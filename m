Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107D0C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 12:31:09 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.7431.1646137867765437414
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 04:31:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RPfeBa5t;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id z2so13312359plg.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 04:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=mscWYOYjn0EDmMv6UT893WuUeIDrJoelYFlVBZq+UtI=;
        b=RPfeBa5tmAtSAvMhviowmR7Xw8hvsTwto8ABeFB3Ltqo4XnW86ddiwixetn9RcEZ9q
         KV+wtqKCj6RL7qElAVXH6kMdiqg1Or5ZanyWllxlPXVAhEZikOz1G/i3uwC96fZu1kOT
         9wugEy/wdaXcJC7UcwfJaa+J3QUD7tCeIDt+Gr9dsAyg+p6WtrXTZOoY+VTokWMkALEX
         4XPypzYdhnE5V7q5Z1vAlhaaTSMB+2upzFKtbXd5ZzTXp6AKVV3T3Ncp5oQpauBP80ry
         DgPyqRqBGeRL13rgpdEc7ziqdUUjlaHrpZxo2IvuAzAxpiuU6ZiKy3zcV7mH/QHW955e
         eQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mscWYOYjn0EDmMv6UT893WuUeIDrJoelYFlVBZq+UtI=;
        b=Y/Cqo9NtrpUFcqkZbjatVS0O8WLM4sdBXBYqYkGt3M/7sXTq4hke3QoBJd6Xajzrnt
         XNz6m2jvSogzjqmqcYNh8O8fwnevvGTPn/Ln2LZUnUKXTm+luOYKFhQS+qSrO9dJe4s0
         IC36odx0MmAIFsmBZTe60VTfCenXCapDX8JsZ9xoKCB31ZzNRXy9LKrK0GJUxBs+fdqp
         wsMJBmUScNMxGcNZmd4FJUyiOhKNhNxwnVhSV7gm856vGT88DPcSSLPLm4nJPW5dC5QU
         RT1QVtAuHOEiIR/5KiW5enH5Busjbk0TLFCLetvuMQQrPZRvhMHXqz+R9qcRett0e33+
         nACw==
X-Gm-Message-State: AOAM531Z0nag8URauGemYJKnX0WpiB8GCZlgvxoVNBg/Y8Wkv5uHCGpx
	bDSUPMToOHxEx0H8QLuUYppT/ai/ofs=
X-Google-Smtp-Source: 
 ABdhPJxD3PXGiypi1bwiv7iSWWfKYUuJzWdi2QiDDzD4FJ2m2pD3ZHyK/n6Wx3PX/03jDwN8u8NMNA==
X-Received: by 2002:a17:902:e88e:b0:150:25e3:739c with SMTP id
 w14-20020a170902e88e00b0015025e3739cmr21428217plg.13.1646137866789;
        Tue, 01 Mar 2022 04:31:06 -0800 (PST)
Received: from localhost.localdomain ([103.161.99.181])
        by smtp.gmail.com with ESMTPSA id
 p10-20020a056a0026ca00b004f38e426e3csm17015117pfw.201.2022.03.01.04.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 04:31:06 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta-oe][dunfell][PATCH] polkit: Fix for CVE-2021-4115
Date: Tue,  1 Mar 2022 18:00:42 +0530
Message-Id: <20220301123043.1084-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 12:31:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95630

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patch to fix CVE-2021-4115
Also, add a support patch to cleanly apply CVE patch
Link: https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/109

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 ...thentication-bypass-vulnerability-in.patch | 32 +++++++
 .../polkit/files/CVE-2021-4115.patch          | 87 +++++++++++++++++++
 .../recipes-extended/polkit/polkit_0.116.bb   |  2 +
 3 files changed, 121 insertions(+)
 create mode 100644 meta-oe/recipes-extended/polkit/files/0001-GHSL-2021-074-authentication-bypass-vulnerability-in.patch
 create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2021-4115.patch

diff --git a/meta-oe/recipes-extended/polkit/files/0001-GHSL-2021-074-authentication-bypass-vulnerability-in.patch b/meta-oe/recipes-extended/polkit/files/0001-GHSL-2021-074-authentication-bypass-vulnerability-in.patch
new file mode 100644
index 000000000..2a2373ed5
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/files/0001-GHSL-2021-074-authentication-bypass-vulnerability-in.patch
@@ -0,0 +1,32 @@
+From a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81 Mon Sep 17 00:00:00 2001
+From: Jan Rybar <jrybar@redhat.com>
+Date: Wed, 2 Jun 2021 15:43:38 +0200
+Subject: [PATCH] GHSL-2021-074: authentication bypass vulnerability in polkit
+
+initial values returned if error caught
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/polkit/polkit/-/commit/a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81.patch]
+CVE: CVE-2021-4115
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/polkit/polkitsystembusname.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/polkit/polkitsystembusname.c b/src/polkit/polkitsystembusname.c
+index 8daa12c..8ed1363 100644
+--- a/src/polkit/polkitsystembusname.c
++++ b/src/polkit/polkitsystembusname.c
+@@ -435,6 +435,9 @@ polkit_system_bus_name_get_creds_sync (PolkitSystemBusName           *system_bus
+   while (!((data.retrieved_uid && data.retrieved_pid) || data.caught_error))
+     g_main_context_iteration (tmp_context, TRUE);
+ 
++  if (data.caught_error)
++    goto out;
++
+   if (out_uid)
+     *out_uid = data.uid;
+   if (out_pid)
+-- 
+GitLab
+
diff --git a/meta-oe/recipes-extended/polkit/files/CVE-2021-4115.patch b/meta-oe/recipes-extended/polkit/files/CVE-2021-4115.patch
new file mode 100644
index 000000000..37e0d6063
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/files/CVE-2021-4115.patch
@@ -0,0 +1,87 @@
+From 41cb093f554da8772362654a128a84dd8a5542a7 Mon Sep 17 00:00:00 2001
+From: Jan Rybar <jrybar@redhat.com>
+Date: Mon, 21 Feb 2022 08:29:05 +0000
+Subject: [PATCH] CVE-2021-4115 (GHSL-2021-077) fix
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/polkit/polkit/-/commit/41cb093f554da8772362654a128a84dd8a5542a7.patch]
+CVE: CVE-2021-4115
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/polkit/polkitsystembusname.c | 38 ++++++++++++++++++++++++++++----
+ 1 file changed, 34 insertions(+), 4 deletions(-)
+
+diff --git a/src/polkit/polkitsystembusname.c b/src/polkit/polkitsystembusname.c
+index 8ed1363..2fbf5f1 100644
+--- a/src/polkit/polkitsystembusname.c
++++ b/src/polkit/polkitsystembusname.c
+@@ -62,6 +62,10 @@ enum
+   PROP_NAME,
+ };
+ 
++
++guint8 dbus_call_respond_fails;      // has to be global because of callback
++
++
+ static void subject_iface_init (PolkitSubjectIface *subject_iface);
+ 
+ G_DEFINE_TYPE_WITH_CODE (PolkitSystemBusName, polkit_system_bus_name, G_TYPE_OBJECT,
+@@ -364,6 +368,7 @@ on_retrieved_unix_uid_pid (GObject              *src,
+   if (!v)
+     {
+       data->caught_error = TRUE;
++      dbus_call_respond_fails += 1;
+     }
+   else
+     {
+@@ -405,6 +410,8 @@ polkit_system_bus_name_get_creds_sync (PolkitSystemBusName           *system_bus
+   tmp_context = g_main_context_new ();
+   g_main_context_push_thread_default (tmp_context);
+ 
++  dbus_call_respond_fails = 0;
++
+   /* Do two async calls as it's basically as fast as one sync call.
+    */
+   g_dbus_connection_call (connection,
+@@ -432,11 +439,34 @@ polkit_system_bus_name_get_creds_sync (PolkitSystemBusName           *system_bus
+ 			  on_retrieved_unix_uid_pid,
+ 			  &data);
+ 
+-  while (!((data.retrieved_uid && data.retrieved_pid) || data.caught_error))
+-    g_main_context_iteration (tmp_context, TRUE);
++  while (TRUE)
++  {
++    /* If one dbus call returns error, we must wait until the other call
++     * calls _call_finish(), otherwise fd leak is possible.
++     * Resolves: GHSL-2021-077
++    */
+ 
+-  if (data.caught_error)
+-    goto out;
++    if ( (dbus_call_respond_fails > 1) )
++    {
++      // we got two faults, we can leave
++      goto out;
++    }
++
++    if ((data.caught_error && (data.retrieved_pid || data.retrieved_uid)))
++    {
++      // we got one fault and the other call finally finished, we can leave
++      goto out;
++    }
++
++    if ( !(data.retrieved_uid && data.retrieved_pid) )
++    {
++      g_main_context_iteration (tmp_context, TRUE);
++    }
++    else
++    {
++      break;
++    }
++  }
+ 
+   if (out_uid)
+     *out_uid = data.uid;
+-- 
+GitLab
+
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.116.bb b/meta-oe/recipes-extended/polkit/polkit_0.116.bb
index 77288b008..aceb68699 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.116.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.116.bb
@@ -26,6 +26,8 @@ SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0003-make-netgroup-support-optional.patch \
            file://CVE-2021-4034.patch \
+           file://0001-GHSL-2021-074-authentication-bypass-vulnerability-in.patch \
+           file://CVE-2021-4115.patch \
            "
 SRC_URI[md5sum] = "4b37258583393e83069a0e2e89c0162a"
 SRC_URI[sha256sum] = "88170c9e711e8db305a12fdb8234fac5706c61969b94e084d0f117d8ec5d34b1"
-- 
2.17.1


