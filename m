Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208C8FA3740
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 02:07:07 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.1662.1667268425810706083
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 19:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=g3kFi191;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667268423; i=@fujitsu.com;
	bh=CHl4nI448A+FClCnIfp9WprknFuh3cQoRjcfNXNXXBA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=g3kFi191QIpmkXVQ8vK7vFKQkoq898tvmXhC3TF8sAm8CmCYnQXUSsy6h/2XdGuGU
	 pJBVRvfHhpbuVyWQ1W4Ddd6CDmCSA8vuOzvM4HHihz0wUsMFl4hGEq/MBpYFNnzf3w
	 MYVRiZFMO2cA3N5ARmX5WhPJgqQ3UD+nJE6ye9q6LKEMNWwGb1FZjXoQuc1lO0hr3L
	 gvmJDnLPxREbx0b/iUETTlomK/6ItUXdtTVr1oJPcjaaff5cUzzrgZqMDQOAt1W1my
	 oa76/fCoJ6gO3kg0UO5hNUoME9+YfGRF8IWepZ4XDxF3xNkzoKfCxKv+Cgrq5zYqTW
	 4BAcP8kCD/04Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWdetPiH
  Z4M43dYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPl/6tsBWd5K44tOsfYwLiGp4uRi0NI4CGj
  xNF/71kgnMtMEr9a1rN3MXICObsZJU5s0Aax2QSkJG7c/88GYosI6Essnb2HGcRmFlCRePG7B
  6xeWCBU4v2UHrAaFqD4jmc3weK8Ao4SL7oXs4LYEgIKElMevmeGiAtKnJz5hAVijoTEwRcvmC
  FqFCVmX25mgbArJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYjQrTi0qSy3SNdRLKspMzyj
  JTczM0Uus0k3USy3VzcsvKskASiWWF+ulFhfrFVfmJuek6OWllmxiBAZjSnEy+w7GN0v+6B1i
  lORgUhLl/S+RkCzEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgjeyBignWJSanlqRlpkDjAyYtAQHj
  5II769qoDRvcUFibnFmOkTqFKMlx9TZ//YzcywHkzO/th1gFmLJy89LlRLndaoFahAAacgozY
  MbB4veS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeRtAruLJzCuB2/oK6CAmoIPY2uNADip
  JREhJNTDtPLVB6Ftu+JFUrymWc29LOl0Lmfpo99S2Y8mfH07WEU59krWEjb+Ut8J2zgn+j55z
  vFPUStbpysg9OnNrfZrE65qCWc3nA/Wu1G2TKuTa9XS14JF/D/Z6Wd54IFQ39Vp5RuXrhzYh6
  6uOc8t5bKn0LJjaalHY+lK7OVLjw6mrrxQbL+pbu4jVfjR2Opm22/bC5LX7r/jLTk2aksQh/+
  j7c+//Oycf8+wr1tWd9nR9hnWTGuNx80gFlV830uJtmRRNclb8ubDfpaZfrtyrqmPrtjkW7ye
  9+bfIcs2X74L7tv8+FMFs9+K+T2jnh8j4aUFVy3b+P3NfI6r1R/H57g12K6bFH5ryL3LN1FOb
  pGe8UGIpzkg01GIuKk4EACvNC1dZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-745.messagelabs.com!1667268422!869797!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12891 invoked from network); 1 Nov 2022 02:07:02 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Nov 2022 02:07:02 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 25EAF150
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:07:02 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 18B2973
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:07:02 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 1 Nov 2022 02:07:00 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-lazy-object-proxy: upgrade 1.7.1 -> 1.8.0
Date: Tue, 1 Nov 2022 10:06:44 +0800
Message-ID: <1667268408-9931-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 02:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99382

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2022.

Changelog:
==========
    Cleaned up use of cPickle. Contributed by Sandro Tosi in #62.
    Cleaned up more dead Python 2 code.
    Added Python 3.11 wheels.
    Dropped support for Python 3.6.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ject-proxy_1.7.1.bb => python3-lazy-object-proxy_1.8.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lazy-object-proxy_1.7.1.bb => python3-lazy-object-proxy_1.8.0.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.7.1.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.8.0.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.7.1.bb
rename to meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.8.0.bb
index 4c20fcc861..46ef296262 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.8.0.bb
@@ -2,10 +2,10 @@ SUMMARY = "A fast and thorough lazy object proxy"
 HOMEPAGE = "https://python-lazy-object-proxy.readthedocs.io/"
 LICENSE = "BSD-2-Clause"
 SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c7d2e9d24c2b5bad57ca894da972e22e"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-pip-native"
 
-SRC_URI[sha256sum] = "d609c75b986def706743cdebe5e47553f4a5a1da9c5ff66d76013ef396b5a8a4"
+SRC_URI[sha256sum] = "c219a00245af0f6fa4e95901ed28044544f50152840c5b6a3e7b2568db34d156"
 
 inherit pypi setuptools3
-- 
2.25.1


