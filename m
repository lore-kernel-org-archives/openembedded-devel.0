Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0455C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:47:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.22497.1659941269701908721
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Zj/9dvym;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659941268; i=@fujitsu.com;
	bh=3Lb7sTBErhMnbSV8pwahnHA8vg1z5o+aUDsyE1Oblko=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Zj/9dvym6Bcfa3a/1XMO0vCH+fcR6wWGC2Jj4iXtgLi26v9bgXLiiWbqYINOMTmxZ
	 Ku8CpqMQHylQWSKO/kPsxTunSZ9Mtu76oAJU5NGxMpcxnodL3EGo1O9AYzOCX74teZ
	 7VVGoPFEXLvijgLsa1t91SXLlPgsGOFpKlLC4OjU56QxeKl3qFyapu4ro2kwGVE6/n
	 tAvE8ZDlR8vBIoTxheDLfZWvQPpfHBpRkixyST2MGj9Nkxd4GUvKGrjefEBIeUh5Kf
	 eC3TAvfmU/+UUA/tPckWDmrBlnG+Lafia/Q4Ab3FH88VXPXxrlIcdCN3pHGgbAu0Vx
	 FyU9cQOJqzoZg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8ORpDt544c
  kg1//lSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyvHS+YC/q4K36vP8rWwPiFs4uRi0NI4CGj
  xLT1P1ghnCtMEgv+LWWCcPYwStz/do65i5GTg01AQ2L31MtgtoiAvsTS2XvAbGYBNYmjL3+C2
  cICYRLb5v5iB7FZBFQkXk54A2bzCrhIvF9yjg3ElhBQkJjy8D0zRFxQ4uTMJywQcyQkDr54wQ
  xRoyTx9tIeRgi7QuL14UtQcTWJq+c2MU9g5J+FpH0WkvYFjEyrGK2TijLTM0pyEzNzdA0NDHQ
  NDU11jY10DY3M9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJSSzYxAgMzpVihbgfj
  tZU/9Q4xSnIwKYnyOgNDVogvKT+lMiOxOCO+qDQntfgQowwHh5IEb8Z6oJxgUWp6akVaZg4wS
  mDSEhw8SiK8JuuA0rzFBYm5xZnpEKlTjLocV69c2cssxJKXn5cqJc5bsgGoSACkKKM0D24ELG
  IvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmlQK5kiczrwRu0yugI5iAjtjw+T3IESWJCCm
  pBqaFD1n37b0gP1H6/IybshG1U5P8Mle7Kd5/WfZA07FBQFtib3NmWakQV9osxlm7G3JmSctH
  iQdJa7+dyju/cOUCAdeXXx9vL2XJqvvRcHlD9zIu4++6nZ7bWwK7wu8fnr7kJdfTCVd7d5q9n
  Xs5Z+u8PV7WuZtbp9pmPFC+tWaioOHsBXVuOxeFhKeqvw31Weu7J/QiZ+n1zVbuDLKXXvkYpu
  snLL6qcO/HhJM8kqcsBZW5Fy5zErtyNHHBpcdTXT813jqg7jBj6j5vM8X7eV887B4ommp8m5H
  dM5mR+7l+6IH4Q7OVehhvH+45dTR8tmqq6xLvCDmZgy1LrKasFXA8PvnEs7v3yxT15mbcu/9D
  iaU4I9FQi7moOBEAqt6gaFMDAAA=
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-19.tower-548.messagelabs.com!1659941267!165673!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21247 invoked from network); 8 Aug 2022 06:47:47 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Aug 2022 06:47:47 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 47AE41AC
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  8 Aug 2022 07:47:47 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 3CBC21A3
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  8 Aug 2022 07:47:47 +0100 (BST)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 8 Aug 2022 07:47:45 +0100
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dnf-plugin-tui: Fix somw issue in postinstall
 process.
Date: Mon, 8 Aug 2022 14:47:38 +0800
Message-ID: <1659941258-9108-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 06:47:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98151

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../dnf-plugin-tui/dnf-plugin-tui_git.bb                 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index ccbea58f1..f170b9f82 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master;protocol=https"
-SRCREV = "f6ee3fa8fe6f3d7ca8d5b104aa73c1a5c938a403"
+SRCREV = "bac88927b253cdcfe0d06ac7dc5afb876cd2d996"
 PV = "1.3"
 
 SRC_URI:append:class-target = " file://oe-remote.repo.sample"
@@ -28,7 +28,14 @@ do_install:append:class-target() {
     install -m 0644 ${WORKDIR}/oe-remote.repo.sample ${D}${sysconfdir}/yum.repos.d
 }
 
+do_install:append:class-nativesdk() {
+    install -d -p ${D}/${SDKPATH}/postinst-intercepts
+    cp -r ${COREBASE}/scripts/postinst-intercepts/* ${D}/${SDKPATH}/postinst-intercepts/
+    sed -i -e 's/STAGING_DIR_NATIVE/NATIVE_ROOT/g' ${D}/${SDKPATH}/postinst-intercepts/*
+}
+
 FILES:${PN} += "${datadir}/dnf"
+FILES:${PN} += "${SDKPATH}/postinst-intercepts"
 
 RDEPENDS:${PN} += " \
     bash \
-- 
2.25.1


