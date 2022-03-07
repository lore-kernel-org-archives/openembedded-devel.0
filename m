Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9B1C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:47:07 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.25299.1646653626340564653
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:47:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fRQorwSh;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646653624; i=@fujitsu.com;
	bh=Mfeg4tAR0Ap6Uoqr5QXS1IthkMkxvXmmunhxMVbImO0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fRQorwShoXPbyK8n5niwqEAsMVhvKIQ6fK57F7mSUUHFIcswGQJaJw89qsYQ7Drus
	 F2vD0Ld0mexZhZH97BGPHlewGPv016NNwiY8Jaj+CYgb/JmZ21DOPd/BbI3iMWPpyQ
	 7b7OISxPTGRViGwjdzOx2Nuyp2OFRLkv28wbs31zhPdBO2Yusnz9nIveIgCEzOsvGh
	 MIXYihILvQZh7hj1soYZ0P8kkF7cCx/hC0wFDivlDQcZQ/c4sVFsALQeaw7DT7dBc6
	 wlGaRLC1DPeyzi+zT8PIqdu9OaQZ9Vmc+xUdiQIvrblrBGzxF2eJthtO9PWmZS1jDe
	 754wNO4KMSiMw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORqLvjg2q
  Swd79zBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8asd2+YCiZyVUx7t4y1gXErZxcjJ4eQwBNG
  iaV/GLsYuYDsC0wSy76uY4NwjjNKLHzawgJSxSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrBAoMSxDT+A6jk4WIDii6emgoR5BZwk7p9pAiuXEFCQmPLwPZjNKeAscfvcS3aII5wk1s
  9uZoWoF5Q4OfMJC8R4CYmDL15A9SpKzL7czAJhV0jMmtXGBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVolVSUmZ5RkpuYmaNraGCga2hoqmuqa2RqqpdYpZuol1qqW55aXKJrqJdYXqyXWlysV1yZ
  m5yTopeXWrKJERjCKcWs/3cwdvf91DvEKMnBpCTKm7JANUmILyk/pTIjsTgjvqg0J7X4EKMMB
  4eSBO+nN0A5waLU9NSKtMwcYDzBpCU4eJREeI9fAkrzFhck5hZnpkOkTjHqcuzccnkvsxBLXn
  5eqpQ4LycwOoUEQIoySvPgRsBi+xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV5pkCk8mXk
  lcJteAR3BBHREla0SyBEliQgpqQYmgwuzNuVNrQhzlvHft2vDKwc73ZCtf+dwKFxa/pdxeWNc
  18NTC66Ia1d9vHhCwSje1tl/4jKd2z3/hZ5yp+YfenvR+b9bfRDPq++dbQlRYYzr9n86Osmiy
  nZl9bnirVcuCfSqSM6fNqvpSv+TI8+f5hxyalK+Yld5yi6De9n0axWPr5h9m1/ht6CgJu6Fbm
  PJxMOld0uyl9QrxsoynZoxR6fDif2q/d2Huk/vGV6y9eCtU8624Px/TlrtVqCJpkrai9ywDyc
  TPH0lNrzYtqjweexhdvMGg3Pblp4OuWpqk1EX1CXnX924/dzWnGkrXj6pr3L/m3h5xekf16+/
  7K5kesv9uZEv3CGjPsJ1XZaYEktxRqKhFnNRcSIAkQ6SmWgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-587.messagelabs.com!1646653623!102548!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30168 invoked from network); 7 Mar 2022 11:47:04 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 11:47:04 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 80A0D1001A2
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:47:03 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 73A26100185
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:47:03 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 11:46:54 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-jsonrpcserver: upgrade 5.0.3 ->
 5.0.6
Date: Mon, 7 Mar 2022 19:46:40 +0800
Message-ID: <1646653602-55882-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646653602-55882-1-git-send-email-wangmy@fujitsu.com>
References: <1646653602-55882-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 11:47:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95838

Changelog:
==========
Fix reversed Result Either type ([#227]
(https://github.com/explodinglabs/jsonrpcserver/pull/227)).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-jsonrpcserver_5.0.3.bb => python3-jsonrpcserver_5.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsonrpcserver_5.0.3.bb => python3-jsonrpcserver_5.0.6.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.3.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.6.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.3.bb
rename to meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.6.bb
index c2500300f..cdd93516c 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bcb/jsonrpcserver"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=61b63ea9d36f6fb63ddaaaac8265304f"
 
-SRC_URI[sha256sum] = "0cc514559596fa380bf188e31b0cdf3d9e6d9cc162fdca8a49ed511b291a9ae1"
+SRC_URI[sha256sum] = "0fdd69c15e67004fb064d2254469cf82d02b7bc8a7bf7760055caa9d62d92f7c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


