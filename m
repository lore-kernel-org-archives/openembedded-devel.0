Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18531EDE9A0
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:32 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.18331.1725959004373178377
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r/nfhZIw;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959006; x=1757495006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FZgjdXVapoVSLJSyml7MFAJqR9xtSwQash14+tJxAGA=;
  b=r/nfhZIwBW2hXM8DUlt2yOBMTotProywkPh0PZRlmdFCm5SUT4qkFFlV
   YdI5jtk7mE1z5LAWN47EELRCJmZa0Z+4qLg+dPkeYyE5F37VVjActuv7R
   f3dxeEjyDiVX0PLDuqttVf3zO5HpPv/Pw9kRbF+fJIBsYyJeahreSTci7
   J9dTX8Ime2uISALnHfGnfIRgszjDRAVeKAmUx3PAcpWHVhA97eN1STBtW
   C5ebxPxJgEV7R+1O2WX0B9ROgmb9TrC5ULeK2sXTO7iyLBEMK70tOR3to
   ms3EhQdg3jMFrs3FHj7YyvwVWOBEgpjRFWv7IFRc7N3+GKnhDBLV5yhjH
   A==;
X-CSE-ConnectionGUID: N8vCryAcSUGWBynMn5k9NQ==
X-CSE-MsgGUID: zyY23drTRUKQe/7wlupLWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="173214174"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="173214174"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:24 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 52978D29E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:22 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 91A53D73A0
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 321E9200894B0
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D8B201A01E9;
	Tue, 10 Sep 2024 17:03:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 09/42] libcompress-raw-lzma-perl: upgrade 2.212 -> 2.213
Date: Tue, 10 Sep 2024 17:02:37 +0800
Message-Id: <1725958990-5719-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-0.427800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy+WtdtaO3wUEOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrfLZXkeAyYiCBeTZ1yLto/lGfsuOx3NSN1DrY4mstf57UJqMDAyR0FJfZv
	gq8tPBPKK54lxEtIPL3BcX9w4RabhIq49dAKnyeB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112195

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...aw-lzma-perl_2.212.bb => libcompress-raw-lzma-perl_2.213.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-lzma-perl_2.212.bb => libcompress-raw-lzma-perl_2.213.bb} (90%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.212.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.213.bb
similarity index 90%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.212.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.213.bb
index c4cba470b..62521dfe8 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.212.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.213.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=2a0fd6d30eaf8828958
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Lzma-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "4ba7ab803bdba2d7be7d55d4a2668369d794eb8d8d6bb0db6b74fd9b4ce18cac"
+SRC_URI[sha256sum] = "6b979a8347701ced3ac26123d428c1f202b7999850444da19c4aedbb7c862cb7"
 
 DEPENDS += "xz"
 
-- 
2.34.1


