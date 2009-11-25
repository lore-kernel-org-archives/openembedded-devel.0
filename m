Received: from smtpauth11.prod.mesa1.secureserver.net ([64.202.165.33])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1NDLRh-0000eo-Hn
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Nov 2009 18:14:30 +0100
Received: (qmail 10246 invoked from network); 25 Nov 2009 17:12:51 -0000
Received: from unknown (209.242.7.187)
	by smtpauth11.prod.mesa1.secureserver.net (64.202.165.33) with ESMTP;
	25 Nov 2009 17:12:51 -0000
Message-ID: <4B0D6590.2040009@mwester.net>
Date: Wed, 25 Nov 2009 11:12:48 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 64.202.165.33
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: sane-backends-1.0.20 failing to build
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
X-List-Received-Date: Wed, 25 Nov 2009 17:14:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Something is rather fishy with the sane-backends that was just committed
-- anyone else see failures similar to this?  (Looks like the
mkinstalldirs script doesn't take the -g option?)

-Mike (mwester)

Here's the pertinent part of
armv5teb-linux-gnueabi/sane-backends-1.0.20-r0/temp/log.do_install.nnnn:
---------------------------------------------------
for dir in artec_eplus48u gt68xx snapscan epjitsu ; do \
          /bin/sh ../mkinstalldirs
/u/slug/slugos/tmp/work/armv5teb-linux-gnueabi/sane-backends-1.0.20-r0/image/usr/sha\
re/sane/${dir} ; \
          done
mkdir -p --
/u/slug/slugos/tmp/work/armv5teb-linux-gnueabi/sane-backends-1.0.20-r0/image/usr/share/sane/artec_eplus48u
mkdir -p --
/u/slug/slugos/tmp/work/armv5teb-linux-gnueabi/sane-backends-1.0.20-r0/image/usr/share/sane/gt68xx
mkdir -p --
/u/slug/slugos/tmp/work/armv5teb-linux-gnueabi/sane-backends-1.0.20-r0/image/usr/share/sane/snapscan
mkdir -p --
/u/slug/slugos/tmp/work/armv5teb-linux-gnueabi/sane-backends-1.0.20-r0/image/usr/share/sane/epjitsu
/bin/sh ../mkinstalldirs -m 775 -g uucp
/u/slug/slugos/tmp/work/armv5teb-linux-gnueabi/sane-backends-1.0.20-r0/image/va\
r/lock/sane
Usage: mkinstalldirs [-h] [--help] [--version] [-m MODE] DIR ...

Create each directory DIR (with mode MODE, if specified), including all
leading file name components.

Report bugs to <bug-automake@gnu.org>.
make[4]: *** [install-lockpath] Error 1




