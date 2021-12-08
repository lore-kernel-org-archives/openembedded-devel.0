Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B137C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 03:31:42 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.7638.1638934300849967649
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 19:31:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OMFMhGwu;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638934298; i=@fujitsu.com;
	bh=p5pE3151HedHvpAEZhTiywBu1NazElH4cagnTYvETxA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OMFMhGwu3rnvkOTyuA/A4HWPoCUhWjJiMHPBrezRNK/U83Lz+04P0hdNn75JhssML
	 ESZm0r2nP2hueGCFOakLpSdgMk1opPKxs3qPHYxvuh6LdUdguNOgpjo8/c0Nv4r6PO
	 afRS0Be72puJiUxJ+lFozWHf0MnNY6BxEhpKqUnokTzdiO4RTZ33+4asCIE1IIH593
	 xMtyIpHwpUQzGPuB0bh5nG9/Ks3PIlCnOCq2sdkQrbM5JGTWJh9eUYkuvDp6MXA1Qu
	 XPuo/G+Itg0ISGn1PbitmO9zuOnwhaVELeGIdxk/i8AyWqoFWyaoV1v9Rfn6I+kPc7
	 p8MkSACk8WtZw==
Received: from [100.115.67.185] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 B8/01-11258-A1720B16; Wed, 08 Dec 2021 03:31:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDIsWRWlGSWpSXmKPExsViZ8MRoiupviH
  RYM1ZQ4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPL3k/sBQe5Kj5d72NuYLzD2cXIxSEkMINJ
  YvapWYwQzglGieXv1wI5nBxsAuoSj2++BrNFBPQlls7ewwxiMwuoSnRfXMMOYgsLBEhc2HYQL
  M4ioCLR13iaqYuRg4NXwF1i4hMWkLCEgILElIfvwUp4BQQlTs6EiDMLSEgcfPGCGaJGSeLEio
  9MEHaFxOvDl5gnMPLOQtIyC0nLAkamVYy2SUWZ6RkluYmZObqGBga6hoamumYWukYmeolVuol
  6qaW6yal5JUWJQFm9xPJivdTiYr3iytzknBS9vNSSTYzAQEspdpHYwXiz76feIUZJDiYlUd7L
  ihsShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwpqsB5QSLUtNTK9Iyc4BBD5OW4OBREuFNAknzF
  hck5hZnpkOkTjEqSonzvlYFSgiAJDJK8+DaYJF2iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5
  Iwrw7IeJ7MvBK46a+AFjMBLXZuWQ+yuCQRISXVwLTr26ynQXlLCmdfMDYXtxaxP3/s0qFk7yC
  jI5VXN6iEuLbq3tZWl/kqFxlQ1XBi9wotb95NKtqcLRF2vDKVZz3+5HToTPx6/MuG6RMfuZ9S
  PanZOn+NhXS+0KtMIWv31miGicoBZk3eJg+ManzVT/vyK95ffr3sauHP9tmntuxr1NOMZvAM6
  mFdwHT6fOqXC1mXkhw/+3CkKbFsTQyZ6GcZO3ue5rK2CaG+e5dq6KbZO7Tv//rCtrIj/utvw8
  ZaDQax2RvqAxh1d2Qo9RY5HyraqFJwNnMR65RSHv1EHQXJFfb7lKft/fi+6V7d92Uu6akfJyw
  r3sVi+6MlpqBuj3uIA8NE38cOt9+2ZlxTYinOSDTUYi4qTgQA5ex3WS8DAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-528.messagelabs.com!1638934297!31895!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9369 invoked from network); 8 Dec 2021 03:31:37 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-16.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Dec 2021 03:31:37 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1B83VYFm032660
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Dec 2021 03:31:37 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 8 Dec 2021 03:31:33 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-configparser: upgrade 5.1.0 ->
 5.2.0
Date: Wed, 8 Dec 2021 11:31:01 +0800
Message-ID: <1638934261-32278-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Dec 2021 03:31:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94246

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
Project now uses PEP 420 (native) namespace package for backports package.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...hon3-configparser_5.1.0.bb => python3-configparser_5.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-configparser_5.1.0.bb => python3-configparser_5.2.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-configparser_5.1.0.bb b/meta-python/recipes-devtools/python/python3-configparser_5.2.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-configparser_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-configparser_5.2.0.bb
index de9fe2be17..e629331330 100644
--- a/meta-python/recipes-devtools/python/python3-configparser_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-configparser_5.2.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa"
 
-SRC_URI[sha256sum] = "202b9679a809b703720afa2eacaad4c6c2d63196070e5d9edc953c0489dfd536"
+SRC_URI[sha256sum] = "1b35798fdf1713f1c3139016cfcbc461f09edbf099d1fb658d4b7479fcaa3daa"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-toml-native"
 inherit pypi setuptools3
-- 
2.25.1


