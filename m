Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AF8C433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 07:05:28 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.4184.1643353527312039741
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 23:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ORYJATOW;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 z10-20020a17090acb0a00b001b520826011so10153494pjt.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 23:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u4aE2DPhqAQbWUElxDXFFBbqBxVwBg+7Co/qzcoM/Tk=;
        b=ORYJATOWZhBvhUiDLfZgnR3Ra0kyFB6A4P7Ro4keCvVV32b9iU4lAog5jg0RfMPxd3
         QTghR3zWpFdQAqLNiVc7t4D3ap+uTQDCEpLNy3TdV5Nk+4tw+eGtE5O6TiVe2ZW8mqIy
         tW73nq0wpYYOd0Nw7GUWqEN/YfmR5e18NQ4qBXGtyE8zAbjZVhLQ39STtAgzpshgOfrK
         d407HUOyAN3VAw4gSTOkg+D+5k47l20dDI2e5sryoSaArMb4ZRMuwGgRxuBtqTnRexNw
         dYz6eNDhB47mAL7htNdF+za+VcHzzAxxYUNn6Ztm4tSDNvVRqas8+ekT9brMaQFy5rnk
         Y4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u4aE2DPhqAQbWUElxDXFFBbqBxVwBg+7Co/qzcoM/Tk=;
        b=Aq0BuKoutlndBZE2BVRHb+AQdsZkit9KDRdiDBpI+Aq/c6Mau7tq5MBcpng/EyKY2F
         8tLB1Jj7HgS7NzHasu14OcWWHLtER+WEsJ2TrMEUfspavExAUJTlrQvny8m7c+airPC9
         9f4Cvx2hTC3VY4AxwyPLt//pFi+zno5SjPDNEqX6m5h4e5uLwtvxe8BawTlht1KvoE6z
         i1rkmUx4VFSlKYZgiBeBFYAjKiwZN/Qj7PwjjDc8TXo4RGwabtMIQk8mkqJxMXuKrJ2N
         Qf1HmLV3t2tv33yuUHjfCA5eDZLdCZD5a+kj/T4x6Fmlrn+srZTERiyVamfbXQ4qrOHw
         iUCA==
X-Gm-Message-State: AOAM530bA53SPLeV8mM66Rmg9S4MGa5YM6KxIgAM5QOZ3MjcfPBx4uB3
	39eCYgWLJTjmlttk7D1H21aC+lbmSjs=
X-Google-Smtp-Source: 
 ABdhPJwwRaipZ7DsSez41yWW+zljMSBO4yy2IgqNTzXXBnHffi5UcJ5agvq8WduEM4HWgdFSQb6h9w==
X-Received: by 2002:a17:90a:9b06:: with SMTP id
 f6mr4253719pjp.186.1643353526541;
        Thu, 27 Jan 2022 23:05:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 d126sm7655432pfd.136.2022.01.27.23.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 23:05:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/2] gparted: Do not use NULL where boolean is
 expected
Date: Thu, 27 Jan 2022 23:05:21 -0800
Message-Id: <20220128070521.582584-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128070521.582584-1-raj.khem@gmail.com>
References: <20220128070521.582584-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 07:05:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95144

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-use-NULL-where-boolean-is-expected.patch | 33 +++++++++++++++++++
 .../recipes-extended/gparted/gparted_1.3.1.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-where-boolean-is-expected.patch

diff --git a/meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-where-boolean-is-expected.patch b/meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-where-boolean-is-expected.patch
new file mode 100644
index 0000000000..1b0d24024b
--- /dev/null
+++ b/meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-where-boolean-is-expected.patch
@@ -0,0 +1,33 @@
+From 9af84e1c08a2159c10baf13244e2c8a7d7e837e9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 27 Jan 2022 23:02:20 -0800
+Subject: [PATCH] Do not use NULL where boolean is expected
+
+Fixes
+src/GParted_Core.cc:73:57: error: static_cast from 'nullptr_t' to 'PedPartitionFlag' (aka '_PedPartitionFlag') is not allowed
+|         for ( PedPartitionFlag flag = ped_partition_flag_next( static_cast<PedPartitionFlag>( NULL ) ) ;
+|                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+| 1 error generated.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/GParted_Core.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/GParted_Core.cc b/src/GParted_Core.cc
+index f7ac970..3290c66 100644
+--- a/src/GParted_Core.cc
++++ b/src/GParted_Core.cc
+@@ -70,7 +70,7 @@ GParted_Core::GParted_Core()
+ 	ped_exception_set_handler( ped_exception_handler ) ; 
+ 
+ 	//get valid flags ...
+-	for ( PedPartitionFlag flag = ped_partition_flag_next( static_cast<PedPartitionFlag>( NULL ) ) ;
++	for ( PedPartitionFlag flag = ped_partition_flag_next( static_cast<PedPartitionFlag>( false ) ) ;
+ 	      flag ;
+ 	      flag = ped_partition_flag_next( flag ) )
+ 		flags .push_back( flag ) ;
+-- 
+2.35.0
+
diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb b/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
index 1c8dd69686..355bcce9b6 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
@@ -10,6 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = " \
     ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://0001-Install-polkit-action-unconditionally-executable-pke.patch \
+    file://0001-Do-not-use-NULL-where-boolean-is-expected.patch \
 "
 SRC_URI[sha256sum] = "5eee2e6d74b15ef96b13b3a2310c868ed2298e03341021e7d12a5a98a1d1e109"
 
-- 
2.35.0


