Received: from [63.210.253.237] (helo=ext-cn0ut-7.online-age.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@gefanuc.com>) id 1KOTv5-0001bY-RX
	for openembedded-devel@openembedded.org; Thu, 31 Jul 2008 10:54:00 +0200
Received: from int-cn0ut-2.online-age.net (int-cn0ut-2.online-age.net
	[3.159.252.71])
	by ext-cn0ut-7.online-age.net (8.13.6/8.13.6/20051114-SVVS-TLS-DNSBL)
	with ESMTP id m6V8qCVb025828
	for <openembedded-devel@openembedded.org>;
	Thu, 31 Jul 2008 04:52:12 -0400
Received: from cinmlef03.e2k.ad.ge.com (int-cn0ut-2.online-age.net
	[3.159.252.71])
	by int-cn0ut-2.online-age.net (8.13.6/8.13.6/20050510-SVVS) with ESMTP
	id m6V8qB7e003345 for <openembedded-devel@openembedded.org>;
	Thu, 31 Jul 2008 04:52:11 -0400
Received: from LONMLVEM08.e2k.ad.ge.com ([3.159.240.73]) by
	cinmlef03.e2k.ad.ge.com with Microsoft SMTPSVC(6.0.3790.2499); 
	Thu, 31 Jul 2008 04:52:11 -0400
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 31 Jul 2008 09:51:50 +0100
Message-ID: <1CADFA951940554D86FBD8B24BBFF3A001C20F91@LONMLVEM08.e2k.ad.ge.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: gcc-4.1.2 compile breaking in OE stable for powerpc
Thread-Index: Acjy6qxLPtTvefe1TYGzOcA7ud6V5A==
From: "Welch, Martyn (GE EntSol,
	Intelligent Platforms)" <martyn.welch@gefanuc.com>
To: <openembedded-devel@openembedded.org>
X-OriginalArrivalTime: 31 Jul 2008 08:52:11.0209 (UTC)
	FILETIME=[B8859390:01C8F2EA]
Subject: gcc-4.1.2 compile breaking in OE stable for powerpc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 31 Jul 2008 08:54:00 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

Hi all,

I have just tried compiling gcc 4.1.2 to allow native compiling on top
of one of our targets.

I'm getting the following error:

ccache powerpc-angstrom-linux-gcc
-isystem/tftpboot/auto/ppc7d/build//staging/powerpc-angstrom-linux/inclu
de -O2  -g -Os -DIN_GCC    -W -Wall -Wwrite-strings -Wstrict-prototypes
-Wmissing-prototypes -Wold-style-definition  -isystem ./include  -fPIC
-specs=3Dldblspecs -g -DHAVE_GTHR_DEFAULT -DIN_LIBGCC2
-D__GCC_FLOAT_NOT_NEEDED  -I. -I.
-I/tftpboot/auto/ppc7d/build//work/powerpc-angstrom-linux/gcc-4.1.2-r11/
gcc-4.1.2/gcc
-I/tftpboot/auto/ppc7d/build//work/powerpc-angstrom-linux/gcc-4.1.2-r11/
gcc-4.1.2/gcc/.
-I/tftpboot/auto/ppc7d/build//work/powerpc-angstrom-linux/gcc-4.1.2-r11/
gcc-4.1.2/gcc/../include
-I/tftpboot/auto/ppc7d/build//work/powerpc-angstrom-linux/gcc-4.1.2-r11/
gcc-4.1.2/gcc/../libcpp/include  -fPIC -mstrict-align -DL_muldc3
-fvisibility=3Dhidden -DHIDE_EXPORTS -c
/tftpboot/auto/ppc7d/build//work/powerpc-angstrom-linux/gcc-4.1.2-r11/gc
c-4.1.2/gcc/libgcc2.c -o libgcc/./_muldc3.o
/tftpboot/auto/ppc7d/build//work/powerpc-angstrom-linux/gcc-4.1.2-r11/gc
c-4.1.2/gcc/libgcc2.c:1629: error: size of array 'compile_type_assert'
is negative
make[3]: *** [libgcc/./_muldc3.o] Error 1
make[3]: Leaving directory
`/tftpboot/auto/ppc7d/build/work/powerpc-angstrom-linux/gcc-4.1.2-r11/gc
c-4.1.2/build.powerpc-angstrom-linux.powerpc-angstrom-linux/gcc'
make[2]: *** [stmp-multilib] Error 2
make[2]: Leaving directory
`/tftpboot/auto/ppc7d/build/work/powerpc-angstrom-linux/gcc-4.1.2-r11/gc
c-4.1.2/build.powerpc-angstrom-linux.powerpc-angstrom-linux/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory
`/tftpboot/auto/ppc7d/build/work/powerpc-angstrom-linux/gcc-4.1.2-r11/gc
c-4.1.2/build.powerpc-angstrom-linux.powerpc-angstrom-linux'
make: *** [all] Error 2
FATAL: oe_runmake failed


Googling threw up some old mails concerning "cache-amnesia.patch",
however this is already being applied.

I am using the org.openembedded.stable branch, with the "angstron
2007.1" distribution (though this seems to be building "angstrom
2007.12-r18") and compiling for the powerpc arch.

Have I got something configured wrong/ are others able to confirm this
works for them?

Martyn

--=20
Martyn Welch MEng MPhil MIET
Principal Software Engineer

GE Fanuc Intelligent Platforms
Tove Valley Business Park, Towcester,
Northants, NN12 6PF, United Kingdom

Telephone: +44 (0) 1327 359444
Direct Dial: +44 (0) 1327 322748
Fax: +44 (0) 1327 322800
email: martyn.welch@gefanuc.com
web: www.gefanuc.com

GE Fanuc Intelligent Platforms Ltd, registered in England and Wales
(3828642) at 100 Barbirolli Square, Manchester, M2 3AB, VAT GB 729 849
476 =20

GE Fanuc Intelligent Platforms Confidential and Proprietary. If you have
received this message in error please notify us immediately and
permanently remove it from your system and destroy any printed
hardcopies.   =20


