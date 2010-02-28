Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NlivR-0003Gg-BB
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 14:11:18 +0100
Received: from tamarin.localnet (siminn-int-gw.on-waves.com [157.157.59.158])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 683351B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 13:10:10 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Feb 2010 14:08:03 +0100
User-Agent: KMail/1.13.0 (Linux/2.6.33-rc8; KDE/4.4.0; i686; ; )
References: <201001230827.49805.holger+oe@freyther.de>
	<201002262100.19410.holger+oe@freyther.de>
In-Reply-To: <201002262100.19410.holger+oe@freyther.de>
MIME-Version: 1.0
Message-Id: <201002281408.04117.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenEmbedded and known security issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Feb 2010 13:11:18 -0000
X-Groupsio-MsgNum: 17148
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_zqmiL9ZpnCXuxfO"

--Boundary-00=_zqmiL9ZpnCXuxfO
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 26 February 2010 21:00:19 Holger Hans Peter Freyther wrote:

> i try to merge that all with python and spit out a list of vulnerable
> software in our tree...

I will probably rewrite this with GNU smalltalk in the next days but here is 
the first version of a python script...

It needs the output of "bitbake -s" (minus the first three lines), it needs the 
uncompressed/untared auditfiles.tbz and then it will list some stuff... It is 
not yet comparing the package versions...


--Boundary-00=_zqmiL9ZpnCXuxfO
Content-Type: text/x-python;
  charset="UTF-8";
  name="oe_audit.py"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="oe_audit.py"

#!/usr/bin/env python

def read_available(filename):
    """
    Parses the output of bitbake -s
    minus the first few lines
    """
    f = open(filename)
    packages = {}

    for line in f:
        # str.split can not be used as we have multiple whitespace
        first_space = line.find(" ")
        package = line[0:first_space]
        rest = line[first_space+1:]
        pv = rest.strip().split(" ")[0]

        packages[package] = pv
    return packages


class freebsd_info:
    """
    Handles an entry like the one below:
    vulnerability-test-port>=2000<2010.02.26|http://cvsweb.freebsd.org/ports/security/vulnerability-test-port/|Not vulnerable, just a test port (database: 2010-02-26)
    """
    def __init__(self, line):
        split = line.split("|")
        for i in range(0, len(split[0])):
            c = split[0][i]
            if c != '<' and c != '=' and c != '>':
                continue
            self.name = split[0][0:i]
            self.versions = self.split_versions(split[0][i:])
            break

        self.link = split[1]
        self.kind = split[2]

    @classmethod
    def split_versions(self, input):
        """
        Split versions by <, >, >=, >=
        """
        versions = []
        last_pos = 0

        # Try to determine <, >, >=, <=
        # we will have to carry stuff on to find the
        # version..
        i = 0
        while i < len(input) - 1:
            c1 = input[i]
            c2 = input[i+1]
            if c1 != '<' and c1 != '>' and c1 != '=':
                i = i + 1
                continue

            # is a '=' coming behind it?
            next = i + 1
            if c2 == '=':
                next = next + 1

            # submit
            if last_pos != 0:
                versions.append((next_type, input[last_pos:i]))

            # remember stuff
            next_type = input[i:next]
            last_pos = next
            i = next

        assert last_pos != 0
        versions.append((next_type, input[last_pos:len(input)]))
        return versions

    def __repr__(self):
        return "%s: %s" % (self.name, self.versions)

def read_auditfile(filename):
    """
    Read an uncompressed audit file from freebsd
    """
    f = open(filename)
    packages = {}
    for line in f:
        if line.startswith("#"):
            continue

        info = freebsd_info(line)
        try:
            packages[info.name].append(info)
        except:
            packages[info.name] = []
            packages[info.name].append(info)
    return packages

def compare_versions(oe, freebsd, not_known):
    for package in freebsd.keys():
        if not package in oe:
            print >> not_known, "%s is not in OE" % package
            continue

        for ver in freebsd[package]:
            str = []
            for (cmp, ver) in ver.versions:
                str.append("%s %s %s" % (package, cmp, ver))
            print " && ".join(str)

oe_packages = read_available("available")
freebsd_vuln = read_auditfile("auditfile")
buggy = open("not_in_oe.bugs", "w+")

compare_versions(oe=oe_packages, freebsd=freebsd_vuln, not_known=buggy)

--Boundary-00=_zqmiL9ZpnCXuxfO--
