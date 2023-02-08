Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC9FC05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:11:45 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.3794.1675843891983965051
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:11:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ewZ0xLPi;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843896; i=@fujitsu.com;
	bh=lqCYgNEqQUWWDwHzAyJZQpyy4g3n2qAW7YOsVoXA8vM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ewZ0xLPiyNfVwMcXUmbj4nJDDFA+B7rbVAKSOQg0v5TV1yGkd+D5TDdSoO2gh+lnp
	 I0Ofnn4SWMTsMp3ZUphWnsUugfEGzKHidGGC2y9nWm2SlKngrP2Hmo7SC1iOli96j9
	 LZnbKR6LhJWKw/H8SsePNhwABd8q20DsOLrB4mstZCsUBlaB+3WKE7vcwsYYJzUXDu
	 crKKym6MSJV0Z6/LvAOVSgEy3/RWCwavi9p7rvY4hZ/LaLLzx3mDj8k04Z4rkva97T
	 uXjiXNL5TpogaSB18NOTfTFy+ZJJuQaQQ2p9Wah9vqoML4CtnLPUS+HJ4z+qUuVTQs
	 tk/sUwlZ2aZrQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqGse+Tj
  Z4OcfQ4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNt0xrmgs+cFT962lgaGPs5uxi5OIQEnjBK
  NG7tZYRwbjBJnJ99g6mLkRPI2cMoseZwAojNJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICvxIvml2A1LEDx3b8Wgc3hFXCSeHq9GywuIaAgMeXhe7BeTgFnibZP01ghdjlJ7Nh1gB
  miXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjMLhF0p0frhF5StJnH13CbmCYyCs5C0z0LSvoCRaRW
  jeXFqUVlqka6hqV5SUWZ6RkluYmaOXmKVbqJeaqluXn5RSYauoV5iebFeanGxXnFlbnJOil5e
  askmRmD4phSnyO1gvNL3V+8QoyQHk5Ior6fY42QhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErwR4
  UA5waLU9NSKtMwcYCzBpCU4eJREeCNDgdK8xQWJucWZ6RCpU4yKUuK8V0H6BEASGaV5cG2w+L
  3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZg3IAxoCk9mXgnc9FdAi5mAFoeoPgRZXJKIkJJ
  qYOL+2tDMq2Dg0rl015wK9nVxW+56XpWZsMrP7b+nUM/siysTP4tc7ngWebdP8dMy3qmZetfO
  J1QV6jRkGF6c19O+3O7fu6krl5qGGC5Ia781zWxn2B7BRbfqNRclJW619ln6wnnSHMOcywmr+
  lwU3TPuZ6qyrZ72itX/8ocjU2/pbdDqzfk78ep1gRPGUgJThJaoCjccOdHv+/mRjMi31E8ZF0
  SVP5UtWP5Xzmy+QEH8/rsxO05E/ft6aE25xEXL6bXK79ICMvyOZ3YW2H/1vSYzgc331Io7CwR
  a3q4UtVY8Mdma893TRQqbbsbXaly51Ppi6pLWdSwnTnTYiDgtt3W5+Cjb4uEOr3ULvSeEM51U
  YinOSDTUYi4qTgQA8ITU6loDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-732.messagelabs.com!1675843895!393863!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30977 invoked from network); 8 Feb 2023 08:11:35 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:11:35 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4683510018D
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:11:35 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 39C3A100043
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:11:35 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:11:33 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-wtf: upgrade 1.1.0 -> 1.1.1
Date: Wed, 8 Feb 2023 16:11:17 +0800
Message-ID: <1675843877-11285-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675843877-11285-1-git-send-email-wangmy@fujitsu.com>
References: <1675843877-11285-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100982

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fixed validate extra_validators parameter. :pr:548

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-flask-wtf_1.1.0.bb => python3-flask-wtf_1.1.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-wtf_1.1.0.bb => python3-flask-wtf_1.1.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_1.1.0.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_1.1.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-flask-wtf_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-wtf_1.1.1.bb
index 92d78674e..ec47fcac2 100644
--- a/meta-python/recipes-devtools/python/python3-flask-wtf_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-wtf_1.1.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Simple integration of Flask and WTForms."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=d98d089889e14b227732d45dac3aacc4"
 
-SRC_URI[sha256sum] = "10fd267a41b6dee4f433ec8d6507d4cce4f1d71700280cf654a7cdbae6408d47"
+SRC_URI[sha256sum] = "41c4244e9ae626d63bed42ae4785b90667b885b1535d5a4095e1f63060d12aa9"
 
 PYPI_PACKAGE = "Flask-WTF"
 
-- 
2.34.1


