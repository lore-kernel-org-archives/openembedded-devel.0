Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web12.3637.1617934882343057124
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tWD+Y4VL;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id t23-20020a0568301e37b02901b65ab30024so4321300otr.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=LKoLQRP0WqS4iOMWooqT8yyf4S1kz/CjX1O7zUl3P44=;
        b=tWD+Y4VLlSNisMbUz1YODEF2HEyryCRhpaZzkLzmbiV9tfUFp53UZm98LRdZVu1VSQ
         LMcz7hjvB9HgcXH29Vhj/GjzgBVZ9CGeWBlvTA6Z9mRkEty8ditd48x2QCEF7s/yUPw2
         mC+e1UI9nATJVOHhuBQx4F06WXv4VG0TLrEuJ32al6RHQHPvcoAITjzxa1lk/GVJ7J8k
         L8ETWZStPBgc3Ba/ZbBs127Fi3tL2TF40PSrA1y59GkzIUtvDXavYH7o5bp2KTJX7PFU
         dIysojkSrjIdHlnJvet2rRT4kbdR/qDleehc1RhjZ7D4leQ2mPSzS4e+/jphJsfQo6mE
         hu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=LKoLQRP0WqS4iOMWooqT8yyf4S1kz/CjX1O7zUl3P44=;
        b=XuBUzxGgUTvOg9XojowKy04OZz/AC3RulV+SdZfsuA3B6H1pQelVVQmB046HdFD6Za
         Q6aeEVGDN9Uxt2AcLnqaettXlI5iCj5hwCTvgIIm8+onNWo93dW631cHrYGa8N6hJ5e1
         tqN/Gr68PhtyCngbUzYxGM22udr/r3L9iAbTbDDzdCAh5zSbiU0mfMzehQQQDFAbla15
         zQefl32CMIt4q37Ydklv4J7tWCWEoHJ6WcPE4U9ZJv/9R3+hkz6kXXl0AVgNOvxeirHY
         AGdOFDZ67O8vZE6V9ugzx59i1XXj+q8hH2q+HKsPhFNMK5iqYhtdKs3e/ArUhs4y0meO
         WN0w==
X-Gm-Message-State: AOAM533jqtzz3Ch7Pexfghd+tUF4G5kXe6GMZXx0GrecppFq9oOfIL8L
	PsMwOHFYhhA01NoXBcbQ5NqTCBrcYzo=
X-Google-Smtp-Source: ABdhPJzz/ytcvYmV8nJE0uUm0uZlAIWxvgddMWddhknJMKJrcLCz4O8Hw323blzHEabqEY9J532XYg==
X-Received: by 2002:a9d:68cb:: with SMTP id i11mr10164332oto.118.1617934881450;
        Thu, 08 Apr 2021 19:21:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:21 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 32/36] hostapd: fix CVE-2021-0326 and CVE-2021-27803
Date: Thu,  8 Apr 2021 19:20:45 -0700
Message-Id: <64e40a7e84623a3071ae35d8696b2cc5ac0b791c.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Backport 2 patches to fix two CVEs.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5a085c588adaf79bb2bca7921c82d893877b28a1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../hostapd/hostapd/CVE-2021-0326.patch       | 43 +++++++++++++++
 .../hostapd/hostapd/CVE-2021-27803.patch      | 54 +++++++++++++++++++
 .../hostapd/hostapd_2.9.bb                    |  2 +
 3 files changed, 99 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch
new file mode 100644
index 00000000000..54c405b539c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch
@@ -0,0 +1,43 @@
+From 947272febe24a8f0ea828b5b2f35f13c3821901e Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@codeaurora.org>
+Date: Mon, 9 Nov 2020 11:43:12 +0200
+Subject: [PATCH] P2P: Fix copying of secondary device types for P2P group
+ client
+
+Parsing and copying of WPS secondary device types list was verifying
+that the contents is not too long for the internal maximum in the case
+of WPS messages, but similar validation was missing from the case of P2P
+group information which encodes this information in a different
+attribute. This could result in writing beyond the memory area assigned
+for these entries and corrupting memory within an instance of struct
+p2p_device. This could result in invalid operations and unexpected
+behavior when trying to free pointers from that corrupted memory.
+
+CVE: CVE-2021-0326
+
+Upstream-Status: Backport
+
+Credit to OSS-Fuzz: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=27269
+Fixes: e57ae6e19edf ("P2P: Keep track of secondary device types for peers")
+Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/p2p/p2p.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/p2p/p2p.c b/src/p2p/p2p.c
+index 74b7b52ae..5cbfc217f 100644
+--- a/src/p2p/p2p.c
++++ b/src/p2p/p2p.c
+@@ -453,6 +453,8 @@ static void p2p_copy_client_info(struct p2p_device *dev,
+ 	dev->info.config_methods = cli->config_methods;
+ 	os_memcpy(dev->info.pri_dev_type, cli->pri_dev_type, 8);
+ 	dev->info.wps_sec_dev_type_list_len = 8 * cli->num_sec_dev_types;
++	if (dev->info.wps_sec_dev_type_list_len > WPS_SEC_DEV_TYPE_MAX_LEN)
++		dev->info.wps_sec_dev_type_list_len = WPS_SEC_DEV_TYPE_MAX_LEN;
+ 	os_memcpy(dev->info.wps_sec_dev_type_list, cli->sec_dev_types,
+ 		  dev->info.wps_sec_dev_type_list_len);
+ }
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch
new file mode 100644
index 00000000000..fedff76b180
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch
@@ -0,0 +1,54 @@
+From 8460e3230988ef2ec13ce6b69b687e941f6cdb32 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@codeaurora.org>
+Date: Tue, 8 Dec 2020 23:52:50 +0200
+Subject: [PATCH] P2P: Fix a corner case in peer addition based on PD Request
+
+p2p_add_device() may remove the oldest entry if there is no room in the
+peer table for a new peer. This would result in any pointer to that
+removed entry becoming stale. A corner case with an invalid PD Request
+frame could result in such a case ending up using (read+write) freed
+memory. This could only by triggered when the peer table has reached its
+maximum size and the PD Request frame is received from the P2P Device
+Address of the oldest remaining entry and the frame has incorrect P2P
+Device Address in the payload.
+
+Fix this by fetching the dev pointer again after having called
+p2p_add_device() so that the stale pointer cannot be used.
+
+CVE: CVE-2021-27803
+
+Upstream-Status: Backport
+
+Fixes: 17bef1e97a50 ("P2P: Add peer entry based on Provision Discovery Request")
+Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
+---
+ src/p2p/p2p_pd.c | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/src/p2p/p2p_pd.c b/src/p2p/p2p_pd.c
+index 3994ec03f..05fd59349 100644
+--- a/src/p2p/p2p_pd.c
++++ b/src/p2p/p2p_pd.c
+@@ -595,14 +595,12 @@ void p2p_process_prov_disc_req(struct p2p_data *p2p, const u8 *sa,
+ 			goto out;
+ 		}
+ 
++		dev = p2p_get_device(p2p, sa);
+ 		if (!dev) {
+-			dev = p2p_get_device(p2p, sa);
+-			if (!dev) {
+-				p2p_dbg(p2p,
+-					"Provision Discovery device not found "
+-					MACSTR, MAC2STR(sa));
+-				goto out;
+-			}
++			p2p_dbg(p2p,
++				"Provision Discovery device not found "
++				MACSTR, MAC2STR(sa));
++			goto out;
+ 		}
+ 	} else if (msg.wfd_subelems) {
+ 		wpabuf_free(dev->info.wfd_subelems);
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
index 1f38eee0ffe..87899f3da20 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
@@ -13,6 +13,8 @@ SRC_URI = " \
     file://hostapd.service \
     file://CVE-2019-16275.patch \
     file://CVE-2019-5061.patch \
+    file://CVE-2021-0326.patch \
+    file://CVE-2021-27803.patch \
 "
 
 SRC_URI[md5sum] = "f188fc53a495fe7af3b6d77d3c31dee8"
-- 
2.17.1

