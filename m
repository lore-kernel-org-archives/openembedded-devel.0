Received: from [209.191.68.201] (helo=web35007.mail.mud.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <the_kiennd@yahoo.com.vn>) id 1GkB4O-00071w-VU
	for openembedded-devel@openembedded.org; Wed, 15 Nov 2006 04:04:13 +0100
Received: (qmail 80491 invoked by uid 60001); 15 Nov 2006 03:02:04 -0000
Message-ID: <20061115030204.80489.qmail@web35007.mail.mud.yahoo.com>
Received: from [203.160.1.52] by web35007.mail.mud.yahoo.com via HTTP;
	Wed, 15 Nov 2006 10:02:04 ICT
Date: Wed, 15 Nov 2006 10:02:04 +0700 (ICT)
From: Nguyen Kien <the_kiennd@yahoo.com.vn>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4558CA77.1040609@kynisk.com>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: What distro for ixp425
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Nov 2006 03:04:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

 I will test openslug. Thanks for your reply.

Øyvind Repvik <repvik@kynisk.com>  đã viết:   Nguyen Kien wrote:
> My group is developing a smart router with Intel IXP425 XScale and I use openembedded to building a small linux system for our product. 
> In openembedded distro conf directory, there are many distros, which distro is best for me?
> 
> I built debianslug for my nslu2 ( intel ixp4xx ) device, run ok. Is it the best choice, if i built debianslug for my product.

So far, the debianslug distro isn't the best choice for the ixp4xx, 
since debianslug runs LE, and has ~30% lower network performance than 
OpenSlug, which is BE.

> Thanks for your ideas!

It'd be nice if any patches needed to run on your board made it into the 
nslu2-linux kernel repo (or even better, mainstream).

>  Hardware configuration   CPU  533 MHz  IXP425 - XScale architecture, ARM core   RAM  128 to 256 MB  SDRAM operating at 133 MHz   
 >Primary storage  128 Mbit  Parallel flash   Secondary storage  512 MB 
  Optional NAND flash   LAN interface  01 Ethernet  10/100 mbps
 >WAN interface  04 Ethernet  10/100 mbps   General purpose interface 
01 USB  USB v1.1 - may attaches additional storage
>Peripheral bus  01 PCI  Mini PCI 33MHz   Console interface  01 RS-232  115200 8N1   
 >Display  5x7 led + various leds  5x7 3 color led panel   Peripheral 
01 Microcontroller  8 bit AVR   Miscellaneous  ICE JTAG, 8bit DIP 
switch, Battery backed RTC
> http://ftd.routeskeeper.com

Please use a mail client that wraps. The hardware configuration ends up 
as one incredibly long line which is annoying to read.

Øyvind Repvik
SlugOS package manager

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



Nguyen Duy Kien 
System Engineer Department 
FPT Communications center, FPT Telecom 
 
Email: kiennd@gmail.com 
Tel: 04.760.1060 (ext: 4252) 
Mobile: 84-989 255 660 
48 Van Bao (2B Van Phuc Diplomatic Compound), 
Kim Ma Str., Badinh District, Hanoi, Vietnam 
Tel: 04.760.1060 
Fax: 04.822.3111 
Http:// www.fpt.net
 		
---------------------------------
Hãy ghé qua trang chủ Yahoo! Việt Nam!
From lenehan@twibble.org Thu Nov 16 08:26:37 2006
Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lenehan@twibble.org>) id 1Gkbdt-0000m4-1B
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Nov 2006 08:26:37 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 2A3ABD25F6;
	Thu, 16 Nov 2006 18:24:21 +1100 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24515-06; Thu, 16 Nov 2006 18:24:18 +1100 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 3D181C9880;
	Thu, 16 Nov 2006 18:24:18 +1100 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 0619E9D0B0B; Thu, 16 Nov 2006 18:24:17 +1100 (EST)
Date: Thu, 16 Nov 2006 18:24:17 +1100
From: Jamie Lenehan <lenehan@twibble.org>
To: Martin Dietze <martin@the-little-red-haired-girl.org>
Message-ID: <20061116072417.GA1644@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	Martin Dietze <martin@the-little-red-haired-girl.org>,
	openembedded-devel@lists.openembedded.org
References: <E1GfdiZ-0005X2-My@linuxtogo.org>
	<20061102235643.GA30907@twibble.org>
	<20061103102120.GA25260@fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20061103102120.GA25260@fh-wedel.de>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [oe-commits] org.oe.dev libintl-perl: added do_compile()
	function needed for crosscompilation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Nov 2006 07:26:37 -0000

On Fri, Nov 03, 2006 at 11:21:20AM +0100, Martin Dietze wrote:
[...]
>  you find the temp directory with the run.* and log.* files
> I just created with the original .bb file appended to this

Thanks Martin, that helped. Can you give this patch a try and confirm
if libintl-perl builds with it. If this works it'll be a better
option since it'll make sure all of the cpan modules in OE would
build without change.

# 
# old_revision [84fe2f0fca6db99a5c79789a1835d65a2d7f5d4b]
# 
# patch "classes/cpan.bbclass"
#  from [c7d1304c1f4475785c59af38cfea6d8cccffcab1]
#    to [b6652b5fa4a60013e16b4dd0c43f377d0ecb7e27]
# 
# patch "packages/perl/libintl-perl_1.16.bb"
#  from [f584deff8934890a2b1f4e35372d9d3a058718a1]
#    to [405b87d4cc959e645964974b117509fbd12031c2]
# 
============================================================
--- classes/cpan.bbclass	c7d1304c1f4475785c59af38cfea6d8cccffcab1
+++ classes/cpan.bbclass	b6652b5fa4a60013e16b4dd0c43f377d0ecb7e27
@@ -8,7 +8,7 @@ cpan_do_configure () {
 RDEPENDS += "perl"
 
 cpan_do_configure () {
-	perl Makefile.PL ${EXTRA_CPANFLAGS}
+	perl Makefile.PL ${EXTRA_CPANFLAGS} CC='${CC}' LD='${CC}'
 	if [ "${BUILD_SYS}" != "${HOST_SYS}" ]; then
 		. ${STAGING_DIR}/${TARGET_SYS}/perl/config.sh
                 sed -i -e "s:\(SITELIBEXP = \).*:\1${sitelibexp}:" \
@@ -20,13 +20,10 @@ cpan_do_configure () {
 	fi
 }
 
+EXTRA_OEMAKE_append = "CCFLAGS='${CFLAGS}' CC='${CC}' LD='${CC}'"
+
 cpan_do_compile () {
-	# You must use gcc to link on sh
-	OPTIONS=""
-	if test ${TARGET_ARCH} = "sh3" -o ${TARGET_ARCH} = "sh4"; then
-		OPTIONS="LD=${TARGET_ARCH}-${TARGET_OS}-gcc"
-	fi
-        oe_runmake PASTHRU_INC="${CFLAGS}" CCFLAGS="${CFLAGS}" $OPTIONS
+        oe_runmake PASTHRU_INC="${CFLAGS}"
 }
 
 cpan_do_install () {
============================================================
--- packages/perl/libintl-perl_1.16.bb	f584deff8934890a2b1f4e35372d9d3a058718a1
+++ packages/perl/libintl-perl_1.16.bb	405b87d4cc959e645964974b117509fbd12031c2
@@ -1,15 +1,12 @@ RDEPENDS = "perl-module-vars perl-module
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 RDEPENDS = "perl-module-vars perl-module-locale perl-module-io-handle \
             perl-module-symbol perl-module-selectsaver perl-module-io \
             perl-module-integer perl-module-exporter-heavy"
+PR = "r1"
 
 SRC_URI = "http://www.cpan.org/authors/id/G/GU/GUIDO/libintl-perl-${PV}.tar.gz"
 
 S = "${WORKDIR}/libintl-perl-${PV}"
 
 inherit cpan
-
-do_compile() {
-	make CC="${CC}" LD="${LD}"
-}


-- 
 Jamie Lenehan <lenehan@twibble.org>


