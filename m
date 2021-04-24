Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.1617.1619229038858907852
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Apr 2021 18:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a9T7LEAL;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id l17so19654448oil.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Apr 2021 18:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=qipOfdFqWoYrhOGmgZQMVGVsqbUynPtJLFDEwhxcA8E=;
        b=a9T7LEALGE28pZ9/LPe2/ZYtzxkmdnX7GDVim5RG7kyTDsRfsUseHKjvHYprpr/PYp
         fWvr3VkoaN6tcnoeyFXJsV1azEv15O6bVwWdeE/XWg8w+2LNiAodCJewusAdaLsuDVRM
         ww+GM9ZcgYYTb1kTQesdzRmLWin2vIUSc1XTCOCyWKoQR1lXInM/q68Rd+qSfoaozaMZ
         S95IDc8F9VHmJHUKisvB42UVBp5bGan2eadg8xcl/e8140wc9jt9WfVjHos7PAaJbU5T
         iBcD3HdeuQOhmHQYCkIoj1GaCjvuV9xAbSlRPtXrAbpbYOIt6Vk3jZOx9wlyaFRy176c
         555w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=qipOfdFqWoYrhOGmgZQMVGVsqbUynPtJLFDEwhxcA8E=;
        b=U1YbHfiP6C4QiTdnMsyicL80ihm+sz9uUeHy/gq5PIvNw+q0tDCHj7FqmOJQi/AD4U
         l5s6OOIsvzwhT4wfWi9CkYaXxpSWswnk9A1RN7Cpgw1j8P4kabuua1zfhEGYjZ0BJ+Ru
         /971JXnaBFJeUynD0H85Im7VepTgaOSJO7ixYFoIhUnvJMxpL7vSiDkDyE2vALDjME6U
         x/skw8vDugR0lDaS4sCFqFKWov2u8nusPL9q5NJDx1RvWG+9UFKmNfFOZNtjDdQhjY4J
         5QipdM7nats4ZQClehf0QiWkXvbz4ZrkLXXKhuinPfgOMPooL5cozX0oHfCwa9/sW2vE
         YNFg==
X-Gm-Message-State: AOAM533TVIEqK5/kho6uqFNTob4kVCIBgMU1DlbDajTVvsbI9sGGwa6B
	7BUzZ2Rd5H2EAKf4J38ChzPwpVIR+r0kBQ==
X-Google-Smtp-Source: ABdhPJyica+bYSLHwfYJPB25nnBYFtgzpDYUgH567/rviKv8wfR4Ah6loRq8Uiwu98Y6IX8tNNz+pA==
X-Received: by 2002:aca:b02:: with SMTP id 2mr4901936oil.44.1619229036621;
        Fri, 23 Apr 2021 18:50:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e183:e120:a0a1:83e4])
        by smtp.gmail.com with ESMTPSA id s19sm1748075otq.6.2021.04.23.18.50.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 18:50:36 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 5/6] hostapd: fix CVE-2021-0326 and CVE-2021-27803
Date: Fri, 23 Apr 2021 18:50:27 -0700
Message-Id: <d2b027d8d8fcd7c759d60b6a09123748bb6de626.1619228936.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619228936.git.akuster808@gmail.com>
References: <cover.1619228936.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Backport 2 patches to fix two CVEs.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5a085c588adaf79bb2bca7921c82d893877b28a1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 845bd5a5f15bd80cecbf5c0716af3eaca5669632)
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
index 0000000000..54c405b539
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
index 0000000000..fedff76b18
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
index 1f38eee0ff..87899f3da2 100644
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

