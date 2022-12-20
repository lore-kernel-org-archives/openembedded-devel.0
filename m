Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E9FC4167B
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:24:53 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.48762.1671539092434490420
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:24:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ag4YXggM;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671539090; i=@fujitsu.com;
	bh=9ca5ZcyUWuwh4Y89ZHFszdMVfHIhB7vqkb7OrsBxL/4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ag4YXggMHwMk71OvatW5iIC/zK2G8cVP32xZVtxbJrr8YN1x9HhCb34fXRCIgOKgE
	 CSvgcTX03J0R+CmLWUfD6lexAR9lcqeMTJDSRtWNhxnkrOyvicYfYxl028NMYvYpk1
	 ssK/0sqY2U4W/hH2VjRjPGWS2w1pzBBMr8tGiZVJiv+SvfVmRK9Q9IIQH9yISEbuIx
	 zb4g0eAk/0cg0XFDI00qqvMeaS45XBWz3+qy9RUSvXeWArSKYaMxV3lzd14eqax6k3
	 pThYugsPjnbavbh8w+Wzut0jhew8XYJc0a/MssHpbAueiXiaJaSlwilpVFxXKWcJqP
	 IGI0dCu5iZOLA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxSXfiyoX
  JBj++W1pcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBkHL/9iLzjHWbFu2hLGBsaDHF2MXBxCAk8Y
  JboXfmKFcK4zSTTOfM4C4exhlDh+fSNjFyMnB5uAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MIC5hLXZ24Ai7MIqEos+vgWrJdXwFGia0oHE4gtIaAgMeXhe7AaTgEniYOPNoD1CgHV3N
  uwjg2iXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjMLhF0hMWtWG9RMNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYzYtTi8pSi3QNjfSSijLTM0pyEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5Nz
  UvTyUks2MQIDOKU4+e4Oxs7lf/QOMUpyMCmJ8oaFL0wW4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  ME7YxFQTrAoNT21Ii0zBxhNMGkJDh4lEd73K4DSvMUFibnFmekQqVOMilLivBkgCQGQREZpHl
  wbLIIvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmnQUyhSczrwRu+iugxUxAiw9dmguyuCQ
  RISXVwCTeUu6hbjV302/5b6XrzQracipPS31tXVD6/fiFLNmerU83Sf9Yy1nEy9V2UEtzPq/o
  x8ZyVfnZ34/nyk8+6/5zXebbZ9ey697peT9jdbjG+dTCL5D1eUBA4oOkE3u4478WubBlrb/8/
  4aDG+9HtV6/n2679V2uXGb/rqqv+UFSX5PL0uCJHvdFvv3FstsmRVu/n5nfdLaz7uODlUfmSR
  d07/SPOPA/6sN34bvrXD8+6Fp525t1wvSSOYyJj83VvVfM8PIwzZSbuWwP9/5D//uSZm4Rvxz
  IoSXaaXKIM0pjq9zXW9/LZ1asdt982Trx10Nu8QWrQ8N9zfy2S14QtZrL3WSdJX5lpfG/vdM2
  XlViKc5INNRiLipOBACWGotSWwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-728.messagelabs.com!1671539089!382862!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17017 invoked from network); 20 Dec 2022 12:24:49 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-23.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:24:49 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5D19D1000DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:24:49 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 50D2F1000C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:24:49 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:24:47 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tio: upgrade 2.4 -> 2.5
Date: Tue, 20 Dec 2022 20:24:02 +0800
Message-ID: <1671539043-7306-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671539043-7306-1-git-send-email-wangmy@fujitsu.com>
References: <1671539043-7306-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100152

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * Update configuration file documentation
   Rename .tiorc to .tioconfig, tiorc to config, etc.
 * Add support for $HOME/.tioconfig
    Replaces what used to be $HOME/.tiorc
 * Fix double prefix key regression
 * Better error checking in config file, rename the file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/tio/{tio_2.4.bb => tio_2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tio/{tio_2.4.bb => tio_2.5.bb} (91%)

diff --git a/meta-oe/recipes-support/tio/tio_2.4.bb b/meta-oe/recipes-support/tio/tio_2.5.bb
similarity index 91%
rename from meta-oe/recipes-support/tio/tio_2.4.bb
rename to meta-oe/recipes-support/tio/tio_2.5.bb
index 548ee7c63..1f69e1a9e 100644
--- a/meta-oe/recipes-support/tio/tio_2.4.bb
+++ b/meta-oe/recipes-support/tio/tio_2.5.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e1a95b7892d3015ecd6d0016f601f2c"
 
 SRC_URI = "git://github.com/tio/tio;protocol=https;nobranch=1"
-SRCREV = "6b084a53b84dd7b369a6486f59f74138f6d7221a"
+SRCREV = "a2bbab068428275febeea13906654b9e58400c95"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


