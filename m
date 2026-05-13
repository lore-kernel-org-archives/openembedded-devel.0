Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8F9CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:10:28 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.119.1778645424534011969
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XWUpaRkl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645425; x=1810181425;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OC3n+93oIDNtTAwzfGiWqiySgzwMWp+Qwer4JUyN2vk=;
  b=XWUpaRkl5dpJseUy/eokS4O2siWGbK9GqHApdJlBxvEbB558E/QsV8wv
   bz88vqwXD3hcR/mzjU9txhg7AKk/JZmhlf9YKbB9ObcUms5eDk0C0Jbmt
   oYwNwzAff/kmklQcEFmQiMuH/zWJexpWKfvAl78cX1grhajPTXpImvSxA
   2rNCy7abuywad2HFmTiAlIorZiHAWZyX/6ya5S0Z4BYnQo+oeVcS5Lxp4
   ObfNMtAn/8tDIJP+eC9atC7QKLGvPbTufbGuKbUHYMCMXhfZ9gQvIMgu9
   jKvNmoB7w+HcdRcvjORi9/UjztMnSEnb0SuYePtzrrkLSL4V0ESz6i+cN
   Q==;
X-CSE-ConnectionGUID: z/pGemesQoaL8w/OOjfWUQ==
X-CSE-MsgGUID: lpmOyxQxQzqMM80pyjuB4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240257318"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240257318"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:10:23 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id EBE4282072A
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:22 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A68F0861278
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4A01614000AF;
	Wed, 13 May 2026 04:10:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 21/56] pure-ftpd: upgrade 1.0.53 -> 1.0.54
Date: Wed, 13 May 2026 12:05:20 +0800
Message-ID: <20260513040555.377-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126906

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Multiple hardening fixes across PureDB, the IP access checker, PAM, LDAP,
  quota handling, and pure-pwconvert.
- IP access rules now support IPv6 patterns. Hostname rules are resolved
  using the client's address family, so AAAA records can match IPv6 clients;
  previously this path was IPv4-only.
- Malformed CIDR widths in PureDB allow/deny lists now fail closed and a
  warning is logged identifying the offending pattern.
- LDAP searches that return more than one entry are now rejected as
  ambiguous and a warning is logged identifying the offending uid.
- Malformed quota files no longer reset usage to zero; the failure
  surfaces during quota checks instead.
- PureDB virtual users with a non-numeric or partially numeric uid or
  gid field are now rejected. Records with uid or gid 0 continue to require
  ACCEPT_ROOT_VIRTUAL_USERS at build time, as documented.
- Anonymous LDAP binds work again after a regression introduced in 1.0.53.
- Pure-pwconvert skips entries whose fields contain ':' or newline
  characters rather than emitting corrupted records.

igned-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pure-ftpd/{pure-ftpd_1.0.53.bb => pure-ftpd_1.0.54.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/pure-ftpd/{pure-ftpd_1.0.53.bb => pure-ftpd_1.0.54.bb} (90%)

diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.53.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.54.bb
similarity index 90%
rename from meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.53.bb
rename to meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.54.bb
index 02a10f8e84..222a0bb731 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.53.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.54.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${PV}.t
            file://0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch \
            file://nostrip.patch \
 "
-SRC_URI[sha256sum] = "b3f2b0194223b1e88bf8b0df9e91ffb5d1b9812356e9dd465f2f97b72b21265f"
+SRC_URI[sha256sum] = "dc9140420ec44f7829579591ff378aa6396b4604b9c6aeae847368e0f35bd7b2"
 
 inherit autotools
 
-- 
2.43.0


