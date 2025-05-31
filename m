Return-Path: <dimitris@siganos.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36008C5AE59
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 19:55:18 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.13578.1748721314025603540
 for <Openembedded-devel@lists.openembedded.org>;
 Sat, 31 May 2025 12:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siganos-org.20230601.gappssmtp.com header.s=20230601 header.b=mnlBl8tJ;
 spf=none, err=permanent DNS error (domain: siganos.org, ip: 209.85.221.67, mailfrom: dimitris@siganos.org)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-3a375888297so1844235f8f.1
        for <Openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 12:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=siganos-org.20230601.gappssmtp.com; s=20230601; t=1748721312; x=1749326112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=veGcNkEnkc9GuBZrCrF2l1iiLHn7VLYtCvv0QQMdOkM=;
        b=mnlBl8tJHeSO00VuY96xJ6V0M49yNJadQxpGjvREjXNzmUCcnKryuUyH/paWkL3cES
         yTW0+CMzs1Cfjg0ne2EbJ2+OP5KUTwdP0ZZlNGA5KVP3uGyv3ATAmY8EoZSlu0aNgOr/
         un+52iYBQRszMJYNfnSdzTsXtWs+8Njq7SNOm+CPH/THVXOou3LBBiDRp+qlAy4RI4bC
         /DK/gKVIlY1J0VNxVhoPbnckVi1qoX2DyHg4sORivB77uqkNAsVfkCPqqbbTpgA0sHRC
         mBGGbyNwmNLs6iGrI/hgG/J2G4fjS2pY8n4q1T3k0tXu+QZDnFHkvM/rbmmKj+2OuAW/
         oY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748721312; x=1749326112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=veGcNkEnkc9GuBZrCrF2l1iiLHn7VLYtCvv0QQMdOkM=;
        b=RUfP0qUphpg2cHlgIRbkgWE7GLLSvyA3KQLmKrGv1+KvWdjb3A8hdfMFdpKiq79Df8
         MR/YYdMlhxYfrix076oRxAhOIJgVC0DKdW3vnXOKNb2yrkZP4N0giHETCr6lbhPdoLM6
         kBQfYyFaMXn8uTYVRuZFhKIlSxU8GXhdj+UwIyyF4tYE3ZPhW5ME8wXiJOzUWzOo0r3g
         f6T4V1ipLrNwZrfskCwcocOkFcwjO6eQ4QebiATmssQaEV0BDPws9c/JfLCIhLjh3Kyl
         XsKTTjH71KJS/mVzBYqX+EGJAikFBjBlMNj5P4nBWaUZRzne54kO31ZUMMrq6rjW/Hdi
         lugQ==
X-Gm-Message-State: AOJu0YwN6hIDbPy0fWgsXnExRwe+VUBbpWAEyi+BLqR7aks4tspyG+SL
	RC8p8/rWQdF9pN1ITlttWpf0vU7fHCegOgyAxs8DGO3thXgiedFR0bZCZrmxhGVooF68QVn3JH6
	JtmeEUSlDOzGf
X-Gm-Gg: ASbGnctHevJkPSmrYTMIk8ptcTfuU0SsxZLtSc2j0Uo+wx4D9pA6jVBZeHVu+H6Jja7
	HefFwy89TeInYFzaZxvGw5ACV1Ryaa/m0AIq+PGXtcyVDl0iRiG6JvDy2sOihuQwSjbtxcOC2OU
	OqhpcebQRvT2jyNwpfZz6MOJxsmGnoCrUm4A2e84P1A+p3SPNVqhdYkazr5UzOtLPpcces7Gros
	wMRL7s2w8cL77hnBDtWPwO8s0z14ofZciE+qkrvirz0Af4nn0WWnWyg7/tnYjGS+CN0h733aQjj
	StIIpanGIwj9fE8nWlOxJCCK+0u4YYtFMoldDYKQYKMtTyBE6+twDNgal2IYk3MEfTRzUl18vN0
	osjXTyLsMSlR0mOywKGBJDSlBWYYl+xI=
X-Google-Smtp-Source: AGHT+IHWJzqYYAQT7e1LKUwq9LO44XXtdTUqLLQwsBHoxP3zICtc91YY4ymzsTXMmXeRn8pv5ucjjg==
X-Received: by 2002:a5d:5f8c:0:b0:3a4:dc80:b907 with SMTP id ffacd0b85a97d-3a4f79e725fmr6993056f8f.26.1748721312076;
        Sat, 31 May 2025 12:55:12 -0700 (PDT)
Received: from tux.. (cpc79031-cbly7-2-0-cust13.6-2.cable.virginm.net. [82.14.108.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe754acsm9145460f8f.59.2025.05.31.12.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 12:55:11 -0700 (PDT)
From: Dimitrios Siganos <dimitris@siganos.org>
To: Openembedded-devel@lists.openembedded.org
Cc: Dimitrios Siganos <dimitris@siganos.org>
Subject: [meta-oe][PATCH v2] bvi: fix license + tiny improvement in SRC_URI
Date: Sat, 31 May 2025 20:54:41 +0100
Message-Id: <20250531195441.586612-1-dimitris@siganos.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 19:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117691

Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>
---
 meta-oe/recipes-support/bvi/bvi_1.4.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/bvi/bvi_1.4.2.bb b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
index b0081794d0..fb136e16a6 100644
--- a/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
+++ b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
@@ -2,10 +2,10 @@ SUMMARY = "Binary VI editor"
 DESCRIPTION = "bvi is a visual editor for binary files."
 HOMEPAGE = "https://sourceforge.net/projects/bvi"
 SECTION = "console/utils"
-LICENSE = "GPL-3.0-only"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a36207309d382da27cd66fdaae922e3c"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/bvi/bvi-${PV}.src.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz"
 SRC_URI[sha256sum] = "4bba16c2b496963a9b939336c0abcc8d488664492080ae43a86da18cf4ce94f2"
 
 DEPENDS += "ncurses"
-- 
2.34.1


