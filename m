Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B928C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:34:10 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.1251.1667810042179456146
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=timJce0W;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667810040; i=@fujitsu.com;
	bh=T+/F8Ug1nmfnfvwiXrN4a2Wq8AJYuZDv62Bcd3gqGkg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=timJce0WHg31GZZ6KGC2UxGQjo5CtPeGNR9sKZsoLnSAAJQ2n0GCaSYrxIMLgd6nE
	 C3SvjoX33zGgGw07OT2C4tOccbcH5FVWsX32D8l2/bSzx0WkPk+iM/w1zXFv9YGBmj
	 CqcV6muvH2FybMB5TeLbLGv54hO2G53GFYerr6x1AYZ5wvC101u5WmDU4rGcTmzy2W
	 8xG4bqD82QjZCo+dFECv0VOjLxMdavpkYxXE/T1HzE35mMaBynLI9Dedh7IOglJdNq
	 7goEDAC6TAi9YyUE4pbts3q3KvK10rH94WQYX+gjdnqRoZYbvN4Fsx0VkDqWxGYXaQ
	 OsOXeCtsRKl8g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpPv9UEa
  ywfs/JhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bxjavYCm5wV5xs52lgXMrVxcjFISTwkFHi
  esdURgjnMpPE7lcLmSGc3YwSN59NAcpwcrAJSEncuP+fDcQWEdCXWDp7DzOIzSygIvHidw87i
  C0sYC/R2DQNrIYFKL7y9COwXl4BJ4lH0yaD1UsIKEhMefgezOYUcJZo3LqZtYuRA2iZk8SCd8
  EQ5YISJ2c+YYEYLyFx8MULqFZFidmXm1kg7AqJWbPamCBsNYmr5zYxT2AUnIWkfRaS9gWMTKs
  YzYtTi8pSi3QNLfWSijLTM0pyEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5NzUvTy
  Uks2MQKDN6U4NXoH49xlf/QOMUpyMCmJ8v5enpEsxJeUn1KZkVicEV9UmpNafIhRhoNDSYL3x
  kagnGBRanpqRVpmDjCSYNISHDxKIrxh+4DSvMUFibnFmekQqVOMilLivNd2AyUEQBIZpXlwbb
  DovcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmJd5D9AUnsy8Erjpr4AWMwEtri5IA1lckoi
  Qkmpgsqv/XGzI+ut72fEXlksPpZjdXL2poOfx+YcMf+d96ak9lyyqnegn/sFkl+pF6+drFu3L
  8H/8QqE8dLJodSjb94dt1Zt+G0U8OH6Ly9Nl3sLKnmXhsgYxXtMdXXmUhPzt54QKBHtt3Ln3+
  CsVeR/zsAmeP3dduZ8mo6/MNM88wU88Ql+6Sp/Z413/0jXS+nsL/Fdt/TNB+szu381O7nv8rr
  Olmd+oc4p/+Ou1E7v8mbiwC6xnu2a2fJTT5Uvpun2Fe1XLxT+bPrs2+D2rL5/F8apqjmiywke
  P/uJD7zft2AuUD/7Qw/V+gsZSLR4DheAHacK//tfnxfKH5TL/lauXP/iWWefRQbvT7zgNHimx
  FGckGmoxFxUnAgAiwu7uWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-732.messagelabs.com!1667810039!243855!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31705 invoked from network); 7 Nov 2022 08:33:59 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:33:59 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 3B05A1AE
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:33:59 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 302DF7B
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:33:59 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:33:57 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] uhubctl: upgrade 2.4.0 -> 2.5.0
Date: Mon, 7 Nov 2022 16:33:40 +0800
Message-ID: <1667810023-31001-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667810023-31001-1-git-send-email-wangmy@fujitsu.com>
References: <1667810023-31001-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99458

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Added support for Linux sysfs based power switching provided in Linux kernel 6.0+
  - it allows to solve reliability issues when turning power off on Linux (#450).
* Added option --nodesc to skip querying device string descriptors (necessary
  for some buggy devices which otherwise would completely freeze).
* New simpler way to configure udev rules on Linux (one rule works for any USB hub).
* Even more supported devices.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../uhubctl/{uhubctl_2.4.0.bb => uhubctl_2.5.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uhubctl/{uhubctl_2.4.0.bb => uhubctl_2.5.0.bb} (92%)

diff --git a/meta-oe/recipes-support/uhubctl/uhubctl_2.4.0.bb b/meta-oe/recipes-support/uhubctl/uhubctl_2.5.0.bb
similarity index 92%
rename from meta-oe/recipes-support/uhubctl/uhubctl_2.4.0.bb
rename to meta-oe/recipes-support/uhubctl/uhubctl_2.5.0.bb
index b40fa5255..8b334dbde 100644
--- a/meta-oe/recipes-support/uhubctl/uhubctl_2.4.0.bb
+++ b/meta-oe/recipes-support/uhubctl/uhubctl_2.5.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libusb1"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "014b55ac5d1d7fb46a8f1eefe9fc3b87ea65a75f"
+SRCREV = "20276ad5ced147d018e2b3fccedabd94597aa25e"
 SRC_URI = "git://github.com/mvp/${BPN};branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


