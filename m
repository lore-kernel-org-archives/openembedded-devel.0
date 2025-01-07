Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C86C02189
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:02:06 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.16412.1736240517633665354
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q2kCWJ3w;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240517; x=1767776517;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=u/8xpNhuux9BZbFnNKAIhkccAWOmTe8PkZ5a2px16z4=;
  b=Q2kCWJ3wRb2Hxmbmv3mfHZWIZnwUWNc9aPcFYJ+qIQfS/Wl7Aha4SjX7
   Gd5MlXcAEga+HbNMwEb7VEBSNnxgqXM250HPpk9zoCbHIT9swybF4JzUS
   W+C7nxmhKNxP7RSmLDAjacNPUZ4hnF1Y1hfFmazb6lJtpoMwR9t1DztF2
   UJS0LbHmyPx1l6JdfVxYslEhT8loqqLRtDs9NmXST67YPdHj58ALbqeBr
   xDKZrTjcozbmQ9vLt88J560TkyWB8mQlx16pmF+SQ6SJr211KRE2hjQ9D
   tfmLDT7oEGFPbAktJXEh8wxlm3qGsLYxN9ujRPianVzdTVwEu1+qyrf/w
   A==;
X-CSE-ConnectionGUID: lcIsujstQsGpksdX7b9IQg==
X-CSE-MsgGUID: nKRj94GIRcmuxmKmZzmPew==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="164742119"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="164742119"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:55 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7483CD4C42
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4BC7ABDC81
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D482D40FF6
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:52 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8FB331A0071;
	Tue,  7 Jan 2025 17:01:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 03/18] evolution-data-server: upgrade 3.54.2 -> 3.54.3
Date: Tue,  7 Jan 2025 17:01:29 +0800
Message-Id: <1736240504-5315-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
References: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10--3.601700-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4BwTlc9CcHMZeysPB8dBBorSqU
	3RD+dVC4bTF4phlrGWQGFBbDeVn4hSpe4ofkluPssZaZ5UBQsod9LQinZ4QefOYQ3zcXToXr+gt
	Hj7OwNO2OhzOa6g8KraOxPLfym38l9+jRhufq/UGUJghOENfGUrT31ySiyhzaHHb6kZNvAHlY5/
	kJG6hO2YaWmzcFhcEzQcprSrSOiU7ppmNa8vIK3x0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114679

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index f9dc173a9e..4e6c90f943 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -10,5 +10,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 GNOMEBASEBUILDCLASS = "cmake"
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "11f0253089c8abf456cffda3fe658a35a0de2b8ae93d8f257d6b020ae7963d20"
-PV = "3.54.2"
+SRC_URI[archive.sha256sum] = "5108dc38ee5cc1f8ef9155e87f6c4129f9644550a0962c5ae23ff807b57cb8d0"
+PV = "3.54.3"
-- 
2.43.0


