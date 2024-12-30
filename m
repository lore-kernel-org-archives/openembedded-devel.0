Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 528EFC02180
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:30:50 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.58742.1735543848832504524
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e20TMW9f;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543849; x=1767079849;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9IbMJVm3FE9N+U4TUDfwTD2wvyFEvF5GDUUeQNOMeLQ=;
  b=e20TMW9f80gm7ODIIP6ki8my/t8C7GQrV2EU/N6F406BwOcS5utqdSw+
   e9gh3uyTuUZcilQjMQ/eeQ+lwAOi8rlis6QGmm0TRfXFt0umNZo0L+PgB
   oijjwpp2VsRiJRrZj6irW1yReoJyqpcalzig+sQ5tJpfGJULKgycdGnzy
   KCtvNG7SD6yEncDuMIEfS7AQMFYhI6q7oD4RYi6xuigC48lvGqzfbrHoh
   sLZqgPZe4ZwBY5yTFtE5xD1njIAmCU+JHhe1fmNSkgwnujyexF/6kIpjX
   GgrayTiFMf1g6/pQrni2Jmd0xguz2ShD1Bq/Bvw6L0zKn1r4n821EJzto
   g==;
X-CSE-ConnectionGUID: I8+5m5DsQke0+dPo2VnWUw==
X-CSE-MsgGUID: ZOQOQ3qLQPaRHPREEx7A/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="164216973"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="164216973"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:30:47 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 47EFFD6EA9
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D5DBD5040
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AE82920074EB1
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:44 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 58F131A006C;
	Mon, 30 Dec 2024 15:30:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/18] python3-path: upgrade 17.0.0 -> 17.1.0
Date: Mon, 30 Dec 2024 15:30:31 +0800
Message-Id: <1735543836-2512-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
References: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10-0.096800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZEzEoOqAAVLN9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrTfSadPoYFBeSBZrgtd3G+Ywn+GHA/FuK0xwzzTrgcB247YWKQkjJ/U5V4
	uAOvZ6xHODtlIUdcLjn9jIPbBGnZKP3nmyspPBiB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 07:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114593

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-path_17.0.0.bb => python3-path_17.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-path_17.0.0.bb => python3-path_17.1.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-path_17.0.0.bb b/meta-python/recipes-devtools/python/python3-path_17.1.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-path_17.0.0.bb
rename to meta-python/recipes-devtools/python/python3-path_17.1.0.bb
index e809952079..066f756730 100644
--- a/meta-python/recipes-devtools/python/python3-path_17.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-path_17.1.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A module wrapper for os.path"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "e1540261d22df1416fb1b498b3b1ed5353a371a48fe197d66611bb01e7fab2d5"
+SRC_URI[sha256sum] = "d41e05ed4fa1d4f6d702df3c1e0a1a255d7b544287432456455dc7c51e5f98e9"
 
 SRC_URI += "\
     file://run-ptest \
-- 
2.43.0


