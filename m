Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 994DFC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 11:56:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.8945.1647950213064850360
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 04:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HWbh4NPR;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647950211; i=@fujitsu.com;
	bh=DIYrF2Lvit0lyULPVf9NDhCPtr6Y5L4o0qKpubo4ntA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HWbh4NPRB9a5eDBJOhdaYDZA88HQeO9AUE0bScQ0ReBILKQqVfxm91/x/8y1wZKpY
	 ijevSPezRKa278UxEKGcKcSMBsuodfMPH7gQbyNPQP1nGQzvpjupmUKI+bgFuokNr1
	 NXBLWiRsWh3kIDK0VJunqVMJviJ43dk/to9WsrioHpvyFTaDPjkkENxIj0wOd8AATz
	 LFZyobokoxBlXPSgF0/fuuelt/bNWqGn2eLaSOLc3kZT0Z9hAEOboo5HnPfdQ0XZ1e
	 NE0D4kzxPEfz2zReEOcbWztaewSEHtThk/OFEC1BKtzCAwpAJKe7STGtmgOVYuwaeJ
	 royUZgsOnfm2g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSbdpp2W
  SwceVVhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aV/QdYCo5yVOza/529gfExexcjJ4eQwBNG
  iYu/ebsYuYDsC0wSa/susEA4exglbs5/wQhSxSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  WCThAVcJR5NvwBUz8HBIqAq0bA6HCTMK+Ao8XDDXjYQW0JAQWLKw/dgrZwCThJ9zy+xQRzhKP
  Fh2X1miHpBiZMzn7BAjJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n
  7AkamVYxWSUWZ6RkluYmZObqGBga6hoamusaWuhZGeolVuol6qaW65anFJbpAbnmxXmpxsV5x
  ZW5yTopeXmrJJkZgCKcUqwftYPy24qfeIUZJDiYlUV7x5ZZJQnxJ+SmVGYnFGfFFpTmpxYcYZ
  Tg4lCR4128HygkWpaanVqRl5gDjCSYtwcGjJML7dwNQmre4IDG3ODMdInWKUVFKnDdqB1BCAC
  SRUZoH1waL4UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnzQKbwZOaVwE1/BbSYCWixPqs
  ZyOKSRISUVANTzLXIuFnrBE15l03OrTh+9mhjZO7Jt91PV6wIPLDaf9/suBXzby+6kdEqXHnP
  tPGC86yV16e0RTMf/sRxXdRwysVZmnq5rS+PSz42c/9n2JiW9nqmwOx50SxRiwW2pW0R5b/hX
  qKQGPJpEdMliyWLr1xzNKrbcHAF2+bcg0uKvK9uCPmf9k+Vu8Pa0o3rvPrcNJmtQusm6Oz9sK
  iySGijQfyaMjG+eisF+bm9iQrH4rey9t0Tid46M9rtS0T0/fvhtq7avJc/3Or9aDnvOt9OVpF
  pj2c41Z3ILJt3MiyXxdM7OPP2vz3u2UstfFT3RHPvjOUS/JLxs1zprJ7TTn6HjeVf7jKnLFMo
  vB+3s/exEktxRqKhFnNRcSIAyVnJzVwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1647950210!1029!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 965 invoked from network); 22 Mar 2022 11:56:50 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 11:56:50 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 96AF6100453
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:56:50 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8933610044D
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:56:50 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 11:56:42 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] graphene: upgrade 1.10.6 -> 1.10.8
Date: Tue, 22 Mar 2022 19:56:26 +0800
Message-ID: <1647950188-5858-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647950188-5858-1-git-send-email-wangmy@fujitsu.com>
References: <1647950188-5858-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 11:56:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96136

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../graphene/{graphene_1.10.6.bb => graphene_1.10.8.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphene/{graphene_1.10.6.bb => graphene_1.10.8.bb} (86%)

diff --git a/meta-oe/recipes-graphics/graphene/graphene_1.10.6.bb b/meta-oe/recipes-graphics/graphene/graphene_1.10.8.bb
similarity index 86%
rename from meta-oe/recipes-graphics/graphene/graphene_1.10.6.bb
rename to meta-oe/recipes-graphics/graphene/graphene_1.10.8.bb
index 0c05c60eee..813ff74adf 100644
--- a/meta-oe/recipes-graphics/graphene/graphene_1.10.6.bb
+++ b/meta-oe/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -7,7 +7,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gobject-introspection gtk-doc
 
-SRC_URI[archive.sha256sum] = "80ae57723e4608e6875626a88aaa6f56dd25df75024bd16e9d77e718c3560b25"
+SRC_URI[archive.sha256sum] = "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c25ec859da31dfde2928f279a"
 
 # gtk4 & mutter 41.0 requires graphene build with introspection
 PACKAGECONFIG ?= "introspection"
-- 
2.25.1


