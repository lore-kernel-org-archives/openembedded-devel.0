Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E014C433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 09:11:36 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.6778.1634807490350749045
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 02:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CEyx96kg;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634807488; i=@fujitsu.com;
	bh=rQtUCyO5b8PZzDrtVecA58zUAhU8G9lUFKGcD9Fg1SQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CEyx96kgd5h7F+iBuys01SZtuYXEqjKMnM8RSWakv3mQitRJfN2JMTaZ369lEFLLR
	 CAZcimn8GVrtzJglvV4BvnRrdqFfkKe6+p5p9mjJCz1W32Cn8HY2HfACFAsWgMxgWJ
	 wM5bOAwkYiHw3+QVMVwZgQY0sfQZStzs28BwnHDifnCIDvVEciNPa5iuUsO7RB68n+
	 eeRyER80bafstcUrorsPEPtlcJqquybKgHvh2cfCpqKs0cYsF0pwWhIdWkSV5oLLF1
	 TwmarZLXPvPimPhpstLkLRbg7S9UFerXBl9vt1J7drJXrNTxOyQqGz2BFbwztT8U9G
	 +Wdy0qBZroTWg==
Received: from [100.113.7.241] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id FD/D0-14220-0CE21716;
 Thu, 21 Oct 2021 09:11:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+EI1d2nV5h
  o0DlR3OLi4aXMDowe5zauYAxgjGLNzEvKr0hgzejsusNY8IO74tvN7YwNjO+5uhi5OIQEZjNJ
  zHyxhAnCOcEocfZjC5DDycEmoCPR8aKbBcQWEdCXWDp7DzOILSzgI7Fg4gUwm0VAVWJ6xyOwG
  l4BN4nJN5aC2RICChJTHr5nhogLSpyc+QQsziwgIXHwxQtmiBpFie07z0DVV0i8PnyJeQIjzy
  wkLbOQtCxgZFrFaJlUlJmeUZKbmJmja2hgoGtoaKxrqmtoaqyXWKWbpJdaqpucmldSlAiU1Us
  sL9YrrsxNzknRy0st2cQIDKWUQtaZOxg/vf6gd4hRkoNJSZRX51dBohBfUn5KZUZicUZ8UWlO
  avEhRhkODiUJ3p3qhYlCgkWp6akVaZk5wLCGSUtw8CiJ8PorA6V5iwsSc4sz0yFSpxgVpcR53
  8kDJQRAEhmleXBtsFi6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYt0sXaApPZl4J3PRXQI
  uZgBYXWBSALC5JREhJNTB16eT9+ftrVkjxlJWL/s+Ke/rgw8JT4d/3pPhmMTAdjyleO8lx79n
  GznXPeD6GmOteFZmheCk9w8ZjxrWjs7aI30nKv31D48Pp/LBiqwtv//zbVZ39YDv3jvk66/jD
  nu/u8ta6Ov2kbalr2RbTzGfXb7HPn5gsNX+lkZ8dr2ZCyMQiVdYHP+fayMcdmbv9V4DLxG9HH
  Y4m6nZ0PlOr3GPzuiznGaOMYkjhh6bl2/9HzTa38Os0f/RgT5+NXM6X2FltGiduu3AUMk5cUl
  M28dHexcZuqRs8Lm37Pn+jSHrsZN0E54NLBepZ5RJXXPLMvRPgbPv4v/a9/b/Lgo++rZ9XK/C
  y8OUVJtOz5ycK2jBNVmIpzkg01GIuKk4EAAMYLxwgAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-248.messagelabs.com!1634807482!1965790!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31799 invoked from network); 21 Oct 2021 09:11:25 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-5.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Oct 2021 09:11:25 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19L9BMpa029398
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 10:11:22 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Thu, 21 Oct 2021 10:11:20 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pyscaffold: upgrade 4.1 -> 4.1.1
Date: Fri, 22 Oct 2021 05:11:15 +0800
Message-ID: <1634850675-4763-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Oct 2021 09:11:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93515

Version 4.1.1, 2021-10-18
-------------------------
- Ensure required extensions are installed on ``--update``, :pr:`512`
- Prevent extension from crashing when persisting ``None`` in ``setup.cfg``, :pr:`510`
- Prevent multi-line descriptions to crash ``putup``, :pr:`509`
- Warn users about empty namespaces, :pr:`508`
- Prevent parsing errors during dependency deduplication, :pr:`518`
- Add ``license_files`` to ``setup.cfg`` template, :issue:`524`

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-pyscaffold_4.1.bb => python3-pyscaffold_4.1.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_4.1.bb => python3-pyscaffold_4.1.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_4.1.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_4.1.1.bb
index 61737c78c..9769cd6b9 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.1.bb
@@ -12,7 +12,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "PyScaffold"
 
-SRC_URI[sha256sum] = "ff83ea4e585b29a746857c49a4dcba80795af130f62ff3f722d9f39aa4ff2a75"
+SRC_URI[sha256sum] = "8972252fda90d1020a93f1e99db370c002d18f52ff2fca9c3cc2a0aee74d07ad"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


