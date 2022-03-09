Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF017C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 10:45:28 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.4129.1646822727479344749
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 02:45:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=j5hNOa/n;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646822725; i=@fujitsu.com;
	bh=1YKDmzdMNLxkj+SIi1EJ9mqPddnhSNYAEgmM/wNSiOA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=j5hNOa/npmJAGVL1aj/pDMAPmK0FvxwKLT4y68MlWqu9QGOfYkYkp2icHM5W4fk25
	 jS1kg7X4gIhj87angoQZhvBy2G2o0b4S6OnXVKUp4kLxPokhwsgLQkiJ259Zn/dDQJ
	 YCFZaVT4q1lgRtP48CPd0OQ9tbA21I5dK9FBPldPvLx/6+YUOdnIqo84chdNPRbgFz
	 KAWm7cSJnQPGv2+VOiQ4Fz6izPZzcn+qAgjl+SFxJDk+Bt2wIB3E6pqoONxQRxwRyQ
	 JyOx9RbcVR4/lo8unpiE9ZtDA5jdBwGWAQVkcP1Zyfd2qDfEnn2bPzYqC+3Wtpey4k
	 5DFIAGOdBPt7g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8ORqOvaqpF
  kcPuQoMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrGu5SFbwULhisbGHpYGxvsCXYxcHEICTxgl
  DjzaxAThXGCSWPHyLzOEc5xRYurdtyxdjJwcbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdw
  w5iCwsESMxpngtWwwIUv/JnEZjNK+AkcWvSDLAaCQEFiSkP34P1cgo4S0z68Y8NxBYCqvlx/h
  wzRL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKka7pKLM9IyS3MTMHF1DAwNdQ0NTXTMzXUNTU73EKt1EvdRS3eTUvJKiRKC0XmJ5sV5qcbFe
  cWVuck6KXl5qySZGYDinFDvN3sG4o++n3iFGSQ4mJVFemWCNJCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvJ1NQDnBotT01Iq0zBxgbMGkJTh4lER4P9cApXmLCxJzizPTIVKnGBWlxHnfNAMlBE
  ASGaV5cG2weL7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZiXrwVoCk9mXgnc9FdAi5mAFts
  ZqYEsLklESEk1MO1WNzzi5PNKV2zmotfK8u9/nm/vf2fKG+9nu4533/eKrNL4t1+YVi3bsLC3
  jI2hMVBJNTtoV2qjac6N90xiXOr1ycvtfG7umakdt19z6ZrXR7NluC3j+Vbc+y7J+ig6a7vnG
  75mhgiW6uTLWhaXz4ae9Yu8bq26KdPoLbdJxEKzj57OHC8ecbJ8l7sZpb5pn4OFvaIbRxz7HP
  PFOf75hqvUDyx7uOmVswuj7olkabs/t7dlObwtc9Sf1ckpu95yrfx2ri0mH8+raq2K0DxRYbX
  PqLq9KzV+bt7TvSIdWockmc5dDGLxKX535mmIZoIo583FehYyB7YFnV5f+veToNnh+Dhlfbab
  S1vcEhcqsRRnJBpqMRcVJwIADzOux2IDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-528.messagelabs.com!1646822725!6512!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5475 invoked from network); 9 Mar 2022 10:45:25 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Mar 2022 10:45:25 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BEFD7100194
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  9 Mar 2022 10:45:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 977731001A2
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  9 Mar 2022 10:45:24 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 9 Mar 2022 10:45:18 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.152 ->
 2.4.155.1
Date: Wed, 9 Mar 2022 18:45:03 +0800
Message-ID: <1646822705-61973-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646822705-61973-1-git-send-email-wangmy@fujitsu.com>
References: <1646822705-61973-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 10:45:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95902

Changelog:
=========
Changes
-------
- Bump required python version for doc.
- Remove python 3.6 from metadata.
- Re-bump changelog.
- Bump version.
- Bump changelog.
- Bump misp-objects.
- Bump deps.
- Bump new minimal python version to 3.7.
- Perl dependencies not longer required.
- Simplify submodules checkout.
- Use https for link to documentation.
- Bump deps.
- [misp-objects] updated to the latest version.
- [FIPS] no clean way to support OpenSSL hashlib interface for FIPS.
- [FIPS] falling back on older version of Python not having
  usedforsecurity.
- [FIPS] in some cases, the `usedforsecurity` is not used. So fail if
  the FIPS compliance is required and then the `usedforsecurity` is
  disabled.
- [feeds] FIPS: when MD5 hashes are generated for fast-lookup it's not
  for security.

  hashlib provides an option to tell if the hash is used for security or
  not. By default, it's set to True. For the feed cache generation, it's
  not. Then usedforsecurity=False
- Bump deps.
- Bump deps, objects.

Fix
-----
- Incorrect call when requesting a new API key.
- Libfuzzy-dev is not longer required.
- [mispevent] cannot type.
- Make mypy happy.

New
------
- Get_new_authkey for a user.
- [dep] Use pydeep2 instead of pydeep.

Other
------
- Create add_filetype_object_from_csv.py.
- Add feed option for local tag exclusion #817.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.152.bb => python3-pymisp_2.4.155.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.152.bb => python3-pymisp_2.4.155.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.152.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.155.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.152.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.155.1.bb
index 18f5f9cd90..ef18671a0a 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.152.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.155.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "d991e53f9a9641f454e116e83d2913edf405a53f"
+SRCREV = "03dc22f9598e6caae81b0e40ce27bf3f17799f4e"
 S = "${WORKDIR}/git"
 
 inherit poetry_core
-- 
2.25.1


