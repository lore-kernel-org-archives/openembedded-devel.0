Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6D1A071A73
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 07:53:44 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r126so9993100wmr.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 23:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Fw86QLlRan5IzYJi9qx/ehaLwbHTLXIuFqELhor8u08=;
	b=L5/8lUVkRe43hSz78Wh7kLIAvsRm6Q2V6BPEqGK1DF5+ZxQm+3tCdLdE8jJQfIm4zL
	030rtcC7Up7wlSW0tOcw+E5RUUxj1siWxTgPHhG/6u4Pd32mkt8SauedI9PRochSoG6L
	+FhfK/9uFZtYi6zp/vl+0NhJF2t58mx8MDeoOigafTmWfr4WNl+GlFY7J6pd1LFsJqmK
	9TcfgCXLy9X8BHPA7+XTAQECnvQZMTNjXCgEjmxmQzGEMzUcUCrWkqnWPy05aUfyFhcU
	R9za+TeAYBdwKZr3zGlh5DlEVL7Tzx2uuRPj5JvFeQC5Jm75waNCYc1gUDT1jrpjMhDh
	bM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Fw86QLlRan5IzYJi9qx/ehaLwbHTLXIuFqELhor8u08=;
	b=RWPfZ1hN2gZdOTN63nQW//hKn18egIKaNqXQ2W//3u6FwSqxsJWzwgVl92iEkJdvq4
	jitRzi7t1hCCXK9OKJGJGricDY54YAn2f2GDC70yqTVZY4f82Ce1e0vMVYZuCLVUSe31
	LBjXHVc+a8UsaT2d5s+Hls5BA482OfUrVOS1JvIezlpK259cDxy5kALr7k8wyFLXkqMF
	qNiRw6weMuc9JfkXmllPc/rqiWJp9HkUI7Vo6DBJL8PB1yGRrY3Zigxo/EjXMxlXmP/b
	AXw2CuMOobncTo8C7kN39WnRsdbZ90HZ7hznaqtTqBDJccJaJckl33gfePJTQA9np/qX
	qS3w==
X-Gm-Message-State: AIkVDXJnjqubfPG+2lSb+ecSoINpl/Csi6/sqXEe4if0MTltpG65+/M2mmK8UmOLMa8Ixg==
X-Received: by 10.223.141.133 with SMTP id o5mr7176253wrb.100.1484812424545;
	Wed, 18 Jan 2017 23:53:44 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	l67sm11050656wmf.1.2017.01.18.23.53.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jan 2017 23:53:44 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jan 2017 08:53:28 +0100
Message-Id: <1484812412-26806-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
References: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] libopus: add --enable-custom-modes to EXTRA_OECONF
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
X-List-Received-Date: Thu, 19 Jan 2017 07:53:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* this is what jack is looking for
* while we are here do some polishing

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
index b5eef82..a24f5e3 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
@@ -20,11 +20,13 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[fixed-point] = "--enable-fixed-point,,"
 PACKAGECONFIG[float-approx] = "--enable-float-approx,,"
 
-EXTRA_OECONF = "--with-NE10-includes=${STAGING_DIR_TARGET}${includedir} \
-                --with-NE10-libraries=${STAGING_DIR_TARGET}${libdir} \
-                --enable-asm \
-                --enable-intrinsics \
-               "
+EXTRA_OECONF = " \
+    --with-NE10-includes=${STAGING_DIR_TARGET}${includedir} \
+    --with-NE10-libraries=${STAGING_DIR_TARGET}${libdir} \
+    --enable-asm \
+    --enable-intrinsics \
+    --enable-custom-modes \
+"
 
 python () {
     if d.getVar('TARGET_FPU') in [ 'soft' ]:
-- 
2.7.4


