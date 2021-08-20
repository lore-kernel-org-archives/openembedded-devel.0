Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web11.80184.1629440578586379033
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 23:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WFdt6Jhf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629440576; i=@fujitsu.com;
	bh=qL4n0CB/QwCbtrHXqA4GE362JLwG52qQ7JrO2rYEgwM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WFdt6Jhf04tmJ+H/IcERGnB5/OZVv/kxzWlpQRmXl67ohk3Z4S+p0s89jCk9vYhXI
	 YNRx+Hdf8hcI+GoXflpkp8+pOs3K3KbgORyOXKCC2NYN4ziWmY38gbsi15M2TS5yWy
	 dPbCsHAFpJWwLTP6TIeXqvsX4rI7rDoCdrat29ABkHr2y8wmfaV4c/suV0sHG2S+jK
	 0nbN98yD3kTstAGFHs/B2t6HH5SXMe0JFTZjteyD906oAXDeat9r3+7TrMCzjxU+FQ
	 iAcjUZORD4PJRxw3rFMtSsTNuqx1edtO9RkUPJCXwXX7PhRqyOWrmDuyS75xmAOwo+
	 TIqoXAyNRBrbA==
Received: from [100.113.7.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 94/FE-01664-04A4F116; Fri, 20 Aug 2021 06:22:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYouvgJZ9
  osH8hm8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFt/UXmggXsFYsubWZuYDzL1sXIxSEkMJtJ
  4uilJnYIZw+jxP6djUAOJwebgK7EucdrwWwRAX2JpbP3MIPYwgIuEp/v3WMFsVkEVCU2fjvEA
  mLzCnhIXFjYBBaXEFCQmPLwPTNEXFDi5MwnYDXMAhISB1+8AIpzANUoSsyeLg9RXiHx+vAl5g
  mMPLOQdMxC0rGAkWkVo2VSUWZ6RkluYmaOrqGBga6hobGuOZBlqpdYpZukl1qqm5yaV1KUCJT
  VSywv1iuuzE3OSdHLSy3ZxAgMpJRC9swdjJPffNA7xCjJwaQkyqtqJp8oxJeUn1KZkVicEV9U
  mpNafIhRhoNDSYL3oTtQTrAoNT21Ii0zBxjUMGkJDh4lEd6bHkBp3uKCxNzizHSI1ClGRSlx3
  hUgCQGQREZpHlwbLJIuMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmnQgyhSczrwRu+iugxU
  xAi4VUZUEWlyQipKQamC7XvPFbv0rSe8Hyit3+nTtUi/+vMdjU4rvmyKnbEbtPcU9pX8qy7Yr
  y98Mapb7b3p3KNnQzOWm3UfLKmZOzxWfNYXxf9Fbh85+g7GOB5x+G6bglzPrPwzR5+97pfut2
  Hl1yoO/bvTluEmKVwT8s+Tut5NV2Ze7KXbDl4fvMBi0vsynPpyzYfjJmc8eTi1ua3mpdmjZpf
  hGjtYBGiJbx3oNN4dILjG1MV3GVv/9heWhPI6fq+puKJk1G8pPYzDw9TryueJwwdxZX0X2zTV
  bynxNmKBa/+rPx6dFnKoWLyzR2ik8Oalzio/XYRN7Fe9LEHR2ae1PWCkqtTs1uOBjtxRmbseb
  er43Fcf0zgv9J3ldWYinOSDTUYi4qTgQABo33ex8DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-238.messagelabs.com!1629440575!113010!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25459 invoked from network); 20 Aug 2021 06:22:56 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-5.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Aug 2021 06:22:56 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17K6MtQS004114
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 07:22:55 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 20 Aug 2021 07:22:53 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] sedutil: upgrade 1.15.1 -> 1.15.1.01
Date: Fri, 20 Aug 2021 14:22:50 +0800
Message-ID: <1629440570-34634-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-extended/sedutil/sedutil_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/sedutil/sedutil_git.bb b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
index 1e7a393193..53330c0675 100644
--- a/meta-oe/recipes-extended/sedutil/sedutil_git.bb
+++ b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
@@ -8,8 +8,8 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://Common/LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 
 BASEPV = "1.15.1"
-PV = "${BASEPV}+git${SRCPV}"
-SRCREV = "358cc758948be788284d5faba46ccf4cc1813796"
+PV = "1.15.1.01"
+SRCREV = "565670749ef6947a905c451477a3a9a15e7e0ba5"
 SRC_URI = "git://github.com/Drive-Trust-Alliance/sedutil.git \
 	file://0001-Fix-build-on-big-endian-architectures.patch \
         file://0001-DtaAnnotatedDump-Add-typedef-name-to-the-union.patch \
-- 
2.25.1

