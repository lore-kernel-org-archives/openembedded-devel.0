Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1Opq5Y-0007fS-Kl
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 00:10:58 +0200
Received: by wyg36 with SMTP id 36so5535382wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 15:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=tvBUjYwwHLTt4+eiHtIcTui9CrKgo+su2e4dV6fcroI=;
	b=ZYqT6kfUYqV6mKSX/rPNKA1NR46R5/BvXmedp0Qb5tgQd68I3I6VTAygXFDrtplTRo
	ovsbiLyP3UZcv4lC2i/NdhQeqpnbLaHdrIcnZJmu+9/Wouis7k+yo7bWZrRmaleIsFXn
	TV8DP5uCKNSvGxzOauvG6LbfviFOVSAJIR3mk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=dbYPpJaytbgiN/dJfJD60UtmtCVcZTH0+ss5eLPHCN2ZaI0GVWhMUmZO627HkxkrLX
	PLyfdoTFsEzd78WDgIVzzXYZX/fHdWNEzud062VI7QneRzUpZFRvifMxMs52Pt0z+Jf/
	5pKgtxi6oePCCevNd/UbJMJHS8DFzuD/2Rr8w=
MIME-Version: 1.0
Received: by 10.216.89.149 with SMTP id c21mr4073619wef.73.1283119823244; Sun,
	29 Aug 2010 15:10:23 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Sun, 29 Aug 2010 15:10:23 -0700 (PDT)
Date: Sun, 29 Aug 2010 15:10:23 -0700
Message-ID: <AANLkTinA9eBvR8GED__wEG=Yy-DSfdSDWfUBp-pA+pO3@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gpe-package 0.4 does not build
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
X-List-Received-Date: Sun, 29 Aug 2010 22:10:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have yet another package failing to build its gpe-package .04 comes
with this error message: Can anyone help?

NOTE: Running task 2765 of 2777 (ID: 10,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/gpe-package/gpe-package_0.4.bb,
do_compile)
ERROR: function do_compile failed
ERROR: log data follows
(/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gpe-package-0.4-r2/temp/log.do_compile.25974)
| NOTE: make -e MAKEFLAGS= PREFIX=/usr
| arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8
-mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb
-isystem/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-ggdb3 -DENABLE_PCRE
-isystem/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-DVERSION=\"0.4\" -DPREFIX=\"/usr\" -D_GNU_SOURCE
-DPACKAGE=\"gpe-package\" -DPACKAGE_LOCALE_DIR=\"/usr/share/locale\"
-DIPKG_LIB  `pkg-config --cflags libipkg` -pthread
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gtk-2.0
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/gtk-2.0/include
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/atk-1.0
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/cairo
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pango-1.0
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pixman-1
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/freetype2
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libpng12
  -pthread -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gtk-2.0
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/gtk-2.0/include
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/atk-1.0
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/cairo
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pango-1.0
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pixman-1
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/freetype2
-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libpng12
  -MD -Wall   -c main.c -o main.o
| Package libipkg was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libipkg.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libipkg' found
| In file included from main.c:28:
| packages.h:4:33: error: libipkg.h: No such file or directory
| In file included from main.c:28:
| packages.h:57: error: expected specifier-qualifier-list before
'pkg_state_status_t'
| main.c: In function 'main':
| main.c:46: warning: implicit declaration of function 'exit'
| main.c:46: warning: incompatible implicit declaration of built-in
function 'exit'
| main.c:72: warning: incompatible implicit declaration of built-in
function 'exit'
| make: *** [main.o] Error 1
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gpe-package-0.4-r2/temp/log.do_compile.25974
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/gpe-package/gpe-package_0.4.bb
do_compile failed
ERROR: Task 10 (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/gpe-package/gpe-package_0.4.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 2764 tasks of which 2746 didn't need to
be rerun and 1 failed.
ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/gpe-package/gpe-package_0.4.bb'
failed


