Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web10.27106.1631524617429760835
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Sep 2021 02:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QnOdWrsl;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631524615; i=@fujitsu.com;
	bh=w08IxwTlNmAhnAKtpYlDpif5qJY8bk3Aha1Y515nBaQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QnOdWrslRStS1Bj4yBDd4oHjV5i4jTUetv+0c0czfWfmjqA0naA61H4NonHU34sF+
	 47LGfNWa4c9BYsPjAknZnpckVWPvUOh9HyAW0VvT9kh61KELI4jSK0bEiMDOlf+E/a
	 lMIX86IgftkCHPqpHog5f5sKsGdJYTtYDAuV/0ZH/V0gd+fLV4zV5QP8neKgr0SYbK
	 ZsoSzEJ1SRra+NDYPo5WijPXyWq4ZcaFuBEOEKKDwrKMIgSgf8BURRwgFpuGFFBE92
	 4EQBN0MtiwlFrbawr1L2Nk9qiFJn3KVe2RDzVb9emT5MJuozAIwqtX+wGKPY+nuxuV
	 iAXtyDuz+oTVQ==
Received: from [100.113.3.88] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id AF/2A-29868-7071F316; Mon, 13 Sep 2021 09:16:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8MxVZdd3D7
  RoGMNm8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtHw5AxzQTNnxc/GHYwNjBM5uhi5OIQEZjNJ
  bFnzjBXCOcEosXvWbcYuRk4ONgEdiY4X3SwgtoiAvsTS2XuYQWxhASeJydc/sIPYLAKqEn+v3
  2cCsXkF3CTmLG5mA7ElBBQkpjx8zwwRF5Q4OfMJ2BxmAQmJgy9eMEPUKEps33mGBcKukHh9+B
  LzBEaeWUhaZiFpWcDItIrRMqkoMz2jJDcxM0fX0MBA19DQWBdIGhvoJVbpJuqlluomp+aVFCU
  CZfUSy4v1iitzk3NS9PJSSzYxAkMppZChaQfju1cf9A4xSnIwKYny7v9llyjEl5SfUpmRWJwR
  X1Sak1p8iFGGg0NJgtdSxD5RSLAoNT21Ii0zBxjWMGkJDh4lEd5gIaA0b3FBYm5xZjpE6hSjP
  cebtUsWMXO03bsLJGcuOLiameN++6HVzEIsefl5qVLivMtEgdoEQNoySvPghsLi8BKjrJQwLy
  MDA4MQT0FqUW5mCar8K0ZxDkYlYd5fILfxZOaVwO1+BXQWE9BZX0/ZgJxVkoiQkmpg2r2pinW
  /J6fejKgS32XvRMolD9XEr5oZP3lGWsY8m03tGYW5j5nZ+yZ7FwZKJK92s+B9Nm+d+Uve+IN3
  8yc/THy0QWf9rnfXS3t8/zxZWfDz9i3+QsuA31mWwukOp9lnNb0Pt6n+fVDqYLxuCnfOZJfWF
  garr5uZV4l7G7+dznA1pspvh/fzXPsNCgpvtGx/nNJZPlFw/R3drD0mx0/u3q09gafpntiCuI
  w9u/pernNMiXXnWvTicierg9dSFclZx7YZv49Zd/mHhNo8npLVFdsf+jzvYbitZmmwSflu1LN
  gDrGnK1yLn6Y8S5B/ErP4tnil2pW9wTNOF1x9fCkt/191p9Iio8XucjmvVoc5KrEUZyQaajEX
  FScCANfMfuA+AwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-232.messagelabs.com!1631524614!9292!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27414 invoked from network); 13 Sep 2021 09:16:55 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-4.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Sep 2021 09:16:55 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18D9FjXl003126
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Sep 2021 10:15:51 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 13 Sep 2021 10:15:44 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] dnf-plugin-tui: upgrade 1.2 -> 1.3
Date: Tue, 14 Sep 2021 05:15:38 +0800
Message-ID: <1631567738-5985-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

From: Wang Mingyu <wangmy@fujitsu.com>

2021/09/08:
Release v1.3.
1.When installing with package list, add the function of detecting whether the package exists.
2.Added the function of generating installed package info csv file.
3.Delete the pseudo directory in each init phase.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index 8835f3233d..60ca2ab282 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -4,8 +4,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master "
-SRCREV = "6d3fab9b9559b6a483fe668e39c29126cdbb58d8"
-PV = "1.2"
+SRCREV = "b0d80b7129f1d84cc563a4098d869e7420bcf4bc"
+PV = "1.3"
 
 SRC_URI:append:class-target = " file://oe-remote.repo.sample"
 
-- 
2.25.1

