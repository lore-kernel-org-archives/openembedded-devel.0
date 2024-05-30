Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3C0C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 12:35:06 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web11.7194.1717072503497474408
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 05:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CI1MDDj8;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5b998092bdaso443066eaf.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 05:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717072502; x=1717677302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NVjB2AUOHdZaLFsVasuoDme5WHEnUbjBv025Yq63ikU=;
        b=CI1MDDj8lsB9H68O3ydScpjikHQxWxRGuHJswO4BeGYBnJjRDyfHKc39zcahfgL+uW
         bjCXc53nj24wI0Rd1gYi/qgTrApHKfTFWeFgWiSh0R/FrAMaeM1n1VAQslnHw3iLTd9O
         DvY02IAtKmUt6wnxh67t4KQddzPxN7hT/BIDD3fYDgHJVDCEU2wl00p9PMkx0Cadh0aE
         Q+DNOnlRjjwb40Gh19g9QXF54Mse0LSRp0ZGX3MGUC+UR5pj6uYg6fjbd5cvCOqACbwR
         JPnCyFxl7gKHaZltvY3e/I1oteP8fTYYdJxfitiOzG9B2M9T4F8GlWyuOFGRcW44PwAz
         kXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717072502; x=1717677302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVjB2AUOHdZaLFsVasuoDme5WHEnUbjBv025Yq63ikU=;
        b=dIwjFzLHksDmD6+Ie6XF0q3fJQI5AP0jKEhsCZ7Wu0mi6sMjtF1Lad+f1udof6LTQd
         w5G+tSlPZebAN7MpEVMt6NS0wDq8j+OtY1XJN/YyEs2c9BppWLIb57Z6krIavtMUIN82
         q/j20pzc1OP3ibtmedEewqr+E9tCT/4B33xaliWxRU3vnat1tg/SZncM9Z8pB/mfBfGf
         A8TAxUohNFMoGzrs+CmBTY24PzWEKJ8tOTVsEamHhSD7M2pIGsGNSjkFL/imRJ9FoTMx
         JZeF1aw5tmYXGj+eifttqiy/WjoicsXO7y6IraejVhH1Ya4SlrZBJf1fUYs1OEJI9P45
         In/A==
X-Gm-Message-State: AOJu0YyYy/1OBmNxjaD5yCFNsUV/g40o9SEeCC+jY658vnphE4RuS1ML
	WIIUjlYlAujjwyqHfDULoJAu3/aEuc6P+VghzDBmxeNWSJVUPzMXKE0VTw==
X-Google-Smtp-Source: AGHT+IH21TZBBrDgaqiTch6NTmayboiy8+C/GF5nN4ljH0gqYklWkVIFX9e/A4naaqj6tVOl3EbYDQ==
X-Received: by 2002:a05:6820:151a:b0:5b5:3d56:50ff with SMTP id 006d021491bc7-5b9ec7f61dcmr1601193eaf.9.1717072502522;
        Thu, 30 May 2024 05:35:02 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fd30:ccb0:f3d7:336b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5b999aa91a8sm2305401eaf.36.2024.05.30.05.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 05:35:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] pcapplusplus: Fix build with gcc14
Date: Thu, 30 May 2024 08:35:01 -0400
Message-Id: <20240530123501.2890879-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 12:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110626

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-initialize-timespec-variable.patch   | 35 +++++++++++++++++++
 ...e-m_ExternalRawData-in-IDnsResource-.patch | 34 ++++++++++++++++++
 .../pcapplusplus/pcapplusplus_23.09.bb        |  5 ++-
 3 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch
 create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch

diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch
new file mode 100644
index 0000000000..f2e210fc67
--- /dev/null
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch
@@ -0,0 +1,35 @@
+From 298dec6f87061914c85049faca3d0ff3310d1794 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 May 2024 12:15:30 -0700
+Subject: [PATCH] initialize timespec variable
+
+Fixes build warnings with GCC14
+
+/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/pcapplusplus/23.09/git/Packet++/src/RawPacket.cpp: In constructor 'pcpp::RawPacket::RawPacket(const uint8_t*, int, timeval, bool, pcpp::LinkLayerType)':
+/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/pcapplusplus/23.09/git/Packet++/src/RawPacket.cpp:23:18: error: 'nsec_time.timespec::<anonymous>' is used uninitialized [-Werror=uninitialized]
+   23 |         timespec nsec_time;
+      |                  ^~~~~~~~~
+cc1plus: all warnings being treated as errors
+
+Upstream-Status: Submitted [https://github.com/seladb/PcapPlusPlus/pull/1389]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Packet++/src/RawPacket.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Packet++/src/RawPacket.cpp b/Packet++/src/RawPacket.cpp
+index 8ad52d52..07dbbbe2 100644
+--- a/Packet++/src/RawPacket.cpp
++++ b/Packet++/src/RawPacket.cpp
+@@ -20,7 +20,7 @@ void RawPacket::init(bool deleteRawDataAtDestructor)
+ 
+ RawPacket::RawPacket(const uint8_t* pRawData, int rawDataLen, timeval timestamp, bool deleteRawDataAtDestructor, LinkLayerType layerType)
+ {
+-	timespec nsec_time;
++	timespec nsec_time = {};
+ 	TIMEVAL_TO_TIMESPEC(&timestamp, &nsec_time);
+ 	init(deleteRawDataAtDestructor);
+ 	setRawData(pRawData, rawDataLen, nsec_time, layerType);
+-- 
+2.45.0
+
diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch
new file mode 100644
index 0000000000..b6389e0e3f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch
@@ -0,0 +1,34 @@
+From 742f564ee80749e9f1f3363092775545e37c0f87 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 9 May 2024 17:02:09 -0700
+Subject: [PATCH] packet++: Initialize m_ExternalRawData in IDnsResource
+ constructor
+
+Fixes following warning with GCC-14
+
+Packet++/src/DnsResource.cpp:29:24: error: '*this.pcpp::IDnsResource::m_ExternalRawData' may be used uninitialized [-Werror=maybe-uninitialized]
+   29 |                 return m_ExternalRawData;
+      |                        ^~~~~~~~~~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/seladb/PcapPlusPlus/pull/1391]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Packet++/src/DnsResource.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Packet++/src/DnsResource.cpp b/Packet++/src/DnsResource.cpp
+index fec1bf05..c1f97041 100644
+--- a/Packet++/src/DnsResource.cpp
++++ b/Packet++/src/DnsResource.cpp
+@@ -10,7 +10,7 @@ namespace pcpp
+ {
+ 
+ IDnsResource::IDnsResource(DnsLayer* dnsLayer, size_t offsetInLayer)
+-	: m_DnsLayer(dnsLayer), m_OffsetInLayer(offsetInLayer), m_NextResource(nullptr)
++	: m_DnsLayer(dnsLayer), m_OffsetInLayer(offsetInLayer), m_NextResource(nullptr), m_ExternalRawData(nullptr)
+ {
+ 	char decodedName[4096];
+ 	m_NameLength = decodeName((const char*)getRawData(), decodedName);
+-- 
+2.45.0
+
diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
index 39c6942c83..9db0222172 100644
--- a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
@@ -7,7 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
 DEPENDS = "libpcap"
 
-SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master \
+           file://0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch \
+           file://0001-initialize-timespec-variable.patch"
+
 SRCREV = "4cf8ed44f9dd145f874dc1dd747dfefcfcab75be"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


