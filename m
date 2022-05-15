Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56964C4332F
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:49:50 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.16868.1652622585276303648
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mgu3EB16;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d22so12084188plr.9
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gHH2mIL2Oo1HOkliCeQPmADN4O5KzZ8JlLNSnpGZZ6k=;
        b=Mgu3EB16tLVWn0DgZJk1OVUpEIkyl5a4uTzUGqmbjZoWodaMkw+LO+tY1fQD4xK2H5
         nT9EF/i1FMTVWMRqTMhoEW5ku+wHWUQ2cVLDqemd2JgWt1bR5+aWAuiXFcJenaevDLjE
         Sza47831hV2dIfGaaw/nphVGnQ5g1FgFGDPql9NYuhrNv9ZXaSkEEIgm3S7flNsDALLA
         zNbOSR+XVN3gjA3O4ra9gW9pnjHTEH80o2wS8zz2q7fSRE27MQ90u/u1uxsI5KXxNPoi
         zJuaGe43Z6kZYDl+fanIWStt5ZHlAHViZeJQ5ZHJLeYXPl9rWQNibj7isMeP1gbPH3iz
         m66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gHH2mIL2Oo1HOkliCeQPmADN4O5KzZ8JlLNSnpGZZ6k=;
        b=YZ86Fefe/Il9khyMMMn4StEPdFxZucOJ5V0L1v5RcvxvlUd7UDGLbAm1ZT4xsegKo/
         ltTEkDzGqcfwUHsb92aHkPYwNhQhOMiZEmQQYzJfZUlU+XkfIKW+S7gHFK/PNY0uE4LY
         mpoIZ297iscZ0T+q4qCN+tH7WGQ1QCYfLaCgmVEWE7xDEMd6ILlLo9NSOG6OAQ+0Wbxm
         CDOZSJIB2BCgOSYvrFcYsTGsWTSL+67d042zqu+C3IU6xBup57QVgDNMeeQ+PATaIG9d
         Kkk9tDbvMLNr3+u9rwZXZ47ttlUVshqLkyhmDJr04ixlDuqxP7+YxgPa4iHjrgcrA8+1
         gzwA==
X-Gm-Message-State: AOAM533hFPi2AZ23KRu/kA9LmCVlqkczvqHb33VJgCZimQ5tzNkrsQ0e
	Nxx0lihTrhlg5Gf7rnRpQlA26+qrz+MrHA==
X-Google-Smtp-Source: 
 ABdhPJw1Q6kiTb0jAfwHDXQc/QS/hRRlX6zuGqF4CMSKKWZLa91WEsmQKWuGJ4ErIGz0J5IhiM5Fzg==
X-Received: by 2002:a17:903:32c9:b0:15e:c1cc:2409 with SMTP id
 i9-20020a17090332c900b0015ec1cc2409mr13469873plr.2.1652622584422;
        Sun, 15 May 2022 06:49:44 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 14/22] networkmanager: fix parallel build failure
Date: Sun, 15 May 2022 06:49:14 -0700
Message-Id: 
 <ebd5988fb55d7a9039cc59688e5df92a8f62331e.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:49:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97111

From: Yi Zhao <yi.zhao@windriver.com>

Add dependency libnm_client_public_dep to libnm-client-test to fix
parallel build error:

| In file included from ../NetworkManager-1.36.0/src/libnm-client-test/nm-test-utils-impl.c:10:
| ../NetworkManager-1.36.0/src/libnm-client-public/NetworkManager.h:47:10: fatal error: nm-enum-types.h: No such file or directory
|    47 | #include "nm-enum-types.h"
|       |          ^~~~~~~~~~~~~~~~~

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dedf55890abd21a198e16fca59ab8c7e5ff2ce62)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...t-add-dependency-libnm_client_public.patch | 34 +++++++++++++++++++
 .../networkmanager/networkmanager_1.36.2.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-client-test-add-dependency-libnm_client_public.patch

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-client-test-add-dependency-libnm_client_public.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-client-test-add-dependency-libnm_client_public.patch
new file mode 100644
index 0000000000..6be2d4bed1
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-client-test-add-dependency-libnm_client_public.patch
@@ -0,0 +1,34 @@
+From 7b5dc04e1fcc28dc653fb7bf0e9dda3700d93218 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 3 May 2022 15:30:37 +0800
+Subject: [PATCH] libnm-client-test: add dependency libnm_client_public_dep
+
+Fix parallel build error:
+| In file included from ../NetworkManager-1.36.0/src/libnm-client-test/nm-test-utils-impl.c:10:
+| ../NetworkManager-1.36.0/src/libnm-client-public/NetworkManager.h:47:10: fatal error: nm-enum-types.h: No such file or directory
+|    47 | #include "nm-enum-types.h"
+|       |          ^~~~~~~~~~~~~~~~~
+
+Upstream-Status: Submitted
+[https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/1206]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/libnm-client-test/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/libnm-client-test/meson.build b/src/libnm-client-test/meson.build
+index 8e2fba1130..bcac437702 100644
+--- a/src/libnm-client-test/meson.build
++++ b/src/libnm-client-test/meson.build
+@@ -13,6 +13,7 @@ libnm_client_test = static_library(
+   ],
+   dependencies: [
+     libnm_core_public_dep,
++    libnm_client_public_dep,
+     glib_dep,
+   ],
+ )
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
index b09ff18bf7..6c665d53bb 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
@@ -29,6 +29,7 @@ SRC_URI = " \
     file://enable-dhcpcd.conf \
     file://enable-iwd.conf \
     file://0001-do-not-ask-host-for-ifcfg-defaults.patch \
+    file://0001-libnm-client-test-add-dependency-libnm_client_public.patch \
 "
 SRC_URI[sha256sum] = "ab855cbe3b41832e9a3b003810e7c7313dfe19e630d29806d14d87fdd1470cab"
 
-- 
2.25.1


