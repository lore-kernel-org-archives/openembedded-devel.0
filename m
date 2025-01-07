Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A584C02185
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:02:06 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.16414.1736240519172125224
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EBODHaYq;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240519; x=1767776519;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/fvjsqYZ7h82yFmxiXFlJZSEkbmJlvf8Itdh6ZBFVZY=;
  b=EBODHaYqbFGuIKB0YgajuSbKmgAu1A5YFwKZXZ5C5Hj7pCff2gBS/zHD
   Y2m1uJC+mOsVKt3mqD2OJZid4nOJiC9q6MoLSmEtUQ9/b32oMSJuTnTts
   Y3YJd59/J45KrHYWLuAiXa/fQgWovfT01JRA03Oth6SwRWo5alq/Y/TtH
   YVzo1qqyPI/ZO2BceSC52pj6lRJuxr8eC6Tpz2PvVnyi4xM/Nb1VeFAXR
   9fOS1N4T4jvVItqZ8MEYpykikv3E5/Yr9pcQDNpAnqKJxaaAegWtV7O1Z
   e4BJm7SXnXAJZAcZkz9aydrXZfERGFzMRQFvUIMZpLtdqVb+QUZgD5BfZ
   Q==;
X-CSE-ConnectionGUID: YzUCS19VRkqFvcPDmh417g==
X-CSE-MsgGUID: HZH5ikecQFCgSZhgD+du5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="173804739"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="173804739"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:56 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E483D480F
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 23EC5BF4B6
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B4D8BE293A
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:54 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8B7721A0071;
	Tue,  7 Jan 2025 17:01:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/18] python3-inline-snapshot: upgrade 0.18.1 -> 0.18.2
Date: Tue,  7 Jan 2025 17:01:37 +0800
Message-Id: <1736240504-5315-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
References: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10--0.000700-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrtzEbzNaGyQt4YeSlHZYFoghe
	eEB+ZGSZY2PW9ga289xGX1XcWsC8PzGAa4fqwM9Ll368qSp6b54XivwflisSrKZR9gDesrZOcwh
	qloOj04pBK08Q1gVeY+CVO/I0E6DpPXdZx1sZHpBbUzvsaHW6BkSuz0x2weESB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaKRmYpU4vHLUjsKXyzHgcEbfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtvG0VHndRxgLxDW517UExf8AWi2ueWKdPHb3p1QLd1vRMafNFi4bOedGVXvs0WbK92hdR
	lyy3qt5opRkKtUQvtogrtmE6lLOrqMZCqAq5WS3yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114683

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- [Alarm] Fix Alarm reuse on cancellation.
- [xDS RBAC] Support string_match in HeaderMatcher.
- [pick_first] fix shutdown bug in new PF impl.
- [c-ares] Fix inverted length check in GrpcPolledFdWindows.
- [RetryFilter] Copy the SliceBuffer from RetryFilter's cache to batch payload.
- [EventEngine] Add stronger wording on Endpoint::Read contract.
- [chttp2] Fix channelz address.
- [XdsClient] Add missing authority to XdsClient metrics scope.
- [EventEngine] API contract: Endpoint::Read will provide either an error or data, but never both.
- [Build] Dropped Bazel 6.x support.
- [Build] Override MACOSX_DEPLOYMENT_TARGET for gRPC Python.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.18.1.bb => python3-inline-snapshot_0.18.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.18.1.bb => python3-inline-snapshot_0.18.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.18.1.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.18.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.18.1.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.18.2.bb
index cd5e850455..8ea777fcbc 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.18.1.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.18.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "a93bcf0aec68edf27323fa8dfc902354ef9a730050ab8939a4b174419828db6b"
+SRC_URI[sha256sum] = "1be34afa453b75d120e12e8fb4724e28cb23f71b8f0fb0a7bc822a78c97ff826"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


