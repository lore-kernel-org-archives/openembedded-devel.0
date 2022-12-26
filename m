Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51036C3DA79
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 22:57:53 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.147015.1672095466097472912
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 14:57:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mxNsI3qn;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id h7-20020a17090aa88700b00225f3e4c992so3093334pjq.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 14:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YnIUUlwb5SzJmbQttiFCBzRFzNg3phD8V3TGZ3oa3mI=;
        b=mxNsI3qnZaiqpo4pIeMIV8jlKObMPrbQopjI4LUmEjkSPsYz3iScD3AQj+lbI4VNIk
         oe1Q2tMPMUd9K0YgZTkER+oWERhvoUjmazkHOKZOjh+CRat1jYQcMPJTvIHFcFnOScvJ
         zOVH69+g7CMvKCg2lsO+1LDHgrBB9umTUtd7LJmkfXYVDFX2j7QaDg2SY78uVpr2MkWA
         bSXDfkzi1loOcq/jEkVkhg8t6PmfrJBBXQrnbd39SbxPUu0mF9CQIupbDTrUGaYLjtph
         bF7RjxbsU4Ods2++Hb2/puAUbsXnGe0M/imN+JUPpNmeZGavgIcxww8XkbQIAv3Bm8YU
         rPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YnIUUlwb5SzJmbQttiFCBzRFzNg3phD8V3TGZ3oa3mI=;
        b=Y6ZHdsn+8zXOsZ/GObnyaPyW5PyBCDiZn0TAwel5xawwv2vAWifmICrYkSM8jHWBr+
         ShGToErexrYtUB566TkR8AZOR+hIEenLMAzrCjgFrz6VhedzHirCgUm/5Zxjgf/1NMbU
         mL6xCJe8nKx8jO0z7Tt17e1aoYnZBNNUh2egRj4CslyctxRMF9fEh5kKmhIyEnChTPOL
         T8ZpIVY3Pxr3oaBD/BzSFeblIx1Cs4BrDiEQ1+a0w46hsL1QR191zYsHKh0jtT41vSfG
         BDKFtwsLJT/34eAO89KkOeCvO5VdWjhMjdYusBU4XHSs3SSA+o2TpaMfNx5oBuvRzB4g
         cHPg==
X-Gm-Message-State: AFqh2kqsOQUHhop5vBTewPJ5Pw96j0SXOqyG8ukrJZXiYBKfQqekN0+W
	WlS4OITxBaSvnuXNHP82SLx7dMv5kLk=
X-Google-Smtp-Source: AMrXdXsu/K3eNEm/fmZ46846+1x33i6NBrN1O5XPFDZLEZtHnQWbhOPVIlXhNDvLMmJf8b05QT88LA==
X-Received: by 2002:a17:902:710f:b0:192:4ce1:13f0 with SMTP id a15-20020a170902710f00b001924ce113f0mr16749822pll.56.1672095465183;
        Mon, 26 Dec 2022 14:57:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id u7-20020a170903124700b00189a50d2a3esm7557078plh.241.2022.12.26.14.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 14:57:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] spice-gtk: Use libucontext for coroutines on musl
Date: Mon, 26 Dec 2022 14:57:42 -0800
Message-Id: <20221226225742.1745493-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 22:57:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100247

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb b/meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb
index d654a36f48..44b42a3313 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb
@@ -38,6 +38,7 @@ DEPENDS = " \
 	usbutils \
 	zlib \
 "
+DEPENDS:append:libc-musl = " libucontext"
 
 RDEPENDS:${PN} = "python3-pyparsing python3-six"
 
@@ -46,5 +47,7 @@ inherit meson pkgconfig vala gobject-introspection features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 EXTRA_OEMESON = "-Dpie=true -Dvapi=enabled -Dintrospection=enabled"
+EXTRA_OEMESON:append:libc-musl = " -Dcoroutine=libucontext"
+
 
 FILES:${PN} += "${datadir}"
-- 
2.39.0


