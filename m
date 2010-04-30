Received: from micropolis.microdata-pos.de ([212.202.104.142]
	helo=squirrel.microdata-pos.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@awek-microdata.de>) id 1O7kHl-0003Fj-L9
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 09:05:35 +0200
Received: by squirrel.microdata-pos.de (Postfix, from userid 2006)
	id 8C63E28085; Fri, 30 Apr 2010 09:01:35 +0200 (CEST)
Date: Fri, 30 Apr 2010 09:01:35 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100430070135.GH15511@squirrel.microdata-pos.de>
MIME-Version: 1.0
User-Agent: Mutt/1.5.13 (2006-08-11)
From: michael@awek-microdata.de (Michael Westermann)
X-SA-Exim-Connect-IP: 212.202.104.142
X-SA-Exim-Mail-From: michael@awek-microdata.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: package_deb and update-alteernatives-dpkg-native on amd64 fails
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
X-List-Received-Date: Fri, 30 Apr 2010 07:05:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I use openembeeded too make a short distro for our embedded boards. We
use a arm mx27 cpu. The Host system is a amd64 debian sid linux.
I use the git version from openembedded-dev.

I've the follow mistake/problem, on the rootfs the update-alternatives
dont work. I get the foolow messages:

Can't locate dpkg-gettext.pl in @INC (@INC contains: /etc/perl
/usr/local/lib/perl/5.10.1 /usr/local/share/perl/5.10.1 /usr/lib/perl5
/usr/share/perl5 /usr/lib/perl/5.10 /usr/share/perl/5.10
/usr/local/lib/site_perl . ../usr/lib/dpkg) at
/opt/oe/platform/cwmx27-awek-smartstorage-rel1/staging/x86_64-linux/usr/sbin/update-alternatives
line 7.

/opt/oe/platform/rel1/staging/x86_64-linux/usr/sbin/update-alternatives 

in /usr/sbin/update-alternatives are the

$admindir= "/var/lib/dpkg"; 
$dpkglibdir= "/usr/lib/dpkg";

but this is are paths from the host-system, the location from
dpkg-gettext.pl is:

/opt/oe/platform/rel1/staging/x86_64-linux/usr/lib/dpkg/dpkg-gettext.pl

How can I set the correct this paths?

I've test different versions from update-alternatives-dpkg-native e.g.

PREFERRED_VERSION_update-alternatives-native = "1.13.22"
PREFERRED_VERSION_dpkg-native = "1.13.22"

Michael


