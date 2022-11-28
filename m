Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2103CC4167D
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:12:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.111374.1669615958996270496
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:12:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wFkRx1g5;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669615962; i=@fujitsu.com;
	bh=v6jXa79BAQ+qnP7tV42gUapmWfTwilUXT+nVLqt/F4U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wFkRx1g5CYnhWyqQcoksmREivxJTb6nTptq5qxD0mFDKjQoUVQE5MIP97rTog6PnS
	 g1i+ryVt42PVxloWYT7hr5dIB+7MXO6xiSGTBX6xQSo8FeoWbSD5BMbzSFPjeQHBsU
	 kWB4VXM8x7YAQyvwT3rCe44BXv/gbo/HzVv9jEfvnxhQe7RC3nzm9Ujoa9aVyb1Vj+
	 UwkZXFG4YHP22PARrXPNKg8gHPpt8lVoW+cjlWNGbXLbJl8R8GXeUgzEWyV3msHQqs
	 vFd3exZmphuZF1Z/wzd/2uCnDPy/Nm4oDfQJN5l1ygPG/VtTsljUe+qwCRxDcbnG8e
	 38SWYVeJNQYxw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORpBsZ2JJ
  ssGCxmcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjHz+GGWggaeii9nfjE1MD7h6mLk4hASeMgo
  8X36TnYI5zKTxN0bf1ghnD2MEq3rfrF1MXJysAlISdy4/x/MFhHQl1g6ew8ziM0soCLx4ncPU
  DcHh7CAv8SpVnmQMIuAqsTVX5PBynkFnCRaFsxkBbElBBQkpjx8D9bKKeAsMW39djBbCKhm68
  rpjBD1ghInZz5hgRgvIXHwxQtmiF5FidmXm1kg7AqJWbPamCBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYzYtTi8pSi3QNLfSSijLTM0pyEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5Nz
  UvTyUks2MQLDN6U4JWAH46Zlf/QOMUpyMCmJ8i681JQsxJeUn1KZkVicEV9UmpNafIhRhoNDS
  YJ3vWdLspBgUWp6akVaZg4wlmDSEhw8SiK8i+2B0rzFBYm5xZnpEKlTjLocM7+2HWAWYsnLz0
  uVEuc95w9UJABSlFGaBzcCFteXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzbgOZwpOZVwK
  36RXQEUxAR2xSbAI5oiQRISXVwDRx6VoNhj0HNFYyNn96lHDSo8Qh2NhPU/zW1K+nGhjvuigu
  PjJTN2PFLLmLASxNbdcD2m7nHJG/vMFB5PxFB7lM1vDgCo5/C7a/cdFezasRneUtypV8MGBWa
  9n9KZ+efJ7E1rJhcuGs93cOFtU8ZnHTLfy4gH22wfYDFpqTXXL8g8992rZgCXM5m2vkXNMa26
  xvwqu7329qm7H/1Hynu02h7S+VtBKST5/i55fLlbPyPPTg9PE9ZpYZC90dJyawrNvr75x0qOP
  QM4+r9wxf/PhiwJ557+59yflcz3pOcudUrepmllhrJXT2wd7Fq9TffrP33XAjU29N2q8n6UHu
  144E5wv1rOFmEN5Zk8uzzkuJpTgj0VCLuag4EQAKYDlzZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-728.messagelabs.com!1669615961!10146!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2391 invoked from network); 28 Nov 2022 06:12:41 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:12:41 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 5F5761AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:12:41 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 52C7E7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:12:41 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:12:39 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.12.12 -> 2.12.13
Date: Mon, 28 Nov 2022 14:12:08 +0800
Message-ID: <1669615929-13134-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669615929-13134-1-git-send-email-wangmy@fujitsu.com>
References: <1669615929-13134-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99799

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
    Prevent returning an empty list for ClassDef.slots() when the mro list contains one class & it is not object.
    Prevent a crash when inferring calls to str.format with inferred arguments
    Infer the length argument of the random.sample function.
    Catch ValueError when indexing some builtin containers and sequences during inference.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_2.12.12.bb => python3-astroid_2.12.13.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.12.12.bb => python3-astroid_2.12.13.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.12.12.bb b/meta-python/recipes-devtools/python/python3-astroid_2.12.13.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.12.12.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.12.13.bb
index aa0ce44ba..ca87ff013 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.12.12.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.12.13.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "1c00a14f5a3ed0339d38d2e2e5b74ea2591df5861c0936bb292b84ccf3a78d83"
+SRC_URI[sha256sum] = "1493fe8bd3dfd73dc35bd53c9d5b6e49ead98497c47b2307662556a5692d29d7"
 
 inherit pypi setuptools3
 
-- 
2.25.1


