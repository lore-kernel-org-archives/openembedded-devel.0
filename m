Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RbALW-0005b5-1E
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 13:23:34 +0100
Received: by mail-ee0-f47.google.com with SMTP id b15so1718019eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 04:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Sc3fDjEmDUg7nA8YA71zlMbZQVzcaeJA+ZWQXLQwIcc=;
	b=WnLYh+/ANSN7tVSqBVknfzUvQICqC+Hw0+1D9z/3OCzA1MwmfEanCKpmB1v6ndZy9n
	3SURSD66Ys8LLgZoZx2495plkMwtjzWD/ChaxGYKna3a90jFz9+ER9+Q5kTeBeX98wsQ
	HQUHFznjKw32+cNE6LIFEhwqGNHUJZcmgQHjU=
Received: by 10.14.48.9 with SMTP id u9mr1379157eeb.37.1323951398468;
	Thu, 15 Dec 2011 04:16:38 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t1sm13483595eeb.3.2011.12.15.04.16.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 04:16:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2011 13:15:53 +0100
Message-Id: <b85dc69db3d426eaa8df90ab7948b4512ec91c46.1323951062.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <14695ed754963f85a601e945e21179c00199661a.1323951062.git.Martin.Jansa@gmail.com>
References: <14695ed754963f85a601e945e21179c00199661a.1323951062.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323951062.git.Martin.Jansa@gmail.com>
References: <cover.1323951062.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][meta-efl 6/6] libvpx: disable tree-vectorize
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
X-List-Received-Date: Thu, 15 Dec 2011 12:23:34 -0000

* It's causing ICE with latest gcc-4.6 from meta-oe, see:
  http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-November/036001.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/webm/libvpx.inc |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx.inc b/meta-oe/recipes-multimedia/webm/libvpx.inc
index fbece03..8434f38 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx.inc
+++ b/meta-oe/recipes-multimedia/webm/libvpx.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "vpx Multi-Format Codec SDK"
 LICENSE = "BSD"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "http://webm.googlecode.com/files/libvpx-v${PV}.tar.bz2"
 S = "${WORKDIR}/libvpx-v${PV}"
@@ -10,7 +10,18 @@ S = "${WORKDIR}/libvpx-v${PV}"
 # sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GLIBC_2.4'
 ARM_INSTRUCTION_SET = "arm"
 
-CFLAGS += "-fPIC"
+#-ftree-vectorize was causing ICE with gcc-4.6 from meta-oe, see
+# http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-November/036001.html
+#|     [CC] vpx_scale/generic/gen_scalers.c.o
+#| vpx_scale/generic/gen_scalers.c: In function 'vp8cx_vertical_band_3_4_scale_c':
+#| vpx_scale/generic/gen_scalers.c:537:6: internal compiler error: in vect_get_vec_def_for_stmt_copy, at tree-vect-stmts.c:1390
+#| Please submit a full bug report,
+#| with preprocessed source if appropriate.
+#| See <http://gcc.gnu.org/bugs.html> for instructions.
+#| make[1]: *** [vpx_scale/generic/gen_scalers.c.o] Error 1
+#| make: *** [.DEFAULT] Error 2
+
+CFLAGS += "-fPIC -fno-tree-vectorize"
 
 export CC
 export LD = "${CC}"
-- 
1.7.8



