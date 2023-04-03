Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A82C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 09:00:33 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.65493.1680512425699483539
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 02:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=R0JFFdsl;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680512424; i=@fujitsu.com;
	bh=k10b60aPXj1mwWTwZfycMYwoBrSMF6jFKrMUf+yJC0c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=R0JFFdslu0oeLD8PfkPgjK2VSyEG+mS8xOR1pndgThP952ESkZAv8Zb27glZdMx3N
	 zrhXnTU3ENKy5zYyXoPcbf5zF3xzuk+aeRLpeetQCPRjDmQBxaU9tURGZULW8LzuSS
	 hRZ9GfXSXbRGOFy5xbkVXlxxJ+x5Voe3R+UKRcp3MAy96WlvlXpePp8uthaPNa8Psd
	 hGZamFCW6me0IPZXFeFopPs5GhQpJOEtU+fUmkBeoFPajGDr8w6PR9oJ7C66cxSBj1
	 TDg4mDahL36l40T0EBEDa+glxL+DBPNeQ6iXP00UeN0C9QaPgrQgFYsn3RUD5R30es
	 OKUIiKOVkS+vg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqLt8qla
  KQeNcHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPp7knmghbeiv1vLrM1MC7n7mLk4hASeMIo
  cf38J0YI5zqTxOZFr1kgnN2MEl2zbjF1MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgKPFg6nOgeg4OFqD4hpsKIGFeASeJTRf3g5VICChITHn4nhmkhFPAWWL+Fl2QsBBQyY
  9d95ggygUlTs58wgIxXULi4IsXzBCtihKzLzezQNgVEo3TDzFB2GoSV89tYp7AKDgLSfssJO0
  LGJlWMZoVpxaVpRbpGhroJRVlpmeU5CZm5uglVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibn
  pOjlpZZsYgSGbkoxY/IOxqt9f/UOMUpyMCmJ8grWa6UI8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uA9OAEoJ1iUmp5akZaZA4wjmLQEB4+SCG9wL1Cat7ggMbc4Mx0idYpRUUqc128KUEIAJJFRmg
  fXBovdS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeV9NBJrCk5lXAjf9FdBiJqDFrVEaIIt
  LEhFSUg1M9dNOhGxePkWzWst9usFWx2ny2w6aHn2s9rCX5bPJowW9m2dPK3fk/sw2e9+il7W/
  Gtwz2z3Lnksu/c+uO3nFVL0qKeXOqYXOoW/b93UEpmdq+6kW88U5ORpcP6ymnd+vuZAhT53v4
  FrerIdxf1a9tLjEJ/jonpLbBG7m7erbOLcqbHWpihGS3t5Z/scgaTUr78Lr60+7391vfCowYH
  WGotzj8vpSD8mPWj9PL9gxISpl+/ncCvWwpe6igh5Nl893K79mKI29bqk4+8736Tc2cebse/X
  m1MnqPDWx5vRFS1fs5q2u+cqiUpq56nLVTv9OrXnKn/inq2StuvCfabFrwG1ng9t33n91vlz9
  4f0sJZbijERDLeai4kQAPgxugFgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1680512423!1033540!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30366 invoked from network); 3 Apr 2023 09:00:23 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 09:00:23 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4BA7B1001A8
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:00:23 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3EB2510019A
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 10:00:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 10:00:21 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libpfm4: upgrade 4.12.0 -> 4.13.0
Date: Mon, 3 Apr 2023 17:00:05 +0800
Message-ID: <1680512408-30384-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680512408-30384-1-git-send-email-wangmy@fujitsu.com>
References: <1680512408-30384-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 09:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101898

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  update Intel SKL/SKX/CLX event table
  add ARM Neoverse V2 core PMU support
  move ARM Neoverse N2 to ARMv9 support
  add ARM v9 support basic infrastructure
  add Arm Neoverse V1 core PMU support
  Update Intel SapphireRapid event table
  update Intel Icelake event table
  update AMD Zen4 event table
  add AMD Zen4 core PMU support
  correctly detect all AMD Zen3 processors
  fix CPU_CLK_UNHALTED.REF_DISTRIBUTED on Intel Icelake 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpfm/{libpfm4_4.12.0.bb => libpfm4_4.13.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/libpfm/{libpfm4_4.12.0.bb => libpfm4_4.13.0.bb} (93%)

diff --git a/meta-oe/recipes-kernel/libpfm/libpfm4_4.12.0.bb b/meta-oe/recipes-kernel/libpfm/libpfm4_4.13.0.bb
similarity index 93%
rename from meta-oe/recipes-kernel/libpfm/libpfm4_4.12.0.bb
rename to meta-oe/recipes-kernel/libpfm/libpfm4_4.13.0.bb
index 4baed6214..be0659ad2 100644
--- a/meta-oe/recipes-kernel/libpfm/libpfm4_4.12.0.bb
+++ b/meta-oe/recipes-kernel/libpfm/libpfm4_4.13.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/perfmon2/${BPN}/libpfm-${PV}.tar.gz \
            file://0001-Include-poll.h-instead-of-sys-poll.h.patch \
            file://0002-perf_examples-Remove-unused-sum-variable.patch \
            "
-SRC_URI[sha256sum] = "4b0c1f53f39a61525b69bebf532c68040c1b984d7544a8ae0844b13cd91e1ee4"
+SRC_URI[sha256sum] = "d18b97764c755528c1051d376e33545d0eb60c6ebf85680436813fa5b04cc3d1"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/perfmon2/files/libpfm4/"
 
-- 
2.34.1


