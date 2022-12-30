Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3FFC4708D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:40:39 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.3825.1672803631434460873
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:40:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sxY6/J9g;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803629; i=@fujitsu.com;
	bh=LwT581u05TYZRkBjq/HQkL3qcaGR7Th3cvzGgAbk9Kc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=sxY6/J9gWWM4PwlONnK9RlgmIg7mKmAd6YiUXa+hH4wgPb6OCLAmyRyb278tT3RIa
	 r0y1GV2Ql46MdaufijEaslKmw5XJwHDVXdsNqEm0/PsJdbBavBIjxU++tWM7+iKAkx
	 6wsREzqPFwlgLj8txq3MVFXhIUpnJE2QU70XuyxuFwYSq/LaurZZFjWcqPY2EXu5mK
	 a0Bkc+n0E881k26L0likS8gfl433MKpeOedSgXduZHBaP9faLyeJAOb7/zmrWEAmfV
	 nwNuBz+bR8ZHlZG9D0NAqIO3AP7r8ztL0BTHLuHdbr4cTV7GzBLpHCKwaxtX9kHK+J
	 u7JGOgtlTb5Dg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORpKvzdUu
  ywZZWc4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePe/8esBS95K/7NWMfSwLiXp4uRi0NI4CGj
  ROuSZ6wQzmUmiTf9b5ggnN2MEkcefQFyODnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCT2HR4IwuIzSKgKrHu2wywOK+Ak8TnxVfA4hICChJTHr4H6+UUcJb49nonWFwIqObP0a
  fMEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZeboeZUSMya1cYEYatJXD23iXkCo+AsJO2zkLQvYGR
  axWhWnFpUllqka2ipl1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KX
  l1qyiREYvinFiut2ME5f9kfvEKMkB5OSKG/J5y3JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR41
  T8B5QSLUtNTK9Iyc4CxBJOW4OBREuHNAmnlLS5IzC3OTIdInWLU5bi7cO9eZiGWvPy8VClxXt
  cvQEUCIEUZpXlwI2BxfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO9qkFU8mXklcJteAR3
  BBHRE0pqNIEeUJCKkpBqYOBKPT277v//9R142sZ0851jDtVMedLN6vxL6+ZpR96vnYuWlqgs/
  x6ZxljTlnvx40uxqc0hZ58EbRx/eaZ7uHtBw/T+blJYBi796x5u/h9Z5pujdlU9Z8Vkzlk+7Q
  ct4/rPOZW9KFUs7Tar8Vm74Wlse/GRN6sddCg71H+fZ/n53rSTXVWdJvUNxI1vIrZJ3BRkrfF
  r4ux7fcr9rmf7t89XsCydk/d8vzNReK7et3HfGe4MjLC/knwcqehX7Fv9YP3W2T1Lkiq6YRnO
  Ptz81Z85O+mpwSvB7WiOn5uvYmQ9W8JmnPHJpdJ36eMpXjvx/H5eGBr79JX5HIJ/xQdlxkZ8p
  64uOfZ17nzfZprJPiaU4I9FQi7moOBEAvz6YQWYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-565.messagelabs.com!1672803628!384019!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12977 invoked from network); 4 Jan 2023 03:40:28 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:40:28 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9C7151B0
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:40:28 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 90FDA7B
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:40:28 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:40:26 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xlsxwriter: upgrade 3.0.3 -> 3.0.5
Date: Fri, 30 Dec 2022 12:56:50 +0800
Message-ID: <1672376212-25291-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672376212-25291-1-git-send-email-wangmy@fujitsu.com>
References: <1672376212-25291-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100373

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Added 'OverlappingRange' exception which is raised during Worksheet
  :func:'add_table()' or :func:'merge_range()' if the range overlaps an existing
  worksheet table or merge range. This is a file corruption error in Excel. See
  :ref:'exceptions'.

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-xlsxwriter_3.0.3.bb => python3-xlsxwriter_3.0.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.0.3.bb => python3-xlsxwriter_3.0.5.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.3.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.5.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.3.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.5.bb
index 0f8dd35e0f..e64463edca 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python 2 and 3 compatibility library"
 HOMEPAGE = "https://xlsxwriter.readthedocs.io"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b9a26d1a52d2c66df334bbdad23896a"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=12d9fac1f0049be71ab5aa4a78da02b0"
 
 inherit pypi setuptools3
 
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "e89f4a1d2fa2c9ea15cde77de95cd3fd8b0345d0efb3964623f395c8c4988b7f"
+SRC_URI[sha256sum] = "fe2b1e2dec38ef8952e9a41a0290861a052e6771a9f43f5e3d56dc63b7112348"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


