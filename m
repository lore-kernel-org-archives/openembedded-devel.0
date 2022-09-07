Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D9BC38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 11:25:04 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web12.6503.1662549902611414787
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 04:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eqZ4G/aF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662549900; i=@fujitsu.com;
	bh=esayBeoABRm9+K2AVKFgOV2ShcVCqBSUQsOJ4X+6UJA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eqZ4G/aFPCWK0Dh2WOpB/hT0N/CQ3vQ3eFrPRscEyUUQxbxyzRAzKITHweOEGDHuO
	 KeEYLKsB9MLSLJPxwGU14tY0Qi8fhH1ISe12PWeDjqWnUqbKQ9rv5hAVAMQ/79iZQw
	 c2Hl3pMLmYewrQ6oUMiYsrX5py9+cDEFg7CWiWMAdWL1tz+aSqpVTs457REH9iDboQ
	 3bmwCrAPvsqWGgmrdOqNgwRIs2eXMccS/SMktVYAqLVa9rvFP22gc8IobL5f4KIvi3
	 /BwpsmitO2Zry5dnKZMATAtBVtbi35CjxHnuF+uVWshOx50QGEWZegp4Y5ZStwkfPG
	 LZHGbYWQa2g0A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqNtTL5F
  s8OiAksXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjFr/gSmgpVcFTPefWFvYFzD2cXIxSEk8IRR
  4uT1HcwQznUmiUUda1i7GDmBnN2MEnd+OoPYbAJqEtNv3QCLiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCV2D7zNVgNC1B82ZIvTCA2r4CTxPu5/xhBbAkBBYkpD9+D9XIKOEvMb1kBtctJYvvs/V
  D1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7AqJxumHmCBsNYmr5zYxT2AUnIWkfRaS9gWMTKs
  YrZKKMtMzSnITM3N0DQ0MdA0NTXUNdY0MjPUSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yorc5Nz
  UvTyUks2MQKDOKWY8fQOxk19P/UOMUpyMCmJ8sZ5SSQL8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uCVqgHKCRalpqdWpGXmACMKJi3BwaMkwvusFijNW1yQmFucmQ6ROsWoyzHza9sBZiGWvPy8VC
  lx3rMgRQIgRRmleXAjYNF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwL0Md0BSezLwSuE2
  vgI5gAjpia6A4yBEliQgpqQamKZvlyw1+rcx1t3pxV+W53L8bNzff/x60qfvMtPC65+fvsT4o
  kU51VknLE7ZQfvV4x4SLLGWtrPNaAuf+undoY6mJzbRdYSd23TpdZPbo39cs3e5zPL86D7FIP
  jaoWxXM91D1/OMT6bc7leewv5p3U7WfQey6ad6ht7tvfjYLkvILnL5PXW6pS3b7vHk2/mfELt
  3edro5MuxYBGO906Wre7keT/V4pL3qUA/7Q5vd+8QibybKSKnMrGu5lJJ60D5wzeZQsQuTGqb
  aKBXcUwywONdux2vdcftf+bLlT23nPDh13T56a6NtdEjUprN39v2cO+ldYtzmDy3iAm7V64Uv
  rfzU1zTz3KOau89cmv1Xb1ZiKc5INNRiLipOBADVzyCVaQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-585.messagelabs.com!1662549900!1037846!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21553 invoked from network); 7 Sep 2022 11:25:00 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Sep 2022 11:25:00 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2D74210018D
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 12:25:00 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 21232100043
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 12:25:00 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 7 Sep 2022 12:24:58 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.21.1 -> 2.21.2
Date: Wed, 7 Sep 2022 19:24:29 +0800
Message-ID: <1662549869-17948-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662549869-17948-1-git-send-email-wangmy@fujitsu.com>
References: <1662549869-17948-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 11:25:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98688

Changelog:
===========
Fix
------
    Allow v3.imread to read dicom (#868) (22c98c2)
    Revert to asanyarray (#863) (fdaba04)

Other
--------
    Add missing numpy import in example (#866) (d85bfba)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.21.1.bb => python3-imageio_2.21.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.21.1.bb => python3-imageio_2.21.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.21.1.bb b/meta-python/recipes-devtools/python/python3-imageio_2.21.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.21.1.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.21.2.bb
index 5c792a5db8..06af2a15f0 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.21.2.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "5f0278217c1cf99d90ef855dab948f93d9fce0ab7ab388e13a597c706b7ec4e5"
+SRC_URI[sha256sum] = "5702e7b4874bdb2f428b08c7491699b44842129d412cdaa7177ba7ff059deb2c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


