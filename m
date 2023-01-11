Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFFDC46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:26:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.16684.1673414794568132190
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:26:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vyWPA2mA;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673414792; i=@fujitsu.com;
	bh=eARSjsVqNAYbQfmG3XRiHS3ZJhvuKzKooVFlMujYnl0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vyWPA2mAhJuQUTdH8/gUxHLsc2ipvS27CkinlfZADxy+ybvFRMJDjHYlm9zIdnuF6
	 nspo7tdlQyFtGzkGJBoretsUoPhT4FMkKtU87FZYZtPKZwyv9YSWBVayBg5hGCCQVH
	 yU3fcIbuqFWba/zTr3csWNL+ekMiic2zFhc4iiGDMSdvzjQVf19ANwSy8r2V8zHiC8
	 O+xhRSkyr95c2wAGDJB/hf3Dd0FKf71B+FTzlO6dzy+8C7EG/YLsEcu5gjCMhLFMYH
	 4TzIWRHtzNqRcaFFcmyZSbUy50TfYSbCulXu+do/IeU3e4bvGkuRu6dksOMac/JrTV
	 dKG17cqZATS1Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORqNvusS/
  ZYOUxC4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNAQ3hBK3fF9MN/mRoYF3B1MXJyCAk8YZS4
  +8K6i5ELyL7BJDH/fwMrhLOXUeL68mY2kCo2ASmJG/f/g9kiAvoSS2fvYQaxmQVUJF787mEHs
  YUF4iSOTDgMVMPBwSKgKrF+aixImFfASWJ/wxZWEFtCQEFiysP3zBBxQYmTM5+wQIyRkDj44g
  UzRI2ixOzLzSwQdqVE64dfULaaxNVzm5gnMPLPQtI+C0n7AkamVYzmxalFZalFuoYGeklFmek
  ZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgaGYUpxycQfjk2V/
  9A4xSnIwKYny5knsSxbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwaviCpQTLEpNT61Iy8wBxgVMW
  oKDR0mEt9YRKM1bXJCYW5yZDpE6xagoJc7r7A6UEABJZJTmwbXBYvESo6yUMC8jAwODEE9Bal
  FuZgmq/CtGcQ5GJWFeZmegKTyZeSVw018BLWYCWny4ay/I4pJEhJRUA9PWRf73fp6SYzXlPHN
  YJWPBYwHlhTbLdB0EDk9dLfNeJHG9hGSO5rz/er1WEWpvbva6rlZ3eKb2uurrgVmHjswpKnx1
  0Pq8/vpdnvMX8cg0hlgVHcp8P9f1SJzoX90ZB/a5lrv4Xfr66kuKg2D9JSHbLb5JMlcn+U2ec
  /Ba3BcOkYklDgqS3fsu72bWfW9wvMavy1d5Cm+La0V5dtoRKVsucaUD2v6fflrHlhRcnjXl6v
  R9gvsXSM2Zu7+Tabnf2QsVPU/nn3l+y+TK87Nd9irTLi9/eVlJ6+KRoHOFa5rKL/sKv1kkHM0
  i8a6xMqLi5dlbihM3Ssly3pt84rOYh6HYGUa/3IOX1++tU4guOnlOiaU4I9FQi7moOBEAzayB
  gEADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-745.messagelabs.com!1673414791!501573!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 958 invoked from network); 11 Jan 2023 05:26:31 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2023 05:26:31 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4E461100191
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:26:31 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 41F6F100182
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:26:31 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 11 Jan 2023 05:26:29 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-googleapis-common-protos: upgrade 1.57.0 -> 1.58.0
Date: Wed, 11 Jan 2023 13:26:16 +0800
Message-ID: <1673414780-13856-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100533

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Add google/rpc/context/audit_context.proto (41f1529)
 Add google/rpc/http.proto (41f1529)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tos_1.57.0.bb => python3-googleapis-common-protos_1.58.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.57.0.bb => python3-googleapis-common-protos_1.58.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.57.0.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.58.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.57.0.bb
rename to meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.58.0.bb
index 2a233ad18..27c3b9b22 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.57.0.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.58.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "27a849d6205838fb6cc3c1c21cb9800707a661bb21c6ce7fb13e99eb1f8a0c46"
+SRC_URI[sha256sum] = "c727251ec025947d545184ba17e3578840fc3a24a0516a020479edab660457df"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-grpcio \
-- 
2.25.1


