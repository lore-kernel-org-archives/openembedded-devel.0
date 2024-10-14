Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5DBCFC517
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:14 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.50339.1728896165901350629
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cEvKZEZ4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896167; x=1760432167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aie+NETzWE0z0q+0/n2TiFtxSYdBRIFznBsoCXkZEoE=;
  b=cEvKZEZ4uFU3j3sxTrKr0jSw38OJq6+KoKaZNt2Vz1JFmYZwpDkhnRLg
   1161M9vHSW0nLaxbPNzYzLHiWy7beDtbwZpVCK3t8UUZdTVT1YzCu7jKQ
   FWo3sF728xoehyMQ5ID1vGTcumiaMZ6Y5QIPOyoIkF9CSrshLrvuQ2wH9
   JEbEXkZxWaYKp/Y2LgvJRvRCDWL++tPMci4zqQp6y7vl4HYn+QCpHsyU4
   Dc2Qs8GEOwsU/64DdZzsH0gMaRBwGoj2dIHE+SDsRX871xJK2omtK4n7V
   oQLfdCrkbANquri46zLEet5LL+F+95q/fxDhdnUrBPcmnJr4OIBadcxd5
   g==;
X-CSE-ConnectionGUID: sn9mRUWvThuhh8grJjt2RQ==
X-CSE-MsgGUID: JYCb1klvSX6fv9JT8Pruag==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="156132005"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="156132005"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:04 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 937C4D6EEF
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D4712D3F01
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FD74200649DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1C7CB1A01E9;
	Mon, 14 Oct 2024 16:56:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/54] python3-dbus-fast: upgrade 2.24.2 -> 2.24.3
Date: Mon, 14 Oct 2024 16:54:43 +0800
Message-Id: <1728896115-2944-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-5.069800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/2g0UfsHxDzQOi
	VFpF7nSJKqrQ7lLcMnygKELwwYMNFm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSyBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIx1FPlNAAmcAOYZ
	qGDzxYB56AhYTsavHt0BixL8BHCdW13cVt2fKa9OP4e5/ViOcs4rk5hIsPxbRQI5yXJWDBmluR6
	p0zFv4ZlXSWXd9bEtk=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112873

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Remove deprecated no_type_check_decorator

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dbus-fast_2.24.2.bb => python3-dbus-fast_2.24.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.24.2.bb => python3-dbus-fast_2.24.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.2.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.24.2.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.24.3.bb
index ccac69924..bf267ed86 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.2.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "20c517dc70dbc940b8bf2e0f079abf3dfe821fdda3013641a17e3d8f18e131ae"
+SRC_URI[sha256sum] = "9042a1b565ecac4f8e04df79376de1d1d31e4c82eddb6e71e8b8d82d0c94dd3d"
 
 PYPI_PACKAGE = "dbus_fast"
 
-- 
2.34.1


