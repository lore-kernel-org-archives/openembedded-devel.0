Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B6BC433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 09:04:17 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.26312.1643274256114397426
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 01:04:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qi2b3I+Z;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643274254; i=@fujitsu.com;
	bh=xiQ16XUk8hzj1fq5Hde6tbWacUL6f6fDd1FfDZGZt00=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qi2b3I+ZNhnaZhSe+XQoMqi2gS3ICXTACSQ2d0Ab9n7bQQ0JyekJS5GxMqLirsRVX
	 +Ea8+otKasqG7OZjSDLVxKNShDjp+8bxL2nChjgz7YFr1MtbBurO/9iU9FZ3W2DMkn
	 4G3DsleZawKHn/GJXcC9Wl6hJd5zOHUuVHz/3hUlh1WrjhIApx+VINIcmvt7WQTQgT
	 k2w7BVtrGmPjEFKXhPMXUf0ZDrIwBI7dcxeuvgdmKlwKfLDUBLbEU2rC5YcldcR0uA
	 NO4ZjFcXgGgiOOsiMbPYfEgAfDvS7E9Wgv4QlJUEuknDSlJEOSEgs40XCzwJ9HPT+8
	 fUMiI3Kfr/JDQ==
Received: from [100.115.3.188] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id BB/B0-12986-E0062F16;
 Thu, 27 Jan 2022 09:04:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRosub8Cn
  R4NR1fYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePewryClZwVjR/vsTcwXuHoYuTiEBKYySSx
  7dhzxi5GTiDnJKPEgT+SIDabgLrE45uvweIiAvoSS2fvYQaxmQVUJbovrmEHsYUF4iQeNG8Hq
  2EBir/5+IkNxOYVcJPo+PEUzJYQUJCY8vA9WC+ngLvEvPb3QHEOoF1uEr/n6UOUC0qcnPmEBW
  K8hMTBFy+YIVqVJE6s+MgEYVdIvD58iXkCI/8sJC2zkLQsYGRaxWiVVJSZnlGSm5iZo2toYKB
  raGiqa6prZGysl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGI4pxawvdzBO
  7/upd4hRkoNJSZR3ifmnRCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvPmxQDnBotT01Iq0zBxgb
  MCkJTh4lER4V8UBpXmLCxJzizPTIVKnGBWlxHlF44ESAiCJjNI8uDZYPF5ilJUS5mVkYGAQ4i
  lILcrNLEGVf8UozsGoJMxbCjKFJzOvBG76K6DFTECLf59/B7K4JBEhJdXAJKP4IavuXXpDNlu
  Zq8bK3XWqs17ZpmU2vHj8QHKPruMEYetZKku/HXE6nHv2A5tgqvTcf2zF58pZTukqanyJ0P74
  ObBg1bS+420Zq8WXCGmw5R9fvO11AJtu3lwRJX3xB3t3WqncDpk+55u/uq6kiHx1whenyC9GS
  sL7JL6Zvql2Y1ouJfk96bicA6PPrlWSe5zvN/DIT9g2b4rXfU3eBr22PVPmznRP9jb5GvQgZd
  Pfid2vs0Tv/a5wjWDVTFA0NfK3+1N9IO7c7ipv08rrnbnLnpgIxpTeidM/ODGutlHt1du/ZRK
  zHnu5ZD/e9rGxRvP/CSm7wkLGgl2Oh9pEdq5mMOCfLvhZy2zGqx9KLMUZiYZazEXFiQBwbGiD
  QgMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-585.messagelabs.com!1643274253!3776!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9959 invoked from network); 27 Jan 2022 09:04:13 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-20.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jan 2022 09:04:13 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20R947JN013626
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 09:04:13 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 27 Jan 2022 09:04:08 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 3/3] [oe] [meta-python] [PATCH] python3-pytest-timeout:
 upgrade 2.0.2 -> 2.1.0
Date: Thu, 27 Jan 2022 17:04:16 +0800
Message-ID: <1643274256-7015-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643274256-7015-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1643274256-7015-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jan 2022 09:04:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95119

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...-pytest-timeout_2.0.2.bb => python3-pytest-timeout_2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-timeout_2.0.2.bb => python3-pytest-timeout_2.1.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.1.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pytest-timeout_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest-timeout_2.1.0.bb
index 7c77e4add6..c4faec6c61 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff"
 
 PYPI_PACKAGE = "pytest-timeout"
 
-SRC_URI[sha256sum] = "e6f98b54dafde8d70e4088467ff621260b641eb64895c4195b6e5c8f45638112"
+SRC_URI[sha256sum] = "c07ca07404c612f8abbe22294b23c368e2e5104b521c1790195561f37e1ac3d9"
 
 inherit pypi setuptools3
 
-- 
2.25.1


