Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Nljn9-0006bS-VL
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 15:06:48 +0100
Received: from tamarin.localnet (siminn-int-gw.on-waves.com [157.157.59.158])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 5847F1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 14:05:40 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Feb 2010 15:03:34 +0100
User-Agent: KMail/1.13.0 (Linux/2.6.33-rc8; KDE/4.4.0; i686; ; )
References: <201001230827.49805.holger+oe@freyther.de>
	<201002262100.19410.holger+oe@freyther.de>
	<201002281408.04117.holger+oe@freyther.de>
In-Reply-To: <201002281408.04117.holger+oe@freyther.de>
MIME-Version: 1.0
Message-Id: <201002281503.35018.holger+oe@freyther.de>
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
X-List-Received-Date: Sun, 28 Feb 2010 14:06:49 -0000
X-Groupsio-MsgNum: 17149
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_2eniLbU2seQ2+Qy"

--Boundary-00=_2eniLbU2seQ2+Qy
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Sunday 28 February 2010 14:08:03 Holger Hans Peter Freyther wrote:

> It needs the output of "bitbake -s" (minus the first three lines), it needs
> the uncompressed/untared auditfiles.tbz and then it will list some
> stuff... It is not yet comparing the package versions...

Attached is the current script and the current output. I need to compare 
versions and bb.utils.vercmp doesn't like some of the BSD versions...

Here is a manual analysis and a list of vulnerable software:

gd needs to be upgraded to at least 2.0.35 + patch
unzip seems vulnerable
gnutls 2.4.42 needs to be upgraded to >2.6.6
dia 0.96.1 is vulnerable
fetchmail 6.3.8 is vulnerable
wireshark 1.0.2 is vulnerable
firefox 3.5.5 is vulnerable
vim 7.0 is vulnerable
wget 1.9.1 is vulnerable
perl 5.8.8 is vulnerable 
mt-daapd 0.2.4.2 is vulnerable
cyrus-sasl 2.1.19 is vulnerable
gpdf 2.10.0 is vulnerable
ruby 1.8.7-p248 is vulnerable
pango-native is vulnerable
cscope 15.5 is vulnerable
freeciv 2.0.8 is vulnerable
openssl 0.9.8j is vulnerable
tor 0.1.1.26 is vulnerable
libghttpd 1.4.18 is vulnerable
ipsec-tools 0.6.7 is vulnerable
cyrus-imapd 2.2.12 is vulnerable
gallery 1.5.5. is vulnerable
thuunderbird 1.0.7 is vulnerable 
findutils 4.2.29 is vulnerable
findutils-native 4.2.29 is vulernable
streamripper 1.61.10 is vulnerable
id3lib 3.8.3 is vulnerable
vorbis-tools 1.1.1 is vulnerable
libvorbius 1.2.3 is vulnerable (without a patch)
gftp 2.0.18 is vulnerable
gnupg 1.4.2.2 is vulnerable
screen 4.0.3 is vulnerable
wv 1.2.0 is vulnerable
libxine 1.1.16.3 is vulnerable
libcdaudio 0.99.12p2 is vulnerable
imlib 1.9.15 is vulnerable
bogofilter 0.96.0 is vulnerable
gdk-pixbuf maybe too
maradns 10.41 is vulnerable
cdrtools-native 2.01 is vulnerable
squit 2.6.STABLE14 is vulnerable (http://portaudit.FreeBSD.org/6eb580d7-
a29c-11dc-8919-001c2514716c.html)
pngcrush 1.6.4 is vulnerable
pngcrush-native 1.6.4 is vulnerable
gzip 1.3.5 is vulnerable
dnsmask 2.47 is vulnerable
apr 1.3.3 is vulnerable
socat 1.3.2.1 is vulnerable
unrar 3.4.3 is vulnerable
unrar-native 3.4.3 is vulnerable
bitlbee 1.0.4 is vulnerable
ctorrent is vulnerabe
postgressql 8.1.8 is vulnerable
libexif 0.6.17 is vulnerable
libwmf 0.2.8.4 might be vulnerable
libwmf-native same thing
git 1.6.0.4 is vulnerable
git-native 1.6.0.4 is vulernable
netatal 2.0.3 might be vulnerable
lubspf2 1.0.4 is vulnerable
curl-sdk 7.18.2 is vulnerable
bzip2 might be vulnerable
gnome-screensaver 2.28.0 is vulnerable

love
	z.

--Boundary-00=_2eniLbU2seQ2+Qy
Content-Type: text/x-python;
  charset="UTF-8";
  name="oe_audit.py"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="oe_audit.py"

#!/usr/bin/env python

import bb.utils

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


def strip_oe_version(oe_version):
    """
    We need to strip the package epoch... and the PR to compare
    it to the FreeBSD versions. Also FreeBSD seems to use _N as
    PR so we might need to do more..
    """
    split = oe_version.split(':', 1)
    ver = split[1]

    split = ver.rsplit('-r', 1)
    ver = split[0]
    return ver

def strip_bsd_version(bsd_version):
    """
    FreeBSD is adding ,1 for revisions.. remove that
    """
    split = bsd_version.rsplit(',', 1)
    return split[0]

def compare_versions(oe, freebsd, not_known):
    def handle_package(oe_name, bsd_name):
        if not oe_name in oe:
            if oe_name == bsd_name:
                print >> not_known, "%s is not in OE" % oe_name
            return

        oe_version = strip_oe_version(oe[oe_name])
        for ver in freebsd[bsd_name]:
            str = []
            for (cmp, ver) in ver.versions:
                bsd_ver = strip_bsd_version(ver)
                str.append("%s %s %s %s" % (oe_name, oe_version, cmp, bsd_ver))
            print " && ".join(str)

    for package in freebsd.keys():
        # handle the various versions of OE packages
        handle_package(package, package)
        handle_package("%s-native" % package, package)
        handle_package("%s-full-native" % package, package)
        handle_package("%s-sdk" % package, package)


# read the input data
oe_packages = read_available("available")
freebsd_vuln = read_auditfile("auditfile")
buggy = open("not_in_oe.bugs", "w+")

compare_versions(oe=oe_packages, freebsd=freebsd_vuln, not_known=buggy)

--Boundary-00=_2eniLbU2seQ2+Qy
Content-Type: application/zip;
  charset="UTF-8";
  name="current_output.zip"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="current_output.zip"

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
AAABAAEARQAAANsSAAAAAA==

--Boundary-00=_2eniLbU2seQ2+Qy
Content-Type: application/zip;
  charset="UTF-8";
  name="not_in_oe.bugs.zip"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="not_in_oe.bugs.zip"

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

--Boundary-00=_2eniLbU2seQ2+Qy--
