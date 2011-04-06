Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <luisborlido@gmail.com>) id 1Q7R21-0003PR-HT
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 13:36:17 +0200
Received: by wye20 with SMTP id 20so1283218wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 04:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=wfHlsCEtZlDRf9ZKD+EK/kxpj46uonc4TvCYt3VcJ2Q=;
	b=JJv5RNRK5xY7CG3fBmerlxDvEBy4BLLTJXaNRCGda0usFAkM7qCOeQ3F3oGdm6YnjS
	PL7e1WFO9hYlPMu9IY/tKRupWMIEq23q40L+CAifJ1oQ1Xc3E5Llg2rH08sPle4jOMcE
	1JDzYWe3wumH71Es0N1iXWebtNwY7AhKxtxDA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=psBALmpf5N1A3jEzHKOkBmwY5xW2sfs96UiFZV3Bg9KKygcbxsnDhXRqyC93Cw3PVP
	zRuniezDTiJYzCsco5k860phGwYMf+gE+IMHA6VBhxTtak3rFa2xitYsPzRwkIvrSAeE
	8ThweA4+vGREGtkhGnQ9T92uf5Lox2CVwHEBY=
MIME-Version: 1.0
Received: by 10.216.245.4 with SMTP id n4mr175274wer.83.1302089650476; Wed, 06
	Apr 2011 04:34:10 -0700 (PDT)
Received: by 10.216.38.147 with HTTP; Wed, 6 Apr 2011 04:34:10 -0700 (PDT)
In-Reply-To: <BANLkTimy1b_JM5zx9EYJddfEqk4MYWZ2Pg@mail.gmail.com>
References: <BANLkTimy1b_JM5zx9EYJddfEqk4MYWZ2Pg@mail.gmail.com>
Date: Wed, 6 Apr 2011 18:34:10 +0700
Message-ID: <BANLkTimD2hxAA-nQPGFzUhXtJLzVXui1Jg@mail.gmail.com>
From: =?ISO-8859-1?Q?Lu=EDs_Filipe_Sal=E9_Borlido?= <luisborlido@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: ESE Key Daemon 1.2.4: FTBFS with gcc-4.5
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
X-List-Received-Date: Wed, 06 Apr 2011 11:36:17 -0000
X-Groupsio-MsgNum: 30989
Content-Type: multipart/mixed; boundary=e0cb4e43d1bb15198204a03e5fd9

--e0cb4e43d1bb15198204a03e5fd9
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi!

I was compiling a new image for mini2440  that contains esekeyd and I got a=
n
error:

NOTE: Running task 2457 of 4369 (ID: 199,
/opt/OpenEmbedded/openembedded/recipes/esekeyd/esekeyd_1.2.4.bb, do_compile=
)
NOTE: package esekeyd-1.2.4-r0: task do_compile: Started
ERROR: Logfile of failure stored in:
/opt/OpenEmbedded/build/tmp/work/armv4t-angstrom-linux-gnueabi/esekeyd-1.2.=
4-r0/temp/log.do_compile.11553
Log data follows:
| + do_compile
| + base_do_compile
| + '[' -e Makefile -o -e makefile -o -e GNUmakefile ']'
| + oe_runmake
| + oenote make
| + echo NOTE: make
| NOTE: make
| + make
| make  all-recursive
| make[1]: Entering directory
`/opt/OpenEmbedded/build/tmp/work/armv4t-angstrom-linux-gnueabi/esekeyd-1.2=
.4-r0/esekeyd-1.2.4'
| Making all in src
| make[2]: Entering directory
`/opt/OpenEmbedded/build/tmp/work/armv4t-angstrom-linux-gnueabi/esekeyd-1.2=
.4-r0/esekeyd-1.2.4/src'
| arm-angstrom-linux-gnueabi-gcc -march=3Darmv4t -mtune=3Darm920t
-mthumb-interwork -mno-thumb
--sysroot=3D/opt/OpenEmbedded/build/tmp/sysroots/armv4t-angstrom-linux-gnue=
abi
-DHAVE_CONFIG_H -I. -I..     -fexpensive-optimizations -fomit-frame-pointer
-frename-registers -O2 -ggdb2 -MT keytest.o -MD -MP -MF .deps/keytest.Tpo -=
c
-o keytest.o keytest.c
| keytest.c: In function 'main':
*| keytest.c:55:3: error: variable-sized object may not be initialized*
| make[2]: *** [keytest.o] Error 1
| make[2]: Leaving directory
`/opt/OpenEmbedded/build/tmp/work/armv4t-angstrom-linux-gnueabi/esekeyd-1.2=
.4-r0/esekeyd-1.2.4/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/opt/OpenEmbedded/build/tmp/work/armv4t-angstrom-linux-gnueabi/esekeyd-1.2=
.4-r0/esekeyd-1.2.4'
| make: *** [all] Error 2
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
NOTE: package esekeyd-1.2.4-r0: task do_compile: Failed
ERROR: Function 'do_compile' failed (see
/opt/OpenEmbedded/build/tmp/work/armv4t-angstrom-linux-gnueabi/esekeyd-1.2.=
4-r0/temp/log.do_compile.11553
for further information)
ERROR: Task 199 (/opt/OpenEmbedded/openembedded/recipes/esekeyd/
esekeyd_1.2.4.bb, do_compile) failed with exit code '1'
ERROR: '/opt/OpenEmbedded/openembedded/recipes/esekeyd/esekeyd_1.2.4.bb'
failed

In one of the Debian bug reports (
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D564981), they seem to sa=
y
that the package cannot be built using gcc-4.5, which is the version of
arm-angstrom-linux-gnueabi-gcc that is being used to build the package.

To solve this problem I added a recipe to esekeyd-1.2.7 (in attach) and now
it's working.

Best regards,
Lu=EDs Borlido

--e0cb4e43d1bb15198204a03e5fd9
Content-Type: application/octet-stream; name="esekeyd_1.2.7.bb"
Content-Disposition: attachment; filename="esekeyd_1.2.7.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gm6674px0

REVTQ1JJUFRJT04gPSAiRVNFIEtleSBEYWVtb24iCkxJQ0VOU0UgPSAiR1BMIgpTRUNUSU9OID0g
ImJhc2UiCkhPTUVQQUdFID0gImh0dHA6Ly93d3cuYnVyZ2hhcmR0LnBsIgoKU1JDX1VSSSA9ICJo
dHRwOi8vd3d3LmJ1cmdoYXJkdC5wbC9maWxlcy9lc2VrZXlkLSR7UFZ9LnRhci5neiIKCmluaGVy
aXQgYXV0b3Rvb2xzIAoKClNSQ19VUklbbWQ1c3VtXSA9ICI1OTM3YWQ2ZDc4MTVkYmM2YWI2OTgz
NDExYTlmMzdkNCIKU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU4YmRhYzk5NGJlODA1ZDljMTFiMjEw
NjU0MjdjOGY1MzY4NGQzOGExYjQ0YmIwMmIxNzVmYzRlZTU5NGNjNTYiCg==

--e0cb4e43d1bb15198204a03e5fd9--
