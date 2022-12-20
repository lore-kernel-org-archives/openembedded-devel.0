Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18804C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:15:03 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.48594.1671538500180772567
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:15:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Dv8huGpb;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538498; i=@fujitsu.com;
	bh=+jg6+s2aRcC/cw0u/tPVU20tChvg/Fl68TsGbNk5yP8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Dv8huGpbvUycz3jmxbQeLLenmRL8mTpXn1NczeO6KR9R1MZHg0am9CdNxv8zAjh3s
	 uJIW1Z21v2Vxf2GeHUmhZYhkzqQbN2SvcBrmFOvCnPGl0stviGngcTjbK9/6K4HSin
	 +oHupUgT1DBlfpmzpKEQ/t17DX3+Mi027chpJ/GPlZBnzEEauAuKlTrhZtnsrX1wz8
	 OpCGDZ6w6gYJhrjTHY9QGxSK2JRXAjp7r/EBeIHKrBzEkt5f1DVkvov5OoPJCoX82w
	 xoMkV6KvQWS70kGF51RiULUi82jcALEThlVwohXrqv0bKLXuzv29qBBLMVf86D1EPS
	 /UwCtEcKllzTw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8ORpOu0fGG
  ywdpV/BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aU1g7mgk1cFWceZDUwLuPsYuTiEBJ4yCix
  acYTVgjnMpPE7D29UM4eRol5D/exdDFycrAJSEncuP+fDcQWEdCXWDp7DzOIzSygIvHidw87i
  C0s4CLx6ORjsBoWAVWJ/fMeAvVycPAKOEq8PJQBEpYQUJCY8vA9WCuvgKDEyZlPWCDGSEgcfP
  GCGaJGUWL25WYWCLtCYtasNiYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRtPi1KKy1CJdC72kosz
  0jJLcxMwcvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwUvbzUkk2MwEBMKVbfuoPx8LI/
  eocYJTmYlER5w8IXJgvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4J2xCCgnWJSanlqRlpkDjAqYt
  AQHj5IIb89soDRvcUFibnFmOkTqFKMux9UrV/YyC7Hk5eelSonzci0DKhIAKcoozYMbAYvQS4
  yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEebuWAk3hycwrgdv0CugIJqAjDl2aC3JESSJCSqq
  BaY/2s2k/rP7cnrV3QeJWxoVLpn88M39pdD631IRstpONzwtXzbkyfRHX4vpIX1mPRycPPTn1
  ccm94wFpO3ykBAUN9qyMubc9Zn2IvfA31XgRlRUvJzm8jFYp/hBUuNtRkcnxnIG+hE3J/UkJp
  r8EHBcq/U/vWrNNITfb/eCetxtYo95cv32nNZpPIG8r69foM6/L+/c6zlw994Xs1Q37zzC19y
  xw3WH98M4m9VKOrNktM/aGn+zfmtv3Y43ao/lXN1ZvS7Jl/fT82/pHb8/HNO3NW8siftPH5ML
  /9d+13qspMHzRWValslh8yz7v6VLdqb9+7Gn67SGy9NTXX1dfXT6ROM87t3lP2WaLtbLPSubN
  UWIpzkg01GIuKk4EAKN9OAdLAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1671538498!392212!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5158 invoked from network); 20 Dec 2022 12:14:58 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:14:58 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id ED6E21AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:14:57 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E18BC7B
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:14:57 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:14:56 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] protobuf: upgrade 3.21.10 -> 3.21.12
Date: Tue, 20 Dec 2022 20:14:23 +0800
Message-ID: <1671538467-7143-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100135

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Fix broken enum ranges (#11171)
 Stop requiring extension fields to have a sythetic oneof (#11091)
 Python runtime 4.21.10 not works generated code can not load valid proto.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../protobuf/{protobuf_3.21.10.bb => protobuf_3.21.12.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.10.bb => protobuf_3.21.12.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.10.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.21.10.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
index 4c45c4a7e..343933033 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.10.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "11bc195441adfbc87ff0349f1c4be7a239d1daad"
+SRCREV = "f0dc78d7e6e331b8c6bb2d5283e06aa26883ca7c"
 
 SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=21.x;protocol=https \
            file://run-ptest \
-- 
2.25.1


