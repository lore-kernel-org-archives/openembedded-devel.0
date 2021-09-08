Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.2493.1631156722339022981
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 20:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=V1bM1p81;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631156720; i=@fujitsu.com;
	bh=e1caHTxTKTDA6WvoktVR0xFEPRyZT+zmWgNrC/ioOKs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=V1bM1p81n5xUYe+QcDb13OyZK/EAXSaDjgizPQn5huJUX4la5FZEzJFCgSww83FyY
	 Fs0xelUSBnC3Jerv7K2Ncll77pexc+/q4d+ZoXFx7LwPwMpEOttT3703t9QYnKa7Pm
	 a4SljGMBFPe/4uV6kMV2sZ4lTfa5fyH4oC21y/b59vIKJt7dy77z1tBoIdX1/y8Q2r
	 nKkxY4ENCwAc6B7jqPsuhJhU9pF8tWV8miA4bB2K3JrPfIk32hKH9IDMZd37cyPesy
	 u4yEHxSb5YvuYavJvh5dABVIO4ieLlZMBdATn8ma7bRg+u98xw7dQYG4zLkgrzHthn
	 NX2NjcWrf2BJQ==
Received: from [100.112.195.172] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id D0/B8-08194-0F979316; Thu, 09 Sep 2021 03:05:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeJIrShJLcpLzFFi42Kxs+EI1X1faZl
  o0HXJzOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzbjzMbZgImfF31luDYxbOLoYuTiEBGYxSXQv
  2MsO4exmlPhwdDNzFyMnB5uArsS5x2vZQWwRAX2JpbP3gMWFBTwk5v94xwJiswioSDzefpiti
  5GDgxcovnZ2AEhYQkBBYsrD92DlvAKCEidnPgErZxaQkDj44gUzSLmEgKLE7OnyEOUVEq8PX2
  KewMgzC0nHLCQdCxiZVjGaJxVlpmeU5CZm5ugaGhjoGhoa6RpaGumamOglVukm6qWW6panFpf
  oGuollhfrFVfmJuek6OWllmxiBIZPSsEBnR2MP1990DvEKMnBpCTK2yBsmSjEl5SfUpmRWJwR
  X1Sak1p8iFGGg0NJgvdgBVBOsCg1PbUiLTMHGMowaQkOHiUR3g9lQGne4oLE3OLMdIjUKUZFK
  XHepyB9AiCJjNI8uDZY/FxilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMz7H2QKT2ZeCdz0V0
  CLmYAW+16zAFlckoiQkmpgmhI1gckkj+nVrUKlhVNTgzPFHVh3sCiuPMWtkTrB27yreZ22pfj
  WNTHThOaEO3+L9E+TC+mezVjz7bba7F2dKssYAn64ZRf99tXf4rz9TfqBl50ysRU1caF73tkf
  vq51IaPqmSbD6mLjH9pF+7IeHtsaUHO+/P+uh9oq6+cprGpjW7BjEpPidIW2UC2Ge38v75/1M
  WD7+btvJqz4/uCnelvC6Xvvrmr1vFNsTWabuf5R/JRILUOFRfncFy8dcFS5nLnPfcEyzY87eG
  8uevfgf92XyTv9UpLs696GR0+3u7FJolxT8NCKY7Fi9zkmCRo7HjgrcajoyKx8i+e2zt2LUm4
  k8NqtnNRQmPJJyX2tqxJLcUaioRZzUXEiADk2QcMaAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-265.messagelabs.com!1631156719!211179!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6118 invoked from network); 9 Sep 2021 03:05:19 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-10.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Sep 2021 03:05:19 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18935ErL027813
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Sep 2021 04:05:19 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 9 Sep 2021 04:05:13 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-filesystems] [PATCH] fuse3: upgrade 3.10.4 -> 3.10.5
Date: Wed, 8 Sep 2021 08:15:35 +0800
Message-ID: <1631060135-96119-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Various improvements to make unit tests more robust.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../recipes-support/fuse/{fuse3_3.10.4.bb => fuse3_3.10.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.10.4.bb => fuse3_3.10.5.bb} (95%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.10.4.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb
similarity index 95%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.10.4.bb
rename to meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb
index 21f5c385a3..6af9fc9c09 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.10.4.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.xz \
 "
-SRC_URI[sha256sum] = "9365b74fd8471caecdb3cc5adf25a821f70a931317ee9103d15bd39089e3590d"
+SRC_URI[sha256sum] = "b2e283485d47404ac896dd0bb7f7ba81e1470838e677e45f659804c3a3b69666"
 
 S = "${WORKDIR}/fuse-${PV}"
 
-- 
2.25.1

