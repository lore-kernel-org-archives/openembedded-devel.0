Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFCCCCD180
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:52:57 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.18460.1759326774614842701
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BL/rbDf1;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-634cdb5ed4bso2013858a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326773; x=1759931573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Y7k+kGQCYucw6IVUvK8DXLZqcnHUCB99yOY7upVQDA=;
        b=BL/rbDf1VKmVYVT1IoBCacEv/+oWi8hIT1kE2aCiC/nbY06o4To4yLH+E7KV2AoauL
         EQX5xUw8nZurxCugk51PfS16TJpxvyDfhCo6rkzL97/deCWZVR5pP9KFBD2edmlSRIia
         u9B1RbhGT+bfPUzTBY2+R1sT9LDyiRMF6j8l7B0zeL8xHyjWTAg53oRPy4kr1GHbFvBJ
         x8q66m50RLmgivCk4wwzJ4yyBn7DRQHr8VMavnT1R+MospotTHmKfAX+ZfVS6U/koG6z
         4jJkONCmqahX025FLar0U9G8s+yYXuBMRVaTI5fkViNybulkMniSCr2Cf7l7aj1lwfZh
         BRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326773; x=1759931573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Y7k+kGQCYucw6IVUvK8DXLZqcnHUCB99yOY7upVQDA=;
        b=jPatCJpiYgABPe4EOuaceKZ1OLyErsDIhWBi5fJDwdswNaBP/cETBQrQ1Vs4esT32g
         Umh5ZPEivF7O04m+7b3buohczzUYdv63tCZfLR1pu5LVbdl0eWFLXFWFcPcIZPgzf5VZ
         sn1J5e2ReMpoJQqU5ybVBnqLfEZXL+P84g2uu5EqqHV0Fjkv5/BMM8wpoTl2re6NH4kx
         YOH2ogYmVE4R2AIYY2fQ5D/QCuKhpcHsJqhfP4mwDU9iXIYjUfkPLK+G1646db8u2ZUN
         ivW16V/eczyVacmB/0/CxLi2n4j5MxLvuiMeX+ztM6opdzCAZF9z4N+j1ObFPM4r5ov/
         7teg==
X-Gm-Message-State: AOJu0Yx7Cl9zO9wVMKcX288ph53M4G27UHoSuTjMChXD2OA4vfWXIDHp
	xHg6B/dJtoAfWEMWDPlc2drf0MYsjlSd5t+6uOs68IjQgp++GgtIrF3vhC9ukA==
X-Gm-Gg: ASbGnctLyqPTriGvbBNgD9sx2vMlVIeHUmz1Ho3OZVB/l+oJYc9bcV5Tg0pqdHpFPa8
	3QY08/8RiK3rf8kbp1dvo22wWGQBCj4ujvsMdFORpt966dwYm5qJxtYznwjwkv4VNYVxozqPpeT
	IlG79+dgJ6iqTRKxxQJNlSXJPqk1v9M1mVrEWirZ/ps8k5q8439vxo7OK3Yw8aQ8exfGnWFUZFl
	e6QblxSlDp9Sp3OAg4f9/zcUdYp7aFOL4bXEwgt712lym8djaW03OopCIlV6boFsTv5oLXgWdAM
	Pjw6Ya8X+lHW9cXdsykgK/esiDov/62ryRPy5SMEYDmH6lllzUp1gD7Xab5QfEtP0lvuyb2CEPr
	KlC9/WKJ0qNR3/Jt2/AiW5kurAXh/ToFof8LQcPlu50u5
X-Google-Smtp-Source: AGHT+IHoatFxWHnfBkVHLV08TIeiBglVVrEbU9DcPLKndEF3VV8XOADXOkSDfGLbA/JVIsBJt4pY+w==
X-Received: by 2002:a05:6402:274c:b0:634:544b:a740 with SMTP id 4fb4d7f45d1cf-63678c56e05mr4503887a12.22.1759326772909;
        Wed, 01 Oct 2025 06:52:52 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:52 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 11/25] openbox: fix crash on alt+tab with fullscreen app
Date: Wed,  1 Oct 2025 15:52:29 +0200
Message-ID: <20251001135243.1490753-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120126

From: Alexandre Videgrain <alexandre.videgrain@smile.fr>

Apply an openbox patch to openbox recipe to fix crashes on alt+tab with
fullscreen app.

Github issue: https://github.com/openembedded/meta-openembedded/issues/837

Signed-off-by: Alexandre Videgrain <alexandre.videgrain@smile.fr>
Suggested-by: Ludovic Jozeau <ludovic.jozeau@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 85132c16210d1bdf83e8be5b3da4f430ce7b4b91)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...traversal-issue-in-client_calc_layer.patch | 56 +++++++++++++++++++
 .../recipes-graphics/openbox/openbox_3.6.1.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openbox/files/0001-Fix-list-traversal-issue-in-client_calc_layer.patch

diff --git a/meta-oe/recipes-graphics/openbox/files/0001-Fix-list-traversal-issue-in-client_calc_layer.patch b/meta-oe/recipes-graphics/openbox/files/0001-Fix-list-traversal-issue-in-client_calc_layer.patch
new file mode 100644
index 0000000000..8bc2b80f68
--- /dev/null
+++ b/meta-oe/recipes-graphics/openbox/files/0001-Fix-list-traversal-issue-in-client_calc_layer.patch
@@ -0,0 +1,56 @@
+From d41128e5a1002af41c976c8860f8299cfcd3cd72 Mon Sep 17 00:00:00 2001
+From: pldubouilh <pldubouilh@gmail.com>
+Date: Fri, 17 Mar 2023 18:23:47 +0100
+Subject: [PATCH] Fix list traversal issue in client_calc_layer
+
+The calls to client_calc_layer_internal can modify stacking_list, which
+can cause us to follow dangling ->next pointers (either by the pointer
+itself already being freed, or it pointing to a freed area). Avoid this
+by copying the list first, the goal is to visit every client in the list
+once so this should be fine.
+
+Upstream-Status: Backport [http://git.openbox.org/?p=mikachu/openbox.git;a=commit;h=d41128e5a1002af41c976c8860f8299cfcd3cd72]
+Signed-off-by: Alexandre Videgrain <alexandre.videgrain@smile.fr>
+---
+ openbox/client.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/openbox/client.c b/openbox/client.c
+index 7168b240..b8264587 100644
+--- a/openbox/client.c
++++ b/openbox/client.c
+@@ -2742,9 +2742,12 @@ static void client_calc_layer_internal(ObClient *self)
+ void client_calc_layer(ObClient *self)
+ {
+     GList *it;
++    /* the client_calc_layer_internal calls below modify stacking_list,
++       so we have to make a copy to iterate over */
++    GList *list = g_list_copy(stacking_list);
+ 
+     /* skip over stuff above fullscreen layer */
+-    for (it = stacking_list; it; it = g_list_next(it))
++    for (it = list; it; it = g_list_next(it))
+         if (window_layer(it->data) <= OB_STACKING_LAYER_FULLSCREEN) break;
+ 
+     /* find the windows in the fullscreen layer, and mark them not-visited */
+@@ -2757,7 +2760,7 @@ void client_calc_layer(ObClient *self)
+     client_calc_layer_internal(self);
+ 
+     /* skip over stuff above fullscreen layer */
+-    for (it = stacking_list; it; it = g_list_next(it))
++    for (it = list; it; it = g_list_next(it))
+         if (window_layer(it->data) <= OB_STACKING_LAYER_FULLSCREEN) break;
+ 
+     /* now recalc any windows in the fullscreen layer which have not
+@@ -2768,6 +2771,8 @@ void client_calc_layer(ObClient *self)
+                  !WINDOW_AS_CLIENT(it->data)->visited)
+             client_calc_layer_internal(it->data);
+     }
++
++    g_list_free(it);
+ }
+ 
+ gboolean client_should_show(ObClient *self)
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
index 4c97c03978..26fc7c3650 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
@@ -8,6 +8,7 @@ SRC_URI = " \
     http://icculus.org/openbox/releases/openbox-${PV}.tar.gz \
     file://0001-Makefile.am-avoid-race-when-creating-autostart-direc.patch \
     file://0001-openbox-xdg-autostart-convert-to-python3.patch \
+    file://0001-Fix-list-traversal-issue-in-client_calc_layer.patch \
 "
 
 SRC_URI[md5sum] = "b72794996c6a3ad94634727b95f9d204"

