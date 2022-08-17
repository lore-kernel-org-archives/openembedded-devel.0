Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BA9C25B0E
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:58:22 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.24861.1660705096453469664
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=l7n4rvt6;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660705094; i=@fujitsu.com;
	bh=6a6ouSN/OSO0CcMOffQMjy15tw1cRSxSrN2jLC/xLJk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=l7n4rvt66YZfxzLR2bw8FTsJj9uPxhhMYCJ57F3dKozmmR/u4KB3n6k9UXyFFEHys
	 G9Q+inzugl36xfoZrzEaBde5EOZIYbHrMXZAziliy6f4YRnDZrhH3ERFwHsh5SfD6S
	 EMnFLqKHszGduWrXPcFCgsn04mfNre9EziW/rwYpY8djcIvCqJQhW4BdR9QACAqLPY
	 +HXM4CZheFNHIIJNCqfBMluBh2Ky1PVG8uxpoPTzuwDmMd72Yhv2PMYFb0YcOLzYJs
	 yjjCM1dNsl/hIJjlL0hghRhsTyobiMdWf7Jzv0XGLnQ4sEKwvf+98xVSkGlcW93myZ
	 QyK8ZfEalTZtQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORpOsS+Sf
  J4G+DucXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHx3TrGgpmcFYe3XGdpYDzK0cXIySEk8JBR
  4sf9tC5GLiD7CpPE+dvLmCGcPYwSaw5eYAOpYhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1ggQOJ6/zawOIuAqsTDy/dZQGxeASeJSf1PwGwJAQWJKQ/fg9VwCjhLfJu9E2g+B9AyJ4
  m5U80hygUlTs6EKGcWkJA4+OIFM0SrosTsy81QYyokZszYxgZhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaJNUlJmeUZKbmJmja2hgoGtoaKpraaZraGmsl1ilm6iXWqqbl19UkqFrqJdYXqyXWlys
  V1yZm5yTopeXWrKJERjGKcUJB3cwrtj3S+8QoyQHk5Iobz/TnyQhvqT8lMqMxOKM+KLSnNTiQ
  4wyHBxKErzfwoFygkWp6akVaZk5wJiCSUtw8CiJ8MoGAKV5iwsSc4sz0yFSpxh1OWZ+bTvALM
  SSl5+XKiXO+9YHqEgApCijNA9uBCy+LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5v0Ocgl
  PZl4J3KZXQEcwAR1x7OJvkCNKEhFSUg1MJns54zykqjPmSVce2O965RPfDUHTTXmJSzZP87z5
  Nfdbdx2nY+WLpzO2XBSa+Stttnr7gzPvFulH/5D+0LZkX7HBUze7451SZkInT765mrry/vknp
  grvP890q/ISPLz3rIbIsZeHkhPKqtP+n2GI/5MlZx038e+lNWt/sdTLBJ0wfu2toGK3//Q/nm
  uXzsUvvbiBcdnBCTf3M9T9NL+R9N3sO89PpkTZ3/+YTzteE/LslHZ4qtW8yez3W5PwHy77vry
  bXzi9+lrAyft32Rqnn6z9fWK7hneOYX/ZZeZtJ57c/bd+WUDOXPspP8Oq7IyvzGIruHJe55DR
  g0uHavi5z9zhvlNvOze2YdvXQjGuIC0lluKMREMt5qLiRACqJrTmagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-732.messagelabs.com!1660705092!790827!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23385 invoked from network); 17 Aug 2022 02:58:12 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:58:12 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4FEDA1AE
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:58:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 44F9B1AC
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:58:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:58:10 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.39 ->
 1.4.40
Date: Wed, 17 Aug 2022 10:57:39 +0800
Message-ID: <1660705060-17241-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660705060-17241-1-git-send-email-wangmy@fujitsu.com>
References: <1660705060-17241-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:58:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98282

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.39.bb => python3-sqlalchemy_1.4.40.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.39.bb => python3-sqlalchemy_1.4.40.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.39.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.40.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.39.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.40.bb
index 0690a8b4a2..f61030fc10 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.39.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.40.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f4001d1ca15b69d096fa1b4fd1bdce79"
 
-SRC_URI[sha256sum] = "8194896038753b46b08a0b0ae89a5d80c897fb601dd51e243ed5720f1f155d27"
+SRC_URI[sha256sum] = "44a660506080cc975e1dfa5776fe5f6315ddc626a77b50bf0eee18b0389ea265"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


