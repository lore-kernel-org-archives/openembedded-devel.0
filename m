Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B54FA3742
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 08:42:40 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.7167.1667205749025698801
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 01:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cHhXTTZD;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667205747; i=@fujitsu.com;
	bh=CWweYCzOTnNlSMglRwMAnZPf0xcGWJCtbOiIw9T+D3Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cHhXTTZDNHy7XfeeZX0I4xLpVFNsM4Ijqz9mUPgnl/SDgTDHpe5VKPBWqn4lp/64f
	 Jx+4422v1XNjv07SzlEtikQqjzga/FsYK1eoulSS+2ZILfAUjrQ9EmjPFWBz0xHlYp
	 UoPLU0HukpsOjkG2sPJTKzgxtBtNMrI3HPZKnVvAc7Yv8Wc8ZvsmBvzCe86uWrT/k6
	 5IWR2tqjY5Ouf43HiNKMTkd19KS1DYBooTICRZBC2iWKXigg+809pFTfmR+pV4v4v0
	 B6v0afedPvFQTgJy5JA4HEak6ym3AnNyGaTmlUek6bPSKFjAAj9b+YzkEVJ28gEvsB
	 RDM+SYdMz8U6g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8MxSbe4Kz7
  ZYEkrh8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrG9K7xgO2fF48bP7A2M+zm6GDk5hASeMEo8
  eiTcxcgFZF9nkui5tpcNIrGHUaL3ZQ6IzSYgJXHj/n+wuIiAvsTS2XuYQWxmARWJF7972EFsY
  QE7ie03n7GC2CwCqhK/Pm5gArF5BRwljn9/wwJiSwgoSEx5+J4ZIi4ocXLmExaIORISB1+8YI
  aoUZSYfbkZqr5CYtasNiYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRtPi1KKy1CJdC72kosz0jJL
  cxMwcvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwUvbzUkk2MwDBMKVbfuoPx8LI/eocY
  JTmYlER537XEJwvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4GVsB8oJFqWmp1akZeYAYwImLcHBo
  yTC29sKlOYtLkjMLc5Mh0idYrTkmDr7335mjuVgcubXtgPMQix5+XmpUuK8ZZ1ADQIgDRmleX
  DjYHF7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw71aQq3gy80rgtr4COogJ6CC29jiQg0o
  SEVJSDUy317BMvrV81nrPKfs/pkT0FPlOdU68prji3yv/l2enzUvesKLk1e11V18zNN8w25p9
  rKnW40pTiZrYn5BbJu82ukqLuzsfr/rhcfdQVzxv1B6ZOR8crjPyWlXcvsJ3W88lbU7jvX0fH
  J94W116Wf9JZpNncV77lhz386J3bn6Z9U+U9c7P8jOnD67c55o+p7L1oHTrl4v88hrJn+PL4n
  2Vls+ZVqfCvfJU+/S+ypd+H5Jq9/x/IV6dy3TVO+9U4PfjLnuckiI3/5iRPG9Njv7SUzKx5sd
  EVfdV12Vo3cj9wPl1sS5na5vnqmum1TeV3z371DFf7doFs5SNp3/W2h35FSmR57dV+PJhzbDw
  VfP2KLEUZyQaajEXFScCALDWhwBWAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-548.messagelabs.com!1667205746!460177!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15262 invoked from network); 31 Oct 2022 08:42:27 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Oct 2022 08:42:27 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D2A261000DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:42:26 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C647B1000C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:42:26 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 31 Oct 2022 08:42:23 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] grpc: upgrade 1.50.0 -> 1.50.1
Date: Mon, 31 Oct 2022 16:42:09 +0800
Message-ID: <1667205733-3829-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99370

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fix Bazel 4 support and objc bazel tests on python3.9 (#31410)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/grpc/{grpc_1.50.0.bb => grpc_1.50.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.50.0.bb => grpc_1.50.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
index 74ec3a8a55..7b8a25c277 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "91091e3668144de9c6aa392f496bb7639f7025a7"
+SRCREV_grpc = "90ccf24d22b6fc909a1021ebd89fd8c838467d26"
 BRANCH = "v1.50.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
-- 
2.25.1


