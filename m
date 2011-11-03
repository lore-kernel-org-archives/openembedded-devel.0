Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <slapinid@gmail.com>) id 1RLtbY-0006mb-8u
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Nov 2011 10:29:00 +0100
Received: by wyh5 with SMTP id 5so1062071wyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2011 02:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=3WqmOZCjMiJauh2MeLF5fNFWRHiZqcVy5Sl4mNckets=;
	b=dzoi+ZUafhSiWwbYFcNr4jrKDUQTkGMxnf8b0JriNPh+8PCC8i+Wuba4r38MekBJaC
	mY2Kr0jY6C8QdTOczqk0U9Vn108xB3cQYd8KwPgnBpeYUfDFkt/KEHJMCyAQvG+aC5ce
	b3CGoM6Ve9qxKw6bHp05Uo4v+K32kspzofAwc=
MIME-Version: 1.0
Received: by 10.216.132.41 with SMTP id n41mr2486233wei.77.1320312162975; Thu,
	03 Nov 2011 02:22:42 -0700 (PDT)
Received: by 10.216.25.1 with HTTP; Thu, 3 Nov 2011 02:22:42 -0700 (PDT)
Date: Thu, 3 Nov 2011 12:22:42 +0300
Message-ID: <CAFZPMoY0yFw7dAx=rOQRhj6nnXJ7tuPqjPQ4J0a_gi2tjw-WsA@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe-core[ de034bf830bec1b64260ac8516dd584163716ef4 breaks iproute2
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
X-List-Received-Date: Thu, 03 Nov 2011 09:29:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, all!
iptables upgrade broke iproute2. Do anybody work on this?

NOTE: package iproute2-2.6.38-r0: task do_compile: Started
ERROR: Function 'do_compile' failed (see
/home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/iproute2-2.6.38-r0/temp/log.do_compile.22734
for further information)
ERROR: Logfile of failure stored in:
/home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/iproute2-2.6.38-r0/temp/log.do_compile.22734
Log data follows:
| + cd /home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/iproute2-2.6.38-r0/iproute2-2.6.38
| + do_compile
| + base_do_compile
| + '[' -e Makefile -o -e makefile ']'
| + oe_runmake
| + '[' xmake = x ']'
| + bbnote make 'CC=ccache arm-angstrom-linux-gnueabi-gcc
-march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s
-mthumb-interwork -mno-thumb
--sysroot=/home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux'
KERNEL_INCLUDE=/home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux/kernel/include
DOCDIR=/usr/share/doc/iproute2 'SUBDIRS=lib tc ip' SBINDIR=/sbin
| + echo 'NOTE: make CC=ccache arm-angstrom-linux-gnueabi-gcc
-march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s
-mthumb-interwork -mno-thumb
--sysroot=/home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux
KERNEL_INCLUDE=/home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux/kernel/include
DOCDIR=/usr/share/doc/iproute2 SUBDIRS=lib tc ip SBINDIR=/sbin'
| NOTE: make CC=ccache arm-angstrom-linux-gnueabi-gcc  -march=armv5te
-mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork
-mno-thumb --sysroot=/home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux
KERNEL_INCLUDE=/home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux/kernel/include
DOCDIR=/usr/share/doc/iproute2 SUBDIRS=lib tc ip SBINDIR=/sbin
| + make 'CC=ccache arm-angstrom-linux-gnueabi-gcc  -march=armv5te
-mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork
-mno-thumb --sysroot=/home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux'
KERNEL_INCLUDE=/home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux/kernel/include
DOCDIR=/usr/share/doc/iproute2 'SUBDIRS=lib tc ip' SBINDIR=/sbin
| make[1]: Entering directory
`/home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/iproute2-2.6.38-r0/iproute2-2.6.38/lib'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/iproute2-2.6.38-r0/iproute2-2.6.38/lib'
| make[1]: Entering directory
`/home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/iproute2-2.6.38-r0/iproute2-2.6.38/tc'
| ccache arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb
-mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb
--sysroot=/home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux
-D_GNU_SOURCE -O2 -Wstrict-prototypes -Wall -I../include
-DRESOLVE_HOSTNAMES -DLIBDIR=\"/usr/lib/\" -DCONFIG_GACT
-DCONFIG_GACT_PROB -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
-Wl,-export-dynamic -shared -fpic -o m_xt.so m_xt.c -lxtables
| m_xt.c: In function 'parse_ipt':
| m_xt.c:167:31: warning: passing argument 2 of
'xtables_merge_options' discards qualifiers from pointer target type
| /home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux/usr/include/xtables.h:407:23:
note: expected 'struct option *' but argument is of type 'const struct
option *'
| m_xt.c:167:31: warning: passing argument 3 of
'xtables_merge_options' from incompatible pointer type
| /home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux/usr/include/xtables.h:407:23:
note: expected 'const struct option *' but argument is of type
'unsigned int *'
| m_xt.c:167:31: error: too few arguments to function 'xtables_merge_options'
| /home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux/usr/include/xtables.h:407:23:
note: declared here
| m_xt.c: In function 'print_ipt':
| m_xt.c:312:30: warning: passing argument 2 of
'xtables_merge_options' discards qualifiers from pointer target type
| /home/build1/OE/slave/angstrom_build/build/buERROR: Function
'do_compile' failed (see
/home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/iproute2-2.6.38-r0/temp/log.do_compile.22734
for further information)
| ild/tmp-angstrom_2010_x-eglibc/sysroots/crux/usr/include/xtables.h:407:23:
note: expected 'struct option *' but argument is of type 'const struct
option *'
| m_xt.c:312:30: warning: passing argument 3 of
'xtables_merge_options' from incompatible pointer type
| /home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux/usr/include/xtables.h:407:23:
note: expected 'const struct option *' but argument is of type
'unsigned int *'
| m_xt.c:312:30: error: too few arguments to function 'xtables_merge_options'
| /home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux/usr/include/xtables.h:407:23:
note: declared here
| make[1]: *** [m_xt.so] Error 1
| make[1]: Leaving directory
`/home/build1/OE/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/iproute2-2.6.38-r0/iproute2-2.6.38/tc'
| make: *** [all] Error 2
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
NOTE: package iproute2-2.6.38-r0: task do_compile: Failed
ERROR: Task 453
(/home/build1/OE/slave/angstrom_build/build/sources/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_2.6.38.bb,
do_compile) failed with exit code '1'

I do not know anything about xtables stuff, but could try to help as
last resort.


