Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE8CC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 02:27:03 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.5142.1647570421603586738
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 19:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FzXUQVcy;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647570419; i=@fujitsu.com;
	bh=vtv13OXxEs5iV4/fbX2I3IWkHHkkYNExk1/u9vbrKDs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FzXUQVcyZRUIEBz0AOAA/9hpMYKYZoSsN6MaoWZcAAjpAwSZ4+hJTWrK7O3gdGPhv
	 kOk5jjs3FMI1L6OSf/1toXFoxnVVi3LFUzoZJBuwBCT7VMiYvJj8jPi2ddAA/x87A1
	 GEJwg+XeEBqo5rHaPGbsNgqPjAksaxhTeFDuGqm3yIm1XzajMb/Gf2mwdrJeNBDY0V
	 eoWgblKHNRFF0xvNp7vCKiXrUYswpo0dhJjuig13jGre+agD+sAzTrq9JGluVHYQO3
	 sAWNPAUSsBGruG6bVnYgFLBOKllHf+6fzaJ4VSmEHAZhgJmOozvK/Paih0B0TmLtZX
	 itsGJlUUcYOfA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8MxRffTW+M
  kgxW9BhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bZjzEFxzkrJm+fy9bA+I6ji5GLQ0hgJpPE
  02+/WCGcPYwSE9avY+pi5ORgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8edhBbWCBQ4n/LI
  7B6FgFViWUHn7KB2LwCjhLTji0AsyUEFCSmPHwP1ssp4CRx/O1lsHohoJr7s18zQdQLSpyc+Y
  QFYr6ExMEXL5ghehUlZl9uZoGwKyRmzWpjmsDIPwtJyywkLQsYmVYx2iUVZaZnlOQmZuboGho
  Y6BoamuqaAykzM73EKt1EvdRS3eTUvJKiRKC0XmJ5sV5qcbFecWVuck6KXl5qySZGYGimFLst
  28G4r++n3iFGSQ4mJVHevPvGSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeLNeA+UEi1LTUyvSM
  nOAcQKTluDgURLhvXUNKM1bXJCYW5yZDpE6xagoJc5rA4wuIQGQREZpHlwbLDYvMcpKCfMyMj
  AwCPEUpBblZpagyr9iFOdgVBLmXfIKaApPZl4J3PRXQIuZgBY3ChiBLC5JREhJNTAJT4uvfqR
  yVHGR6aN0v8eHv19QvCi1mk1vZ9u27z8qrwmt1kw+nH7+w8f1RvrXgv+la5pFq3DvU01QsxGu
  1fSV1In8d/esVkiSwZYQg8VecSZZitz6fOLHN+x7dHTv/96par/9FVpYnpTdFul8Mn0e59lSc
  b7LsXY1Bbd1RCf/mxO+lXtexuLLrlw3Zs0XDF2wsj9+sluMe6Adw42X7+4orK7PSPyxyOi2n4
  zFrDnrDoXt0dx28UTaB43mvPc3/yZckZpiZsG4dtORI7llU56e8Dh/7Ke21dn3fGzxPnG7N6/
  /FrXbQvaDpn/oD5evitdvXfk7+8zs9QfO71x5RvcrvwaDR/GRNxx69W+/hp5QV2Ipzkg01GIu
  Kk4EAPxaYX9IAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-532.messagelabs.com!1647570418!10558!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12276 invoked from network); 18 Mar 2022 02:26:58 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-14.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Mar 2022 02:26:58 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22I2QrFx032753
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Mar 2022 02:26:58 GMT
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 18 Mar 2022 02:26:53 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-jsonrpcserver: upgrade 5.0.6 ->
 5.0.7
Date: Fri, 18 Mar 2022 10:26:41 +0800
Message-ID: <1647570401-7286-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647570401-7286-1-git-send-email-wangmy@fujitsu.com>
References: <1647570401-7286-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Mar 2022 02:27:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96055

Changelog:
=========
Upgrade to jsonschema 4.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-jsonrpcserver_5.0.6.bb => python3-jsonrpcserver_5.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsonrpcserver_5.0.6.bb => python3-jsonrpcserver_5.0.7.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.6.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.7.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.6.bb
rename to meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.7.bb
index cdd93516ce..537fd33136 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bcb/jsonrpcserver"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=61b63ea9d36f6fb63ddaaaac8265304f"
 
-SRC_URI[sha256sum] = "0fdd69c15e67004fb064d2254469cf82d02b7bc8a7bf7760055caa9d62d92f7c"
+SRC_URI[sha256sum] = "b15d3fd043ad0c40b2ff17f7df2ddaec2e880bb923b40d133939a107c97fde5c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


