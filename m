Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E8EC433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 03:36:26 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.5235.1637033786046003036
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 19:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LBzESNre;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637033778; i=@fujitsu.com;
	bh=596wcg3koy7wQ727Xjn2cnfoWjaDOu/3NkGTXJzkVpY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LBzESNrei9Vvwzv/snU75ftp3EF2PyNJBqLKfs/kf9AYEYakfyzxCUbeOVsbsL3NE
	 cUbJ4FR3EpvfLHJaFcRL3aUTTptY5fRehZshIDgqnq+ko2Q1jTiIuFtZg1DBNNWOWG
	 5wF8vDHUicRkGzfmpPoxheJcF7ENjQoipVr65oYhPx7p+SFnfu/kje3Vm1t0Iqzx76
	 W6D+R2gCZ14WKCri+pdCyOPWoqVcBiw7DPnLF1YRJrENusNfJLB3pxBjyBVncHFWzU
	 Z6+0/hKLqRka5MzWNWUFGhHWSNe7DFajsLr28JcmXDUVhS4kqi2bV6hSCq2m1UZjdz
	 XFSQG08y1H3EQ==
Received: from [100.113.7.62] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id C3/BF-14220-13723916;
 Tue, 16 Nov 2021 03:36:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MxVddQfXK
  iQecKJYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePqp162ggMcFYu/LWNuYHzF3sXIxSEkMJNJ
  4t7Nu0wQzglGiStP3gE5nBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DDmILC3hI/F3Rw
  QhiswioSqze0c4GYvMKOEm8n7AZbI6EgILElIfvwXo5BZwlNi9cABYXAqq5uWwmI0S9oMTJmU
  9YIOZLSBx88YIZoldRYvblZhYIu0Ji1qw2pgmM/LOQtMxC0rKAkWkVo2VSUWZ6RkluYmaOrqG
  Bga6hobGuia6hsYFeYpVukl5qqW5yal5JUSJQVi+xvFivuDI3OSdFLy+1ZBMjMCRTClmadjD+
  fvVB7xCjJAeTkihv3KJJiUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeB+pTE4UEixKTU+tSMvMA
  cYHTFqCg0dJhFdOESjNW1yQmFucmQ6ROsWoKCXO+1gEKCEAksgozYNrg8XkJUZZKWFeRgYGBi
  GegtSi3MwSVPlXjOIcjErCvPNVgabwZOaVwE1/BbSYCWix/b1+kMUliQgpqQYmg7vPUm6+0Qi
  cdGLt3cxG3csuQdmpd9p//FS8Ycs9+VFy4tl6l/kHeA2OpOfudV2ZGFisGHLkqsOzqjdvMmLD
  j5e9XDT9+N7uVR4fVRc7arWUyB/co6m9TOr9JO+kLItd8Wd3ZXgc57BM3nOtJ6JTbIrj+3urT
  W96+ia9rXzAO69uZdwpD86uvpltSzfxf9iwbL/v28aX5/fEHvumKsk6vcv8ivajPWFrZ9l+Yy
  u75db+s2hG9ayrbc/6UgL4VusLdYaKxAUv3hy8W1DiQsnyJz6eZ1PsZFN2q2mqz2RMnTd/ZQ1
  n9fpDebvD9MXnTY+/bCK93nb588V7yr731b/fm5YVxJ7tIJmgaHDn3qmnSizFGYmGWsxFxYkA
  4WPwB0QDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-248.messagelabs.com!1637033777!952881!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24586 invoked from network); 16 Nov 2021 03:36:17 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-3.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Nov 2021 03:36:17 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1AG3aEi8001311
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 03:36:17 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 16 Nov 2021 03:36:12 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-gast: upgrade 0.5.2 -> 0.5.3
Date: Tue, 16 Nov 2021 11:35:56 +0800
Message-ID: <1637033756-81253-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637033756-81253-1-git-send-email-wangmy@fujitsu.com>
References: <1637033756-81253-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 03:36:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93965

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gast_0.5.2.bb => python3-gast_0.5.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gast_0.5.2.bb => python3-gast_0.5.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-gast_0.5.2.bb b/meta-python/recipes-devtools/python/python3-gast_0.5.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-gast_0.5.2.bb
rename to meta-python/recipes-devtools/python/python3-gast_0.5.3.bb
index d318973a17..7fd49456d2 100644
--- a/meta-python/recipes-devtools/python/python3-gast_0.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gast_0.5.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90"
 
-SRC_URI[sha256sum] = "f81fcefa8b982624a31c9e4ec7761325a88a0eba60d36d1da90e47f8fe3c67f7"
+SRC_URI[sha256sum] = "cfbea25820e653af9c7d1807f659ce0a0a9c64f2439421a7bba4f0983f532dea"
 
 inherit pypi setuptools3
 
-- 
2.25.1


