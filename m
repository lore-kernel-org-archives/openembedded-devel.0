Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2313C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:51:35 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.152176.1692150689871881325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="128229567"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="128229567"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:51:28 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CC481E4458
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:51:25 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0737AD3F1C
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:51:25 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7AC1920076847;
	Wed, 16 Aug 2023 10:51:24 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.71.4 -> 0.76.0
Date: Wed, 16 Aug 2023 09:50:49 +0800
Message-Id: <1692150649-6060-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10-6.650700-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrhdJtcweYFQwFf2cKXhyij+bz
	+w3eW/bAD/OFpcSAvwu130KPLZ1jhcOY7UMlS7FZEhGH3CRdKUUhBMJtJ3C24v4DDXoaCqk7BNd
	m32YG6n7gK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJRSLgSFq3TnjEd+K6O5Nt52WL4
	FqozBM2tW4+exsqYmWKI5/U0OcIj6tYv/FAmebjp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyMdRT
	5TQAJnACPb6oPYE8XzDcMU78LCFUOJP6FXwY/0FrePYq2RLS3sOt8fcxv6l4YC7tSoUbnnhEMHw
	+HqXfLFfaWmMO8D3DKjCh9NHCvi0
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104403

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Feature
--------
    Improve performance responding to queries (#1217) (69b33be)
    Expose flag to disable strict name checking in service registration (#1215) (5df8a57)
    Speed up processing incoming records (#1216) (aff625d)
    Speed up unpacking text records in ServiceInfo (#1212) (99a6f98)
    Add a cache to service_type_name (#1211) (53a694f)
    Speed up processing incoming records (#1206) (126849c)
    
Fix
-------
    Remove typing on reset_ttl for cython compat (#1213) (0094e26)
    Revert adding typing to DNSRecord.suppressed_by (#1210) (3dba5ae)
    Revert DNSIncoming cimport in _dns.pxd (#1209) (5f14b6d)
    Race with InvalidStateError when async_request times out (#1208) (2233b6b)
    Improve performance of ServiceInfo.async_request (#1205) (8019a73)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.71.4.bb => python3-zeroconf_0.76.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.71.4.bb => python3-zeroconf_0.76.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.71.4.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.76.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.71.4.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.76.0.bb
index ce92c6478a..86f12ab384 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.71.4.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.76.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "b988425f6bd0d4f11f05fa258a6c49d9f9956777e9af00ca98c4ed3f743bd677"
+SRC_URI[sha256sum] = "80478e7e61eb2aac8043ead671d9b248333d6a6929153023a50774dd1e5dbd2c"
 
 inherit pypi setuptools3
 
-- 
2.34.1


