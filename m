Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58C4C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 03:12:26 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.3831.1667877138480150150
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 19:12:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=v7SzhTbs;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667877136; i=@fujitsu.com;
	bh=MdXZobNwkELcwmPpT8LxRmITidr9IGIRxf/ie3rYNPI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=v7SzhTbskRkIWAWjkUC4QC1nGMvFzj1dtwN+mh1/Lcm29FSP7+DditYqlsuEV3dRu
	 YvmKtVbB+4gXbxfPMH08fVUbDMQNov1D6o0P04XBnY6v3E5eixLn9At5UtWldNeOx5
	 aAy3xIGcTRereIT0B0GgJqpHJi7Kn1Z4CaJzgE/zi1IfHOQtF/Sbf8hbDuaznYkyCf
	 LCXXJ7Cr79cPdkeKk9Tq+G7sGJB0y8z08ARig5DeS27sSHVDXEtBQ04xYISXg/IyVd
	 vKZVMcYe8CSkzpsHwa0yJoLrQbtrcfbPMNyvZpC0u85leN4HWVqwerQ8e5hv8kxNzV
	 BPVDjgWQ+IjiA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxSZf/ZGa
  ywalbnBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bhN3+YCt5zVnw//5atgfEfRxcjF4eQwBNG
  idXnHzBBONeZJJ7tuMbYxcgJ5OxnlNg8xQ/EZhNQkFi49QwriC0ioC+xdPYeZhBbWMBLovvhP
  hYQm0VARWLi5eVgNbwCHhLrlpwHq5EA6p3y8D0zRFxQ4uTMJ2D1zAISEgdfvACKcwDVKErMni
  4PUV4hMWtWGxOErSZx9dwm5gmMfLOQdM9C0r2AkWkVo3lxalFZapGuoYVeUlFmekZJbmJmjl5
  ilW6iXmqpbl5+UUmGrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZg0KUUpwTsYNy07I/eIUZJDiYl
  Ud4s28xkIb6k/JTKjMTijPii0pzU4kOMMhwcShK82seAcoJFqempFWmZOcAIgElLcPAoifC+P
  w6U5i0uSMwtzkyHSJ1i1OWY+bXtALMQS15+XqqUOO8hkBkCIEUZpXlwI2DReIlRVkqYl5GBgU
  GIpyC1KDezBFX+FaM4B6OSMO8hkFU8mXklcJteAR3BBHREdUEayBEliQgpqQYm/aL/O3btONX
  xajvv9N6NMp5bDGeXMzgYnL+4ODw9Xea3p4rwntP2Hj8/vVeSOLo5ZaeOzOIsAflXE9wW3End
  Hzdpi4QJ848dLrOCvkzlWWGi3P64fbaFs78Qz4MTfAuYGRhKbxt8ubr/+q3sf3X3uni7njjN+
  GpoUZo/++3eqqSDK6cHfG97U6LDG/mmY/KivWH+vKobznhI5J1hzGqb9N91lSy/SczrrWst5L
  iul+mJ6Ok+cgnqEgneUpN2SbHp9V2VlqS65cotRy6a9gpuCCjWrS5ZplLnuPcuf+6OY96ccjI
  r8xdW/C2U0Zi5UCFzbWzwfM5FZybfvLRtfvTnlzaZ6xev4XFx33reOPi/EktxRqKhFnNRcSIA
  jeWbfEEDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-732.messagelabs.com!1667877134!328586!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23394 invoked from network); 8 Nov 2022 03:12:15 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Nov 2022 03:12:15 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A07A11000D5
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Nov 2022 03:12:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 941EE1000D2
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Nov 2022 03:12:14 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 8 Nov 2022 03:12:13 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-tqdm: upgrade 4.64.0 -> 4.64.1
Date: Tue, 8 Nov 2022 11:12:07 +0800
Message-ID: <1667877127-29211-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Nov 2022 03:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99487

Changelog:
==========
support ipywidgets>=8 (#1366, #1361 <- #1310, #1359, #1360, #1364)
    fix jupyter lab display
    update notebook tests

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-tqdm_4.64.0.bb => python3-tqdm_4.64.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.64.0.bb => python3-tqdm_4.64.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.64.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.64.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.64.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.64.1.bb
index 3cb45f1a6..cb3b56aa8 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.64.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.64.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=1672e2674934fd93a31c09cf17f34100"
 
-SRC_URI[sha256sum] = "40be55d30e200777a307a7585aee69e4eabb46b4ec6a4b4a5f2d9f11e7d5408d"
+SRC_URI[sha256sum] = "5f4f682a004951c1b450bc753c710e9280c5746ce6ffedee253ddbcbf54cf1e4"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


