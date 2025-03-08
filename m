Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E9CC2BA1B
	for <webhook@archiver.kernel.org>; Sat,  8 Mar 2025 23:05:55 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.6126.1741475148737530247
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Mar 2025 15:05:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C6F2QMxl;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22113560c57so57027305ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 15:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741475148; x=1742079948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9kKk7vqWHRG3lJlRMyY8cDf7BIXDgcrJXSzt37Zyr8=;
        b=C6F2QMxlVYZ8m6vIHgtgU136nUXX25Wh22UZiJTjeewh3DxsBn7Bx18r/10yJ7P58F
         kTTJ29JDQ4KH/y1KITLZsWhrCcV6v3iHLJ7S5x/elq0U8PjAlnM7ZziSW7mT24AGsyRM
         CSmh88EWCLNmlUUDnMK+uKbVkpEtxXFo3KJkBp2IecEpPtv+XeaRtgP9G+dmZU0BeTQr
         38Kdp0+N21TDwT46ou2QqyJ88UWrIukAAg0fU7Ng45eIZRibT6Cwrg4ZLh0GsNdZ5f1M
         JdjIJzuBdo0KE64c1b7urqto3w68umzv/OJO9OkF76wi6/NWx0D3QVXTbKwOwvetq3cT
         OZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741475148; x=1742079948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9kKk7vqWHRG3lJlRMyY8cDf7BIXDgcrJXSzt37Zyr8=;
        b=mmIASYdIHAa05eakWJuScLGUC52p6oo3kMCyC6NkQt7P1W4BBVE+3+vUF/030yhhqn
         cLH475P6lbpCBSvFU1B9Ju7Q4gOiFKjeucf6BDgkLzbGBdP1s67vi4bkpiCJTD7U4Rp3
         Etuczz1Ds5bUtZHGH1l9Q2wGGzpRmXAwTG1Er1fg864vEHQZNOONxi7nmcEpssLQUhbC
         EGOfv5J7/utDyFmr297AKdoxzzZMSPck1yd5ecJb1KkbGKDySsaWcXyR8NESTFFGm9OO
         7TbkoCYpWH91HvTApvlH1OvXpS1fcJlmpqBWh6/mCGCI8iume2wIdZSFZJtkclstsCqW
         26xA==
X-Gm-Message-State: AOJu0Ywa7yqWZiOjTiNg8kTGqknN51ac65CVXeiwgzH/j2AUQPg9pFuT
	YToGakYL0LqDCIqEP6A5CQt2Y2RdQMp+WWHKfs/L/4LKINjO4FtsXOGBFcIt
X-Gm-Gg: ASbGncv4hZqejbgem5TU1/Qc38PYxfnSvrEAPJefbOQ2RJX4FGbH55joF5j7peiPDSJ
	5HBgE1GzjUUCbDjJofmT2RT1upjQy/u4NLkj031JyOoIm/ckKaGfiZRxi0KCWPIeUckazGW7LL+
	gn76OgrvxHaQh9hjFUFxRaIt7eZ1u7RfqzDs57aer6esPwdcbCnu3V4DsAmW7YsPhAToy3NjTLq
	CABLozeM/9qeJMg9Qt4z7xAAMTJK/A5YAenZ2zpXyL2iZ+A5cOyLubqtLXkmxwA3qPyHfWo3x9Q
	IKOm13STEYQbOnWIFsixrcGbsWAA2MmRBGbhPHiz5WZbS+4=
X-Google-Smtp-Source: AGHT+IGS/aV+i5Xzgf/xGehu26GVwIgYExXKyhAcYBnAdsgznvSsCV7EvoM7f2aqpVTzPGirRLJugQ==
X-Received: by 2002:a05:6a00:2d22:b0:736:4e02:c543 with SMTP id d2e1a72fcca58-736aa9d5461mr11162374b3a.9.1741475147815;
        Sat, 08 Mar 2025 15:05:47 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736c456bf16sm1316881b3a.156.2025.03.08.15.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 15:05:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] pcapplusplus: Upgrade to 2024.09 release
Date: Sat,  8 Mar 2025 15:05:43 -0800
Message-ID: <20250308230543.1774147-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308230543.1774147-1-raj.khem@gmail.com>
References: <20250308230543.1774147-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 23:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115812

Backport a fix for json to build with clang20

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Remove-whitespace-in-operator-_json.patch | 52 +++++++++++++++++++
 .../0001-initialize-timespec-variable.patch   | 35 -------------
 ...e-m_ExternalRawData-in-IDnsResource-.patch | 34 ------------
 ...lusplus_23.09.bb => pcapplusplus_24.09.bb} |  7 ++-
 4 files changed, 55 insertions(+), 73 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Remove-whitespace-in-operator-_json.patch
 delete mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch
 delete mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch
 rename meta-oe/recipes-connectivity/pcapplusplus/{pcapplusplus_23.09.bb => pcapplusplus_24.09.bb} (80%)

diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Remove-whitespace-in-operator-_json.patch b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Remove-whitespace-in-operator-_json.patch
new file mode 100644
index 0000000000..fb793548a2
--- /dev/null
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Remove-whitespace-in-operator-_json.patch
@@ -0,0 +1,52 @@
+From 16974cb6a9f10fbd08db964ee0d9f074ef430db6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Mar 2025 11:55:12 -0800
+Subject: [PATCH] Remove whitespace in operator"" _json
+
+Clang 20+ errors about this whitespace.
+
+Fixes
+git/3rdParty/json/include/json.hpp:24428:58: error: identifier '_json' preceded by whitespace in a literal operator declaration is deprecated [-Werror,-Wdeprecated-literal-operator]
+ 24428 |     using nlohmann::literals::json_literals::operator "" _json; // NOLINT(misc-unused-using-decls,google-global-names-in-headers)
+       |                                              ~~~~~~~~~~~~^~~~~
+       |                                              operator""_json
+
+Upstream-Status: Backport [ Its fixed in json import post 2024.9 release ]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ 3rdParty/json/include/json.hpp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/3rdParty/json/include/json.hpp b/3rdParty/json/include/json.hpp
+index 60ba1df..6eceb7c 100644
+--- a/3rdParty/json/include/json.hpp
++++ b/3rdParty/json/include/json.hpp
+@@ -24353,7 +24353,7 @@ inline namespace json_literals
+ /// @brief user-defined string literal for JSON values
+ /// @sa https://json.nlohmann.me/api/basic_json/operator_literal_json/
+ JSON_HEDLEY_NON_NULL(1)
+-inline nlohmann::json operator "" _json(const char* s, std::size_t n)
++inline nlohmann::json operator ""_json(const char* s, std::size_t n)
+ {
+     return nlohmann::json::parse(s, s + n);
+ }
+@@ -24361,7 +24361,7 @@ inline nlohmann::json operator "" _json(const char* s, std::size_t n)
+ /// @brief user-defined string literal for JSON pointer
+ /// @sa https://json.nlohmann.me/api/basic_json/operator_literal_json_pointer/
+ JSON_HEDLEY_NON_NULL(1)
+-inline nlohmann::json::json_pointer operator "" _json_pointer(const char* s, std::size_t n)
++inline nlohmann::json::json_pointer operator ""_json_pointer(const char* s, std::size_t n)
+ {
+     return nlohmann::json::json_pointer(std::string(s, n));
+ }
+@@ -24425,8 +24425,8 @@ inline void swap(nlohmann::NLOHMANN_BASIC_JSON_TPL& j1, nlohmann::NLOHMANN_BASIC
+ }  // namespace std
+ 
+ #if JSON_USE_GLOBAL_UDLS
+-    using nlohmann::literals::json_literals::operator "" _json; // NOLINT(misc-unused-using-decls,google-global-names-in-headers)
+-    using nlohmann::literals::json_literals::operator "" _json_pointer; //NOLINT(misc-unused-using-decls,google-global-names-in-headers)
++    using nlohmann::literals::json_literals::operator ""_json; // NOLINT(misc-unused-using-decls,google-global-names-in-headers)
++    using nlohmann::literals::json_literals::operator ""_json_pointer; //NOLINT(misc-unused-using-decls,google-global-names-in-headers)
+ #endif
+ 
+ // #include <nlohmann/detail/macro_unscope.hpp>
diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch
deleted file mode 100644
index f2e210fc67..0000000000
--- a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 298dec6f87061914c85049faca3d0ff3310d1794 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 6 May 2024 12:15:30 -0700
-Subject: [PATCH] initialize timespec variable
-
-Fixes build warnings with GCC14
-
-/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/pcapplusplus/23.09/git/Packet++/src/RawPacket.cpp: In constructor 'pcpp::RawPacket::RawPacket(const uint8_t*, int, timeval, bool, pcpp::LinkLayerType)':
-/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/pcapplusplus/23.09/git/Packet++/src/RawPacket.cpp:23:18: error: 'nsec_time.timespec::<anonymous>' is used uninitialized [-Werror=uninitialized]
-   23 |         timespec nsec_time;
-      |                  ^~~~~~~~~
-cc1plus: all warnings being treated as errors
-
-Upstream-Status: Submitted [https://github.com/seladb/PcapPlusPlus/pull/1389]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Packet++/src/RawPacket.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Packet++/src/RawPacket.cpp b/Packet++/src/RawPacket.cpp
-index 8ad52d52..07dbbbe2 100644
---- a/Packet++/src/RawPacket.cpp
-+++ b/Packet++/src/RawPacket.cpp
-@@ -20,7 +20,7 @@ void RawPacket::init(bool deleteRawDataAtDestructor)
- 
- RawPacket::RawPacket(const uint8_t* pRawData, int rawDataLen, timeval timestamp, bool deleteRawDataAtDestructor, LinkLayerType layerType)
- {
--	timespec nsec_time;
-+	timespec nsec_time = {};
- 	TIMEVAL_TO_TIMESPEC(&timestamp, &nsec_time);
- 	init(deleteRawDataAtDestructor);
- 	setRawData(pRawData, rawDataLen, nsec_time, layerType);
--- 
-2.45.0
-
diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch
deleted file mode 100644
index b6389e0e3f..0000000000
--- a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 742f564ee80749e9f1f3363092775545e37c0f87 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 9 May 2024 17:02:09 -0700
-Subject: [PATCH] packet++: Initialize m_ExternalRawData in IDnsResource
- constructor
-
-Fixes following warning with GCC-14
-
-Packet++/src/DnsResource.cpp:29:24: error: '*this.pcpp::IDnsResource::m_ExternalRawData' may be used uninitialized [-Werror=maybe-uninitialized]
-   29 |                 return m_ExternalRawData;
-      |                        ^~~~~~~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/seladb/PcapPlusPlus/pull/1391]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Packet++/src/DnsResource.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Packet++/src/DnsResource.cpp b/Packet++/src/DnsResource.cpp
-index fec1bf05..c1f97041 100644
---- a/Packet++/src/DnsResource.cpp
-+++ b/Packet++/src/DnsResource.cpp
-@@ -10,7 +10,7 @@ namespace pcpp
- {
- 
- IDnsResource::IDnsResource(DnsLayer* dnsLayer, size_t offsetInLayer)
--	: m_DnsLayer(dnsLayer), m_OffsetInLayer(offsetInLayer), m_NextResource(nullptr)
-+	: m_DnsLayer(dnsLayer), m_OffsetInLayer(offsetInLayer), m_NextResource(nullptr), m_ExternalRawData(nullptr)
- {
- 	char decodedName[4096];
- 	m_NameLength = decodeName((const char*)getRawData(), decodedName);
--- 
-2.45.0
-
diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb
similarity index 80%
rename from meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
rename to meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb
index 9db0222172..7979094a0b 100644
--- a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb
@@ -8,10 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 DEPENDS = "libpcap"
 
 SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master \
-           file://0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch \
-           file://0001-initialize-timespec-variable.patch"
-
-SRCREV = "4cf8ed44f9dd145f874dc1dd747dfefcfcab75be"
+           file://0001-Remove-whitespace-in-operator-_json.patch \
+          "
+SRCREV = "4af4b8b04e6d5dd40b8e69cc30c5c1f62e7fe368"
 
 S = "${WORKDIR}/git"
 

