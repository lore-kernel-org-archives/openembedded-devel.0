Received: from [213.4.149.66] (helo=ctsmtpout2.frontal.correo)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <JOAQUINDURAN@adtelecom.es>) id 1GO9zY-0000qZ-9x
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Sep 2006 11:28:12 +0200
Received: from ctps6.adm.correo (213.4.149.70) by ctsmtpout2.frontal.correo
	(7.2.056.6) id 45066CC50007D770; Fri, 15 Sep 2006 11:24:29 +0200
Received: from [217.126.70.245] by correo12.telefonica.net with HTTP
	(authenticated as joaquinduran@adtelecom.es);
	Fri, 15 Sep 2006 11:15:55 +0200
Message-ID: <3701781.1158311755168.JavaMail.root@ctps6.adm.correo>
Date: Fri, 15 Sep 2006 11:15:55 +0200 (MEST)
From: "JOAQUINDURAN@adtelecom.es" <JOAQUINDURAN@adtelecom.es>
To: <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: New member to list - problems with cross compiler
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Sep 2006 09:28:12 -0000
Content-Type: text/plain;charset="UTF-8"
Content-Transfer-Encoding: 7bit

Dear all,

My name is Joaquim Duran. I'm a software engineer working at ADTelecom 
(Spain, www.adtelecom.es).

I'm developing embedded devices using the PXA270 Xscale board from 
Toradex (www.toradex.com). I wwant generate the meta-e-x11 image to 
test some X11 features on embedded devices. The problem is that I'm not 
able to generate the images due to that the cross-compiler generation 
fails. In the host computer, there are installed gcc 4.1.1 and gcc 
3.4.6 compilers (the default is 4.1.1).

I've defined several version of target compilers to generate the 
image: 3.3.4, 3.4.4 and 4.1-20060217. These are the errors messages:


3.3.4:

| /home/qduran/oe/oebuild/work/gcc-cross-initial-3.3.4-r3/gcc-3.3.4
/build.i686-linux.arm-linux/gcc/xgcc -B/home/qduran/oe/oebuild/work/gcc-
cross-initial-3.3.4-r3/gcc-3.3.4/build.i686-linux.arm-linux/gcc/ -
B/home/qduran/oe/oebuild/cross/arm-linux/bin/ -
B/home/qduran/oe/oebuild/cross/arm-linux/lib/ -isystem 
/home/qduran/oe/oebuild/cross/arm-linux/include -O2  -DIN_GCC -
DCROSS_COMPILE   -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-
prototypes -isystem ./include  -fomit-frame-pointer -fPIC -g0  -
DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED -Dinhibit_libc -I. -I. -
I/home/qduran/oe/oebuild/work/gcc-cross-initial-3.3.4-r3/gcc-3.3.4/gcc -
I/home/qduran/oe/oebuild/work/gcc-cross-initial-3.3.4-r3/gcc-3.3.4
/gcc/. -I/home/qduran/oe/oebuild/work/gcc-cross-initial-3.3.4-r3/gcc-
3.3.4/gcc/config -I/home/qduran/oe/oebuild/work/gcc-cross-initial-3.3.4-
r3/gcc-3.3.4/gcc/../include  -DL_floatdidf -c 
/home/qduran/oe/oebuild/work/gcc-cross-initial-3.3.4-r3/gcc-3.3.4
/gcc/libgcc2.c -o libgcc/./_floatdidf.o
| /tmp/ccpbQuvf.s: Assembler messages:
| /tmp/ccpbQuvf.s:11: Error: selected processor does not support `ldfd 
f0,.L3'
| /tmp/ccpbQuvf.s:12: Error: selected processor does not support `fltd 
f1,r3'
| /tmp/ccpbQuvf.s:13: Error: selected processor does not support `mufd 
f1,f1,f0'
| /tmp/ccpbQuvf.s:16: Error: selected processor does not support `fltd 
f2,r0'
| /tmp/ccpbQuvf.s:17: Error: selected processor does not support `mufd 
f1,f1,f0'
| /tmp/ccpbQuvf.s:18: Error: selected processor does not support 
`ldfltd f0,.L3+8'
| /tmp/ccpbQuvf.s:21: Error: selected processor does not support 
`adfltd f2,f2,f0'
| /tmp/ccpbQuvf.s:22: Error: selected processor does not support `adfd 
f1,f1,f2'
| /tmp/ccpbQuvf.s:23: Error: selected processor does not support `mvfd 
f0,f1'
| make[2]: *** [libgcc/./_floatdidf.o] Error 1


3.4.4:

| /home/qduran/oe/oebuild/work/gcc-cross-initial-3.4.4-r3/gcc-3.4.4
/build.i686-linux.arm-linux/gcc/xgcc -B/home/qduran/oe/oebuild/work/gcc-
cross-initial-3.4.4-r3/gcc-3.4.4/build.i686-linux.arm-linux/gcc/ -
B/home/qduran/oe/oebuild/cross/arm-linux/bin/ -
B/home/qduran/oe/oebuild/cross/arm-linux/lib/ -isystem 
/home/qduran/oe/oebuild/cross/arm-linux/include -isystem 
/home/qduran/oe/oebuild/cross/arm-linux/sys-include -O2  -DIN_GCC -
DCROSS_COMPILE   -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-
prototypes -Wold-style-definition  -isystem ./include  -fomit-frame-
pointer -fPIC -g0  -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED -Dinhibit_libc 
-I. -I. -I/home/qduran/oe/oebuild/work/gcc-cross-initial-3.4.4-r3/gcc-
3.4.4/gcc -I/home/qduran/oe/oebuild/work/gcc-cross-initial-3.4.4-r3/gcc-
3.4.4/gcc/. -I/home/qduran/oe/oebuild/work/gcc-cross-initial-3.4.4-
r3/gcc-3.4.4/gcc/../include   -DL_floatdidf -c 
/home/qduran/oe/oebuild/work/gcc-cross-initial-3.4.4-r3/gcc-3.4.4
/gcc/libgcc2.c -o libgcc/./_floatdidf.o
| /tmp/ccQy6aid.s: Assembler messages:
| /tmp/ccQy6aid.s:11: Error: selected processor does not support `ldfd 
f0,.L3'
| /tmp/ccQy6aid.s:12: Error: selected processor does not support `fltd 
f1,r3'
| /tmp/ccQy6aid.s:14: Error: selected processor does not support `mufd 
f1,f1,f0'
| /tmp/ccQy6aid.s:15: Error: selected processor does not support `mufd 
f1,f1,f0'
| /tmp/ccQy6aid.s:16: Error: selected processor does not support `fltd 
f2,r0'
| /tmp/ccQy6aid.s:17: Error: selected processor does not support 
`ldfltd f0,.L3+8'
| /tmp/ccQy6aid.s:19: Error: selected processor does not support 
`adfltd f2,f2,f0'
| /tmp/ccQy6aid.s:21: Error: selected processor does not support `adfd 
f0,f1,f2'
| make[2]: *** [libgcc/./_floatdidf.o] Error 1
| make[2]: Leaving directory `/home/qduran/oe/oebuild/work/gcc-cross-
initial-3.4.4-r3/gcc-3.4.4/build.i686-linux.arm-linux/gcc'
| make[1]: *** [libgcc.a] Error 2
| make[1]: Leaving directory `/home/qduran/oe/oebuild/work/gcc-cross-
initial-3.4.4-r3/gcc-3.4.4/build.i686-linux.arm-linux/gcc'
| make: *** [all-gcc] Error 2
| FATAL: oe_runmake failed


4.1-20060217:


| /home/qduran/oe/oebuild/work/gcc-cross-initial-4.1-20060217-r1/gcc-
4.1-20060217/build.i686-linux.arm-linux/./gcc/xgcc -
B/home/qduran/oe/oebuild/work/gcc-cross-initial-4.1-20060217-r1/gcc-4.1-
20060217/build.i686-linux.arm-linux/./gcc/ -
B/home/qduran/oe/oebuild/cross/arm-linux/bin/ -
B/home/qduran/oe/oebuild/cross/arm-linux/lib/ -isystem 
/home/qduran/oe/oebuild/cross/arm-linux/include -isystem 
/home/qduran/oe/oebuild/cross/arm-linux/sys-include -O2  -g -Os -
DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings -Wstrict-prototypes -
Wmissing-prototypes -Wold-style-definition  -isystem ./include  -fomit-
frame-pointer -fPIC -g0  -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED -
Dinhibit_libc -I. -I. -I/home/qduran/oe/oebuild/work/gcc-cross-initial-
4.1-20060217-r1/gcc-4.1-20060217/gcc -I/home/qduran/oe/oebuild/work/gcc-
cross-initial-4.1-20060217-r1/gcc-4.1-20060217/gcc/. -
I/home/qduran/oe/oebuild/work/gcc-cross-initial-4.1-20060217-r1/gcc-4.1-
20060217/gcc/../include -I/home/qduran/oe/oebuild/work/gcc-cross-
initial-4.1-20060217-r1/gcc-4.1-20060217/gcc/../libcpp/include  -
DL_addsubdf3 -xassembler-with-cpp -c /home/qduran/oe/oebuild/work/gcc-
cross-initial-4.1-20060217-r1/gcc-4.1-20060217/gcc/config/arm/lib1funcs.
asm -o libgcc/./_addsubdf3.o
| /home/qduran/oe/oebuild/work/gcc-cross-initial-4.1-20060217-r1/gcc-
4.1-20060217/gcc/config/arm/ieee754-df.S: Assembler messages:
| /home/qduran/oe/oebuild/work/gcc-cross-initial-4.1-20060217-r1/gcc-
4.1-20060217/gcc/config/arm/ieee754-df.S:454: Error: selected processor 
does not support `mvfeqd f0,#0.0'
| /home/qduran/oe/oebuild/work/gcc-cross-initial-4.1-20060217-r1/gcc-
4.1-20060217/gcc/config/arm/ieee754-df.S:476: Error: selected processor 
does not support `mvfeqd f0,#0.0'
| /home/qduran/oe/oebuild/work/gcc-cross-initial-4.1-20060217-r1/gcc-
4.1-20060217/gcc/config/arm/ieee754-df.S:530: Error: selected processor 
does not support `ldfd f0,[sp],#8'
| make[3]: *** [libgcc/./_addsubdf3.o] Error 1
|


Please, could you tell me the version of compilers used in host and in 
target computer? How I specify a different compiler for host computer? 
By defining CC and CXX var?


Thanks in advance.

Thanks and Best Regards,
Joaquim Duran




