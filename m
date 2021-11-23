Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8250BC433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 02:14:49 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.5765.1637633688058173396
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 18:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OdssgY4z;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637633686; i=@fujitsu.com;
	bh=Q7U2pLubl4tv9ovV2QwE3XP9s0G2UZETmFew01rIM7s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OdssgY4zyf5KqEnpZ0GDXdGNaxLQ70gM9v/OvN99PHGkpwXATlyA+LoqlIX2Cz9V8
	 fhLQP37eINYL99WJjb8WlG3Twdu5DqELcYxTyEBidfgpABQ4AKcdE5Nmllam9jizu1
	 MNe2e7mrbAIGFLKGspBfnBslGm71QI08xkFaAfB0RdmEFzdKrcotBE7DkgglwXRMXQ
	 Fo0HOe23ofIQIfVvTuV5lslPNfar+ugtheaMNhD15khef1f5cDo0PaFoFDiZSS2wCY
	 pF4zt4G7AyAfVWiZcFKv8v54+q5RUm2jJmZ017qAknferurqj2qWfl/v7u4eWDPIQT
	 GWrU8b563O+nw==
Received: from [100.113.7.250] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 80/27-14220-59E4C916;
 Tue, 23 Nov 2021 02:14:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8MxSXeK35x
  Eg/PbLSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyZR+QLFnFW/PnZxNrAeIKji5GLQ0jgCaPE
  5dOb2CCcC0wSS68dZIRwTjBKrN1xgr2LkZODTUBNYvqtG6wgtoiAvsTS2XuYQWxmARWJF797w
  GqEBYIl1uw7zwRiswioSqxf3A9WwyvgLHHqwGM2EFtCQEFiysP3UHFBiZMzn7BAzJGQOPjiBT
  NEjaLE7MvNLBB2hcSsWW1MELaaxNVzm5gnMPLPQtI+C0n7AkamVYyWSUWZ6RkluYmZObqGBga
  6hobGuia6hsYGeolVukl6qaW6yal5JUWJQFm9xPJiveLK3OScFL281JJNjMCQTClkadrB+PvV
  B71DjJIcTEqivAsM5yQK8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuBd6AOUEyxKTU+tSMvMAcYHT
  FqCg0dJhHeNL1Cat7ggMbc4Mx0idYrRnuPN2iWLmDna7t0FkjMXHFzNzHG//dBqZiGWvPy8VC
  lx3myQNgGQtozSPLihsHi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYdzPIFJ7MvBK43a+
  AzmICOqt3z2yQs0oSEVJSDUy9es5/ZoX3Sp8/Edz2kIFZ4rn3PhPn6ExOE6WP1u5hto0bI0Me
  9WVeiQxNmMbA92d+BdfTS23Xzwuknnzy+uCyvAWbC5XtsnNk3PZszdinfmXvzs73cyOXMTepC
  jMKdm8Myw5Yl7rBw46FdVq4dcO+Z8mdqpENJf8Whl023C0Xa7/Et6TkiPCF1E2Fc5TLv7nWJo
  hf5zqz+aG7d9sC5TVZeb3bLVP3np1yfobELLsflYYvzr/y/2c//UbsJrkynlDpG6XxTp/bxM/
  9+1gZdcv3rd2p1uCNwTqcR6c4Pl2XX5b1gnXZibvy0V9da8xTXuf+2N6/N2LOr+Zb5utvXNpk
  +EXYKzlm+ZQZb5Y6qSqxFGckGmoxFxUnAgCcaVihYgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-245.messagelabs.com!1637633684!467003!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32181 invoked from network); 23 Nov 2021 02:14:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Nov 2021 02:14:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 73E1910046E
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Nov 2021 02:14:44 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 66CBB10045F
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Nov 2021 02:14:44 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 23 Nov 2021 02:14:42 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH v2] libnetfilter-log: upgrade 1.0.1 ->
 1.0.2
Date: Tue, 23 Nov 2021 10:14:32 +0800
Message-ID: <1637633672-100838-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Nov 2021 02:14:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94104

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libnetfilter-log_1.0.1.bb => libnetfilter-log_1.0.2.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-filter/libnetfilter/{libnetfilter-log_1.0.1.bb => libnetfilter-log_1.0.2.bb} (87%)

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
similarity index 87%
rename from meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb
rename to meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
index 994825cb7e..03c0af59ac 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
@@ -5,8 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libnfnetlink libmnl"
-SRCREV = "ba196a97e810746e5660fe3f57c87c0ed0f2b324"
-PV .= "+git${SRCPV}"
+SRCREV = "b0e4be94c0b8f68d4e912402b93a130063c34e17"
 
 SRC_URI = "git://git.netfilter.org/libnetfilter_log;branch=master"
 
-- 
2.25.1


