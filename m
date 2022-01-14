Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BE3C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 08:49:54 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.4990.1642150193345438006
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 00:49:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AeWj3Kd5;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642150190; i=@fujitsu.com;
	bh=XhQDsAMe5T1aoRO/Co4jYleh1RPsweLkzHAsPZ//xrk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AeWj3Kd5npFygaOA4fbjpIZUBwvzOkJLm4qBnp88LA4AOg1Ak3o9M0RGT5MUiOr3a
	 qWJ4zjY0d80JDP/N/F2MedOVo/qiRLxeouLOdEOj5QCv++e+0BDetFE7xvCELrX+/x
	 ZZ1LsS03Mh5hr65iBqbQ+0tus8niGZmAJ2yUWfWpCWE3RtxwZLYHm2s2C6JZaR+GTZ
	 h6RcPi4snsANs2sAnQLdu10KATfoPgxE1//GL+KB1QIfwyh6vc4kCugMm5+cr9cXek
	 7mpAUEN7BZwgMu4uThyUSHYZIF2Zam9CIyQoBzrbIi//NWdrCjFsxTvGrav+gIs4sr
	 TgrHN/nVbWo+w==
Received: from [100.115.7.173] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 1F/2A-11340-E2931E16;
 Fri, 14 Jan 2022 08:49:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxSVfP8mG
  iwf3T7BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ahNadYClq5KqYs38vawDiHs4uRi0NI4Amj
  xOxJZ1kgnAtMEidez2KCcE4wSpydsZq9i5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  4BqODiEBfwkns4wAwmzCKhKXHm7kRHE5hVwlNi08iWYLSGgIDHl4XtmiLigxMmZT1ggxkhIHH
  zxghmiRlFi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGPlnIWmfhaR9ASPTKkarpKLM9IyS3MTMHF1
  DAwNdQ0NTXRNdI2NLvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwKBMKWZ5
  v4Oxqe+n3iFGSQ4mJVFeTrmHiUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeDnNgHKCRanpqRVpm
  TnACIFJS3DwKInw6oOkeYsLEnOLM9MhUqcYdTlet/zcwSzEkpeflyolznvaHKhIAKQoozQPbg
  QsWi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuaNtQCawpOZVwK36RXQEUxAR7z9cw/kiJJ
  EhJRUA5Noa8vj91+bhUxcPHVel/eVNWwuF294NL38602RCvkd6tdXX2vyvfH2C6dG1pkNezPs
  5DLuHujss8paKhT1eV7Kp/X6zhd5uKdGzTcwTRQ/wcm9jSuu6pxeBe/MIqHzh59Oe5nYpHXU9
  /Vk4cp/hv8+uWg7a9jPuxQvLzD3xcvOl171E+Kd5rbFeolvvn16Q92Fhuyu5fuz3cvvnynVcv
  9U+r38O4vtG7fvm7Q+nNXhueP1IINnRXIkz0a99U5KvMvSW/2P73Wx8JwT+Tlu6WaGdfMPmc1
  LuCw5Kar7gVtadpF2y8lD/ivjztj/Ezs+1Wnus5iO96s3LDjiOF+tIMREOJDLcNsrFr2VQtP+
  RiqxFGckGmoxFxUnAgC7Ud7mUQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1642150189!3159!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17788 invoked from network); 14 Jan 2022 08:49:50 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Jan 2022 08:49:50 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 98CB3100463
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 08:49:49 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8BE10100456
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 08:49:49 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 14 Jan 2022 08:49:27 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyscaffold: upgrade 4.1.1 -> 4.1.4
Date: Fri, 14 Jan 2022 16:49:17 +0800
Message-ID: <1642150158-4679-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 08:49:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94826

Changelog:
url for these releases
<https://github.com/pyscaffold/pyscaffold/issues/####>
=========
Ensure build configuration produces sdist as it is needed by conda, #570
Documentation improvements in #567

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pyscaffold_4.1.1.bb => python3-pyscaffold_4.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_4.1.1.bb => python3-pyscaffold_4.1.4.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.1.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb
index 9769cd6b9..7e5599e4a 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb
@@ -12,7 +12,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "PyScaffold"
 
-SRC_URI[sha256sum] = "8972252fda90d1020a93f1e99db370c002d18f52ff2fca9c3cc2a0aee74d07ad"
+SRC_URI[sha256sum] = "46a2bbdf255ba2efc6c56ae1428249b61d56c4a3e54ef3db0d05fa97792011a5"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


