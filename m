Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42348C27C44
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 16:48:36 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.1527.1717087701192202200
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 09:48:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XhkxdAqy;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5b96ae827d2so595336eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717087700; x=1717692500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vaioe+2yEyRA8PvxLpB/9ZADuqOtOg8RO2avefgsiZA=;
        b=XhkxdAqyJMYFhmvFTmh6WTPL+fv1ZgptPZB18kX2y2MBjrIc68WWwzMMnhYLd6Ir1T
         d5F90gr1QZ1Jfh1tlWa3DQmkDqvCXloDPbrlQ4VHTMdBvEOGR1GX9I8XUmcFvut/c3XS
         HbUR3TKnX+YAP9uhV/abJN0a2UTNqbxsWyPels7/ChdQrurt3uGCGcWLSuEXShD+8bNN
         dn0TGCZvoH5h/EaHDjwrlC9HmNMePy5FDnRExagsypLIsT2OgH2+KOD9vkpMYg49xtCb
         8UJVlDArjJ52Hs2XDuuA0ojapEv6BhRNAbW5Yw41Z8VmArUwlvP119H+6Y8vG/Y8acy7
         khvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717087700; x=1717692500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vaioe+2yEyRA8PvxLpB/9ZADuqOtOg8RO2avefgsiZA=;
        b=qSBMy22dJCQKJIxJIHmFUO1wITZJpyzKcdD3nwbpM09iO0cSkmQOSDPT72BzAKLYCW
         GIwLvJTEh77gvF2I4xfT9oH8O4NmkqYbSHgKdU4Ip7FJM7JXll6Q2iDICh4SWLs7ztk6
         BgtIljcJOueWmElduExWxjKMoklGJj6JEL6oPLcnJ5GLHnwnxDEgF27k3GDfhP7wVg8b
         0LWyouT2Zn0XYhbd1MG/akyT4+IUwWOaXh3PvLEchsXbOgahF5xnfcIRRRrQW8s7C4Tf
         pt5HtbRuqt8MoJDEx707ccEAZkLnfiknOwo3k0ShEjY7YHQBIJwgmzFtVlezVMR+MpBF
         xiCQ==
X-Gm-Message-State: AOJu0YyHIz67cmOV/ng+lF16wLRBJsbxCg3Ecno3pDofTRLM+GpW7Yi9
	8mM6/38Yrr6A0Udn9qaDXqhpcmyV3EOXM0w2btEfxMcTSupdvos54Cy4aw==
X-Google-Smtp-Source: AGHT+IHov/Ec+hI6W49kQa4iYTf1g1J7Cq0fpjf84vG1dtT2tckV69GswJOJOsH3CQxrruggv8P+Kg==
X-Received: by 2002:a05:6870:659e:b0:22a:3226:b10a with SMTP id 586e51a60fabf-25065e2f2a3mr848720fac.17.1717087699898;
        Thu, 30 May 2024 09:48:19 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fd30:ccb0:f3d7:336b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25085226dd8sm12718fac.38.2024.05.30.09.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 09:48:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][v2][scarthgap][PATCH] pcapplusplus: Fix build with gcc14
Date: Thu, 30 May 2024 12:48:18 -0400
Message-Id: <20240530164818.2896557-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 16:48:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110633

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>

----
v2]
Scarthgap has the same error as master: initialize timespec variable.

pcapplusplus/23.09/git/Packet++/src/RawPacket.cpp:23:18: error: 'nsec_time.timespec::<anonymous>' is used uninitialized [-Werror=uninitialized]
|    23 |         timespec nsec_time;
|       |                  ^~~~~~~~~
| cc1plus: all warnings being treated as errors
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


