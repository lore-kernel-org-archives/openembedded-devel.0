Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E77C32771
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 01:32:36 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.1265.1663291945475973517
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 18:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GxwD6nTW;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663291943; i=@fujitsu.com;
	bh=sOHjsZUKltKPB+rSpcZNa/9B4KIVl6jIiJtcKahKsp8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GxwD6nTWnnj/PAUBs52qszeGG0SbWM+wck+5ofoL26s8vg1hITwQK0TQrzgQX88QH
	 VhRcegZz2/NSwZ9dC+GBRtKnFabsU1FhVc06ghJZrVYXQ9SshEXk4XCQ+plSuVx0Zq
	 kMdcc7wv3pdbc4ph4+jjCjhZG77kL+lppeizZ1gIVqj6G+2lOV6amrRWoWoHoHV5yN
	 9o+ZC0X0fLWLUwFyQUxkEB9OqDpqIQp1z9f6ffgau+3guJmsDTQOVCyKoCEyY5rgPe
	 pb5D19U1aKoDG4Sy9uwTnfj2p5z48Gkv4vLORXMQluXsCx/jQWgOcC/lNY4YtuHTOp
	 ZhIlq8DP/WB9Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8ORpKt2STn
  ZYPImZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNVcw97QStHxflDEQ2M3exdjFwcQgIPGSWu
  rvnICuFcYZK40baBDcLZyyjR8f8YUIaTg01AQ2L31MvMILaIgL7E0tl7wGxmATWJoy9/gtnCA
  o4Sk+++ArNZBFQlvl16CWbzCrhKnJnQywRiSwgoSEx5+B4qLihxcuYTFog5EhIHX7xghqhRkn
  h7aQ8jhF0h0Tj9EFSvmsTVc5uYJzDyz0LSPgtJ+wJGplWMNklFmekZJbmJmTm6hgYGuoaGprq
  WlkDKUi+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwMFOKk8t3MG7f90vv
  EKMkB5OSKO9jc+VkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8F08D5QSLUtNTK9Iyc4BRApOW4
  OBREuE1PQKU5i0uSMwtzkyHSJ1iVJQS51W6AJQQAElklObBtcEi8xKjrJQwLyMDA4MQT0FqUW
  5mCar8K0ZxDkYlYV6zc0BTeDLzSuCmvwJazAS0mNcAbHFJIkJKqoFp/pOA/L0laVOLNjrpTuB
  y2VPsO+t73txXohmH5vcwl//YKvScRZznkJHjbDVX/68OSwRubXsg3LHviWFNd2bszRuy1/ab
  sDI5sJS8yWBt3Vqh+j9yghbf9zmXj03SzhJzf5RhPXlr7iqZhHL31ps+X3j0/O/er2U8EJ639
  zIzy4ZX78x1ql9+6/+7+92F2/qrn56T07PTjuae8vTEYt81hyon3JKQeL5ILuOM/sabT9aZHz
  l0+vzjN9M/rPt36o281e2mkJPHp/+omKOhvTA1aOc+q5M2e359vv1mp4L+uoh1LRWSCg+PMGk
  XZy5TVRL1j6r3PzjT5e7Ke4VRL8/seBXeqlzeey6Jh031YnZWmBJLcUaioRZzUXEiACC3lc9H
  AwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-12.tower-745.messagelabs.com!1663291942!52305!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7768 invoked from network); 16 Sep 2022 01:32:22 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Sep 2022 01:32:22 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 074011B1
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 02:32:22 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id F05C01AF
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 02:32:21 +0100 (BST)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 16 Sep 2022 02:32:20 +0100
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-gnome][PATCH] gexiv2: Fix buildpaths warning.
Date: Fri, 16 Sep 2022 09:32:11 +0800
Message-ID: <1663291931-26311-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Sep 2022 01:32:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98827

WARNING: gexiv2-0.14.0-r0 do_package_qa: QA Issue: File /usr/src/debug/gexiv2/0.14.0-r0/gexiv2/gexiv2-enums.cpp in package lib32-gexiv2-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.0.bb b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.0.bb
index afec302..fed29da 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.0.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.0.bb
@@ -19,3 +19,10 @@ EXTRA_OEMESON = " \
 PACKAGES =+ "${PN}-python3"
 FILES:${PN}-python3 = "${PYTHON_SITEPACKAGES_DIR}"
 RDEPENDS:${PN}-python3 = "${PN}"
+
+PACKAGE_PREPROCESS_FUNCS += "src_package_preprocess"
+src_package_preprocess () {
+        # Trim build paths from comments in generated sources to ensure reproducibility
+        sed -i -e "s,${B}/../${BPN}-${PV}/${BPN}/,,g" \
+            ${B}/gexiv2/gexiv2-enums.cpp
+}
-- 
1.8.3.1


