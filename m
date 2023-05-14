Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE9CC77B7F
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:07:15 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web11.66078.1684069631637059278
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kD4U2pLp;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069629; i=@fujitsu.com;
	bh=2LXAM9AmZhMwfFf4i5DHQs8Ip5/ZKO6D5yLf+hgnzH8=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=kD4U2pLp23eAwqxvDK5ObGu3anWdoAURTLYw2ChFAhJUhNT1DVOPt5lenkH2VrTa3
	 V/PXkQNJ1Kkg7P2Z3avkImHZUU6EIRMBzbn9GF+GTl5aAGbAyQroDpBKn1Y1igXKuy
	 wcQwBffC6g0g9oiplZRNeJ9c1ZIdw09xjWOpohiZQUr8DnV4h3iNCrJgcvUPYBkp6f
	 vPmZa+olYLWgMu+cLIqGvTO2af8Yv6YmpYqpDutPwClt8bSNe3mVbSehQMUilAfXgj
	 R9SakoNscDLVz2IGpRjTt1QSDnpvv94Ygta0BXFZYa2XBhl2J8lKxBPJtn4jlYgmyt
	 BFzKpFGhyHxuQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFLMWRWlGSWpSXmKPExsViZ8ORpPvnTkK
  KwabpVhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bda8fZCrq4KjYf/sTYwDiHs4uRi0NIYCOj
  RNfvK2wQzjQmiXn7pzN2MXJysAlISEzfe5IdxBYR0JX4+GEuWJxZQEVixuQjTCC2sECAxL+3R
  1lAbBYBVYnlL6eC2bwCThIP10xjBbElBBQkpjx8zwxhq0lcPbeJeQIj1wJGhlWMZsWpRWWpRb
  qGBnpJRZnpGSW5iZk5eolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgV5OKWZ
  K2cG4atdfvUOMkhxMSqK810riUoT4kvJTKjMSizPii0pzUosPMcpwcChJ8OrcTEgREixKTU+t
  SMvMAQYcTFqCg0dJhDfuKlCat7ggMbc4Mx0idYpRUUqcVx0YpkICIImM0jy4NliQX2KUlRLmZ
  WRgYBDiKUgtys0sQZV/xSjOwagkzMtzA2gKT2ZeCdz0V0CLmYAW39oTD7K4JBEhJdXA5Lq8MG
  vd8sPTorzFwh4cNQm6HLzdh+0vP1+RWfKhItmq7mdP62de2XO27aq7s/U7t+NhJiFfuj1/Zwv
  +K4209NyVIZWUu1t+15bV5YlXk1cyT1rJ/NTO/hrTJymvJRP353y9tfLKgzYxxj9ehc8TzXyn
  JhsudvLlXKnj2OP5sr3mdv4Ptxeu7/K3LLubOiPkWevZyNM7F/DVVuWavltg+XJB97bfepI7z
  be9913bejHlNvvu7qCys0lubLJhW9aLzlV6wrKdb8YUi8//8/d1nzBc/ezn6X6JtSyax20Wtf
  z+UeUUmZn+WtFWW7itUXBV1TQ35V+bjN3EWM5s9lwvPmfh89RjMxqkVy7Zc2rZMyWW4oxEQy3
  mouJEAD7ZMkztAgAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-585.messagelabs.com!1684069628!583984!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10303 invoked from network); 14 May 2023 13:07:08 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:07:08 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 932241AE;
	Sun, 14 May 2023 14:07:08 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B9C4C1AC;
	Sun, 14 May 2023 14:07:07 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.22.1 -> 1.22.2
Date: Sun, 14 May 2023 21:06:53 +0800
Message-Id: <1684069617-12375-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102581

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Fix: Django caching spans when using keyword arguments (#2086)
Fix: Duration in Celery Beat tasks monitoring (#2087)
Fix: Docstrings of SPANDATA (#2084)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.22.1.bb => python3-sentry-sdk_1.22.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.22.1.bb => python3-sentry-sdk_1.22.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.22.1.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.22.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.22.1.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.22.2.bb
index ef4d629a87..359090caee 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.22.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.22.2.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "052dff5069c6f0d836ee014323576824a9b40836fc003fb12489a1f19c60a3c9"
+SRC_URI[sha256sum] = "5932c092c6e6035584eb74d77064e4bce3b7935dfc4a331349719a40db265840"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


