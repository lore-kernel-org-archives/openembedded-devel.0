Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gilby985@gmail.com>) id 1QBVh2-0004A5-Bk
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 19:23:28 +0200
Received: by iwn10 with SMTP id 10so3779394iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 10:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=OHEsnZTGFKd+xZoqPdvEJH/rQyLtzUsyWOWqh1VJoOo=;
	b=dw7xR1Gcwm3Th6UtM5CQpysLql90c7aupCoThG3LIBXjTS8X3pb9/00QTadCzRj/Va
	G8FHk049YLRvA6EGimSPF3VufJIqaOrAsPcxs1E44Q/s1JcJZGg61ZERd8Espep9/7Cs
	voyWgwCr9NhbkBExHtkoY5qHc1qtvw2Dylys0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Azn6n/KB+sy4SFyLoq3iTIhjY7RVVHIwShCz4d7QLerZfsE0JZo0LfM9ZYkLnTl50Y
	HR42LybZ4f4WAgU4WFYLHEGejWJBU+IhlFsbBWUWqt5do6YNoR13epfW1+tjYsj4Yara
	2VzLE0vCpwPQXageHcHvkgFPqqXTGY0kMoB3c=
MIME-Version: 1.0
Received: by 10.42.226.72 with SMTP id iv8mr5341973icb.151.1303060858894; Sun,
	17 Apr 2011 10:20:58 -0700 (PDT)
Received: by 10.42.224.73 with HTTP; Sun, 17 Apr 2011 10:20:58 -0700 (PDT)
Date: Sun, 17 Apr 2011 19:20:58 +0200
Message-ID: <BANLkTin=ptRRhu_WB=gDooxUEJLh64DNaA@mail.gmail.com>
From: Alberto Carrozzo <gilby985@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Installing MAD-FCL using bitbake
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
X-List-Received-Date: Sun, 17 Apr 2011 17:23:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello, I'm trying to install MAD-FCL (http://mad.cs.tut.fi/) in order
to use the Flute protocol on Angstrom... to do it, I modified the
"wscan_20091230.bb" recipe that you can find in
"oe/openembedded/recipes/dvbtools/" folder...

_________________________________________________
ESCRIPTION = "Wscan is a dvb channel scanner that doesn't require an
initial frequency table"
LICENSE = "GPLv2"

SRC_URI = "http://wirbel.htpc-forum.de/w_scan/w_scan-${PV}.tar.bz2"

S = "${WORKDIR}/w_scan-${PV}"

inherit autotools

FILES_${PN} += "${datadir}"

SRC_URI[md5sum] = "97cd83d5c174e386d01a364b2d280f2a"
SRC_URI[sha256sum] =
"1a5864559b6a0acb76b9fa66b4e1351acd7d06c4e4a9a2ba323e7eafa4d4788b"
__________________________________________________

It works perfectly and bitbaking it I can find the executable w_scan
in the ~/oe/tmp/work/armv7a-angstrom-linux-gnueabi/wscan-20091230-r0/w_scan-20091230
folder... So I modifed it in this way:

___________________________________________________
SRC_URI = "http://mad.cs.tut.fi/download/mad_fcl_v1.7_src.tar.gz"

S = "${WORKDIR}/flute"

inherit autotools

FILES_${PN} += "${bindir}/flute"

SRC_URI[md5sum] = "71a0c9d856a9b949b2c7c25bfd91029e"
SRC_URI[sha256sum] =
"97c0abc3807e48b102fee85bf14aaaeabe39ce3f98bb4423daed9651978e62f0"
____________________________________________________

...but it doesn't work and it gives me the following error on the
log.do_install file:
____________________________________________________
NOTE: make DESTDIR=/home/gilby/oe/tmp/work/armv7a-angstrom-linux-gnueabi/flute-1.0-r0/image
install
make: *** No rule to make target `install'.  Stop.
FATAL: oe_runmake failed
ERROR: Function do_install failed
____________________________________________________

Note: the log.do_compile file tells me "NOTE: nothing to compile"

... OK, so i added this on the recipe above:
____________________________________________________
do_install(){
	install -m 0755 -d ${D}${bindir} ${D}${docdir}/flute
}
____________________________________________________

and it work without errors... but the log.do_compile file tells me
again "NOTE: nothing to compile" and i can't find the executable in
the ~/oe/tmp/work/armv7a-angstrom-linux-gnueabi/flute-1.0-r0/
folder... and the same thing happen if I delete the "inherit
autotools" row...

SO:

1) Why for some recipes it execute the makefile automatically and not
for other ones?
2) How can I fix my prolems?

somebody can help me? thank you so much


