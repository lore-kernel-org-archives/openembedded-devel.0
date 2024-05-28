Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB64C25B74
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:08 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.12675.1716860939674487270
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C98lV3rl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860940; x=1748396940;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=lu0HU+rO10A2xWAOiG2tYY2HME6x6AS8LQHKECFAJUQ=;
  b=C98lV3rlTVWVA6TsC8P+aWxss3vvRL6SonZ217Fq7wRBX8xCW4I8PnYW
   lt4tz/pwcpOasEY/9aUbq2ThxFObaDrF8uiA5jUck1nDnaqC6Y6bzbiBs
   uEXxM1H+LNU5rSOMKIvw7MC0cd/vEzT2w35+6tlFJgsWfQ6scBkr146J2
   03TSJzJu1ES+fnteLBfAffcXE4nUSFfMIE1/rm8Ih9Wen/Bfjr7PsBj2P
   U6v75DmV9Tx1jIEMvVn5s1t4/hpjE7+8/QWs/GlnozsoPHYXBb9Cxha5D
   viEOdmFfPynrMTjQ5PS0qqwEUMwEz/6qPzKUZSOXYsf8w8UdH02mgO1eP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="160525236"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="160525236"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:48:58 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id EBAFECD6E3
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:48:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C865CFAAD
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:48:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F4EE411AA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:48:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3BE781A000A;
	Tue, 28 May 2024 09:48:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 03/40] evince: upgrade 46.1 -> 46.3
Date: Tue, 28 May 2024 09:47:44 +0800
Message-Id: <1716860901-863-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--4.508800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbyu9fDwsqN3dWWlF
	7OhYLlctoiRiRqJbjhYF1Ec/oUIRldAy2LXTI7g3EXjPIvKd74DdKRNjzo2IOIAjsy+r+wvnO3i
	gRTX1/YoltEHvFWFwQXk48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w6R4W
	wG0yZ2eTztT3JLblFtvMEz/J9S0t9WUejQawVU/C3LAxybHzU3NbG8qnowmK3+6DNE1jX7knjYl
	ySRNi7HLKTmCy+GSeyCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110538

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix typo in URL

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/evince/{evince_46.1.bb => evince_46.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_46.1.bb => evince_46.3.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_46.1.bb b/meta-gnome/recipes-gnome/evince/evince_46.3.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/evince/evince_46.1.bb
rename to meta-gnome/recipes-gnome/evince/evince_46.3.bb
index 5077cfc20..47c0950b6 100644
--- a/meta-gnome/recipes-gnome/evince/evince_46.1.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_46.3.bb
@@ -33,7 +33,7 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'open
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "94bb525365b060a28c2f6017d22cbf2af5115507254aa42e9bfc000bbc18ab62"
+SRC_URI[archive.sha256sum] = "bc0d1d41b9d7ffc762e99d2abfafacbf745182f0b31d86db5eec8c67f5f3006b"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.34.1


