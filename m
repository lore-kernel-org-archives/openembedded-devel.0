Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D238C32771
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:26:52 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.24187.1660703205768331843
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=phu5JIrb;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660703203; i=@fujitsu.com;
	bh=bi5X31AqaqlkZDhLbLEDfI+H6Fq8OlZJw+jYdfPBIoM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=phu5JIrbTBXM2C7z99jQtV3aEcQDl0K4nd/8Y06mnGCVTsDkff/1/Aw3ZINwwYX7w
	 BXmkIkpBh6IbzP8RHtz6mNsTFRgBzCwsK5q5iMBwxIvYjO3zoBEXWFc25O9tXsZzbY
	 D2u7RNwfRG11rBa8UDWnAvmIjLtFkSXZ510KAFr7yNJJdWJI79YDXMMM+khcIAZBLw
	 bhZF0gcw4oPxmAOS8wmMr7x2D0Het4iWkxMSIjGpahmbg2QneSoGqQ3ag5t196xy+C
	 sv20KNNWZ3qOUVaJBpqIWjwXtb36hT7icZHHPx+bgpnNHkztbilQY6eHfVw+NatmMh
	 LJc6IwB+iq8tQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8MxSfdx4J8
  kg80zhCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owN0zeyFDzhrDi9YRpjA2MXZxcjF4eQwBNG
  iRvfPjJBONeZJI6dXMsI4ZxklHh06jmQw8nBJqAu8fjmazBbREBfYunsPcwgNrOAqkT3xTXsI
  LawgJ9Ey8IjYHEWoHjD5p2sIDavgLvEi2NNYHEJAQWJKQ/fM0PEBSVOznzCAjFHQuLgixdQNU
  oSJ1aAXARiV0i8PnwJKq4mcfXcJuYJjPyzkLTPQtK+gJFpFaN1UlFmekZJbmJmjq6hgYGuoaG
  prrGprqGFiV5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFlbnJOil5easkmRmBgphQr79jB2Lbq
  p94hRkkOJiVR3n6mP0lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHjv+QPlBItS01Mr0jJzgFECk
  5bg4FES4ZUNAErzFhck5hZnpkOkTjHqcsz82naAWYglLz8vVUqc960PUJEASFFGaR7cCFjEXm
  KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzLvPG2gKT2ZeCdymV0BHMAEdcezib5AjShIRUlI
  NTCG6HmHvLZflflq0Iid4heOshQqcTMLlM5rzwtkdbN+1G794YrDZ8PkRLnHxqA9qujHZa/UX
  llqvvGrx7fUJodCVLMUZr5yfbXLzXzlruqCs4JpagU1/tF8fEOeYlb9rpardklOl53vWSVQtk
  p/zyrBxwiEGv99qczP39R9/rPwjRnKBZ8WrD5v+/38s+4xb4+O6KVcfCTDqWykL31ZXXsGxMD
  qzdc307IA7O87qL/8jfCfGVnht5OS2tDaN8tD5aw4aFaysfV3vfLmRX+TORLl1p62L311M2P4
  s3WUX61Nt55NF22IihR4obC91LzbUWnNr+UKOlJcrn7vF60s49/AIlHu5f1p78qJOrpX5FCWg
  FxINtZiLihMBoSevglMDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-548.messagelabs.com!1660703203!23800!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19184 invoked from network); 17 Aug 2022 02:26:43 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:26:43 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0420C1000C1
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:26:43 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id EC0E6100078
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:26:42 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:26:41 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.21.4 -> 4.21.5
Date: Wed, 17 Aug 2022 10:27:56 +0800
Message-ID: <1660703277-15849-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:26:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98270

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-protobuf_4.21.4.bb => python3-protobuf_4.21.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.21.4.bb => python3-protobuf_4.21.5.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.21.4.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.21.5.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.21.4.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.21.5.bb
index 6ebd797987..537683000d 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.21.4.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.21.5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "5783dc0d6edae631145337fabb18503b4f77274f94cdd22a4b26b9fe5029e718"
+SRC_URI[sha256sum] = "eb1106e87e095628e96884a877a51cdb90087106ee693925ec0a300468a9be3a"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


