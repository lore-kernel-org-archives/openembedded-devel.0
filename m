Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250F9D711D1
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 17:33:16 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.19902.1732123987226366878
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 09:33:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SUiz+szg;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21210fe8775so9486045ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 09:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732123986; x=1732728786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sXEypVC2z/XuVlvw7ajkIT7/2kLbbwMaTUiIhsylQs=;
        b=SUiz+szgbBX22x4jXzgFqkw+4hYb3kjwwXd/6IyN65OYdHOI6aJ7quIHUOvHY33kHF
         oqlUxI2qCWBszl5EpRIvSLpo3cf9K/XxUTrxlbGrubzHSsL8oCJBu57YGEWuf1lIY5rR
         a78ILVbilOB9GTp57V3fTytdcwqDmKqT2n7+a7aTyKYg9BFRALVeZ8kIcOw3EVg6k/7Y
         6jp6U1ZS+kkaU9bOBc+GuD8UroArYyeEbQL2Rw+1UPpGilOdlPttRpt9rt7iLUjErW/K
         QrEwVBOv36L69lgaKYHjL7my8Pd5XO6NDsGw0kTaBGulfZzUgfNHoUumBorkehFQPpzL
         I9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732123986; x=1732728786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sXEypVC2z/XuVlvw7ajkIT7/2kLbbwMaTUiIhsylQs=;
        b=NCGxYR2LRdgjHPTeJxOhhHfdZEAecQR3J4+CAYjRzmFPphYYC5bmy4B5hf45gzmFQm
         LLH434PCQLo6Jr0z+3vvR/CQ6AsWk/YQAYQpUZl5IadZUymcy7GZQqn3ZBONcJHMmvmn
         OSZR91nyG/6rdWKFjFXlpTc0uJ7ZFrivzf4/JNdJ8+eI4Ffw5w791RPGa7Sjz9HQMg+Q
         z9yZp7WtB9H3lGFQXlUNWfE1rLCXMxVPhdwcDObdKNgxPU527OcKUj1h23Za9fpKY8uu
         ppfu+3gm7TGD2EqGLEFeaJSQf623PiHEB4zkJkk99IUgWEVbLhDxhNVzg9RbAV713mhE
         98pQ==
X-Gm-Message-State: AOJu0YyrdRZOh/IK0Nz2kOZap8K6tRw6ts39FBLRHLsU2QU57wlT+vHs
	cgwG9J2zLphBirszjaAUGzHXdpVtWMjm8ajEpMKAsnZvRoDYwxVomMHDXg==
X-Google-Smtp-Source: AGHT+IE2i18D5IgVqr5TFzUArfFHsCiURjyw/qLUN1iyWLOEhsWfPPcoHx8WJLKhBeZY79FN8ZFGEQ==
X-Received: by 2002:a17:902:e943:b0:212:10ea:a4a1 with SMTP id d9443c01a7336-21283c86ac6mr94175ad.15.1732123984967;
        Wed, 20 Nov 2024 09:33:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::2c23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2121859c307sm61533885ad.238.2024.11.20.09.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 09:33:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] keepalived: Upgrade to 2.3.2
Date: Wed, 20 Nov 2024 09:32:58 -0800
Message-ID: <20241120173258.3321858-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241120173258.3321858-1-raj.khem@gmail.com>
References: <20241120173258.3321858-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 17:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113931

Changes are
https://www.keepalived.org/release-notes/Release-2.3.0.html
https://www.keepalived.org/release-notes/Release-2.3.1.html
https://www.keepalived.org/release-notes/Release-2.3.2.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nfigure.ac-Do-not-emit-compiler-flags-into-object-.patch | 6 ++----
 .../keepalived/{keepalived_2.2.8.bb => keepalived_2.3.2.bb} | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-daemons/keepalived/{keepalived_2.2.8.bb => keepalived_2.3.2.bb} (95%)

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived/0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch b/meta-networking/recipes-daemons/keepalived/keepalived/0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch
index 1f9f8b30b1..e44e2035c2 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived/0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch
+++ b/meta-networking/recipes-daemons/keepalived/keepalived/0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch
@@ -13,12 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  configure.ac | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index fae16f1..677b94a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -904,8 +904,7 @@ if test "$enable_hardening" != no; then
- 	  "-Wp,-D_FORTIFY_SOURCE=2" \
+@@ -1013,8 +1013,7 @@ if test "$enable_hardening" != no; then
+ 	  "-Wp,-D_FORTIFY_SOURCE=$FORTIFY_SOURCE" \
  	  "-fexceptions" \
  	  "-fstack-protector-strong" \
 -	  "--param=ssp-buffer-size=4" \
diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.3.2.bb
similarity index 95%
rename from meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb
rename to meta-networking/recipes-daemons/keepalived/keepalived_2.3.2.bb
index c4d59d3caa..2cb76e6d41 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.3.2.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz \
            file://0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch \
            "
-SRC_URI[sha256sum] = "85882eb62974f395d4c631be990a41a839594a7e62fbfebcb5649a937a7a1bb6"
+SRC_URI[sha256sum] = "77f4a22e5a23fa8e49b8916acdfb584c864e72905a2f1de2a7f62ed40a896160"
 UPSTREAM_CHECK_URI = "https://github.com/acassen/keepalived/releases"
 
 DEPENDS = "libnfnetlink openssl"

