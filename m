Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC1FCAC5B6
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:28:58 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.11199.1758716935760273127
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KglIg4Xy;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb78ead12so1020059366b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716934; x=1759321734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGeZrijDjIbSbdiaFdrA44r0M8s1nHzLQ0B/RGQ1yto=;
        b=KglIg4Xy+LtKruJrTIWQsj84qGKLU6zoOHxJED0AZUn8JuvaPlCiLrAQLa41ITc+tN
         jk4RvUc0Jvy9ErsudIrBTJ0wJoPW1TemG9ACQXfgjUzu+0H/e2g1e0YnJgpX6DpGI6Hb
         gqQdGGHwg4FfR5hwFIl2vHffAglh5XWrOht0ZTUTgBriCVSQRdrSy2hacjsBIhRbE2cg
         rqmfOMcS/XsMBJ4zLoMcoJsX/AYYmZyVhapPh93YHDd4BGHwaVh8HHB/FtI1jKIuRpVk
         byr7soWdJPBOkDm0E6IML3bEkR6qpVe7ws1Yc7lSA0/4UXj9igBaNeFMRVPrWR8yRmNP
         k02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716934; x=1759321734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGeZrijDjIbSbdiaFdrA44r0M8s1nHzLQ0B/RGQ1yto=;
        b=q8PxVEmHhALNhf3+RrKkg7s5U4XR8W3sCwg4blh9/b7q9cbpNjBuIiKLq/ste75g+a
         SKVNVc5RYLGF5SRngP+NMwNkckaggtrRvWIlsI0VAJbmNQ+Uoh+qlCVqlS/rJ6/pu+tI
         0J8fTJ7qyg3Qsg7qFh6fwaEKGr1lyRqQepcMSPPotdy6+YzYKtcR8PbgN/lzglFOT5GZ
         GH4EWfA3VqIUtvqHTK5GeLShYd+asJseGu2KcLqloF65KR+ZkoNMixPRZT7fCHAIZbVN
         BtzWyUlhXBPW9V//5TgRcUQj2EDILogJb3RS07buLUb8lbiA15Gc35mLnnVeFlfmQWyG
         BqoQ==
X-Gm-Message-State: AOJu0Yy8GT/aj4Xk1QxiZfF83YmewKvtkWIwxgO+uqCek567ndH/B76q
	Oe+RNsNqL8XQTR84NU5GAlMs6E35yGMksQaF1/6Yzy+azqyHULaShsHxbCjMvQ==
X-Gm-Gg: ASbGncv7ec5dVpRG0HWwN7TcyRiTk2seUnPbalpQxe0mSEZsWkxt8erdR4ew/QiC+Wv
	BfCA/5gXw5pUJOtofJ3um7yuI0xpk+JfecFFakpJs2Pn4DCRG423Epz8YDgaQlQdERm00XCRAK5
	IED+yWC9JeqS4jqlh9QOjfMRYio/Hjewx1AvbG3XeNuT0+VSuqy7EWWA3pXA+OFSAOMAnGhYnVj
	OdxfP4eqCCwej/cHcU5AaXKERqJw+M0RVmz+9AQdT4nRfk97zdAgw/d29I8C9EW/hO8DMZFfAiU
	2DKYXy8z6eJSgRlRyTRiTYiKObIQI/dqG/dFJW0J09snT32H+8eOGGfpzdlYtiJcXV9IO1zsaUR
	oQPZV4N6fGq/KmIJP3lKN
X-Google-Smtp-Source: AGHT+IF8/YI1uv459ESVRqzP+kkmonGqa0O6tJhbsdbrTDL1+WVyo1FkzvfGmQyRassAYsn4XHDsXw==
X-Received: by 2002:a17:907:968d:b0:b2c:dc13:89e3 with SMTP id a640c23a62f3a-b302c8dd51dmr668730666b.59.1758716933900;
        Wed, 24 Sep 2025 05:28:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.28.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:28:52 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 10/20] gvfs: upgrade 1.50.0 -> 1.50.2
Date: Wed, 24 Sep 2025 14:28:28 +0200
Message-ID: <20250924122839.4184719-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119813

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
* smb: Rework anonymous handling to avoid EINVAL
* http: Unescape prefix to fix handling of encoded URIs
* build: Fix build without Avahi support
* dav: Drop user from URI as a workaround for Nextcloud bug
* dav: Port DNS-SD resolver to async API to fix hangs when mounting
* smb: Ignore EINVAL for kerberos/ccache login
* dav: Rewrite to libsoup async API to fix crashes
* dav: Do not lose userinfo when copying URIs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 92d4a5374b3100aed5606c2e759cacab9273c62e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.50.0.bb => gvfs_1.50.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.50.0.bb => gvfs_1.50.2.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.50.0.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
index 93f7f57617..d56b51c727 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
@@ -12,7 +12,7 @@ RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.sha256sum] = "cbc2f564d2e9f00c760673f42d6803bce3e081ab7ffb4456deffffba9339b4dd"
+SRC_URI[archive.sha256sum] = "03d72b8c15ef438110f0cf457b5655266c8b515d0412b30f4d55cfa0da06ac5e"
 
 # depends on gsettings-desktop-schemas->gcr->gtk+3-> x11
 REQUIRED_DISTRO_FEATURES = "x11"

