Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.5297.1623397951169849444
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jun 2021 00:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UBFkbHF+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623397948; i=@fujitsu.com;
	bh=xr2mWaiTN+6zVYXMph7NepQuwO4MmbW3MBmw++WQa6U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UBFkbHF+pLBq92G7ArOnRIp97sMGji9UuVKRNN91DpUr7RIpk3OU42Gz3wkpgW/8Y
	 8iioF/shr6zAd30wH+SMxU3wbjOZDP8O4CFm6cLuYXbQlyjShanvu9DwFm0+0liipm
	 22xNYpZbLQYnJV9GLVUQawIgRtTMp3WP75uvfComWz4HmWlXaux8WpYy6OAnFfl4Dk
	 ez9UQp3AIJEC7WKP+3dqdnaFGxH9zFN6lMs0Yd3yP88qJ9isq4L0+BPrCDU1gWIM2T
	 VDTu+QJCyKSuo2ZNEfJ4AGiT8DpQibM54ZY/LMEetGbJfRjM09pb/DgQrAxR8FAv6L
	 WANKN/ObODjoQ==
Received: from [100.113.4.24] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id F3/BD-15146-C3613C06; Fri, 11 Jun 2021 07:52:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYomsldjj
  B4MRCA4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPV+06WgpUcFetPT2JsYDzI3sXIxSEkMJtJ
  4uL/+2wQzglGiTkrulm6GDk52AR0JDpeQNgiAvoSS2fvYQaxhQWcJN73bwSzWQRUJQ7NnQLUz
  MHBK+Au0f3PECQsIaAgMeXhe7ASXgFBiZMzn4CNYRaQkDj44gUzRI2ixPadZ1gg7AqJGTO2sU
  1g5JmFpGUWkpYFjEyrGC2TijLTM0pyEzNzdA0NDHQNDY11TXQNjQ30Eqt0k/RSS3WTU/NKihK
  BsnqJ5cV6xZW5yTkpenmpJZsYgYGUUsjStIPx96sPeocYJTmYlER5J7IdThDiS8pPqcxILM6I
  LyrNSS0+xCjDwaEkwRsuCpQTLEpNT61Iy8wBBjVMWoKDR0mEt1AIKM1bXJCYW5yZDpE6xagoJ
  c6bA9InAJLIKM2Da4NF0iVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrwvQMbzZOaVwE1/Bb
  SYCWgxs8YhkMUliQgpqQYm984kI02TVWL+HrGcqcfzDgYejLGTy2O4FPFi/5eDG96zZG8Wv3p
  GPL/2P5fki/pJ7rbP/YKtvuyYoPC9vHnbzwWZN8PWeAg9DPzpnP+XQ++un3XdTN6gycdYmqsO
  C4hNuvbgX+3ZV3cfPmEw/aH+zKnHr4L7/NTXa/KnTzNzlG4MnxDAWlf3LMpiiqa1GYekbuTTg
  53ccyYW6ugFs1TMtNqsYvLs583vZeu/+UUku19nu1A14dDFMxE3EpcfXbVYZPOMjaote8q2s3
  Fv53+31pghS/ZPsWG/7m6GJr9V4RE39DquW8o7sJs8STu2znfJVJ0JdYdD0ma+eRftXfU+MTC
  zaj5fFP9D2V2GkouUWIozEg21mIuKEwEypXglHwMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-238.messagelabs.com!1623397941!123422!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12453 invoked from network); 11 Jun 2021 07:52:24 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-14.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jun 2021 07:52:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15B7qFC0009691
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jun 2021 08:52:21 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 11 Jun 2021 08:52:13 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] protobuf: upgrade 3.17.0 -> 3.17.3
Date: Fri, 11 Jun 2021 15:52:05 +0800
Message-ID: <1623397925-50736-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../protobuf/{protobuf_3.17.0.bb => protobuf_3.17.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.17.0.bb => protobuf_3.17.3.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.17.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.17.3.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.17.0.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.17.3.bb
index 81af2d50f9..6ad3bdb3bf 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.17.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.17.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS_append_class-target = " protobuf-native"
 
-SRCREV = "652d99a8ee8aa6b801e11977951fbf444cfccc8f"
+SRCREV = "909a0f36a10075c4b4bc70fdee2c7e32dd612a72"
 
 SRC_URI = "git://github.com/protocolbuffers/protobuf.git \
            file://run-ptest \
-- 
2.25.1

