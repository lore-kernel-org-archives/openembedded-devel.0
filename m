Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB06C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 13:24:29 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.10472.1645449868291078443
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 05:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oMl3gu4E;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645449866; i=@fujitsu.com;
	bh=7pZK0R1YQuzgx6ix9LH0tghv2Ww6iqgfw2maLEbgB80=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oMl3gu4Eq2XM91+XF/m+amHsJDLi8UCf5WC4rVAwQy6EPAU3F8K5yApEGqMzSI64K
	 tSxXNXszHw3ZNrfDqk67+X+DtgU6swmFSNqhAVtM289fQSRZeERpI5uIhE4WCxIUf1
	 ypHksnlidsrBpFcQpC8snevdkWqQKlhcZvVcL31ciFt3q27DMyGzseHn/Uhrlkuar5
	 6Q9BrJsMSmrXGxQ2BlG9t2o8XrXMyW+g3XlIfu9usYv0TwnVSY4L+Q0kzzvautBPA3
	 yIVJLxmncCCe8URzfcUV7jR3gXd0p2K71Wj0eO2teXlm6uoTwnpLbovxa8tJ3Q62lR
	 K1wCCEu6kH7FA==
Received: from [100.115.37.210] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id 12/26-29321-A8293126;
 Mon, 21 Feb 2022 13:24:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSbdrknC
  SwYl/EhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bT5CvsBcu4Ks68ncjWwNjM2cXIxSEk8IRR
  YvnSVcwQzgUmiSs7jrNCOCcYJS7PuMXUxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAvcT3KSfZQGwWAVWJyX1zwGxeASeJa1vmg9VLCChITHn4HszmFHCWuNTfAWYLAdVc2r
  CXHaJeUOLkzCcsEPMlJA6+eAHVqygx+3IzC4RdITFrVhsThK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNVUlFmekZJbmJmjq6hgYGuoaGprrG5rqGlXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVu
  ck6KXl5qySZGYBinFKsK72DsWPlT7xCjJAeTkihvbbtwkhBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJXuF+oJxgUWp6akVaZg4wpmDSEhw8SiK85c1Aad7igsTc4sx0iNQpRkUpcV7BiUAJAZBERm
  keXBssji8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuYNBpnCk5lXAjf9FdBiJqDFU7KEQBa
  XJCKkpBqYmD/PsRUOMGh8Pp1LJlNDlYlFclNzwxHfG7dtORYvmS3ZUCTzfeX7om8cnoLHojg1
  TlVmT+VZx7e18Nj7mzan3d8csJ7EMPGpxs2QViu9m5cnuC42Pqb0Ka72edySR79+X+A/bh03O
  aReanYd74XuP5nfYvRNfZynGK/N4WuYWOjl0Mlz56ePwaHkzlx180lOtyQj1rw4P30107zOBp
  1U/Q13rkfs51pkW31g8vR3Mef/iB89uW+2SmWyb9LTVV0uLNNOaTro1Mse/HFGld/MnmnBFPc
  wbi2W6XMPqyml/o7mauGJ0Sy52Xj4Xef0o7bHjFaoH2rvlWNj+9rHxMg3w7ri8VoT/nmXrn+6
  q7BIiaU4I9FQi7moOBEA4NTDMF4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1645449866!19069!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4325 invoked from network); 21 Feb 2022 13:24:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Feb 2022 13:24:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0519710044D
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:26 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id EB6A2100354
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:25 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 21 Feb 2022 13:24:09 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libxmlb: upgrade 0.3.6 -> 0.3.7
Date: Mon, 21 Feb 2022 21:23:55 +0800
Message-ID: <1645449836-23309-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645449836-23309-1-git-send-email-wangmy@fujitsu.com>
References: <1645449836-23309-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 13:24:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95416

Bugfixes:
 - Ensure reproducible results when importing a node
 - Ignore all hidden files when using _WATCH_DIRECTORY
 - Show the value bindings when using XB_SILO_PROFILE_FLAG_XPATH
 - Use the correct lookup method for the python3 script interpreter

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxmlb/{libxmlb_0.3.6.bb => libxmlb_0.3.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libxmlb/{libxmlb_0.3.6.bb => libxmlb_0.3.7.bb} (91%)

diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.6.bb b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.7.bb
similarity index 91%
rename from meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.6.bb
rename to meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.7.bb
index 585c490194..48a7701db7 100644
--- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.6.bb
+++ b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 SRC_URI = "git://github.com/hughsie/libxmlb.git;branch=main;protocol=https \
            file://run-ptest \
            "
-SRCREV = "89276ffa4407a8d684e95675990fa864793a7586"
+SRCREV = "dc96ba2327bb1f408909b2cd7fb4ecc318e8165a"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome lib_package
-- 
2.25.1


