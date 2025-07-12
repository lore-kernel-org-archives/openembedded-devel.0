Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF739C83F1B
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 02:33:52 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.29428.1752287625216758727
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 19:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nz5ZRxat;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-748d982e92cso1803465b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 19:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752287624; x=1752892424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSOkp0BMLhaRGZO8esUclkk8spNZ0NOzsgiDUakRAKQ=;
        b=Nz5ZRxatre39lmt6D5K1rAJCkQkcGpjqiwyHsx5vG9RHK+NFeCESIl2Ug/EZNFwzxU
         wm8XP19jj/bEiFsCsDKvk1aPuqW2kli5kpD3Uk+nUnq9oY3xEKxJBHpAHmF3VrCGGhga
         Za7eSGJE6Fqeam8qfTI47jRWKmzwGDZWz87bEx9iPklCJxTrAvhNQHLQ8c6KydVP88oY
         iT9QUf9738SXRR/zX+OmCncN+3ihwqUElnatgIYsivDCI8Km8DkmhNtfta+RYl7RCGbr
         6DSw++AXhGvYGWE6DOvTNx8rfx7IqDhMw2h64t6Q/y+PQnAk4XskcPjc4+HSyINpanDd
         aLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752287624; x=1752892424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSOkp0BMLhaRGZO8esUclkk8spNZ0NOzsgiDUakRAKQ=;
        b=AiUmTmhKyyh8cHxoy7RKi7+rWaNGjSl5OIAmuXk0tYZRJ/ZAXyTL9hZe6BDtmeWLnH
         KNYwUZuH2Kf9tCaaR1B77ek5n1Zn1qdw5ZrVZPQ25Kqj/eNrD0lbLFSbK8JiaZ44Ufx8
         ppYSgxq1cbVZ6M7uR9s3D1utm50pBCZktPfDthGpSzux3+DJbtSMkrweZeuPjAMVwK2Y
         J55Yhn21YH2bh57agqRsWPzu4pkrVMflGXh7zNg4SCUl0cfQD3Dom09rSZ5I4N+RLm0m
         v6GWQyvFp3PZu1I6W5C2qzqRlokU81wVIC83RnSWOjolgSbkK96m3N4I7SMQV3G7rrWL
         HWRQ==
X-Gm-Message-State: AOJu0YwttXFjtssXTK9sdrPRuAJGOHfODAGPUcImkq/Uz586KKp8uO8o
	YrJXkAs8eoZW3J+6ujXZZcDnn4JDJnpmCpT+arAXsJLgYR9bUkHlEImmlhz7/kwA
X-Gm-Gg: ASbGncuMy5ZRys2xh6LNKo50TWcEOkuyVAbABBef/+n4Ib1FQaQQNesLqP541C8TdCa
	JuDVs5Q1kKIiO8jqqANdyOEzkowFlXTTbA1raRMaV2TEBPih85nI6dDXfaKxQ8oM7BfdhTXDm2R
	BX9caxYLKq4lsSXBRqZcICbuRto6yCBCHrwUTCtFRM0YUOfPAsgh7yFnEqTz51x/Bm1GL9AohZE
	talihMUlnxwmNTYlf/4W7J4caSC5RG5I3/GIh/UzVsqfIW/0yG5YmZIbqiB5H+h3+9Go1fiI4st
	IjN7nLvbPpXUtsK0R+ECGqB7faCM3UEaBQxuWJ1PBFp88KNPrKz0F7s9ZMZLQ1ESGRmlsiXA+u4
	jPtBVvk+JFFYYxA==
X-Google-Smtp-Source: AGHT+IH+/2xCItDBGIgAG1SHyThigy/4JW/h/ChxJUKMpflmCLvVNqR4kuDzakDVmn8qeDeYhWNEvw==
X-Received: by 2002:a05:6a21:3990:b0:1f5:83bd:6cc1 with SMTP id adf61e73a8af0-2311a7c9719mr8893196637.0.1752287624159;
        Fri, 11 Jul 2025 19:33:44 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe5baf70sm5894240a12.32.2025.07.11.19.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 19:33:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 2/2] xfce4-clipman-plugin: Use meson for building this recipe
Date: Fri, 11 Jul 2025 19:33:40 -0700
Message-ID: <20250712023340.3814738-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712023340.3814738-1-raj.khem@gmail.com>
References: <20250712023340.3814738-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 02:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118467

autotools is still supported upstream but meson is preferred starting
with 1.7 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../clipman/xfce4-clipman-plugin_1.7.0.bb            | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.7.0.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.7.0.bb
index c2e2f32d5c..2f007e11c3 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.7.0.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.7.0.bb
@@ -8,14 +8,16 @@ inherit xfce-panel-plugin
 
 DEPENDS += "xfconf xorgproto libxtst glib-2.0-native"
 
+XFCEBASEBUILDCLASS = "meson"
 XFCE_COMPRESS_TYPE = "xz"
 SRC_URI[sha256sum] = "903302c3070a951d44ee17a84fa3cf21d36c6787678af8fbfc79e469fd00cb46"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
-PACKAGECONFIG[qrencode] = "--enable-libqrencode,--disable-libqrencode,qrencode"
-PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland, wayland-native wayland"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)} \
+"
 
-EXTRA_OECONF += "WAYLAND_SCANNER=${STAGING_BINDIR_NATIVE}/wayland-scanner \
-				 GLIB_COMPILE_RESOURCES=${STAGING_BINDIR_NATIVE}/glib-compile-resources"
+PACKAGECONFIG[ptest] = "-Dtests=true,-Dtests=false,"
+PACKAGECONFIG[qrencode] = "-Dqrencode=enabled,-Dqrencode=disabled,qrencode"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,wayland-native wayland"
 
 FILES:${PN} += "${datadir}/metainfo"

