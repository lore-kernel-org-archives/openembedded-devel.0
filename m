Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396C7C27C7B
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:59:08 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2499.1718161143948066197
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ogXV5VNg;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161143; x=1749697143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7UJBgG5W5qfh207JHluZ8dcedlLqXli+usB8Oh26k04=;
  b=ogXV5VNgiUUQnKzqq0Gbyr1X0+4TvyBdVFkcpkdqPuVg1PcX5xxQ+Hb0
   7OWFas84YVa/NMAc5szMXbeGxRuNz5dTp/g+DVB5jmj0cN7JZAah7dy28
   i2Z8KgvSh/42pqmYSrZu0ploGYbJadO8pBglmWTSiPW32DOIJ1megD9OP
   aRVTYyXSmArMMG+uhNgNipDiTSXyNy6pObJqVAOtlx19NNza1sHiwc06c
   fKo6Xdi7HJhgYW6/yBuKBIAGq0CtkgckR7R4jS1UxbpN7B1hpNynCWF7c
   0W1J4VQ5Qit58UXubbHiaGGfMXRuuMo4TTevPELV89BM0lB+FhgS+YsyZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="141617849"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="141617849"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:59:01 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CB196C68E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:59 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 17FEFEB3F
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C99D20071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0D9581A000C;
	Wed, 12 Jun 2024 10:58:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 41/43] squashfs-tools-ng: upgrade 1.2.0 -> 1.3.1
Date: Wed, 12 Jun 2024 10:58:14 +0800
Message-Id: <1718161096-29710-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-2.163100-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9ceZzJlaRLGxTSg
	hb/pcAwygwSBmfF7XEY221P4+0gd+Ox6sVFArPFqqhcdnP91eXEYFQt+VRO1dDABh2rVVNejli+
	BaqMwTNqV7ePBzIkH4fL3NxFKQpq17VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YNdDssRjZE3eRY0
	JyfRdA4o46E8WjvgOf6lMHeJW+THIfE8yM4pjsD7q9UFRTJ0kKxEHRux+uk8hxKpvEGAbTDmLfY
	n8dwkS2fwZ5N8ZZ0AVTaZ+G+XgKggahbNSyMfEcaJEpWwQZjiLhNtqhTspGSvTIE5MHKXDNJc+o
	ED7HPrbF4jj/OlLD1oK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110880

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- gensquashfs: apply xattr file also when using a pack file
- Fix broken C++ guard in rbtree.h
- fixed fragment table size typo
- rdsquashfs: improve unpacking error message on Windows
- rdsquashfs: add a workaround for unpacking forbidden filenames on Windows
- tar2sqfs: Add option to exclude files
- Fix compressor ID enumerator in format documentation
- libsqfs: add a threshold for extended directory inodes with index

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{squashfs-tools-ng_1.2.0.bb => squashfs-tools-ng_1.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/squashfs-tools-ng/{squashfs-tools-ng_1.2.0.bb => squashfs-tools-ng_1.3.1.bb} (94%)

diff --git a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.2.0.bb b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.1.bb
similarity index 94%
rename from meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.2.0.bb
rename to meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.1.bb
index 880af82bb..a542396d4 100644
--- a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.2.0.bb
+++ b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.1.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=a709b68f1ce8a9f10aeea6401446c1f4 \
                     file://licenses/zstd.txt;md5=8df8137b630239cbdd4c0674124cb0c8 \
                     "
 
-SRCREV = "f2a3ad56e40c9711b23371238f9fa07dd24245f1"
-SRC_URI = "git://github.com/AgentD/squashfs-tools-ng.git;protocol=https;branch=master"
+SRCREV = "8f9966c8ea3ea8a854941d041e7fcb9eb4f772fb"
+SRC_URI = "git://github.com/AgentD/squashfs-tools-ng.git;protocol=https;branch=fixes-1.3.0"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


