Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B0BAC53210
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:45:09 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.3791.1672803903692117395
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:45:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Wk1HCJ/E;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803901; i=@fujitsu.com;
	bh=SpzW8avmjSPjIxRJdqa+WXIe1x1At7cQtId6XCH5Eks=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Wk1HCJ/EciEjGv3gbaIb39TvgCt7PbillXHyuOZZA+zhXpPtBls4/GhbrNCtNF9w2
	 ovpyCdw2SDgzWbxAGhOtyRvPMF0+Nz9MbrOr/hymoyVGB6mPy9JbgYeApBQ8i763kj
	 txWs+7NCIMgZLzoflCWACiPTJmMa1HVJJw3FHWpnDW3Bm+2bfz0FSsztCr8xgn6u4M
	 a7UQAMC5+/zeiq4wPXZs63eYuGyzrhnTUm+EodKHZMa7JNkZfzDzsY3rSrGvwEOYz0
	 aemmpBLRSlg4aB6ZJ3FiHhiNJq7e20W8rLVRlsSUJi5f1763yPDXMbRmh3y/4dbdZK
	 B1C2P6R/tNyyQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8MxSdf225Z
  kg3fSFhcPL2V2YPQ4t3EFYwBjFGtmXlJ+RQJrxrPebraCh9wVneeb2RsY93J1MXJxCAk8YZSY
  dKqXGcK5ziSxeOMyKGc3o8T1s+/Zuhg5OdgEpCRu3P8PZosI6Essnb2HGcRmFlCRePG7hx3EF
  hawl/gxaR0riM0ioCrRsnk2UA0HB6+Ak8SCxV4gYQkBBYkpD9+DtXIKOEtcfbqYEcQWAip59+
  kk2BheAUGJkzOfsECMl5A4+OIFM0SvosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjGbFqUVlqUW6pnpJRZnpGSW5iZk5eolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIGhm1Kc4LSDccqyP3qHGCU5mJREeUs+b0kW4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  MGr/gkoJ1iUmp5akZaZA4wjmLQEB4+SCG8WSCtvcUFibnFmOkTqFKMux92Fe/cyC7Hk5eelSo
  nz3voCVCQAUpRRmgc3AhbTlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ864GWcWTmVcCt+k
  V0BFMQEckrdkIckRJIkJKqoGp+twi/volIarBN7pVt8netzr1+tm6GYodKqxXj982YVi44ZdQ
  olThz72/CzmvzRCQDtjNXdNgZ9hn4MVi4sz49FdIxZE0rWcdu9PfvU+3D7FQZg5+d23SrWXTp
  544nZJz586dKaqva9IuXrFMTjN6w/VbKUYnM7d1xXG19soo84c6taa1r67znvC8mu95zJAzJE
  20c+ehKheNyCPfal8/Ws3b+mNVW5OPmFVY04wow+a27PzupvrrnaXvrk7Maqs/FuQzQVh1xt7
  jF29czU0xin3sV9AyqbP+2h/9X/117dvztC+U7db+83RJzaTgJa9cmWtmpdkKfshZMvkFt2eN
  VLKzs/jExVMKGO//D1BiKc5INNRiLipOBAB9evmaZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1672803900!359802!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3487 invoked from network); 4 Jan 2023 03:45:00 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:45:00 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 77EA61000D7
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:45:00 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6B2D51000C1
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:45:00 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:44:58 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] tepl: upgrade 6.2.0 -> 6.4.0
Date: Fri, 30 Dec 2022 13:01:16 +0800
Message-ID: <1672376478-25626-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672376478-25626-1-git-send-email-wangmy@fujitsu.com>
References: <1672376478-25626-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100387

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Build: simplify handling of library soversion.
* Add some new API (see the reference documentation).
* Some API breaks (see the reference documentation).
* Experiments to simplify GtkStack custom switcher implementations.
  Moved the result to the attic/ directory.
* TeplView: add code from gedit: override delete_from_cursor vfunc.
  In gedit it's for the Ctrl+D keybinding to delete the current line.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/tepl/{tepl_6.2.0.bb => tepl_6.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tepl/{tepl_6.2.0.bb => tepl_6.4.0.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/tepl/tepl_6.2.0.bb b/meta-gnome/recipes-gnome/tepl/tepl_6.4.0.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/tepl/tepl_6.2.0.bb
rename to meta-gnome/recipes-gnome/tepl/tepl_6.4.0.bb
index 0eeb345cd..1eecfff4b 100644
--- a/meta-gnome/recipes-gnome/tepl/tepl_6.2.0.bb
+++ b/meta-gnome/recipes-gnome/tepl/tepl_6.4.0.bb
@@ -21,7 +21,7 @@ inherit meson gobject-introspection gettext features_check pkgconfig
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 SRC_URI = "git://gitlab.gnome.org/swilmet/tepl;protocol=https;branch=main"
-SRCREV = "34973a0d48ba5a0dd0a776c66bfc0c3f65682d9c"
+SRCREV = "d1e9cc2e4a0738f68d9002f13724b7239f075844"
 S = "${WORKDIR}/git"
 
 # gobject-introspection is mandatory and cannot be configured
-- 
2.25.1


