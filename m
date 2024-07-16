Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5C0C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 08:02:48 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.5617.1721116964465321404
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jul 2024 01:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wlgQ5Fl6;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-427aeebaecdso11981975e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 01:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1721116962; x=1721721762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jsn58VfSh4ncq2Euslyd+92UumcCyEtw02ueZEerqmI=;
        b=wlgQ5Fl6txqLnZh5zuLkG+UYzgDNjbgk6HrGmUw1PfLhRNjzy4m3nHNA8yvDTpXNFT
         vE/pV1a4nZZ5zxRlsSVqPH6sByimV4Lrfxe2nK5g5cYYlgdAfpT7P9tMhBF96argC4BE
         lOB8wzNBIrz036mhEfLKUklL3MO09fMGSFrqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721116962; x=1721721762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jsn58VfSh4ncq2Euslyd+92UumcCyEtw02ueZEerqmI=;
        b=iAl+oS21mZhOhepfc5GHFxs08Vof61RzwqF0MHykz2MSBJxVI4d3AnJ6NgVVFwapJU
         CCrlK1BIdFrjOxvE07nvQBuq385p//k3f4OLrt14XXngpP2zyHw71xjul3UnKqVAVF75
         fySvtL5pCp8cZX7jzYDkzCN8acyMJhRkO+NNKmCW0EAB9TX+AbqU4btFgXMDAGaMCk1q
         hdNVvVc/EFCsESVAzJu1yVioYwQ1CvqPe2rMhGANLzpbzGMR3bYegCSFOPng06ShzPl1
         e/JdImHUJN4TA4d3783oJgZVwqWRZuZr0dZXES3LB8DD6VCsDhj+4s3NNUkTN6SMtv1x
         OAqg==
X-Gm-Message-State: AOJu0YwJFLrfzXK7BqR7oX8NRv/jWgsa7E+yjUCUWXklfGaerbP2P8Lb
	WUH9B3AcRErGLT2U7Vob2UpcaQfp3d0VFwP5HtwVnvUOTWCywPMP8AgKSEyhvqzYKdKr8Be+zGS
	nB4A=
X-Google-Smtp-Source: AGHT+IHx1ZcLr3v5xDu04QkkHQ633sjt1v2HPa82YZMUMcaonOq0Ic1yWH+aOQ34ioq0l+vr8kmreg==
X-Received: by 2002:a05:600c:4fcc:b0:426:602d:a243 with SMTP id 5b1f17b1804b1-427ba642fe6mr8876865e9.16.1721116962059;
        Tue, 16 Jul 2024 01:02:42 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0481fsm8228290f8f.106.2024.07.16.01.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 01:02:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Alexandre Videgrain <alexandre.videgrain@smile.fr>,
	Ludovic Jozeau <ludovic.jozeau@smile.fr>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] openbox: fix crash on alt+tab with fullscreen app
Date: Tue, 16 Jul 2024 10:02:29 +0200
Message-Id: <20240716080229.2765098-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 08:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111369

From: Alexandre Videgrain <alexandre.videgrain@smile.fr>

Apply an openbox patch to openbox recipe to fix crashes on alt+tab with
fullscreen app.

Github issue: https://github.com/openembedded/meta-openembedded/issues/837

Signed-off-by: Alexandre Videgrain <alexandre.videgrain@smile.fr>
Suggested-by: Ludovic Jozeau <ludovic.jozeau@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 85132c16210d1bdf83e8be5b3da4f430ce7b4b91)
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
index 9a15077316..1851a84b97 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
@@ -8,6 +8,7 @@ SRC_URI = " \
     http://icculus.org/openbox/releases/openbox-${PV}.tar.gz \
     file://0001-Makefile.am-avoid-race-when-creating-autostart-direc.patch \
     file://0001-openbox-xdg-autostart-convert-to-python3.patch \
+    file://0001-Fix-list-traversal-issue-in-client_calc_layer.patch \
 "
 
 SRC_URI[md5sum] = "b72794996c6a3ad94634727b95f9d204"

