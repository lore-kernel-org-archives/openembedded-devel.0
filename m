Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B326CF2572
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 17:53:41 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.15784.1728755618002130024
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Oct 2024 10:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bsULR5Mj;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20ca1b6a80aso13350435ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 10:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728755617; x=1729360417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKS6b/jZM6NqoU3XenwJaPzttzyIVQrTJ1fHL62kcU8=;
        b=bsULR5MjIQGmc14IpxEoFqSZvjMaNAJbUi+TlDrLVwF+Yb5P/yvtry5l58IzBjHfPU
         mvpbHyg+PF05/7LgttkV9768GFAtOTEwJ5nFiawFQIdRoe6rQmZe8Mu+EsP2Wt4XfPCA
         /DA5DHZ06CYITQOv7EC2CAe9HSxl41TQEcOTaXQbADq7DlsuNwCTDB132NSi3fD+wwxm
         bQAlZWLSVrVb3tuemH2x/6cRLcp2hlIshP7HDn5YJs1wWwycqKy7nHKkIkBYQoknON8p
         OfdZXg6RsH9ZwlBz8IBR0z7UslIHdP4XHiaFbLmyBU5DIQwD3zVnASKIebEh0/VFIyzD
         PR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728755617; x=1729360417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKS6b/jZM6NqoU3XenwJaPzttzyIVQrTJ1fHL62kcU8=;
        b=oIaXGRPlFpjp2xOLd9UprA1VX9Fq3pInpV07owv7sJ6Yc8MVPQ3Q8Hjd5Fth0qSzGV
         XJbIGVXpRHut6A+HJTQNKL3X3C5RS74ELpd30wZqaK/UnLEZZVpsU8+kmL9Hz7+WWx4C
         H0wXuAfIrcPzUzd7k0SRVHp9zVfEEhT8073Er92T6Gq/IEa3KHW5bUTNuX0Fkqy2JyBx
         BTyyBjCZiDFAPxgRGzoweplxmZVopwWvtMD0mNXTDxr17krE2e53J65sh0AUGgdkB9eR
         h7ivoj10S4DCsNezcMC5CVzozXvoB+c0LwBy0t5iZdpOlfJw6pH7/2pjed+nAhAx+JXs
         FcuQ==
X-Gm-Message-State: AOJu0YyOA5RbUl7eyaMqXkFHjJEkby/4d7UmfQAAX/nJAWc09U9VfT2a
	epJrrViQ7SVa6o3cFzY7V99yJUzMfgpDT2R3zMFn4kGAKrMf0RxtSOh37UDF
X-Google-Smtp-Source: AGHT+IGYmHMFNjVYwLonLT8CPih9aco4n4mwpqLh7yBBH7P3vRJv9TEdV+Ql5OJTmDdgTvOMyFXyqg==
X-Received: by 2002:a17:902:d489:b0:1fa:1dd8:947a with SMTP id d9443c01a7336-20cbb2408b7mr48168295ad.46.1728755617150;
        Sat, 12 Oct 2024 10:53:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c4a4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea448e4147sm4160936a12.5.2024.10.12.10.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 10:53:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] gstd: Remove redundant rpaths
Date: Sat, 12 Oct 2024 10:53:33 -0700
Message-ID: <20241012175333.3771470-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241012175333.3771470-1-raj.khem@gmail.com>
References: <20241012175333.3771470-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 17:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112833

Remove the logic to add rpaths in meson build file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-gstd-Remove-redundant-rpaths.patch   | 26 +++++++++++++++++++
 .../gstreamer-1.0/gstd_git.bb                 |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-Remove-redundant-rpaths.patch

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-Remove-redundant-rpaths.patch b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-Remove-redundant-rpaths.patch
new file mode 100644
index 0000000000..b1e1e897bf
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-Remove-redundant-rpaths.patch
@@ -0,0 +1,26 @@
+From c183aae97728e25e0822b14f5093f60cb4331207 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 12 Oct 2024 10:48:01 -0700
+Subject: [PATCH] gstd: Remove redundant rpaths
+
+This emits /usr/lib into binaries which are redundant
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gstd/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gstd/meson.build b/gstd/meson.build
+index b6aa588..8cdf810 100644
+--- a/gstd/meson.build
++++ b/gstd/meson.build
+@@ -18,7 +18,7 @@ executable(exe_name,
+   include_directories : [configinc, libgstd_inc_dir],
+   dependencies : [gstd_deps, lib_gstd_dep],
+   c_args: gst_c_args,
+-  install_rpath: get_option('prefix') + '/' + get_option('libdir'),
++  #install_rpath: get_option('prefix') + '/' + get_option('libdir'),
+ )
+ lib_gstd_dir = meson.current_build_dir()
+ 
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
index 43b82526dd..3b0d3ded13 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
@@ -9,7 +9,8 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstre
 
 SRCBRANCH ?= "master"
 SRCREV = "dac03d5e4102080a8f3ef274a6a6583455962095"
-SRC_URI = "git://git@github.com/RidgeRun/gstd-1.x.git;protocol=https;branch=${SRCBRANCH}"
+SRC_URI = "git://git@github.com/RidgeRun/gstd-1.x.git;protocol=https;branch=${SRCBRANCH} \
+           file://0001-gstd-Remove-redundant-rpaths.patch"
 S = "${WORKDIR}/git"
 
 # Remove the +really when upstream version is > 1.0

