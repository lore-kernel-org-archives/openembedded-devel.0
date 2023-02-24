Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336EAC61DA4
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 02:47:46 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.8890.1677206859424315988
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 18:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pjh0Y7f/;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677206857; i=@fujitsu.com;
	bh=7/WcAf95sg3Ymq2po9v3RqDY3g/KjDuEfSuYaA3ToqY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pjh0Y7f/RgCyuZicGIrE2290C4GlAH4bkxIwkTokJ9lI79ToDCgYv80wMfp7Ejp3X
	 keaa6pfv2SeFXk+mHVZKTggUnjZb1RNaDPByk0sWa9JXxR3Bk4uk3CXPZGJzo8ge+l
	 eZqmzoIh5mKsYreCy3jySXiw2RobUnIOytOc8EoHJ5qOLfcAazNZbiDexycTH6zXA8
	 6Uet0dAuMF9OnOJjE75TARxGQcjfdf73Qja7blRhAQLK1BazIJIUG24zqSSZG1q/r9
	 uaVMBwf0rabpyhg1Sl0lZxDOpV6vvv6ZRJNx1N/HPrzJPSVS8/0BGIX26Hw2Ijuwag
	 sakY6q2+3rldA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWddD9Ue
  ywYe/phYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aLqRUFk9grnnd9YG9gPMjWxcjFISTwgFHi
  yLdr7BDOFSaJfS8aoZy9jBKrztwFKuPkYBOQkrhx/z+YLSKgL7F09h5mEJtZQEXixe8eoAYOD
  mGBMInDazVBwiwCqhLTNxwFK+cVcJLYN3kLE4gtIaAgMeXhe2aQck4BZ4lXX0tBwkJAJf0PFz
  NClAtKnJz5hAViuoTEwRcvmCFaFSVmX25mgbArJVo//IKy1SSuntvEPIFRcBaS9llI2hcwMq1
  iNCtOLSpLLdI11ksqykzPKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J0ctL
  LdnECAzclOJEoR2M33r/6h1ilORgUhLl1ZX5kSzEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgveVI
  lBOsCg1PbUiLTMHGEUwaQkOHiURXjaQVt7igsTc4sx0iNQpRkUpcV4tZaCEAEgiozQPrg0WuZ
  cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfO2qwBN4cnMK4Gb/gpoMRPQ4u9vvoAsLklESEk
  1MMk8831/LvlYZ/jWvf8b8tZf1Xl9MGrV46VrBFZ0CHQzuZ88V/ZbUnfbu7dH//JfecDVkCLr
  +rlGYN7je7+l9t7lNmgoYXSevKnvg/LBiY5uVwufpfxtWb61J6FPz+PMf/EFFc11jQGzzkfXh
  sYt7bRmin3hJMjlKs206qTQqt/JiRmGIvePXJP+8+3OrdiK1DvcyXNk+qp/ncnteuIzZd2Jx2
  G7lu69/VT+tnsye+Z+gVOf5Q+v2/Zr8fI6SwaDWwaf7i8v8nvc6vakd17MNG+BvI+7Zt8J+8n
  dIyzSsTslhPHDs6pN/7gmiW3r9rq+q6VsOavVs1mTbPh2eUyNVBBqlVv/cuZKzzQ9xSSfD2+V
  WIozEg21mIuKEwEfphbnVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-728.messagelabs.com!1677206856!1948!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13849 invoked from network); 24 Feb 2023 02:47:36 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-20.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Feb 2023 02:47:36 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 4A0647B
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Feb 2023 02:47:36 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 3E34673
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Feb 2023 02:47:36 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Feb 2023 02:47:34 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 3/3] imlib2: Fix install conflict when enable multilib.
Date: Fri, 24 Feb 2023 10:47:18 +0800
Message-ID: <1677206838-16882-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677206838-16882-1-git-send-email-wangmy@fujitsu.com>
References: <1677206838-16882-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Feb 2023 02:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101244

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/bin/imlib2-config conflicts between attempted installs of lib32-imlib2-bin-1.7.1-r0.armv7ahf_neon and imlib2-bin-1.7.1-r0.aarch64

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
index 869f8123d..9b8849b58 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
@@ -37,3 +37,6 @@ PACKAGES =+ "${BPN}-loaders ${BPN}-filters ${BPN}-data"
 FILES:${PN}-data = "${datadir}"
 FILES:imlib2-loaders = "${libdir}/imlib2/loaders/*.so"
 FILES:imlib2-filters = "${libdir}/imlib2/filters/*.so"
+
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/imlib2-config"
-- 
2.34.1


