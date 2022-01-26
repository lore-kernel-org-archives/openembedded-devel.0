Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE41C5AC75
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 03:14:22 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.7727.1643166860820520527
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 19:14:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=a7RGFOIm;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643166859; i=@fujitsu.com;
	bh=8HY4XH0RQRNPgtIN87NCGVmrKQZVcXmr6UdgjuTGaBk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=a7RGFOImreEdKjGzdg569cbhlWO8K5Vu7LigElyEfuA4PMBtDEzeXrI6nJswe9tei
	 spKIwhynwkDOR/1xQTnr8TH+JEmIF2D45aJRretmFNmvxO7Yyl3zEEPbWGtOzkfCH+
	 wQ4O9wVQqyqrG2IrbXi2EjIDBPu/XqicGvIr9DNuIVtF3WB/7lqiT9cV02m9dGRAlH
	 goPY4wbQKfWe6LO1WRebERVfYvLerESUnClLlTJi2IVbIqVH2SdSegoLrxjUbbeRXK
	 kLf9RE0O9CyG6+nYACMzfbh82mV+LN1uSpPButNq0hHMN89emy1GDoNuK+ttybkLgw
	 Eibd+nq+qG8lg==
Received: from [100.115.3.74] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id 52/CB-12986-A8CB0F16;
 Wed, 26 Jan 2022 03:14:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORqNu150O
  iwcknghYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aZhftYC36IVJyfe5algXGvUBcjF4eQwBNG
  iTe921ggnAtMEovbT7B2MXICOScYJRq21YDYbAJqEtNv3QCLiwjoSyydvYcZxGYWUJF48buHv
  YuRg0NYIEBiwtVgkDCLgKrEoa2vmEBsXgFHiWsTp4LZEgIKElMevmeGiAtKnJz5hAVijITEwR
  cvmCFqFCVmX25mgbArJGbNaoPqVZO4em4T8wRG/llI2mchaV/AyLSK0SqpKDM9oyQ3MTNH19D
  AQNfQ0FTXBMgy1Eus0k3USy3VLU8tLtEFcsuL9VKLi/WKK3OTc1L08lJLNjECQzKlmCV1B2Nf
  30+9Q4ySHExKorwvdT4kCvEl5adUZiQWZ8QXleakFh9ilOHgUJLg/bkdKCdYlJqeWpGWmQOMD
  5i0BAePkgjvlZ1Aad7igsTc4sx0iNQpRkUpcV7FDUAJAZBERmkeXBssJi8xykoJ8zIyMDAI8R
  SkFuVmlqDKv2IU52BUEuZ13Q00hSczrwRu+iugxUxAi3+ffweyuCQRISXVwJS7oMAk9fsWuQX
  9c1/PmL40SV3DbMXd9jaLN41chi7ZGzW3rjVimV39/99lxUVv999/ZX4e6LbPpie+nLV/KRg0
  c2H1+S0vj+3QEZ5gWbbjpt5Uk/n7FLxn7eaZ2ls482LY23jGE6l2yxdv28RfNcNvY6HxyS+N+
  25cNHx6vcYsUiVz3hG19q+uPT7u3pfl/m7YscpLr0LLJcKXjTPJ3tYyaq3XshrfV5cXXfqlYn
  1q+g5ZhXdXlx07cuS2f5J14eRa/Q0zd1nZlbwtm5FaIbPeRvMy77TtgVYtdyfembqoxyag/zA
  /3+RjeSpGk7bssFjXqMkTMpG3QYzt7by5Xx+n3th5wLX8Qvpcle6JDQuVWIozEg21mIuKEwEC
  MsO3RAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-587.messagelabs.com!1643166858!51192!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7545 invoked from network); 26 Jan 2022 03:14:18 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-19.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Jan 2022 03:14:18 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D1135100192
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 03:14:17 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C4F65100180
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 03:14:17 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 26 Jan 2022 03:13:55 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-multimedia] [PATCH] gerbera: fix bug caused by update of
 fmt
Date: Wed, 26 Jan 2022 11:13:45 +0800
Message-ID: <1643166825-9023-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 03:14:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95091

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...0001-fix-bug-caused-by-update-of-fmt.patch | 36 +++++++++++++++++++
 .../gerbera/gerbera_1.9.2.bb                  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-fix-bug-caused-by-update-of-fmt.patch

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-fix-bug-caused-by-update-of-fmt.patch b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-fix-bug-caused-by-update-of-fmt.patch
new file mode 100644
index 000000000..eb3a80233
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-fix-bug-caused-by-update-of-fmt.patch
@@ -0,0 +1,36 @@
+From 2d00f2c8ba8176d9fc6a266e9f4d5ebf75422414 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Wed, 26 Jan 2022 10:17:31 +0900
+Subject: [PATCH] fix bug caused by update of fmt when do_compile 
+
+After fmt was updated to 8.1.1, the following problems were caused:
+
+gerbera/1.9.2-r0/recipe-sysroot/usr/include/fmt/core.h:1728:7: error: static
+assertion failed: Cannot format an argument. To make type T formattable
+provide a formatter<T> specialization: https://fmt.dev/latest/api.html#udt
+|  1728 |       formattable,
+|       |       ^~~~~~~~~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ src/content/autoscan.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/content/autoscan.cc b/src/content/autoscan.cc
+index ae0c0f9..6865a6c 100644
+--- a/src/content/autoscan.cc
++++ b/src/content/autoscan.cc
+@@ -127,7 +127,7 @@ std::string_view AutoscanDirectory::mapScanmode(ScanMode scanmode)
+     case ScanMode::INotify:
+         return "inotify";
+     }
+-    throw_std_runtime_error("Illegal scanmode ({}) given to mapScanmode()", scanmode);
++    throw_std_runtime_error("Illegal scanmode ({}) given to mapScanmode()", (int)scanmode);
+ }
+ 
+ ScanMode AutoscanDirectory::remapScanmode(const std::string& scanmode)
+-- 
+2.25.1
+
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
index 94657ba53..d05c36093 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
@@ -4,6 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
 
 SRC_URI = "git://github.com/v00d00/gerbera.git;protocol=https;branch=master \
+           file://0001-fix-bug-caused-by-update-of-fmt.patch \
           "
 
 SRCREV = "3b93d362ec33f738868a4e896a2c9ee8e9d7a92a"
-- 
2.25.1


