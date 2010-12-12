Received: from mail-iw0-f169.google.com ([209.85.214.169])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PRnJ2-0004qJ-V0
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Dec 2010 15:53:46 +0100
Received: by iwn40 with SMTP id 40so1859236iwn.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Dec 2010 06:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=Lp/HjqoxIYQo7+tXrEZYkUea8aliEWbVvN++a9SWvlA=;
	b=feb4wPNs31fhRgTnRiVugBSoxz80OEm1qD6tKT2R5DN/AGqyFC0gt1s+0UBWtqL7/k
	b4y8TK0BKtgSoDDyxPavzgNpoV4t/A72RxVL8KARQjMBVmTtSWINug91/O6judOTVI3J
	ESlkwHI8gN1T3rWIqdWXCQNRw9pW/AobG59Io=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Hnj8qn0E+YpiI8cYIZWu9bMv9yT5/DWbbyCENut3xH36frVxz+8qheAhMhpTU6zati
	UPm8bWPrGaaPMLATZN1UqoEXj/I6ObEe4D265muKn5IKAV2g4gbPhk3zom58DasqQzdI
	+91jRazIs54zSIy6FJVVxXrlHAlRA3D0vqb0I=
MIME-Version: 1.0
Received: by 10.42.226.7 with SMTP id iu7mr2001961icb.198.1292165529355; Sun,
	12 Dec 2010 06:52:09 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Sun, 12 Dec 2010 06:52:09 -0800 (PST)
Date: Sun, 12 Dec 2010 15:52:09 +0100
Message-ID: <AANLkTim6OtGFRPtXA-pQuGT0efA755FpxJVsUghks8gg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.169
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gettext libtool ARM issue
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
X-List-Received-Date: Sun, 12 Dec 2010 14:53:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

We seem to have an issue with gettext and libtool on ARM
I cannot build git head on our autobuilder for ARM based platforms.
(tried sheevaplug, armv5te and beagleboard armv7a). (distro minimal
build host ubuntu 10.04 x64)

Below is a section of the log: (analysis continues after the log)

| make  install-am
| make[3]: Entering directory
`/home/hudson/jobs/FM_tmp/workspace/tmp/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/gettext-0.18/gettext-tools/src'
| make[4]: Entering directory
`/home/hudson/jobs/FM_tmp/workspace/tmp/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/gettext-0.18/gettext-tools/src'
| test -z "/usr/lib" ||
/home/hudson/jobs/FM_tmp/workspace/tmp/sysroots/x86_64-linux/usr/bin/mkdir
-p "/home/hudson/jobs/FM_tmp/workspace/tmp/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/image/usr/lib"
|  /bin/sh ../arm-oe-linux-gnueabi-libtool   --mode=install
/home/hudson/jobs/FM_tmp/workspace/tmp/sysroots/x86_64-linux/usr/bin/install
-c   libgettextsrc.la
'/home/hudson/jobs/FM_tmp/workspace/tmp/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/image/usr/lib'
| arm-oe-linux-gnueabi-libtool: install: warning: relinking `libgettextsrc.la'
| arm-oe-linux-gnueabi-libtool: install: (cd
/home/hudson/jobs/FM_tmp/workspace/tmp/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/gettext-0.18/gettext-tools/src;
/bin/sh /home/hudson/jobs/FM_tmp/workspace/tmp/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/gettext-0.18/gettext-tools/arm-oe-linux-gnueabi-libtool
 --tag CC --mode=relink arm-oe-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb -std=gnu99
-isystem/home/hudson/jobs/FM_tmp/workspace/tmp/sysroots/armv7a-oe-linux-gnueabi/usr/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os
-release 0.18 ../gnulib-lib/libgettextlib.la -lc
-L/home/hudson/jobs/FM_tmp/workspace/tmp/sysroots/armv7a-oe-linux-gnueabi/usr/lib
-Wl,-rpath-link,/home/hudson/jobs/FM_tmp/workspace/tmp/sysroots/armv7a-oe-linux-gnueabi/usr/lib
-Wl,-O1 -Wl,--hash-style=gnu -o libgettextsrc.la -rpath /usr/lib
message.lo po-error.lo po-xerror.lo read-catalog-abstract.lo po-lex.lo
po-gram-gen.lo po-charset.lo read-po.lo read-properties.lo
read-stringtable.lo open-catalog.lo dir-list.lo str-list.lo
read-catalog.lo color.lo write-catalog.lo write-properties.lo
write-stringtable.lo write-po.lo msgl-ascii.lo msgl-iconv.lo
msgl-equal.lo msgl-cat.lo msgl-header.lo msgl-english.lo msgl-check.lo
file-list.lo msgl-charset.lo po-time.lo plural-exp.lo plural-eval.lo
plural-table.lo format.lo format-c.lo format-sh.lo format-python.lo
format-lisp.lo format-elisp.lo format-librep.lo format-scheme.lo
format-java.lo format-csharp.lo format-awk.lo format-pascal.lo
format-ycp.lo format-tcl.lo format-perl.lo format-perl-brace.lo
format-php.lo format-gcc-internal.lo format-gfc-internal.lo
format-qt.lo format-qt-plural.lo format-kde.lo format-boost.lo
-inst-prefix-dir
/home/hudson/jobs/FM_tmp/workspace/tmp/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/image)
| arm-oe-linux-gnueabi-libtool: relink: arm-oe-linux-gnueabi-gcc
-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
-mthumb-interwork -mno-thumb -std=gnu99 -shared  -fPIC -DPIC
.libs/message.o .libs/po-error.o .libs/po-xerror.o
.libs/read-catalog-abstract.o .libs/po-lex.o .libs/po-gram-gen.o
.libs/po-charset.o .libs/read-po.o .libs/read-properties.o
.libs/read-stringtable.o .libs/open-catalog.o .libs/dir-list.o
.libs/str-list.o .libs/read-catalog.o .libs/color.o
.libs/write-catalog.o .libs/write-properties.o
.libs/write-stringtable.o .libs/write-po.o .libs/msgl-ascii.o
.libs/msgl-iconv.o .libs/msgl-equal.o .libs/msgl-cat.o
.libs/msgl-header.o .libs/msgl-english.o .libs/msgl-check.o
.libs/file-list.o .libs/msgl-charset.o .libs/po-time.o
.libs/plural-exp.o .libs/plural-eval.o .libs/plural-table.o
.libs/format.o .libs/format-c.o .libs/format-sh.o
.libs/format-python.o .libs/format-lisp.o .libs/format-elisp.o
.libs/format-librep.o .libs/format-scheme.o .libs/format-java.o
.libs/format-csharp.o .libs/format-awk.o .libs/format-pascal.o
.libs/format-ycp.o .libs/format-tcl.o .libs/format-perl.o
.libs/format-perl-brace.o .libs/format-php.o
.libs/format-gcc-internal.o .libs/format-gfc-internal.o
.libs/format-qt.o .libs/format-qt-plural.o .libs/format-kde.o
.libs/format-boost.o   -Wl,-rpath
-Wl,/home/hudson/jobs/FM_tmp/workspace/tmp/sysroots/armv7a-oe-linux-gnueabi/usr/lib
-L/home/hudson/jobs/FM_tmp/workspace/tmp/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/image/usr/lib
-L/usr/lib -lgettextlib
-L/home/hudson/jobs/FM_tmp/workspace/tmp/sysroots/armv7a-oe-linux-gnueabi/usr/lib
-lncurses -lc  -march=armv7-a -mtune=cortex-a8 -mfpu=neon
-mfloat-abi=softfp -mthumb-interwork -mno-thumb -Os -Wl,-rpath-link
-Wl,/home/hudson/jobs/FM_tmp/workspace/tmp/sysroots/armv7a-oe-linux-gnueabi/usr/lib
-Wl,-O1 -Wl,--hash-style=gnu   -Wl,-soname -Wl,libgettextsrc-0.18.so
-o .libs/libgettextsrc-0.18.so
| /usr/lib/libncurses.so: file not recognized: File format not recognized
| collect2: ld returned 1 exit status
| arm-oe-linux-gnueabi-libtool: install: error: relink
`libgettextsrc.la' with the above command before installing it
| make[4]: *** [install-libLTLIBRARIES] Error 1
| make[4]: Leaving directory
`/home/hudson/jobs/FM_tmp/workspace/tmp/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/gettext-0.18/gettext-tools/src'
| make[3]: *** [install-am] Error 2
| make[3]: Leaving directory
`/home/hudson/jobs/FM_tmp/workspace/tmp/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/gettext-0.18/gettext-tools/src'
| make[2]: *** [install] Error 2
| make[2]: Leaving directory
`/home/hudson/jobs/FM_tmp/workspace/tmp/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/gettext-0.18/gettext-tools/src'
| make[1]: *** [install-recursive] Error 1
| make[1]: Leaving directory
`/home/hudson/jobs/FM_tmp/workspace/tmp/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/gettext-0.18/gettext-tools'
| make: *** [install-recursive] Error 1
| FATAL: oe_runmake failed
NOTE: package gettext-0.18-r3: task do_install: Failed


Note that if I build from scratch for mpc8313e-rdb and calamari (which
are powerpc) things work like a charm.
When I build for sheevaplug or beagleboard on my home pc (opensuse
11.2, 32 bit) gettext builds but gives some not-so-nice warnings in
the log.
These are also given on the autobuilder when building for power pc.

install -c   libgettextsrc.la
'/home/frans/oe/tmp_minimal/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/image/usr/lib'
arm-oe-linux-gnueabi-libtool: install: warning: relinking `libgettextsrc.la'
arm-oe-linux-gnueabi-libtool: install: (cd
/home/frans/oe/tmp_minimal/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/gettext-0.18/gettext-tools/src;
/bin/sh /home/frans/oe/tmp_minimal/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/gettext-0.18/gettext-tools/arm-oe-linux-gnueabi-libtool
 --tag CC --mode=relink arm-oe-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb -std=gnu99
-isystem/home/frans/oe/tmp_minimal/sysroots/armv7a-oe-linux-gnueabi/usr/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os
-release 0.18 ../gnulib-lib/libgettextlib.la -lc
-L/home/frans/oe/tmp_minimal/sysroots/armv7a-oe-linux-gnueabi/usr/lib
-Wl,-rpath-link,/home/frans/oe/tmp_minimal/sysroots/armv7a-oe-linux-gnueabi/usr/lib
-Wl,-O1 -Wl,--hash-style=gnu -o libgettextsrc.la -rpath /usr/lib
message.lo po-error.lo po-xerror.lo read-catalog-abstract.lo po-lex.lo
po-gram-gen.lo po-charset.lo read-po.lo read-properties.lo
read-stringtable.lo open-catalog.lo dir-list.lo str-list.lo
read-catalog.lo color.lo write-catalog.lo write-properties.lo
write-stringtable.lo write-po.lo msgl-ascii.lo msgl-iconv.lo
msgl-equal.lo msgl-cat.lo msgl-header.lo msgl-english.lo msgl-check.lo
file-list.lo msgl-charset.lo po-time.lo plural-exp.lo plural-eval.lo
plural-table.lo format.lo format-c.lo format-sh.lo format-python.lo
format-lisp.lo format-elisp.lo format-librep.lo format-scheme.lo
format-java.lo format-csharp.lo format-awk.lo format-pascal.lo
format-ycp.lo format-tcl.lo format-perl.lo format-perl-brace.lo
format-php.lo format-gcc-internal.lo format-gfc-internal.lo
format-qt.lo format-qt-plural.lo format-kde.lo format-boost.lo
-inst-prefix-dir
/home/frans/oe/tmp_minimal/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/image)
arm-oe-linux-gnueabi-libtool: relink: arm-oe-linux-gnueabi-gcc
-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
-mthumb-interwork -mno-thumb -std=gnu99 -shared  -fPIC -DPIC
.libs/message.o .libs/po-error.o .libs/po-xerror.o
.libs/read-catalog-abstract.o .libs/po-lex.o .libs/po-gram-gen.o
.libs/po-charset.o .libs/read-po.o .libs/read-properties.o
.libs/read-stringtable.o .libs/open-catalog.o .libs/dir-list.o
.libs/str-list.o .libs/read-catalog.o .libs/color.o
.libs/write-catalog.o .libs/write-properties.o
.libs/write-stringtable.o .libs/write-po.o .libs/msgl-ascii.o
.libs/msgl-iconv.o .libs/msgl-equal.o .libs/msgl-cat.o
.libs/msgl-header.o .libs/msgl-english.o .libs/msgl-check.o
.libs/file-list.o .libs/msgl-charset.o .libs/po-time.o
.libs/plural-exp.o .libs/plural-eval.o .libs/plural-table.o
.libs/format.o .libs/format-c.o .libs/format-sh.o
.libs/format-python.o .libs/format-lisp.o .libs/format-elisp.o
.libs/format-librep.o .libs/format-scheme.o .libs/format-java.o
.libs/format-csharp.o .libs/format-awk.o .libs/format-pascal.o
.libs/format-ycp.o .libs/format-tcl.o .libs/format-perl.o
.libs/format-perl-brace.o .libs/format-php.o
.libs/format-gcc-internal.o .libs/format-gfc-internal.o
.libs/format-qt.o .libs/format-qt-plural.o .libs/format-kde.o
.libs/format-boost.o   -Wl,-rpath
-Wl,/home/frans/oe/tmp_minimal/sysroots/armv7a-oe-linux-gnueabi/usr/lib
-L/home/frans/oe/tmp_minimal/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/image/usr/lib
-L/usr/lib -lgettextlib
-L/home/frans/oe/tmp_minimal/sysroots/armv7a-oe-linux-gnueabi/usr/lib
-lncurses -lc  -march=armv7-a -mtune=cortex-a8 -mfpu=neon
-mfloat-abi=softfp -mthumb-interwork -mno-thumb -Os -Wl,-rpath-link
-Wl,/home/frans/oe/tmp_minimal/sysroots/armv7a-oe-linux-gnueabi/usr/lib
-Wl,-O1 -Wl,--hash-style=gnu   -Wl,-soname -Wl,libgettextsrc-0.18.so
-o .libs/libgettextsrc-0.18.so
/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-gnueabi/4.5.2/../../../../arm-oe-linux-gnueabi/bin/ld:
skipping incompatible /usr/lib/libncurses.so when searching for
-lncurses
/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-gnueabi/4.5.2/../../../../arm-oe-linux-gnueabi/bin/ld:
skipping incompatible /usr/lib/libncurses.a when searching for
-lncurses
/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-gnueabi/4.5.2/../../../../arm-oe-linux-gnueabi/bin/ld:
skipping incompatible /usr/lib/libc.so when searching for -lc
/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-gnueabi/4.5.2/../../../../arm-oe-linux-gnueabi/bin/ld:
skipping incompatible /usr/lib/libc.a when searching for -lc
/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-gnueabi/4.5.2/../../../../arm-oe-linux-gnueabi/bin/ld:
skipping incompatible /usr/lib/libc.so when searching for -lc
/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-gnueabi/4.5.2/../../../../arm-oe-linux-gnueabi/bin/ld:
skipping incompatible /usr/lib/libc.a when searching for -lc
arm-oe-linux-gnueabi-libtool: install:
/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/bin/install -c
.libs/libgettextsrc-0.18.soT
/home/frans/oe/tmp_minimal/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/image/usr/lib/libgettextsrc-0.18.so
arm-oe-linux-gnueabi-libtool: install: (cd
/home/frans/oe/tmp_minimal/work/armv7a-oe-linux-gnueabi/gettext-0.18-r3/image/usr/lib
&& { ln -s -f libgettextsrc-0.18.so libgettextsrc.so || { rm -f
libgettextsrc.so && ln -s libgettextsrc-0.18.so libgettextsrc.so; };
})

Anyone an idea how to fix this?

Frans


