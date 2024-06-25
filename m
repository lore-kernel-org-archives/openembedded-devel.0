Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACD0C31D97
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:15 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.166852.1719305825372752501
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fyPAwWMB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305826; x=1750841826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HXVFLIgWDWrCdj+VW3EAJUClOff4t0bThhOIsy9d3/U=;
  b=fyPAwWMBDlBK9rW9MTRdfLl41yi5h1YcX49G3Uj5EPFiY4OzT/cvJToe
   IfUZa3eDn3I52CresRdD5WJHntnwZWhrt6Ga84X03c5/s8omo53BlIZnO
   pICKrLJhE5+jDNEaOYJkCide6O1HElgJ8lTuEsQCls8TjCEDQw1+IyimX
   PkgHB+TAAEUbWfPaJFvncsMemPXbUd5cf13OsH0TP5eacEUi8H4V0U8Pj
   buqm+S8OqHqEuocWYP5vpIm/5rhRR00b4jARXo5p1NcIwP8+s4/MyCp7j
   VD9WEpaR3g+cWErewyhz+H5hZrz3zyERRdLI4JxHNiYSS5Q2U65wO+dat
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164831321"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164831321"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:03 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CC844DB3C2
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1894CD50BB
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E71A2007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 49DA31A0002;
	Tue, 25 Jun 2024 16:56:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 17/57] mcelog: upgrade 199 -> 200
Date: Tue, 25 Jun 2024 16:55:50 +0800
Message-Id: <1719305790-11484-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--1.979800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2v8LO5wKi8YUnDICbPFvtnTHEDUAqZUZM4ZiTLIQu4YpMSiwizsgluQ1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzNA7DvyiWaXYiDl
	nTrhHOLHyAOaSWXYrR7XyDmu/CZZ3GEXZl4WtHhWosEtkORHCw9+CPoeq0JUXMngC3+NlnrgXWu
	AGuwMryiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111029

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_199.bb => mcelog_200.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_199.bb => mcelog_200.bb} (96%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_199.bb b/meta-oe/recipes-support/mcelog/mcelog_200.bb
similarity index 96%
rename from meta-oe/recipes-support/mcelog/mcelog_199.bb
rename to meta-oe/recipes-support/mcelog/mcelog_200.bb
index 0a48fc48c..9d72e7859 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_199.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_200.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;
            file://run-ptest \
            "
 
-SRCREV = "c17897deb52daab300c585a6a6c2456d062d80cf"
+SRCREV = "955fd0917ab1b9f159443e5cbba1d0fa73486fac"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.34.1


