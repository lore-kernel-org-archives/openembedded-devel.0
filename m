Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57919C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 10:52:10 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26922.1788173522608536671
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2026 03:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2530cabcf4so510131266b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 03:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788173521; x=1788778321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ojnds/v9eNeqmDICSHxys3vP5HxsPtsAYGDzqvpxAZI=;
        b=emWsi3zSO3Pmlf4d65y4UhpwsulGIqR3eVUg1/TQGFJ3De6TkjYzGrxuJwi8IrGQiW
         sIhXheu5dXS/r+eOFTzS0U1tSS2kTZAkSD5gC9jP1oFsKiiLAegX1ejeVUnljFRmDOcK
         2Zttm2n0YFv7RzxjZySu1UE53zfLIidrDsRv5s4QaOfyzx/GopgL8gvs6k0p0uAyCdCr
         aLkI4sXXFti8ke6RkDHqkdgigBi8L+9KIgwyiEltcl+YwubO4QI8QJ/T9Sfbfz3zShvt
         xN3tlRUtAmtz2IPCuEun4lRaT+1lNdbyjYdUQouOlik2D+oxVTkZ2sl8lfrlXj6frCDp
         085w==
X-Gm-Message-State: AFuF++nCm6DPPVWvMA3ntAEw+zJYKzrJQKIwu2MFvnPTRGoFds5cXZQr
	pzWp0PxpK2kE8PZ5E8Gu9Mtrc8/FbJeIQvO43go2w1udRZzJAE3yuLQ20N9vsw==
X-Gm-Gg: AR+sD12zLRxW+IQkUIpvZ5x6d8pxYZSDym+wzRxExdfwOINh2OZpMz4hV5BztxzWG1B
	XQvr9HMfzvN2FCU3s7TxhSXDPf2M1P0nOUHeMcQiZ/3O8E/ySUJZN3nrB+sOV1O6ALhsAaf6kSA
	3rX1PqgIokce9F3u+JyxddUOpv9YrPfVsdAXZHsT4GLU9dHJ95RSpkdjDFacuL0kch5RlLidIUn
	M19apZQQiH3QPLJq9L/hXewaVNwl93wY7ZeXm+9NkoLPECj25aH7ho6pv1U1zk8EsKcUy+9NFIA
	ITqspwjaJp60s0Ml9jTzdo7MJMREdUTk5M/HaGdxD3YGbo/5SE/u9B/6CxYszOuQkIAlPyFQ313
	+DvB59DELWWVUtgV+KIsq/owDOKSpmYudDctTIWuT7zNgK1tRXgxIm68OwWqal2R+aAut6EyW0T
	cKdQG6hSfSOjgJOlvR5Ge/WemUCaplb7ro1QbxO5evjBL3a+3zez53JaEo9T9rKJVtanPfgpgI5
	57vEC3Z8gEV+Oy4PTU=
X-Received: by 2002:a17:907:948a:b0:c24:f8e0:f092 with SMTP id a640c23a62f3a-c25ab25fb1fmr152698466b.1.1788173520554;
        Mon, 31 Aug 2026 03:52:00 -0700 (PDT)
Received: from clast-p14s ([92.241.207.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255eacf6bbsm404009366b.0.2026.08.31.03.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:51:59 -0700 (PDT)
From: Claus Stovgaard <claus@stovgaard.com>
To: openembedded-devel@lists.openembedded.org
Cc: Claus Stovgaard <claus@stovgaard.com>
Subject: [PATCH] android-tools: Install bootimg utilities
Date: Mon, 31 Aug 2026 12:51:53 +0200
Message-ID: <20260831105153.1492735-1-claus@stovgaard.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 10:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129612

mkbootimg.py is used for creating boot.img for devices with abl
(android bootloader) like Qualcomm qcs8550 and similar.

Signed-off-by: Claus Stovgaard <claus@stovgaard.com>
---
 .../recipes-devtools/android-tools/android-tools_35.0.2.bb  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index 0431bddcdf..761c98f5d7 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -219,6 +219,12 @@ do_install() {
     install -m0755 ${S}/debian/out/system/lib*.so.* ${D}${libdir}/android/
 }
 
+do_install:append:class-native() {
+    install -d ${D}${bindir}
+    install -m0755 ${S}/system/tools/mkbootimg/mkbootimg.py ${D}${bindir}
+    install -m0755 ${S}/system/tools/mkbootimg/unpack_bootimg.py ${D}${bindir}
+}
+
 PACKAGES =+ "${PN}-adbd"
 RDEPENDS:${PN}:class-target = "android-tools-conf-configfs 7zip android-libboringssl"
 RDEPENDS:${PN}-adbd += "${PN}"
-- 
2.54.0


