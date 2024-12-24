Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C73BC02186
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.30508.1735032444345337866
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VzMX85r8;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032444; x=1766568444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ANVaPmspfMQ7m/SlSpqWjYgguuaFZOGnCWiIG09tl5U=;
  b=VzMX85r8HZkYdvlFmsClvxPyL1yj0vm1lxs9BovkLOBrYmDg7mewvW8g
   UOUJ3CT/0f+24czNWUB/J3/N3zBUE8eT0TXTHxZucw9NsP63pXD9Q6RHR
   OGnEnLn6Gcg4buLj0awrGaAM+6O/ratUGV8Net3JW3saWiqv+SlJQPI8y
   /rEjI9OxhF2oh+UIrk6OHN3NjlSYmXBiHrWytueOnXaoYCdqmrZdm9BWq
   A3Q4uZBokfZ2r+JXyuqc+KaNYlzSF7GneM4SvKvOR9NoeMfCaURg+Dqzz
   qnU5H8BKTA377tbCS37wP16y1kDXusZ9PwjPVguvW88wl9NRSDNavxDTk
   g==;
X-CSE-ConnectionGUID: JF5S3z0ESvCX6sufBIT5Ug==
X-CSE-MsgGUID: Rz6onqX8RHmln3v/EgHQfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="172125381"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="172125381"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:22 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B42AD5011
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E1FE0F740
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7AE156BB6B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1FD8D1A0073;
	Tue, 24 Dec 2024 17:27:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/67] python3-fsspec: upgrade 2024.10.0 -> 2024.12.0
Date: Tue, 24 Dec 2024 17:26:19 +0800
Message-Id: <1735032421-13513-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--0.214100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr+gx7Y6zr6DncxffnPcZGmwzK
	NF0GZcto1wHmmK+WQ46yy5hP9xC/zB1YpEPWJiyzP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsHqYviVWLIXKeBzEkCCpnRmeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDlhZkv0OuEIuMBXyjmuN8aOT/BATZXpK1Cd82+J4HOnf8hZNLsaPWNMP9784doGHb3Ymw
	OF9Kpm7cqFN9OKcuepAHty/s5vzm4K+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114499

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Enhancements
------------
- "exclusive" mode for writing
- "tree" text display of filesystem contents
- async wrapper for sync FSs
- new known implementation: tosfs
- consilidate block fetch requests

Fixes
------
- better webHDFS proxies
- syn FSs in referenceFS
- don't serialize file caches
- race condition in local ls()
- missing/nan references in parquet
- _un_chain kwargs
- async _cat_file in referenceFS

Other
------
- fallback implementation for _fetch_range

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-fsspec_2024.10.0.bb => python3-fsspec_2024.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fsspec_2024.10.0.bb => python3-fsspec_2024.12.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2024.10.0.bb b/meta-python/recipes-devtools/python/python3-fsspec_2024.12.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-fsspec_2024.10.0.bb
rename to meta-python/recipes-devtools/python/python3-fsspec_2024.12.0.bb
index e6c2b45f8c..faf33d28dd 100644
--- a/meta-python/recipes-devtools/python/python3-fsspec_2024.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fsspec_2024.12.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/fsspec/filesystem_spec"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b38a11bf4dcdfc66307f8515ce1fbaa6"
 
-SRC_URI[sha256sum] = "eda2d8a4116d4f2429db8550f2457da57279247dd930bb12f821b58391359493"
+SRC_URI[sha256sum] = "670700c977ed2fb51e0d9f9253177ed20cbde4a3e5c0283cc5385b5870c8533f"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


