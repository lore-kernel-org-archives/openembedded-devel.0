Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BA0ECAAD1
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 03:02:13 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.32828.1661482923505400237
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 20:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Q06ltkzF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661482921; i=@fujitsu.com;
	bh=Y+8vI0PkWrqnvHTRk26hT7qub5A8NcblkEN46QbogPU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Q06ltkzFpeS7HXhR7/akpa3PUN4MIJI9wqoni/kXYsabc3Cb0XVeuixpxXUqZZK3F
	 v853tP0InpgrSGsR4/USEIwIN0jvFuSk1a9yiUkVtSqQXRzZY8+o5MOmIq1EWZJFSF
	 0jSuj6yCIVNdfz5y5koMsbIESrSv/inIvcsGdDCW62dA9eWmeLLxBFKVrIn5fAyjmd
	 pj2s4rnfU8Pur6fzIt2EVb0pI2v+LZHa61eDI4vGxidGceNq+tMpouPdZWR5WreIyY
	 pNGJ02axhuk6ulZumhBkI4hciYgtF3jzXQCJu9p42+bIs21oVU1HNdY/3f3aGRwyIl
	 +ihKSe4kE1cwg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8OxWXeFOUe
  ywa1OS4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP2p5OsBWe5K6b9fcXUwHiEq4uRk0NI4AGj
  xPlfxl2MXED2FSaJtfOus0E4exkl2uZ/YgapYhNQk5h+6wYriC0ioC+xdPYesDizgIrEi9897
  CC2sECkxKwzpxlBbBYBVYltbx+C1fMKOElMmbUErEZCQEFiysP3YL2cAs4SU+9vZoK4wkli6s
  3bLBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7EqJPbP6mSBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYrZKKMtMzSnITM3N0DQ0MdA0NTXUNdY0MjPUSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yor
  c5NzUvTyUks2MQKDOKWY8fQOxk19P/UOMUpyMCmJ8uo/Y08W4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMGrZsKRLCRYlJqeWpGWmQOMKJi0BAePkgivtChQmre4IDG3ODMdInWKUZdj5te2A8xCLH
  n5ealS4ryeZkBFAiBFGaV5cCNg0X2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvFMgUnsy
  8ErhNr4COYAI6QmoDO8gRJYkIKakGpvAKJUGvGa3SMn4LZs2SffNKUq/lXLHlDKmKTu7rf54d
  06kzdrfN1gvT+NV4b/PGiTKNi4teJLhwfFH7uf+qyydDX2ff1nn+OpPCN8+6/yX7+16tcBeda
  yJnbu6pPinjvtTtycxvy3ufn8/1k1tTIfOhKPOAW8SnQ8VJtxiF79930pGx2d0t8On0UeF7by
  +LXWb3mrKeOfrJWfXS1Qo3Nx35o+JzJHhCbMopm0ALj+xnzPzs93q09ueZiG6JLegymP3YvLD
  T8OC+7xmfQ9vDTYVNrH7dNzUW5TO8u2Z6vcrPnffv2M1Z9n+TeTmLeLnJp3BmPYuXytz3Jz9X
  lb93M3PmduY325Yc6fH68bUtXomlOCPRUIu5qDgRAIgGgaNpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-591.messagelabs.com!1661482920!166987!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8330 invoked from network); 26 Aug 2022 03:02:00 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-16.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Aug 2022 03:02:00 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 87EA77B
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 04:02:00 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7B80E73
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 04:02:00 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 26 Aug 2022 04:01:58 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [oe] [meta-python] [PATCH] python3-jsonrpcserver: upgrade
 5.0.7 -> 5.0.8
Date: Fri, 26 Aug 2022 11:01:47 +0800
Message-ID: <1661482908-10720-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661482908-10720-1-git-send-email-wangmy@fujitsu.com>
References: <1661482908-10720-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 03:02:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98461

Add dependence python3-typing-extensions

Changelog:
==========
Use importlib.resources instead of pkg_resources.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...3-jsonrpcserver_5.0.7.bb => python3-jsonrpcserver_5.0.8.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsonrpcserver_5.0.7.bb => python3-jsonrpcserver_5.0.8.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.7.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.8.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.7.bb
rename to meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.8.bb
index 12e9003798..88b1d6856e 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/explodinglabs/jsonrpcserver"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=61b63ea9d36f6fb63ddaaaac8265304f"
 
-SRC_URI[sha256sum] = "b15d3fd043ad0c40b2ff17f7df2ddaec2e880bb923b40d133939a107c97fde5c"
+SRC_URI[sha256sum] = "5150071e4abc9a93f086aa0fd0004dfe0410de66adfaaf513613baa2c2fc00d7"
 
 inherit pypi setuptools3
 
@@ -17,6 +17,7 @@ RDEPENDS:${PN} += "\
     python3-netclient \
     python3-pkgutil \
     python3-oslash \
+    python3-typing-extensions \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


