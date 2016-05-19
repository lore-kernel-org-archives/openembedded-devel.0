Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6928B60721
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2016 20:10:03 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id s63so9390014wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2016 13:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6g/Uq5qjrKLnPgk/Jf8R5tRpWOmCVc74LC2HzFwFdtU=;
	b=bQo4QPEGrVaaptNkHHmM7GqW/P6pJYeJgnNNqY2vYNvXtw93xMdyBsqSvB/hkkfRPH
	zBJAIM3WifvUz9vRx0ocFOof0daFEcIG3UAZnx5N1wQn08vzBwKclNLbP5W4fpUxvL1R
	FwuGJMqNNnWZQzZWWoWaCeWGLSG0vQaJQEYwpPEX1dLnHzL1BRyT5kKw3VIaAVK82z4E
	TYzrpax67lgIt2/VNJxBhSBCLvs95z80OvkTjpbMP7JHS32Zp+QhJ9zeeQXqQKaz7hpH
	nEzypVN5p46TaIAAAPew8kzO8Qjc/gNrQi/1n34Zuiki/bsRGKDFK41ukJmLiQ37+FIa
	4HOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6g/Uq5qjrKLnPgk/Jf8R5tRpWOmCVc74LC2HzFwFdtU=;
	b=Qq9NgyJILnPQQ8DbYjRG23ZXtCE8u1qCoU9Os2e+Yp27KOG6PU40bRzXrKJpnffciz
	3LFcX95V3Xy6mtUGIjSyXbuB94QoX4/vxBCUO9yg203k1VBmNL2w4s41M/Axzj2nrhLz
	Dhoi5qNuy4KbTbc3lLXfPIOzijCAz+Fls/zJUiDt39vmqKkH0oWs2mFkrh3dciAvbNNW
	HUVYILvyNyVAXyTBWJJKF8J8ztGt6K3vKlUlwE35T/u9wo31p0ndqAtbqO694O3sPThT
	++E6b3JSIWJkmuHlcpYJChOQ67YHiEaehZeSqA43SXaFiCa4m0kjsV2n98GABPNDM+1G
	4WzQ==
X-Gm-Message-State: AOPr4FWEkgIWDFkwSPu87ujBmOCnMfoeBNlVH+hhZMyZqcoSt4ZU0T5/KjC5PSBmOvMtig==
X-Received: by 10.28.23.138 with SMTP id 132mr16147923wmx.50.1463688604472;
	Thu, 19 May 2016 13:10:04 -0700 (PDT)
Received: from localhost.localdomain (p5B0A38BA.dip0.t-ipconnect.de.
	[91.10.56.186]) by smtp.googlemail.com with ESMTPSA id
	w3sm16129913wjt.0.2016.05.19.13.10.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 May 2016 13:10:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 May 2016 22:09:40 +0200
Message-Id: <1463688580-15506-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] fontforge: add back gnulib to DEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 May 2016 20:10:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

commit 00ec8bc10df539ecedc3beb2dde28a8e4665cad8
Author: Paul Gortmaker <paul.gortmaker@windriver.com>
Date:   Sun May 8 15:08:12 2016 -0400

    autotools-bootstrap: make bootstrap package specific.

removed this dependency causing:

ERROR: fontforge-20150824-r0 do_configure: Function failed: do_configure (log file is located at /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/fontforge/20150824-r0/temp/log.do_configure.26234)
ERROR: Logfile of failure stored in: /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/fontforge/20150824-r0/temp/log.do_configure.26234
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing shell function do_configure
| cp: cannot stat '/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2/usr/share/gnulib': No such file or directory
| WARNING: /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/fontforge/20150824-r0/temp/run.do_configure.26234:1 exit 1 from 'cp -rf /home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2/usr/share/gnulib /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/fontforge/20150824-r0/git'
| ERROR: Function failed: do_configure (log file is located at /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/fontforge/20150824-r0/temp/log.do_configure.26234)

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
index 53899f1..6f876aa 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=3f922b42ed0033fa0fd4cd3268f6429c \
 "
 
-DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool uthash"
+DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool uthash gnulib"
 DEPENDS_append_class-target = " libxi"
 
 inherit autotools pkgconfig pythonnative distro_features_check
-- 
2.5.5


