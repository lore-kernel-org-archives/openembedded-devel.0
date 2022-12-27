Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAC2C46467
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:47:15 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.152452.1672123625310307520
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:47:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vknqkUAO;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123630; i=@fujitsu.com;
	bh=lYt+/HXR5qZ//R5S0585YayafPV9jjpRI4z/odJ69SQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vknqkUAOAK5RAt7nA+CMKPVhaUkuJ4rd7yap6mZ8TBhNohYqsKSiE73iSEpxHC7T3
	 hhPADo4ezhE+1cpNMB4piqKNzF0HbdNYc//24i4BI3x22QWaflFrQoR25H04a307yf
	 6tiWr2+I/W48cZOwvgkk1S9nb2G5jdTw2LeVeM48PmUlYo1j1Y3594XXe0LUMhWB8O
	 KyKPGQ7Cv7q6scgCiZVYk6IvChRAB6jvOjj1dOCzh/SHu3QZDl8LQSJhN1nl1rcXsT
	 8TOy+xLUhmHCDvMiKhw4izIysxctjfLpCre4GLX/wQAaom18MeWxfIxuRarmIgH0rP
	 Z96HKc+ETy6lQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSfftlFX
  JBje6ZSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozFc2YzFrzjqphz9iBrA+N3zi5GLg4hgSeM
  Ev9XXWWDcK4zSRxbe4cVwtnDKHHk/W/GLkZODjYBKYkb9/+zgdgiAvoSS2fvYQaxmQVUJF787
  mEHsYUFfCWWHL/ACmKzCKhKvH51AqyGV8BJounQXLA5EgIKElMevgeLcwo4S1zZ3w0WFwKq2b
  vqBCtEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtCYtasNiYIW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRtPi1KKy1CJdU72kosz0jJLcxMwcvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwU
  vbzUkk2MwOBNKVbq28HYteyP3iFGSQ4mJVFeqe5VyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQke
  EsnAeUEi1LTUyvSMnOAkQSTluDgURKBaOUtLkjMLc5Mh0idYlSUEuf9CtInAJLIKM2Da4NF7y
  VGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzqION5MvNK4Ka/AlrMBLT4w6GVIItLEhFSUg1
  M4s23OY9u2GOc36Qy37lf7WvLQn2mLx12N4yfl6VfmfvmT8mz71pB2dlZpdoyFyQMljxoTFUM
  z/E0FU3a77JV9vAbbkE/4Se5DyLjVrfGhR35NzXfs9N1Y6TGfRV1hogPi7Sv75c5163XPmnRl
  lZHlcDlc+zUb33+28a46cflvS0pGfJ3HsdeyP024XLG+WPZM30c/38xmHi71GvV5i+asY/6dV
  a+/2MoW96doNytejBCVPqw7Lz4fYF3cl26TRQuumw4H7oweemmwA2djH8fzbh+9i/flt368fM
  1rzafkdA5VzBzZeonpfnn+e578Gq198lXa69MD96ddvFh1uy6h0XS+2Iu1002PLZ7ufA8JZbi
  jERDLeai4kQAx6NsjVkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-571.messagelabs.com!1672123629!421184!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15385 invoked from network); 27 Dec 2022 06:47:09 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:47:09 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2D75D1000D5
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:47:09 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 20AFC1000C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:47:09 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:47:07 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-traitlets: upgrade 5.7.1 -> 5.8.0
Date: Tue, 27 Dec 2022 14:46:26 +0800
Message-ID: <1672123586-32004-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672123586-32004-1-git-send-email-wangmy@fujitsu.com>
References: <1672123586-32004-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100274

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Shell command-line tab-completion via argcomplete #811
 Expose more attributes for typing #817
 Fix lint #814
 Additional Application examples and docs #811

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-traitlets_5.7.1.bb => python3-traitlets_5.8.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.7.1.bb => python3-traitlets_5.8.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.7.1.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.8.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.7.1.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.8.0.bb
index c5b52a2ae..d7a78254e 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.8.0.bb
@@ -4,7 +4,7 @@ AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.md;md5=f17a3ba4cd59794dd6e005c8e150aef0"
 
-SRC_URI[sha256sum] = "fde8f62c05204ead43c2c1b9389cfc85befa7f54acb5da28529d671175bb4108"
+SRC_URI[sha256sum] = "6cc57d6dc28c85d5365961726ffd19b538739347749e13ebe34e03323a0e8f84"
 
 inherit pypi python_hatchling
 
-- 
2.25.1


