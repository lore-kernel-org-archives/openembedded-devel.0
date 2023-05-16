Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B554C77B7A
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 08:13:51 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.16564.1684224829268983105
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 May 2023 01:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=btRcABwt;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684224827; i=@fujitsu.com;
	bh=5tgIWIPPwxvHWmWqAE4ou9tqqJxbBMg5pQLIrV7RRpI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=btRcABwtWdmqerqcx863K7HVSUQbxsjLDErbk0W4vphnjQ6Svfroz+h09xUV9Ed1K
	 /xL0nV7LFj7hlWqOhNBnWj7i3ifC9pAn/z7jSYV90/7DS28VCWHO6kV2FvQzHaUV9i
	 jLZxKEmIIpZiPDGUEjhrc3RiFw8GM8l87L0bTT3qEFyc0wkHXilawMRhLrtqMxqPfw
	 ZlyDOp5uCKLgWpZB2w4yVQY/dSx4bv+5pBCqk6DFc7igBTuYNe4TLAfyVuC2xMUprF
	 rBlFeZNcY4Jw77wj9pMpzVPMHZj8DvBuuE3E62p7D0zzSuWjxr3Jhf0sraNPFE0DqP
	 /1z1P/fYH6RJQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkkeJIrShJLcpLzFFi42Kxs+FI0rW2Tk4
  xuC1ocfHwUmYHRo9zG1cwBjBGsWbmJeVXJLBmrP3XxFJwQ6ri4uqTzA2Mz8S7GLk4hAQ2Mkq8
  OtfB0sXICeRMZZK4sjICxGYTkJCYvvckO4gtIqAr8fHDXEYQm1lARWLG5CNMILawgJvEgTt/w
  GwWAVWJedN+gdXwCjhJHNg5nxXElhBQkJjy8D1zFyMHB6eAs8TjUzUQq5wkFrfOZ4MoUZO4em
  4T8wRGngWMDKsYzYpTi8pSi3SNDPSSijLTM0pyEzNz9BKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v
  1iitzk3NS9PJSSzYxAsMhpZjt2g7GZzv/6h1ilORgUhLlZVmQlCLEl5SfUpmRWJwRX1Sak1p8
  iFGGg0NJgpfbKjlFSLAoNT21Ii0zBxiaMGkJDh4lEd5qC6A0b3FBYm5xZjpE6hSjMcfqRXv3M
  nNs2td1gFmIJS8/L1VKnJcdZJIASGlGaR7cIFjMXGKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwa
  gkzLvOCGgKT2ZeCdy+V0CnMAGdcmtPPMgpJYkIKakGppcOnanne99+cuF1nr5zUSQDH3fEptW
  PTfJ37/RcOnfxqcP8t56czPddzmxXJsooosvpku0keurxoYfOAi8Wl7z4t+dk8XqhswUHuXlM
  FC4UJurXcFUy6PnNu5PpKNMva3Q6ftWnJ7s7vRSCLjKv8PhQL9cc+k0nnnOLbszHn7O8495dL
  /7zI2CbxYMTouuuHn077eMS3dd9e141tmSIHAivZLZd8PgJi+LZT23OGT7Cxqv97IMf6ieVlL
  xY66rxVfzo+ttJMXECO5NVjz0v+mWkz3il6AvjTatDRyd4Ryt+q+H97pXza5Kvx/N3aXX6azk
  fiS93uxR041DqMr69SlszZc/OuVAZJr7Q6l1JtRJLcUaioRZzUXEiANB1c1AUAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1684224826!494186!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19507 invoked from network); 16 May 2023 08:13:46 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 May 2023 08:13:46 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9A23C1B0;
	Tue, 16 May 2023 09:13:46 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D615C7B;
	Tue, 16 May 2023 09:13:45 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] spdlog: fix build error for master fmt
Date: Tue, 16 May 2023 16:13:32 +0800
Message-Id: <1684224813-27544-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684224813-27544-1-git-send-email-wangmy@fujitsu.com>
References: <1684224813-27544-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 08:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102624

From: Wang Mingyu <wangmy@fujitsu.com>

error message:
include/spdlog/common.h:168:111: error: 'basic_runtime' is not a member of 'fmt'

Add fix-build-for-master-fmt.patch:
* update fmt_runtime_string macro
* fix build of updated macro

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../spdlog/fix-build-for-master-fmt.patch     | 44 +++++++++++++++++++
 .../recipes-support/spdlog/spdlog_1.11.0.bb   |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-support/spdlog/spdlog/fix-build-for-master-fmt.patch

diff --git a/meta-oe/recipes-support/spdlog/spdlog/fix-build-for-master-fmt.patch b/meta-oe/recipes-support/spdlog/spdlog/fix-build-for-master-fmt.patch
new file mode 100644
index 0000000000..c767db919f
--- /dev/null
+++ b/meta-oe/recipes-support/spdlog/spdlog/fix-build-for-master-fmt.patch
@@ -0,0 +1,44 @@
+Upstream-Status: Backport
+[https://github.com/gabime/spdlog/commit/0ca574ae168820da0268b3ec7607ca7b33024d05]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+
+From 0ca574ae168820da0268b3ec7607ca7b33024d05 Mon Sep 17 00:00:00 2001
+From: H1X4 <10332146+H1X4Dev@users.noreply.github.com>
+Date: Fri, 31 Mar 2023 20:39:32 +0300
+Subject: [PATCH] fix build for master fmt (non-bundled) (#2694)
+
+* fix build for master fmt (non-bundled)
+
+* update fmt_runtime_string macro
+
+* fix build of updated macro
+---
+ include/spdlog/common.h | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/include/spdlog/common.h b/include/spdlog/common.h
+index e69201a81..5f671c5c6 100644
+--- a/include/spdlog/common.h
++++ b/include/spdlog/common.h
+@@ -173,12 +173,19 @@ using format_string_t = fmt::format_string<Args...>;
+ template<class T>
+ using remove_cvref_t = typename std::remove_cv<typename std::remove_reference<T>::type>::type;
+ 
++template <typename Char>
++#if FMT_VERSION >= 90101
++using fmt_runtime_string = fmt::runtime_format_string<Char>;
++#else
++using fmt_runtime_string = fmt::basic_runtime<Char>;
++#endif
++
+ // clang doesn't like SFINAE disabled constructor in std::is_convertible<> so have to repeat the condition from basic_format_string here,
+ // in addition, fmt::basic_runtime<Char> is only convertible to basic_format_string<Char> but not basic_string_view<Char>
+ template<class T, class Char = char>
+ struct is_convertible_to_basic_format_string
+     : std::integral_constant<bool,
+-          std::is_convertible<T, fmt::basic_string_view<Char>>::value || std::is_same<remove_cvref_t<T>, fmt::basic_runtime<Char>>::value>
++          std::is_convertible<T, fmt::basic_string_view<Char>>::value || std::is_same<remove_cvref_t<T>, fmt_runtime_string<Char>>::value>
+ {};
+ 
+ #    if defined(SPDLOG_WCHAR_FILENAMES) || defined(SPDLOG_WCHAR_TO_UTF8_SUPPORT)
diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.11.0.bb b/meta-oe/recipes-support/spdlog/spdlog_1.11.0.bb
index ec985fb039..2800be4784 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.11.0.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.11.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ad
 SRCREV = "ad0e89cbfb4d0c1ce4d097e134eb7be67baebb36"
 SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x \
            file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch \
+           file://fix-build-for-master-fmt.patch \
            "
 
 DEPENDS += "fmt"
-- 
2.34.1


