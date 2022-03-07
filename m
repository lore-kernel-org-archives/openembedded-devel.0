Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB84C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:45:18 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.25223.1646653517005215053
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RvofZmFI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646653515; i=@fujitsu.com;
	bh=dlx2mmUQIC6CSLS6SxMQ9g1qlqr4m/ZnKD68O73b0a8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RvofZmFI0BnEzVFV1TsBeKY7lbbQV8UfFYtgAXenRZa13XtMsMlxLBMOr7XqqU66b
	 fZQAO2HKipia6paYhy2sOHY7eTjMxrUxjed8hV1fdIjOYRRtkQEscfUzsc/4rXVCiF
	 NmBEPG3KMZ9cI81KdWG5lcWdgYZHnJlVjWqUkm+mmquodDSR16tS+HLXjg/MZigF7x
	 LosYbll5HjgYZZiCemJCorBEph/FAD+BUQ2GdboyEuLdzvncrmQC6seUqYKCPeM4Q1
	 CHCjuRrbXheNqeAiIkWnSAz5vjQcxIoVJRL1Qv2LwaJQOlJvK+wLyZpCBhv/k3S7xj
	 FF0YykElWT5dA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8MxSdfrg2q
  SQU+TocXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFz/l/WghbOiu6dP1kaGNdxdDFycQgJPGGU
  +DDxBiOEc4FJ4vXSYywQznFGiaf7nrF1MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSwQLnF2/VwwmwUoPu3VGbAaXgEniVvvHzOC2BICChJTHr4Hi3MKOEv0Lb8HNlMIqObp+m
  ZWiHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n7Aka
  mVYx2SUWZ6RkluYmZObqGBga6hoamumYWuoYmxnqJVbqJeqmlusmpeSVFiUBpvcTyYr3U4mK9
  4src5JwUvbzUkk2MwHBOKXbp38F4v++n3iFGSQ4mJVHelAWqSUJ8SfkplRmJxRnxRaU5qcWHG
  GU4OJQkeD+9AcoJFqWmp1akZeYAYwsmLcHBoyTCe/wSUJq3uCAxtzgzHSJ1ilFRSpz32jughA
  BIIqM0D64NFs+XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzbgaZwpOZVwI3/RXQYiagxVW
  2SiCLSxIRUlINTDs4j6rummYfnpF7oboteUN8dKt/sY6RVMZxppJf/QvzOJ2uXd3w9+KvQrGE
  0NVZrqZHhNw02Ta/83bqO3J38+q5Z2bpLHMP7vlSqJUyKWDpynqruvpiBU+/7xt5L/ezfHG8a
  71irlRWyIU9Ebx1t9brnrjyS4l/gVah7c99C8S2a3G0J52x53/CflaYs0qeMd8zumrCOqnorW
  2mae6d1uWvJohM45Z0aa98sebV3JPyeQfabzMGJt1cM2fF0tO5G9f+i/sZvilUqa4xPs7wRLx
  FRt/7J1URLD9bP1zedzHFq/zGpKvB3GltDXYMny5+7DsjLameOJNbtskiuOnwnZuGP2yuf+o9
  HLouRIlRiaU4I9FQi7moOBEAMDZIQ2IDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-528.messagelabs.com!1646653514!22021!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8552 invoked from network); 7 Mar 2022 11:45:14 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 11:45:14 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4FDFA1000FC
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:45:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 42538100344
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:45:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 11:45:00 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cheetah: upgrade 3.2.6.post1 ->
 3.2.6.post2
Date: Mon, 7 Mar 2022 19:44:45 +0800
Message-ID: <1646653487-55825-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646653487-55825-1-git-send-email-wangmy@fujitsu.com>
References: <1646653487-55825-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 11:45:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95835

Changelog:
=========
Build wheels for aarch64 at Travis; publish them at PyPI.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-cheetah_3.2.6.post1.bb => python3-cheetah_3.2.6.post2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cheetah_3.2.6.post1.bb => python3-cheetah_3.2.6.post2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
rename to meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post2.bb
index 448772960..8eed99ee3 100644
--- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
+++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post2.bb
@@ -11,4 +11,4 @@ RDEPENDS:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "58b5d84e5fbff6cf8e117414b3ea49ef51654c02ee887d155113c5b91d761967"
+SRC_URI[sha256sum] = "63157d7a00a273b59676b5be5aa817c75c37efc88478231f1a160f4cfb7f7878"
-- 
2.25.1


