Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DFAC87FD8
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 23:29:45 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.49376.1753918173228710763
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 16:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l9LVgTaV;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753918175; x=1785454175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PNFfT4nnu59RLuZdRZZBoANo6J2b3iIqrIk9C3o5aeg=;
  b=l9LVgTaVPh9j6gayX6SxVEeDxTQelceAncyay2uAGIqvni960Xl9FAYZ
   G0CeEm6xnONsznr1DISd2UGCqgiKI2dwdcZocx5E/N2J0zgee06womcES
   8Y4zHFr2byFrOcsFQnSeNRa94wEwggHr+wLqjC2F61JZqRS2qPoVQGAWZ
   aiZhNHsi0tYp/YNq892jNxCmqjPW6YqaqF5JVWOSawgy2TXxeB/m8oIbv
   Elq7sElO5dO8t9Wl4xTGNagqhD0Gc1iHK8+U8mMQr0+jd8bWAhXI9cmPK
   1ZGbziS7wXd57j1mkvMi9bwoouLoRaQ23fvsgSdIzrgRWDNHkTBlFDg59
   A==;
X-CSE-ConnectionGUID: xKJ0TgUuRPyuFIzR6XMGTg==
X-CSE-MsgGUID: xSdXwE4zTOeMVPOEe0KR+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="196424877"
X-IronPort-AV: E=Sophos;i="6.16,353,1744038000"; 
   d="scan'208";a="196424877"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 08:29:35 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 57C0D42A312
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:35 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id A7B911800D77
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3F4EC1A0073;
	Thu, 31 Jul 2025 07:29:31 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 39/40] usbguard: upgrade 1.1.3 -> 1.1.4
Date: Thu, 31 Jul 2025 07:29:22 +0800
Message-ID: <20250730232923.522-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730232923.522-1-wangmy@fujitsu.com>
References: <20250730232923.522-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118807

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Adapt-for-protobuf-30.0-API-changes.patch
removed since it's included in 1.1.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-Adapt-for-protobuf-30.0-API-changes.patch | 89 -------------------
 .../{usbguard_1.1.3.bb => usbguard_1.1.4.bb}  |  7 +-
 2 files changed, 3 insertions(+), 93 deletions(-)
 delete mode 100644 meta-oe/recipes-security/usbguard/usbguard/0001-Adapt-for-protobuf-30.0-API-changes.patch
 rename meta-oe/recipes-security/usbguard/{usbguard_1.1.3.bb => usbguard_1.1.4.bb} (92%)

diff --git a/meta-oe/recipes-security/usbguard/usbguard/0001-Adapt-for-protobuf-30.0-API-changes.patch b/meta-oe/recipes-security/usbguard/usbguard/0001-Adapt-for-protobuf-30.0-API-changes.patch
deleted file mode 100644
index b7c5b10acd..0000000000
--- a/meta-oe/recipes-security/usbguard/usbguard/0001-Adapt-for-protobuf-30.0-API-changes.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 06ec6473c2ed1920a1d98d40fe992dea9f60b103 Mon Sep 17 00:00:00 2001
-From: Christian Heusel <christian@heusel.eu>
-Date: Tue, 11 Mar 2025 21:43:51 +0100
-Subject: [PATCH] Adapt for protobuf 30.0 API changes
-
-Fixes https://github.com/USBGuard/usbguard/issues/649
-
-Upstream-Status: Submitted [https://github.com/USBGuard/usbguard/pull/650]
-
-Link: https://protobuf.dev/support/migration/
-Signed-off-by: Christian Heusel <christian@heusel.eu>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/Library/IPCClientPrivate.cpp | 2 +-
- src/Library/IPCClientPrivate.hpp | 2 +-
- src/Library/IPCServerPrivate.cpp | 6 +++---
- src/Library/IPCServerPrivate.hpp | 2 +-
- 4 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/Library/IPCClientPrivate.cpp b/src/Library/IPCClientPrivate.cpp
-index 6aa5201..452ecd4 100644
---- a/src/Library/IPCClientPrivate.cpp
-+++ b/src/Library/IPCClientPrivate.cpp
-@@ -225,7 +225,7 @@ namespace usbguard
-     std::string payload;
-     message.SerializeToString(&payload);
-     struct qb_ipc_request_header hdr;
--    hdr.id = QB_IPC_MSG_USER_START + IPC::messageTypeNameToNumber(message.GetTypeName());
-+    hdr.id = QB_IPC_MSG_USER_START + IPC::messageTypeNameToNumber(std::string(message.GetTypeName()));
-     hdr.size = sizeof hdr + payload.size();
-     struct iovec iov[2];
-     iov[0].iov_base = &hdr;
-diff --git a/src/Library/IPCClientPrivate.hpp b/src/Library/IPCClientPrivate.hpp
-index d92a1d4..a33022e 100644
---- a/src/Library/IPCClientPrivate.hpp
-+++ b/src/Library/IPCClientPrivate.hpp
-@@ -84,7 +84,7 @@ namespace usbguard
-     template<class T>
-     void registerHandler(MessageHandler::HandlerType method)
-     {
--      const uint32_t type_number = IPC::messageTypeNameToNumber(T::default_instance().GetTypeName());
-+      const uint32_t type_number = IPC::messageTypeNameToNumber(std::string(T::default_instance().GetTypeName()));
-       _handlers.emplace(type_number, MessageHandler::create<T>(*this, method));
-     }
- 
-diff --git a/src/Library/IPCServerPrivate.cpp b/src/Library/IPCServerPrivate.cpp
-index 548a726..b976f02 100644
---- a/src/Library/IPCServerPrivate.cpp
-+++ b/src/Library/IPCServerPrivate.cpp
-@@ -311,7 +311,7 @@ namespace usbguard
-     message->SerializeToString(&payload);
-     struct qb_ipc_response_header hdr;
-     struct iovec iov[2];
--    hdr.id = QB_IPC_MSG_USER_START + IPC::messageTypeNameToNumber(message->GetTypeName());
-+    hdr.id = QB_IPC_MSG_USER_START + IPC::messageTypeNameToNumber(std::string(message->GetTypeName()));
-     hdr.size = sizeof hdr + payload.size();
-     hdr.error = 0;
-     iov[0].iov_base = &hdr;
-@@ -555,7 +555,7 @@ namespace usbguard
-     std::string payload;
-     message->SerializeToString(&payload);
-     struct qb_ipc_response_header hdr = { };
--    hdr.id = QB_IPC_MSG_USER_START + IPC::messageTypeNameToNumber(message->GetTypeName());
-+    hdr.id = QB_IPC_MSG_USER_START + IPC::messageTypeNameToNumber(std::string(message->GetTypeName()));
-     hdr.size = sizeof hdr + payload.size();
-     hdr.error = 0;
-     struct iovec iov[2];
-@@ -563,7 +563,7 @@ namespace usbguard
-     iov[0].iov_len = sizeof hdr;
-     iov[1].iov_base = (void*)payload.data();
-     iov[1].iov_len = payload.size();
--    qbIPCBroadcastData(iov, 2, messageTypeNameToAccessControlSection(message->GetTypeName()));
-+    qbIPCBroadcastData(iov, 2, messageTypeNameToAccessControlSection(std::string(message->GetTypeName())));
-     iov[0].iov_base = nullptr;
-     iov[1].iov_base = nullptr;
-   }
-diff --git a/src/Library/IPCServerPrivate.hpp b/src/Library/IPCServerPrivate.hpp
-index 25f9ac3..3b3dcc5 100644
---- a/src/Library/IPCServerPrivate.hpp
-+++ b/src/Library/IPCServerPrivate.hpp
-@@ -134,7 +134,7 @@ namespace usbguard
-     void registerHandler(MessageHandler::HandlerType method, IPCServer::AccessControl::Section section,
-       IPCServer::AccessControl::Privilege privilege)
-     {
--      const uint32_t type_number = IPC::messageTypeNameToNumber(T::default_instance().GetTypeName());
-+      const uint32_t type_number = IPC::messageTypeNameToNumber(std::string(T::default_instance().GetTypeName()));
-       _handlers.emplace(type_number, MessageHandler::create<T>(*this, method, section, privilege));
-     }
- 
diff --git a/meta-oe/recipes-security/usbguard/usbguard_1.1.3.bb b/meta-oe/recipes-security/usbguard/usbguard_1.1.4.bb
similarity index 92%
rename from meta-oe/recipes-security/usbguard/usbguard_1.1.3.bb
rename to meta-oe/recipes-security/usbguard/usbguard_1.1.4.bb
index 558f4347b6..3d181173a5 100644
--- a/meta-oe/recipes-security/usbguard/usbguard_1.1.3.bb
+++ b/meta-oe/recipes-security/usbguard/usbguard_1.1.4.bb
@@ -12,11 +12,10 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://github.com/USBGuard/usbguard/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
-    file://0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch \
-    file://0001-Adapt-for-protobuf-30.0-API-changes.patch \
-    "
+           file://0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch \
+           "
 
-SRC_URI[sha256sum] = "707dad2938923202697f636c2b4e0be80f192242039a2af3fc7ac35d03f78551"
+SRC_URI[sha256sum] = "7d76b75e779e3c9e6c2fc10e7389dfa34056864c9f0c6eaca722687b7e75893c"
 
 inherit autotools-brokensep bash-completion pkgconfig systemd github-releases
 
-- 
2.43.0


