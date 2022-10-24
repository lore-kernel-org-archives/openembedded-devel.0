Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36301C3A59D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 07:18:46 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web11.16474.1666595918012423829
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Oct 2022 00:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QauFCBi5;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666595916; i=@fujitsu.com;
	bh=9y08qMjqkI8dHuZNwokslxQyZVthMJ75+8WQhUBvD+A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QauFCBi5CWQ+Ek+d5UxOOU0p6rNT0cQGM57yltpOWLsViFRZ7M+mAmzU/pm1GfIZr
	 Th0FMnxrUziCpk1tfLnsxo+aLJsrWD2BF1/nmPv0QFfm21LAb5qutwoOskI+nAE8oU
	 d5Q9LVAYj71WVQXrfOZaPwW8Za/mD7Wq5Zk+BBIM3DT4VPJNO35C3KGtZc94Kla+A7
	 peRwvhLIoveUdEbQSSK47sXASfUFvP/JvzRoiAdWbCw7RUmNGWS/eGaJ0QApaY2Nd6
	 7SYZjKGWApotwvgqfYJiI3PX4dDAHMSwyGqqmH4iLqBlx/VdXuNAkbUdSUPeh4isgg
	 orZuW1I5iUT9g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8OxWdfbJiz
  ZYFKrtMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFh9TvmgqU8FZNv3mFvYPzB1cXIxSEk8JBR
  4t7SbmYI5zKTxOtZT5i6GDmBnD2MElM7ikFsNgEpiRv3/7OB2CIC+hJLZ+9hBrGZBVQkXvzuY
  QexhQU8Jc7O+MAKYrMIqErsed/NCGLzCjhJfOt5AVYvIaAgMeXhe2aIuKDEyZlPWCDmSEgcfA
  FToygx+3IzC4RdITFrVhsThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNZcWpRWWqRrqGpXlJRZnp
  GSW5iZo5eYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZgMKYUsxfvYHyw7I/e
  IUZJDiYlUV4G8bBkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8NVpAOcGi1PTUirTMHGBkwKQlO
  HiURHhnGQGleYsLEnOLM9MhUqcYdTlmfm07wCzEkpeflyolzmtnDVQkAFKUUZoHNwIWpZcYZa
  WEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMeswSawpOZVwK36RXQEUxAR1xaEQRyREkiQkqqgWm
  eww2O9IcSk4xs2sx01+2uEfy3hsWZLePBtco7uXksWvU3PTT1c076Vt/NWLXl+u2HTQ2PM6PX
  LZxrHeUxnyP04sK9tQ/zRbf+zeO7s+S3++vA/epsMtWV+++f3/d6ze7iTVrntn26pNYxm/GeT
  0TKA/EJZhqrD8V/NZQSq/FuezH9W+O1l6u3sOhJn3vosFrgTmGw//IlSxRK1VqvvZBckmta+d
  cuoW+l9bc1R7rV7bSlGQRnJPLc/OZp/iuG5dbi1oX7W7zMbyRznqnSSIhyee8dff/iK4eW1h2
  uqUkfc72+ax1fVLt61xYP9wdS6Uure7Z/0v61IHbmKQuRSzn6vU/DWjzVqg4ZMu22/qrEUpyR
  aKjFXFScCABy+zWlTQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-585.messagelabs.com!1666595915!443956!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26655 invoked from network); 24 Oct 2022 07:18:35 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 07:18:35 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 13304151
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 08:18:35 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 0651873
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 08:18:35 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 08:18:33 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyjwt: upgrade 2.5.0 -> 2.6.0
Date: Mon, 24 Oct 2022 15:18:17 +0800
Message-ID: <1666595897-29808-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99289

From: Wang Mingyu <wangmy@fujitsu.com>

Changed
--------
    bump up cryptography >= 3.4.0 by @jpadilla in #807
    Remove types-cryptography from crypto extra by @lautat in #805

Fixed
---------
    Invalidate token on the exact second the token expires #797
    fix: version 2.5.0 heading typo by @c0state in #803

Added
-------
    Adding validation for issued_at when iat > (now + leeway) as ImmatureSignatureError by @sriharan16 in #794

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyjwt_2.5.0.bb => python3-pyjwt_2.6.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.5.0.bb => python3-pyjwt_2.6.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.6.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.6.0.bb
index f587e5c0de..d6ca242c58 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.6.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI[sha256sum] = "e77ab89480905d86998442ac5788f35333fa85f65047a534adc38edf3c88fc3b"
+SRC_URI[sha256sum] = "69285c7e31fc44f68a1feb309e948e0df53259d579295e6cfe2b1792329f05fd"
 
 PYPI_PACKAGE = "PyJWT"
 inherit pypi setuptools3
-- 
2.25.1


