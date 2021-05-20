Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web08.2469.1621474042514041297
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 May 2021 18:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=F40mDc5I;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621474039; i=@fujitsu.com;
	bh=g9uPUmy26KL+vHqZNgtVf6DChupfJk+Jow4G3U75Snk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=F40mDc5IfnKxEoa/JEobWKKv6uTK/WYRlQmFRuHsU+WIe/jnLnyozJcl+vADd2L25
	 yJqyQfOCKY16K3ct2u6wjaQGZJiycgzyBB5LngOkLyrrCoZwxJD1c3C9f2gT0TXtXK
	 pH3Gv0zpWSkBOwu2E72kX12pBui5dfrOBk1a6EwiT0vKT2buaegBRQwyn87w2i36vk
	 zMzAg7Gchr7r9ZCqFZ4dPQx2F5dLz7LWcQ4CN0U7xEDBTxDjJOPWZ5FcyrF7JflWqx
	 i/dR3WKGe0fZbQCmGudNXmxrJqg5vmbyyNnrDvEtiRhvawprnlrKrF4y2EpZAHS55+
	 kDHM2Zc9lcWvA==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 81/4B-62504-6FAB5A06; Thu, 20 May 2021 01:27:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI1f22a2m
  CQc9lDYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaO15R1LwU7OigeznBoYr3J0MXJxCAnMZpL4
  /O4cC4RzglHi18ZjQA4nB5uAjkTHi24wW0RAX2Lp7D3MILawgJ/Er4n32UBsFgFViWV3rwPFO
  Th4Bdwl/rzyAwlLCChITHn4HqycV0BQ4uTMJ2BjmAUkJA6+eMEMUaMosX3nGRYIu0JixoxtbB
  MYeWYhaZmFpGUBI9MqRoukosz0jJLcxMwcXUMDA11DQyNdQ0szXSNDE73EKt0kvdRS3fLU4hJ
  dQ73E8mK94src5JwUvbzUkk2MwCBKKThybQfjgdcf9A4xSnIwKYnymt1flCDEl5SfUpmRWJwR
  X1Sak1p8iFGGg0NJgtcQGJZCgkWp6akVaZk5wICGSUtw8CiJ8P7fBpTmLS5IzC3OTIdInWJUl
  BLnzdsJlBAASWSU5sG1waLoEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXkWQ7TyZeSVw01
  8BLWYCWdy4CGRxSSJCSqqBKeTevKeuj7au3LKJ/8mBKUGTbW9F+cmu5o30sHq2KIJft2pr1Tl
  TqzIP9+Z3YSKO6iLL1y5+cyt8zv/WAwwxsh6zXn1axKtzwGlyoGHV30SWisc7pfK2Tn/U8HH3
  ggmB9hkcEQx/E2dIqaTfM0pc/MRikf3GYpEDHNuZ3LbsXRbJ+mWGpPahmh1/13hv+fFNsCKd0
  6x/B5fuvxtNMz9fm/qXt/5Yf82sNzw9bFv33Z6mOZHzQGD3/4oKabv08oOJ6zlZeC288w1ePl
  7UxvBfUPexLv93dvMrW/zuS+xY/GXzytVP4hu5fsTezzKz8w74uXeVyqXYlfJFSwVT/y3/Lcj
  asHRt+IoXfBFFOaohJ5VYijMSDbWYi4oTAUnP3kAdAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-291.messagelabs.com!1621474038!378030!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18896 invoked from network); 20 May 2021 01:27:18 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-4.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 May 2021 01:27:18 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14K1RISj012067
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 02:27:18 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 02:27:16 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-xlsxwriter: upgrade 1.4.0 -> 1.4.3
Date: Thu, 20 May 2021 09:27:10 +0800
Message-ID: <1621474030-11233-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...xlsxwriter_1.4.0.bb => python3-xlsxwriter_1.4.3.bb} | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.4.0.bb => python3-xlsxwriter_1.4.3.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.0.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.3.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.3.bb
index b5e15f14c9..e6b196956e 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.3.bb
@@ -8,6 +8,14 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "XlsxWriter"
 
-SRC_URI[sha256sum] = "82be5a58c09bdc2ff8afc25acc815c465275239ddfc56d6e7b2a7e6c5d2e213b"
+RDEPENDS_${PN} += " \
+	python3-crypt \
+	python3-datetime \
+	python3-compression \
+	python3-numbers \
+	python3-io \
+"
+
+SRC_URI[sha256sum] = "641db6e7b4f4982fd407a3f372f45b878766098250d26963e95e50121168cbe2"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

