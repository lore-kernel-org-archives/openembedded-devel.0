Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7FBC64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:06:21 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.85459.1677485178541684150
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yvQuVqql;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485177; i=@fujitsu.com;
	bh=3Vk7pxFTyAbJAOfVnj9HqyeK0ywIauprI9MqbZ8F5Yc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=yvQuVqqllKQA8D/AM6Q/53/8UO1Cd0Llv9Z4oHD0ZIvMQuLT5TGDwiIZk0fcm/YRs
	 EZyW+WmgTCjBysksCjMpPLpuipyNzEgKt2KV4cdlIaGZbjcr4OH+PYNWfPdP4kadAQ
	 C7ifDEaa1aPbAvUS4mU7K9MaCT1x3AjkxtWo4ZppCULaDsM4veLCQ+ZgauumIvL1y6
	 pG1MNLq2YSrEwhsBrNLOwW47LAl6UDKeM464c952XkN4O0WI+ihdIKotf0hwkXlPrP
	 FhkR/ZzF+Qb71eLaskzJ+oMXB/hXQJfMOD5rGOGgDKUBTqCUYK9o4C9hd+D+ZwNUKj
	 VN4Y/3zQQeQMQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpFuR8if
  ZYE27lsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHi2CamghauikVPjrI3MPZzdjFycQgJPGSU
  mP/0LTuEc4VJYs6J+6wQzl5GiZfnQDKcHGwCUhI37v9nA7FFBPQlls7ewwxiMwuoSLz43QNWI
  yzgJfHhzEewOIuAqsS7gw2MXYwcHLwCThKT3vCChCUEFCSmPHwPVsIp4Czx6tlhsJFCQCWPT+
  xiArF5BQQlTs58wgIxXkLi4IsXzBC9ihKzLzezQNiVEq0ffkHZahJXz21insAoOAtJ+ywk7Qs
  YmVYxmhWnFpWlFukamuolFWWmZ5TkJmbm6CVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfmJuek
  6OWllmxiBAZvSrHihB2MF/v+6h1ilORgUhLlXeT0J1mILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  O/BJKCcYFFqempFWmYOMJJg0hIcPEoivMxGQGne4oLE3OLMdIjUKUZFKXFevkSghABIIqM0D6
  4NFr2XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzRiUATeHJzCuBm/4KaDET0OLtD3+ALC5
  JREhJNTAxb+RM51izRSGXZdPhQ9YiMlazvr9NWMnerrr0yIsvgQfS2xNCpu8/WvL9uKrxHLH5
  Dxa+qZ9woG7XwZZ65y3m96P7euZcPDthy+WkwDtJp+sW/8gLcBfj8bB0tDtV8EXg5tGFyryX6
  4JbncxypdbHLljeymGtKqybrf68ymXW5v+irWrBz/iLrVJeebY3NE3/vaQl+JrdjDmGGbfPKE
  anKMYY/H1m/n4P56NGZfmzz6va9203P3cmV/YYe+aEyycnNRf/6NOym6FbfrFgxTX3q4cjHLd
  GPlLc9uzV/cNi/lv3bNzLVr9jGf8BtuPv5N5aCrR9uOq1dUKWrOIknvPaJiwTjYv/zL77/tbb
  OIfnSizFGYmGWsxFxYkAnI+cQlkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-548.messagelabs.com!1677485176!169867!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6164 invoked from network); 27 Feb 2023 08:06:16 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:06:16 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 5FB7A1AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:06:16 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 53AB37B
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:06:16 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:06:14 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-django: upgrade 4.1.6 -> 4.1.7
Date: Mon, 27 Feb 2023 16:05:53 +0800
Message-ID: <1677485153-11495-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485153-11495-1-git-send-email-wangmy@fujitsu.com>
References: <1677485153-11495-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101271

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
fixes a security issue with severity "moderate" (CVE-2023-24580)
Fixed a bug in Django 4.1 that caused a crash of model validation on ValidationError with no code (#34319).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-django_4.1.6.bb => python3-django_4.1.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.1.6.bb => python3-django_4.1.7.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.1.6.bb b/meta-python/recipes-devtools/python/python3-django_4.1.7.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.1.6.bb
rename to meta-python/recipes-devtools/python/python3-django_4.1.7.bb
index e54398c45..be806eefa 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.1.7.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "bceb0fe1a386781af0788cae4108622756cd05e7775448deec04a71ddf87685d"
+SRC_URI[sha256sum] = "44f714b81c5f190d9d2ddad01a532fe502fa01c4cb8faf1d081f4264ed15dcd8"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.34.1


