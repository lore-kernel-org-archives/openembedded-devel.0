Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA83C636CC
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 06:56:56 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.9169.1676271410416216624
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 22:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XWLrrYMn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676271408; i=@fujitsu.com;
	bh=UOxq0eapQDcKoirt4B6MX3JgOUQGMDT4fXsugofApmU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XWLrrYMnoPHYpQt4sl6P9vhR1tmvwtXz6Ck2e6ub8QSjIZejkmBMyh/8eCnYMwpqQ
	 HjnSPMdIfCfG3l+9HcoyAzq5jXYf0sgHa9rqaJmK7qIpw8N+3vDeZIFQzSOjyeKfcU
	 CaVj5ozMK4g82YZwl2C9/rxQxtR+AULjCMmCOTwtehOrn0qswRPfp2X9dEAwEhBDd3
	 z7uQIbpEMcGziU2677CF43uQ1hKMCGaBHu72pkUpInO31TigQUMOkvth/oRMe+TCRR
	 xk4F4mrHplpkOESZP/tDiIt7Vv/T8bhkyfiCmYPwQQXoMyyZH0Ntd2pKMSqKLoQwh0
	 M+EVCesEXmfKQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSVf//st
  kg7mfLS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oz+5yeZCp5xVfzpaWBpYHzJ2cXIxSEk8IRR
  Ym7nZCYI5waTxKVD66CcvYwS575sAHI4OdgEpCRu3P/PBmKLCOhLLJ29hxnEZhZQkXjxu4e9i
  5GDQ1ggVGLCYh6QMIuAqsSstffAWnkFnCQ+/3sM1iohoCAx5eF7sFZOAWeJK/P/sYDYQkA1C/
  adhaoXlDg58wkLxHgJiYMvXjBD9CpKzL7czAJhV0q0fvgFZatJXD23iXkCo+AsJO2zkLQvYGR
  axWhWnFpUllqka2iol1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KX
  l1qyiREYvCnFTFU7GF/0/dU7xCjJwaQkyrvw9MtkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8l
  24B5QSLUtNTK9Iyc4CRBJOW4OBREuFNA2nlLS5IzC3OTIdInWLU5bh65cpeZiGWvPy8VClx3p
  M3gIoEQIoySvPgRsCi+hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV6Tu0BTeDLzSuA2vQI
  6ggnoiMd8YEeUJCKkpBqYBHVOLIh1FN0irC9ssPXKNJ/FWraZq1kCBA1vv+RVWDjFKKD4pBd7
  e/HB36dzv/Rm7A/90rRqHd+lRw/Zjhw+YLQuaGq3pUxevdhdMYl37P63qyRy9i9+r/f293zVG
  VXlVvsvnMr/qtJ2ZaHFr9v3EwI8uaJWZu5a9bzfSyF218/idb0rTz08m5S3SiehTW+9TviMe8
  ezFaZWHCx6u1XYbAJXS9erFZfWMteEPdd/veBBSn5enn9G3KqP54T2VClddv9SsWVpXrf+yS3
  GN9/HFIZPknH9EyNvwrnmk3yspODEzX5riqc5Gm+NeflXV06p8LKD4OHCs2lfz6rOd9iXsoNd
  V1J2allz2n+Wi+ZTlFiKMxINtZiLihMBm/JLi2UDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-585.messagelabs.com!1676271407!536608!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1345 invoked from network); 13 Feb 2023 06:56:47 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Feb 2023 06:56:47 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8CA771000EE
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Feb 2023 06:56:47 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 807AC1000D7
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Feb 2023 06:56:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 13 Feb 2023 06:56:46 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [oe] [meta-oe] [PATCH] editorconfig-core-c: upgrade 0.12.5 -> 0.12.6
Date: Mon, 13 Feb 2023 14:56:24 +0800
Message-ID: <1676271384-21122-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676271384-21122-1-git-send-email-wangmy@fujitsu.com>
References: <1676271384-21122-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Feb 2023 06:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101065

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
    Fix potential buffer overflow in ec_glob (#87)
    Add simple installation steps for Fedora (#79)
    Update property key, value length limits per spec change (16d1d92)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...torconfig-core-c_0.12.5.bb => editorconfig-core-c_0.12.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/editorconfig/{editorconfig-core-c_0.12.5.bb => editorconfig-core-c_0.12.6.bb} (88%)

diff --git a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.5.bb b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.6.bb
similarity index 88%
rename from meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.5.bb
rename to meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.6.bb
index da5c07ff2..1facb352c 100644
--- a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.5.bb
+++ b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f515fff3ea0a2b9797eda60d83c0e5ca"
 SRC_URI = "git://github.com/editorconfig/editorconfig-core-c.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-SRCREV = "f6b0ca395149b5a2fbd56a488cae30306a58170f"
+SRCREV = "b7837029494c03af5ea70ed9d265e8c2123bff53"
 
 inherit cmake
 
-- 
2.34.1


