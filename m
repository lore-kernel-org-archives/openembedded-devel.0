Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32AEC3DA4B
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 18:30:17 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.801.1720722616377705711
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jul 2024 11:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DkO7GwSJ;
 spf=pass (domain: smile.fr, ip: 209.85.167.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ea952ce70so1331309e87.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jul 2024 11:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1720722614; x=1721327414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QXdDpYZW+Yf+M/9HTCBlgRDwvK+x5kvVPbrqV5j4ojQ=;
        b=DkO7GwSJTQkuWvByXwVZcvXcu/BrwD8u4lKe5c4WNBC2MEW3sM4z4MUTvnYsLRmTGj
         TJUP7k/AWuEQ3LqySZqPjtyjOUOLlUeuDaHvZXKWkJDdjcdbBBV3h/g2vVyMBDFnStXi
         JT962JTFGrQIKfUkgqZ8c+Bl+dw5Q7UBcX5wE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720722614; x=1721327414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXdDpYZW+Yf+M/9HTCBlgRDwvK+x5kvVPbrqV5j4ojQ=;
        b=eXSCfLwkw4XfqdB63Ll0KJno+RZqI4+qEaqcgVlw1sPLM3frtSdekxsVNgTALs6zel
         qZ+fymnnzfJpzAiPLfiVIjRWm2u1KzksDe0FW7iFNmLHax7lh9RhpsVULK1+amUJ7K79
         WDPbbUfQUNcg1aUWOKWQmTUIYWIxCYLNGoM1sKZH95CD3nUo5jGhf4XpVDBSYqpmnyib
         TS1D82qKj1LqI9YeGpNSH4xs36JtysZJXPd3i7G2IX+Awd8Zz94somENvbqOqJhIGgGa
         R+i3aci4dOJVLAWOOCc+pWh/1CD1+svfkkLjXE+pT/1mdn3+jPdayYjsvwYbmt6PqXUo
         k8zw==
X-Gm-Message-State: AOJu0YwOqTu7m87EqiufdDkgwV8Vu6JAcKMIS12jf0GkCsi9I2cTvBnm
	BaiODDmRUmyXwTORJZoCFtbS15y+QCg4bKLFf7JsiId00JNrxYnbFuk52HpObZo6m5YRjo2BJ/K
	hbV0=
X-Google-Smtp-Source: AGHT+IF8Qd6hnhP/PO+ooARZ4GZV7zOXRv2NKLGr2khCpnGuEdjrSYwBv8LXeBbHtetynVfqfJ0G+Q==
X-Received: by 2002:a05:6512:130a:b0:52e:bdbf:d780 with SMTP id 2adb3069b0e04-52ebdbfd884mr4938840e87.59.1720722614192;
        Thu, 11 Jul 2024 11:30:14 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f22acsm296592275e9.24.2024.07.11.11.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 11:30:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Alexandre Videgrain <alexandre.videgrain@smile.fr>,
	Ludovic Jozeau <ludovic.jozeau@smile.fr>
Subject: [meta-oe][PATCH] openbox: fix crash on alt+tab with fullscreen app
Date: Thu, 11 Jul 2024 20:29:38 +0200
Message-Id: <20240711182938.2352114-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jul 2024 18:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111313

From: Alexandre Videgrain <alexandre.videgrain@smile.fr>

Apply an openbox patch to openbox recipe to fix crashes on alt+tab with
fullscreen app.

Github issue: https://github.com/openembedded/meta-openembedded/issues/837

Signed-off-by: Alexandre Videgrain <alexandre.videgrain@smile.fr>
Suggested-by: Ludovic Jozeau <ludovic.jozeau@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
Hello, I'm sending this on the behalf of Alexandre Videgrain. I hope I
haven't messed up the signed-off-bys...

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

