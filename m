Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59B5C433EF
	for <webhook@archiver.kernel.org>; Sun, 12 Dec 2021 17:44:24 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web12.788.1639331043934478153
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Dec 2021 09:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=K0asgpyx;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.174, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f174.google.com with SMTP id p8so20716412ljo.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Dec 2021 09:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EvlA+7AwJ/90T6GyDdpcMlsc+K0irp6dlLEaLKjlxT4=;
        b=K0asgpyxoTUWLx++Mu6s4rDGWpSkCRc4JiL86P83HgmOut61HJ6Ly6r3yB8T4K2T5i
         feWVcJ12V/PKENgZ9fX8mYkekZ7jVK8yMghy8iWN9vVaaYj7kwsItJbgtsA66Fk6vOTV
         AwN0qjZC2jSVY/dguxntnA5KEeKxRO89a+V3MRu8vffa2DKAnLbhAk2NfhmyZViLG/H8
         ouNFy1BM/ogrlrxJCD6Kf34nI1kXz14iTJqBzALUWxigA1gyo4NWUjN/NKTzd9PBZG0p
         Wq8x2lekKm5Uld4f0Sj+M+yMZQFyn775gX1sX9VulPqYB/rpGpJ6N4ixYyaBv7TMTIWz
         UhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EvlA+7AwJ/90T6GyDdpcMlsc+K0irp6dlLEaLKjlxT4=;
        b=BFfu+q1PdLwRSa+1fNUabSk1nmNft1cy5qsNhgelLQkz5kgqZfqYanQfXndMumv4bW
         oVRBhrDT5YsJ5fJdzBYQjXCLJU9OkTYCaqYMaTFyj93wKRdE+Mzs8O76yaLhl3msCKtF
         Azi25Ykad7l40tslnWqfvpyk4/SqyepK6pkbTdNmopX+CKIfjGkjaEyH3xwHcW9FoBmk
         0UmWfrsD+vqIThYJCmOgaDezp/2qwO7FXljeDbgKKTYEAe4DRXGCJolYIeFIrNMYm1uF
         k9k1bM+8X5bKceTsuKYRIiVxVNiVj3aLHaNzJ9hfvV9nUhvF7EUuPnDW2bGSs3icG2VZ
         x0CQ==
X-Gm-Message-State: AOAM532v9w8kelmQSARQDR0oPlFPIP6iD2tpBjoQZzIsMMElBo1aB6yL
	1Xfcdz10yWEzXSFNrouw/0Ihg/sLwNBXZSsw
X-Google-Smtp-Source: 
 ABdhPJx7gMGAv7xcrWeTIfnfqIlaBUCrQakctzVx2qYSFVzDgpmqVUuu5qIB3cEK5dZw4H/niD1exA==
X-Received: by 2002:a2e:3c13:: with SMTP id
 j19mr24603494lja.311.1639331041331;
        Sun, 12 Dec 2021 09:44:01 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 r5sm1106259ljd.84.2021.12.12.09.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 09:44:00 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-gnome][PATCH] libwacom: update to 1.12
Date: Sun, 12 Dec 2021 18:43:58 +0100
Message-Id: <20211212174358.3328150-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Dec 2021 17:44:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94304

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/libwacom/libwacom_0.33.bb | 14 -----------
 .../recipes-support/libwacom/libwacom_1.12.bb | 24 +++++++++++++++++++
 2 files changed, 24 insertions(+), 14 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/libwacom/libwacom_0.33.bb
 create mode 100644 meta-gnome/recipes-support/libwacom/libwacom_1.12.bb

diff --git a/meta-gnome/recipes-support/libwacom/libwacom_0.33.bb b/meta-gnome/recipes-support/libwacom/libwacom_0.33.bb
deleted file mode 100644
index 5db78b7cf..000000000
--- a/meta-gnome/recipes-support/libwacom/libwacom_0.33.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "A tablet description library"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=40a21fffb367c82f39fd91a3b137c36e"
-
-DEPENDS = " \
-    libxml2-native \
-    libgudev \
-"
-
-inherit autotools pkgconfig
-
-SRC_URI = "git://github.com/linuxwacom/libwacom.git;branch=master;protocol=https"
-SRCREV = "87cc710e21a6220e267dd08936bbec2932aa3658"
-S = "${WORKDIR}/git"
diff --git a/meta-gnome/recipes-support/libwacom/libwacom_1.12.bb b/meta-gnome/recipes-support/libwacom/libwacom_1.12.bb
new file mode 100644
index 000000000..d35bbaacb
--- /dev/null
+++ b/meta-gnome/recipes-support/libwacom/libwacom_1.12.bb
@@ -0,0 +1,24 @@
+SUMMARY = "A tablet description library"
+DESCRIPTION = "libwacom is a library to identify Wacom tablets and their model-specific features. \
+               It provides easy access to information such as 'is this a built-in on-screen tablet\', \
+               'what is the size of this model', etc."
+HOMEPAGE = "https://github.com/linuxwacom/libwacom"
+BUGTRACKER = "https://github.com/linuxwacom/libwacom/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=40a21fffb367c82f39fd91a3b137c36e"
+
+SRC_URI = "git://github.com/linuxwacom/libwacom.git;branch=master;protocol=https"
+SRCREV = "942628be9faffa96ae1068833eccb00a1bfe4578"
+
+DEPENDS = " \
+    libxml2-native \
+    libgudev \
+"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON = " \
+    -Dtests=disabled \
+"
-- 
2.25.1


