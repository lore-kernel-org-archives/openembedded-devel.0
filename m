Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D27C43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 06:13:57 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.37577.1658211227371078075
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 23:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GBDQ4dqv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658211225; i=@fujitsu.com;
	bh=l/UR/ilFDBuv380TDeP9hO3icuANSMf1MFt2hudRxx4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GBDQ4dqv5fDk/X7a/0sz9vhaTzU33T9uToGw2ML1r9JGOAk/03F6SzmVffcsZ+2+3
	 bZVO046frXrxdzTSycuR0tEZMpuamX4w2SJ80rkJUoX29SI++QPoXPQg74D+h9k19E
	 fB1PKRtsY/ebpMQVsg4iwk5HhtpkuxQRdPNbONiezzMpbfTeqhwryyDRlLkHcqxL0c
	 Xun/PqgYFa/1xaK+GyucghbtApXNVNiKw9Fno8tGOlc9V9q1WowXPfVwFJc00VmP36
	 AtdibzP8AGiES+U8HNF7EoaCCjB5UEJ5kpCajyqOXOx/mpzjGPKKN6Pk7oDlQhRQsM
	 pah0AZixxBBAQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIIsWRWlGSWpSXmKPExsViZ8MxSXem97U
  kg1MRFhcPL2V2YPQ4t3EFYwBjFGtmXlJ+RQJrxvR1G9kKWvkq3k+cytrA2MDTxcjFISTwhFFi
  y+4WFgjnOpPEsdlfoZw9jBIXbmxm62Lk5GATUJOYfusGK4gtIqAvsXT2HmYQm1lAReLF7x52E
  FtYwEHi0MQ3TCA2i4CqxM73LWA1vAKOEvd+nATrlRBQkJjy8D1YnFPASaJ92ndGEFsIqObBq3
  tQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOwKiRkztrFB2GoSV89tYp7AKDgLSfssJO0LGJl
  WMdomFWWmZ5TkJmbm6BoaGOgaGpoCaWNdI0MzvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK
  3OScFL281JJNjMBQTilOv7GDcde+X3qHGCU5mJREeadqXksS4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMF7wRMoJ1iUmp5akZaZA4wrmLQEB4+SCG+aM1Cat7ggMbc4Mx0idYrRlePDoSt7mTn+fv
  oLJKfO/refmWM5mJz5te0AsxBLXn5eqpQ4b6EXULMASHNGaR7caFhKuMQoKyXMy8jAwCDEU5B
  alJtZgir/ilGcg1FJmLcKZApPZl4J3AWvgI5jAjpuktMVkONKEhFSUg1MuTmxIYW/6reKsqor
  e3SLVF6coRCgZ9DPdlenfw1j/VQWbtnY/nM3Hv/btno+W9q7swcFyoX5j3rdNy9NrNcNEpn2b
  +ryf/VhTwN237U/ImgTfSTjuEqv17WzcefEXsz12/L4o9ItpXyPKydWhpn8eiz+6dFaJd06Ti
  754/4LYt3fCS62SdfK/j9JaveayBvqsyuVz5rbtt+JeMrLu+OV7tM3N/9fzFmRH6rwSO2WklK
  04qe72xKWzj/+5fTfkL6HH2Sa1SfsYl+dxZTT/PlckJTsdrcTb8RDqyoCDprKWkTvMmvdtLl1
  adTxfh0RRiYrA3+14tszclbcEV3vZfk/XXrJL3f1apGv9tYmDwKUWIozEg21mIuKEwGUM8Izh
  AMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-745.messagelabs.com!1658211224!467292!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24831 invoked from network); 19 Jul 2022 06:13:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jul 2022 06:13:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6D03A1000CE
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:13:44 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5EA911000CD
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:13:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Jul 2022 07:13:42 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libp11: upgrade 0.4.11 -> 0.4.12
Date: Tue, 19 Jul 2022 14:13:20 +0800
Message-ID: <1658211200-2891-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658211200-2891-1-git-send-email-wangmy@fujitsu.com>
References: <1658211200-2891-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Jul 2022 06:13:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97890

Changelog:
==========
    Fixed using an explicitly provided PIN regardless of the secure login flag
    Fixed RSA_PKCS1_PADDING handling
    Fixed a crash on LLP64, including 64-bit Windows
    Fixed searching objects when both ID and label are specified
    Fixed the OAEP "source" parameter
    Fixed object searching by label
    Fixed thread safety in slot enumeration
    Fixed storing certificates on tokens
    Fixed several memory leaks
    Fixed OpenSSL 3.0 compatibility
    Fixed LibreSSL compatibility
    Major concurrency improvements and refactoring
    Added re-numeration of slots as an engine control command
    Added the PKCS11_update_slots() API function
    Added support for the SHA3 hash function
    Added a self-test for engine RSA operations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libp11/{libp11_0.4.11.bb => libp11_0.4.12.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libp11/{libp11_0.4.11.bb => libp11_0.4.12.bb}

diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.11.bb b/meta-oe/recipes-support/libp11/libp11_0.4.12.bb
similarity index 94%
rename from meta-oe/recipes-support/libp11/libp11_0.4.11.bb
rename to meta-oe/recipes-support/libp11/libp11_0.4.12.bb
index 31f90ee8b0..2237782009 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.11.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.12.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
 SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https"
-SRCREV = "9ca6a71c890b5583c8af3b4900172626bca55e72"
+SRCREV = "53d65dc48cf436694f7edcfc805414e608e8a2bf"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libp11-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


