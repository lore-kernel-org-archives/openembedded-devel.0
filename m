Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4C9C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 04:08:37 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.47032.1699243716318161721
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Nov 2023 20:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OH25QR1f;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6c115026985so4213023b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Nov 2023 20:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699243715; x=1699848515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SjXk7tyNVigUqx1CB5DlTKxB0YBO37U4uoFxwTfahxw=;
        b=OH25QR1fFrfGvbWkgx+eJwV2Xi/RRT4Z2MBkvxJfnKNepfM600Ta2px1hjlBRD1W8s
         eh5e26qb2dXEmjCMKNdWlBNTD7Rogq+pq9bcJ1hpnvQdtsyoDr1Ckl+FpvU7vVtKueEu
         M6ucqKemwmYzFBNn6p7K6cvrLIgwccluIHBLnqgDMwKBy/MNNhSPeMyeu9hUudMWE5iz
         ZpRN9iDItf+Wmzb0/zzwmw8PM6e2mtKkjVS8elDvimQIDQAZCCEq4+fxB6aAV5tCOkxC
         JTuXi23I5T/WzDhFO0jrEa/gex7m9R+m+EcVXeiJUut39YqcJlAeO0F7g7FoPqpUkFZ5
         C0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699243715; x=1699848515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjXk7tyNVigUqx1CB5DlTKxB0YBO37U4uoFxwTfahxw=;
        b=Ap+OZBt1los0E/HSMNk80XgSXRAgA2qHWyUO+2jL75Fg5IXOzoM3yNlxCr7H9Oryzg
         pcSIHfLSddRk5gmlbX0PmEr18U4ZW/A4rjPCEbZPKyNDY+ILGdv2093KXnUCU7EAjzRr
         RehvkcFq4XyyiEa7cAktTQtHMoSJX8XBhAT+yVl2svaFLrlL+ZuVQqmtmLNouYz1i59M
         oFcRX3AXa2WJaL2RHAQKYFW5pW6afnvFT/Y354qsx23JCjkP+AOdyXSs6e6rDQwNX/RB
         QfdsnDQ2KltONbqpVTarDCQsbI8vgEdutbGg4H8R+4Zj+VbWdRz6ax1ub/WcQC+V0vAK
         BpVw==
X-Gm-Message-State: AOJu0YxdJ8ZGOecTrsGYotTQi+ZAVuTkatsYZ+5yXb+Scgn9qBgcQdR3
	TuoC4DBdnxkNwMj9XyEu2QV/DMc/TiF2NA==
X-Google-Smtp-Source: AGHT+IHG6NvUd3cnJ3q0HU4yD18F+9LWrmKKKad7haftnY2nmol/qeYCh2U34TDIQ0AZN5JJoLxjOw==
X-Received: by 2002:a05:6a20:7348:b0:17a:eddb:ac6a with SMTP id v8-20020a056a20734800b0017aeddbac6amr37254451pzc.6.1699243715017;
        Sun, 05 Nov 2023 20:08:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::38be])
        by smtp.gmail.com with ESMTPSA id f9-20020a170902e98900b001b8943b37a5sm4808601plb.24.2023.11.05.20.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 20:08:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-systemload-plugin: Fix build on 32bit machines
Date: Sun,  5 Nov 2023 20:08:31 -0800
Message-ID: <20231106040831.1296109-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 04:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106392

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../convert-gulong.patch                      | 39 +++++++++++++++++++
 .../xfce4-systemload-plugin_1.3.2.bb          |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin/convert-gulong.patch

diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin/convert-gulong.patch b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin/convert-gulong.patch
new file mode 100644
index 0000000000..30897caab3
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin/convert-gulong.patch
@@ -0,0 +1,39 @@
+Fix build on 32bit architectures
+
+It fails with errors like
+| ../../xfce4-systemload-plugin-1.3.2/panel-plugin/network.cc:126:13: error: no matching function for call to 'read_netload_libgtop'
+|   126 |         if (read_netload_libgtop (&bytes[1]) != 0)
+|       |             ^~~~~~~~~~~~~~~~~~~~
+| ../../xfce4-systemload-plugin-1.3.2/panel-plugin/network.cc:42:1: note: candidate function not viable: no known conversion from 'guint64 *' (aka 'unsigned long long *') to 'gulong *' (aka 'unsigne
+d long *') for 1st argument
+|    42 | read_netload_libgtop (gulong *bytes)
+|       | ^                     ~~~~~~~~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/panel-plugin/network.cc
++++ b/panel-plugin/network.cc
+@@ -114,6 +114,7 @@ read_netload_proc (gulong *bytes)
+ gint
+ read_netload (gulong *net, gulong *NTotal)
+ {
++    gulong tbytes[2];
+     static guint64 bytes[2];
+     static gint64 time[2];
+ 
+@@ -122,10 +123,12 @@ read_netload (gulong *net, gulong *NTota
+ 
+     time[1] = g_get_monotonic_time ();
+ 
+-    if (read_netload_proc (&bytes[1]) != 0)
+-        if (read_netload_libgtop (&bytes[1]) != 0)
++    if (read_netload_proc (&tbytes[1]) != 0)
++        if (read_netload_libgtop (&tbytes[1]) != 0)
+             return -1;
+ 
++    bytes[0] = tbytes[0];
++    bytes[1] = tbytes[1];
+     if (time[0] != 0 && G_LIKELY (time[1] > time[0]) && G_LIKELY (bytes[1] >= bytes[0]))
+     {
+         guint64 diff_bits = 8 * (bytes[1] - bytes[0]);
diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.2.bb b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.2.bb
index 46fd47c126..e7a3e9936e 100644
--- a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.2.bb
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.2.bb
@@ -9,4 +9,5 @@ PACKAGECONFIG ?= "network power"
 PACKAGECONFIG[power] = ",,upower"
 PACKAGECONFIG[network] = ",,libgtop"
 
+SRC_URI += "file://convert-gulong.patch"
 SRC_URI[sha256sum] = "bb303fc3020e053ad1fa0b8fcbf0d7681c5563bb8f649357d6a95a577802b072"
-- 
2.42.1


