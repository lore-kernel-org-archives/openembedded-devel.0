Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A96BC77B76
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:23:39 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.42808.1682306613141299032
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pxVIqyhu;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306611; i=@fujitsu.com;
	bh=T21KvrspKgTOBjLPvKmfiKR4qUeese+sATVv0BdNgqA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pxVIqyhuWmIrzXOHz4NGYlWPrA9sz7lp5lh4+99O6IVQushI4yox3JjHg8r1VpqnC
	 zVj4w6JX7NF4vhLPKTXyR1ut35oIruocxuVdewnOkdF6tNjxAze9d8PCcBBxGzXNc0
	 H6RpI2bYf03Jos26/56gDtGCxfYW0TFbavUiQVJh3uZT8aQmyHhK9fX/DYHY3z9hoY
	 GgpB9+cSflY2Hi78rUl0qVbacNGZqhj3xfPDVRWf9+3Xzx1ssFm3KKYH9LlI9VpYL9
	 P7A+iMvJoGNLKJtpKdVxwI9ZBDOjrIPna390eQ01lgc5iMm14r0inT592x3tpl9Yyq
	 n1je3oFoCIaZg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8OxWdfwm2u
  Kwdl/1hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8arWzPYClZzVbx8eY2xgXE/ZxcjF4eQwENG
  iWtnOtkhnKtMErMmPGSCcPYySrScWgWU4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8es
  BphAV+JLz1/wWpYBFQl+tq2gsV5BZwkfh/dzwJiSwgoSEx5+B6sl1PAWaJ39zOwuBBQzf9Dj6
  DqBSVOznzCAjFfQuLgixfMEL2KErMvN0PNqZRo/fALylaTuHpuE/MERsFZSNpnIWlfwMi0itG
  sOLWoLLVI10gvqSgzPaMkNzEzRy+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5J0UvL7Vk
  EyMwfFOKkxftYDyy86/eIUZJDiYlUd4lG1xShPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwFn1yT
  RESLEpNT61Iy8wBxhJMWoKDR0mEd9kXoDRvcUFibnFmOkTqFKOilDhvIEhCACSRUZoH1waL30
  uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHklPwBN4cnMK4Gb/gpoMRPQ4l3cLiCLSxIRUlI
  NTBn+LevcvI1eJ56OFWfsXvf7VPjUtdMa3mtHp1gyvzHifT752LT7j9sMKjjXS2f1/wlu9TAr
  v3quYa4x+73Ko4m2nSxR7fLfdoku9Xi3+8neQ6Fap6fNPPDNfTVf7TKVqneV6UbGdpfjzgdev
  NR8SZz1/KXytzMv5tq9le1r6bkv8KnnxaWZF2axOJuHsGeF6V1dxlitmpGWpRy+7bDPNe7DJ/
  J33d5V4M7U/f2joeSMs1+sIjRNjVv6z+x3zj5q2OW2bO2Tu/E++V933rp0RNdOReipgzbHjO7
  zdxY7SrxawjmXrz/rnWklh1O7oQqT9V2x9Js73rYxlXodPWQqlbjb8uK5eduETlyxcIjfrsRS
  nJFoqMVcVJwIAIYo/1VaAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-732.messagelabs.com!1682306609!289448!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6874 invoked from network); 24 Apr 2023 03:23:29 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:23:29 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 6E03A155
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:23:29 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 62091142
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:23:29 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:23:27 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.15.2 -> 2.15.3
Date: Mon, 24 Apr 2023 11:23:07 +0800
Message-ID: <1682306589-11841-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682306589-11841-1-git-send-email-wangmy@fujitsu.com>
References: <1682306589-11841-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102161

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix "infer_call_result()" crash on methods called "with_metaclass()".
* Suppress "UserWarning" when finding module specs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_2.15.2.bb => python3-astroid_2.15.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.15.2.bb => python3-astroid_2.15.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.15.2.bb b/meta-python/recipes-devtools/python/python3-astroid_2.15.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_2.15.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.15.3.bb
index 3b8a7f103..bcde06938 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.15.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.15.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "6e61b85c891ec53b07471aec5878f4ac6446a41e590ede0f2ce095f39f7d49dd"
+SRC_URI[sha256sum] = "44224ad27c54d770233751315fa7f74c46fa3ee0fab7beef1065f99f09897efe"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


