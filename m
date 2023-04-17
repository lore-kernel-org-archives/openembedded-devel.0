Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D615C77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:39:01 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.48366.1681717133529930583
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gbEbvL6p;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717131; i=@fujitsu.com;
	bh=bhB5DhaOi7eFsLNCeGUqRdSoyUlU3AtF9XuTQ0Frgtw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gbEbvL6pHgRCU9A6godjidqwgaLfdqa3ew4pXCL6yVDp1/wl1IzRT9M5u+b9/QWw2
	 9/FtQ3I9zX6325Ei/PGXeyK80qeLutpn2c+5XT8xFK7wnFIxF6YcpgyXiTHJulHPgi
	 2JOX5scfzTQfZv/FFjpPYqFDtbcfzYBzx2Vv/V+VhlCSCWoeqdg4ZtTXnFLdbU7+RH
	 PRb5rtBjN9DGc5STFTgo3hiuwSIb1gJszWJ/sTea8Ihm08MDaMgpDAZaqlcR/Xc0hw
	 HOxXxh9KvMkJCC62g9OsxAb84DXqM7sltfTqMiASkRiyqHsjLwTAmDVeVawF2+3Wki
	 3SO5yCXcMiP4Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWbf7u02
  KwcFWKYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePFlxVsBde5Kx4ta2JpYNzF1cXIxSEk8JBR
  4vO9TmYI5yqTxOeZi6CcvYwS27YvBnI4OdgEpCRu3P/PBmKLCOhLLJ29ByzOLKAi8eJ3DzuIL
  SzgLrG7/TZjFyMHB4uAqsSj/jCQMK+Ak8SEzfvAyiUEFCSmPHwPZnMKOEsc7j0IZgsB1TQ0Xm
  eFqBeUODnzCQvEeAmJgy9eQPUqSsy+3MwCYVdKtH74BWWrSVw9t4l5AqPgLCTts5C0L2BkWsV
  oVpxaVJZapGtoqpdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOil5da
  sokRGLwpxYoTdjBe7Purd4hRkoNJSZT3Rap1ihBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3lWfb
  VKEBItS01Mr0jJzgJEEk5bg4FES4TV+BpTmLS5IzC3OTIdInWJUlBLntf4GlBAASWSU5sG1wa
  L3EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3vAvQFN4MvNK4Ka/AlrMBLRYTglscUkiQkq
  qgaltZvzZ0kom5ynMR3ma3gWd8jetOfpl5Tm3zM3b59nOviR1cNuMjMV7pi/efJhBYvuPssgz
  Ri+Z31+cGhA3NWqjhuUqxxQ/UdcpoTu3eO44dPbm6YXJCudnC7N+EC8tkWbzvu+Sxrxth7Izv
  wjD8a5KlsdZs0LF9L3jJE229ifHbEjUyq4/HbdjA/tnpdmal5zEMypXr2CUdt1Q2KJ3eM3Xmp
  wzB7jL7Lli82692KkVUjMzxq70Se7xicGJ8g0bDkQXzLp08pzgtiLe3YceX9r5/r4WQ8qaC7t
  z9CrcXq5tN9lQGmWxyKfZkDlqDt9Lmd4tuxa5nAw7aFgdmhv8cH6o0fH98Ur+Cil+OxnCJymx
  FGckGmoxFxUnAgAwxzYZWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-565.messagelabs.com!1681717131!434727!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32701 invoked from network); 17 Apr 2023 07:38:51 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:38:51 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 25A89153
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:38:51 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 1914E151
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:38:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:38:49 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] openvpn: upgrade 2.6.2 -> 2.6.3
Date: Mon, 17 Apr 2023 15:38:05 +0800
Message-ID: <1681717086-19067-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681717086-19067-1-git-send-email-wangmy@fujitsu.com>
References: <1681717086-19067-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102105

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  GHA: remove Ubuntu 18.04 builds
  vcpkg: request "tools" feature of openssl for MSVC build
  doc: run rst2* with --strict to catch warnings
  Support of DNS domain for DHCP-less drivers
  Bug-fix: segfault in dco_get_peer_stats()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openvpn/{openvpn_2.6.2.bb => openvpn_2.6.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.2.bb => openvpn_2.6.3.bb} (97%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.2.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb
similarity index 97%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.2.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb
index 36ae8c96f..76bce7db5 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.2.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "42d561a9af150b21bc914e3b7aa09f88013d2ffa6d5ce75a025a3b34caa948d4"
+SRC_URI[sha256sum] = "13b207a376d8880507c74ff78aabc3778a9da47c89f1e247dcee3c7237138ff6"
 
 # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
 CVE_CHECK_IGNORE += "CVE-2020-7224 CVE-2020-27569"
-- 
2.34.1


