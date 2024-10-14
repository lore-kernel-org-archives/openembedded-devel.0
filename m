Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3626ECFC51F
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:14 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.50338.1728896164831089953
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OYzALZR1;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896165; x=1760432165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=whLrK3SvsUc8fGt4SjVCCaqdTnWdfgmgOE47uaAKYZk=;
  b=OYzALZR1Ant5LEBBxFmlMvZiGvZKd2YT9M5BFYGOvdP0js4CpVC6go67
   xOFMN7nF41PNm4rS1GXm3KlSOMRhKNohHPll+z+uEFBewds2Vp3OEuCsI
   Fx1VvAPzdAQbrY7wMqf4AmqnLKvn+6zByLQGN5wciLQNBsA4xdjKuR+f0
   eHl7Q7GJ8LPWpfZmx08+3NiyVAsrBnK/rIrvEl34+JfywcwZBHjVhRadE
   Bx3x/tI3nN8VDgOmYtEfPcC8Si+SS5ijRK3QGq4KLVp/x/R0MboA/OJv0
   CNw/FaGk5s6gheZP9fMG+yNXIGI3eKBT1lnRevUdnwAkA8O29vTkF+Lb2
   Q==;
X-CSE-ConnectionGUID: eHdU+v6GS7aGILjAty273w==
X-CSE-MsgGUID: 1wv0v0OKQviSzSjZeQwpcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="164060386"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="164060386"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:02 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 723F9D4F55
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id BC352D5043
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5110620071A00
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F086B1A01E9;
	Mon, 14 Oct 2024 16:55:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/54] python3-bitarray: upgrade 2.9.2 -> 2.9.3
Date: Mon, 14 Oct 2024 16:54:38 +0800
Message-Id: <1728896115-2944-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-2.820700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqx4YeSlHZYFou1v
	YggOx1AL4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedli+
	BaqMwTNrVuPnsbKmJluuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7KKx
	0Jy4vu5U/e38FBRCGlLXLicgySIESuLSFuTLxRuIT2DnB5LzG0kKdpinqIcNlgMG26SW1ctFzCx
	HiVnHWx8VMIrY3aUzqCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112869

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* add official Python 3.13 support
* update cibuildwheel to 2.21.3
* minor simplifications
* fix some typos

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_2.9.2.bb => python3-bitarray_2.9.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.9.2.bb => python3-bitarray_2.9.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.9.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.9.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.9.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.9.3.bb
index 7d7be0b1a..c19307cc9 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.9.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "a8f286a51a32323715d77755ed959f94bef13972e9a2fe71b609e40e6d27957e"
+SRC_URI[sha256sum] = "9eff55cf189b0c37ba97156a00d640eb7392db58a8049be6f26ff2712b93fa89"
 
 inherit setuptools3 pypi
 
-- 
2.34.1


