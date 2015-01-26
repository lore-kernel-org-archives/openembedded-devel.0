Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id B883360017
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 01:14:18 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id w7so5024012qcr.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jan 2015 17:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:date:to:subject:user-agent:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=r7pacN119h0JVrknV0Qjc5/dZDXK1WdPfNYGm1dsedA=;
	b=qnf1lUE6xfIcwZiwCLCjkxOgEY4PYcQHrzh95eJ/fPkpidMYAiFNi/uKevQyGmWODt
	OY+pRQfAqksI7G1NELAgTy3ZBL7VSE1OGbXjoGBBHlYpauPCWSIZvvbxlJmf6WRfEs2I
	ze3uWPIv9/7/hGN/emKmeY8Sc0EOQm/QWLrh+cTn9oU/qAqeb9Iefzy2UNeYJSMEcfoX
	NybvWwlHT8G60htMCqJDDxg+59B5r6JjxG5LTz8jqKViuQNO4gu9+10d09Khc3u65Hb2
	u/Xz2DYKI/iTZjSBUCO17HmoQwLeX2ceXV9agtrvBpBUkDnvJbkl87blEjNyti0eBqmb
	ZsnQ==
X-Received: by 10.224.38.131 with SMTP id b3mr6445845qae.103.1422234859138;
	Sun, 25 Jan 2015 17:14:19 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id p38sm8545122qgd.31.2015.01.25.17.14.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Jan 2015 17:14:18 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
X-Google-Original-From: otavio@nano.lab.ossystems.com.br (Otavio Salvador)
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 338911CABCE20; Sun, 25 Jan 2015 23:14:08 -0200 (BRST)
Date: Sun, 25 Jan 2015 23:14:08 -0200
To: <openembedded-devel@lists.openembedded.org>,
	listing@nano.lab.ossystems.com.br, Mailing@nano.lab.ossystems.com.br,
	Meta-OpenEmbedded@nano.lab.ossystems.com.br
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Message-Id: <20150126011408.338911CABCE20@nano.lab.ossystems.com.br>
Subject: Updates to meta-java (master) in 2015-01-25
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Jan 2015 01:14:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

I pushed following updates:

commit 9319b7458cd136404998f7aeb5508a2baa83e40a (HEAD, origin/master, origin/HEAD, master)
Author: Zhenhua Luo <zhenhua.luo@freescale.com>
Date:   Wed Jan 21 16:34:50 2015 +0800

    openjdk-6: Fix cross compilation for e6500 machines
    
    This is only way for compile for now since qemu can not
    run the sizers binary for e6500 machines. It segfaults
    so we disable generating sizes and also xawt and jawt
    which depends on sizers, this lets jre to cross compile
    for ppc/e6500
    
    The fix is ported according to da0b3a20a67496dc8d4282d19a60672001b7f825
    
    Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
    Signed-off-by: Ting Liu <ting.liu@freescale.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit a9553d6660e4b0def65b3fcfbd923b687ed857a0
Author: Ting Liu <ting.liu@freescale.com>
Date:   Wed Jan 21 16:23:05 2015 +0800

    openjdk-6: do not run gamma test for cross compiles
    
    set CROSS_COMPILE_ARCH which will be checked before run gamma test.
    
    Fix the below issue:
    | make[6]: Leaving directory `.../openjdk-6-jre/6b32-1.13.4-r22.0/build/openjdk.build/hotspot/outputdir/linux_ppc64_zero/product'
    | cd linux_ppc64_zero/product && ./test_gamma
    | ./test_gamma: line 72: ./gamma: cannot execute binary file
    | make[5]: *** [productzero] Error 126
    
    Signed-off-by: Ting Liu <ting.liu@freescale.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit c78363c6050ef244a2df65e2677a03f0af09ecec
Author: Ting Liu <ting.liu@freescale.com>
Date:   Wed Jan 21 16:23:04 2015 +0800

    openjdk-6: pass option --disable-system-lcms
    
    Fix the below issue:
    | checking whether to enable the use of LCMS2... yes
    | checking whether to use the system LCMS install... yes
    | checking for LCMS2... no
    | configure: error: Could not find LCMS >= 2.5; install it or build with --disable-system-lcms to use the in-tree copy.
    | Configure failed. The contents of all config.log files follows to aid debugging
    | ERROR: oe_runconf failed
    
    Signed-off-by: Ting Liu <ting.liu@freescale.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 58c5f41799bec30a5576137d5477e8ba14a0a802
Author: Ting Liu <ting.liu@freescale.com>
Date:   Wed Jan 21 16:23:03 2015 +0800

    openjdk-6: Remove currency data generation expiration date
    
    As the openjdk source was extracted during 'make patch-ecj' in
    do_configure, apply the patch via do_configure_append.
    
    icedtea6-1.13.4/Makefile.am:1200:stamps/extract-openjdk.stamp: stamps/download.stamp
    | if OPENJDK_SRC_DIR_FOUND
    |         if ! test -d openjdk ; then \
    |           cp -pPR $(OPENJDK_SRC_DIR_LINK) $(OPENJDK_SRC_DIR) openjdk ; \
    |         fi
    | else
    | if USE_HG
    |         if ! test -d openjdk ; then \
    |           cp -pPRl openjdk.hg openjdk ; \
    |         fi
    | else
    |         set -e ; \
    |         if ! test -d openjdk ; \
    |         then \
    |           mkdir openjdk ; \
    |           $(TAR) xf $(OPENJDK_SRC_ZIP) -C openjdk; \
    |           chmod -R ug+w openjdk ; \
    |           sh $(abs_top_srcdir)/fsg.sh ; \
    |         fi
    | endif
    | endif
    
    Signed-off-by: Ting Liu <ting.liu@freescale.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 7b66216905c9420032e8a7b97e6a4466f6ec6118
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Tue Jan 20 16:27:10 2015 +0100

    README: improve copy/paste experiance
    
    The section with stuff to be put in local.conf/distro conf currently
    can not be directly copy/pasted from the README
    - adding a missing "
    - putting a # before each comment
    - commenting out alternatives
    - fixing version string 6b27-1.12.8
    - adding version 6b32-1.13.4
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit e705d5e697d20c6811b9687313b027f66a17a42e
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Tue Jan 20 16:14:24 2015 +0100

    Revert "openjdk: Fix QEMU call to use sysroot for libs"
    
    This reverts commit ab51e51d9a9a51bedd19de09bcba4ce830dfc5e7.
    
    Using an oe setup with ptest enabled makes qemu never to return due to testfiles
    staged by udev in the sysroot
    See also:
    http://lists.openembedded.org/pipermail/openembedded-core/2014-September/097098.html
    
    All binaries compiled for qemu are now linked with -static. The -L, -E parameters
    pointing to the sysroot and dynamic linker are not needed anymore and removel works
    around the issue.
    
    Further details:
    http://lists.openembedded.org/pipermail/openembedded-devel/2015-January/099795.html
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit cb351db824b0eb4a71514156bba543f6dde19740
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Tue Jan 20 16:14:23 2015 +0100

    binaries run by qemu: link with -static, force ld.bfd
    
    For machines using DEFAULTTUNE = "armv7ahf" or DEFAULTTUNE = "armv7athf" a build
    of openjdk-7 fails with segmentation faults during the qemu-arm runs.
    
    e.g.
    Segmentation fault (core dumped) | qemu-arm -cpu cortex-a8 -s 2097152
      -L .../sysroots/colibri-t20 \
      -E LD_LIBRARY_PATH=.../sysroots/colibri-t20/lib ./mkbc - bytecodes_arm.s
    
    I found that qemu-arm can not execute any binary which is compiled with the
    resulting compiler and is linked with the gold linker and the -static flag.
    Even a simple hello world program does not work. When executing that
    hello world on the real hardware it also generates a segmentation fault.
    
    Removing the -static flag or forcing the bfd linker fixed this.
    
    Note that other machines, colibri-t30 or i.mx6 based ones with neon but
    otherwise identical setup do not suffer from the issue.
    DEFAULTTUNE = "armv7athf-neon" works.
    
    While at it convert the sizer call for openjdk-7 used when building xawt
    also to use -static even though the code is currently disabled.
    
    Further details:
    http://lists.openembedded.org/pipermail/openembedded-devel/2015-January/099795.html
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

