Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABF9C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:00 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3418.1784111991858792145
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DFDlYI8I;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784111992; x=1815647992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F9WWFBdlFVWzeWsdXUeDrw4xDGEnJy62U8BE4dYtLNY=;
  b=DFDlYI8IFxusMZWVE0qY+M24R1nENHjYk1mcWdEvhjJ5pbn9MpWaCmah
   bzdBoQoNOiDhWlodS5aNqxPsLUjiijXidvPeoe1Dofy+52qlk+Ti5JPiP
   2yfp2fiwhmONarHU2CX+IJXgfMu/LaKk6oboCEZGIMjFtn67Tg5HhXRD+
   NQQdfNWr9ibPEC/8h/J39iTD92DrwWz9I38Na6UE7Ik52dKPRz1h1O9LG
   yBk5GVmP3/toBTEne7k5UCE95xHW/Tt0Hy/497Xek2x/lvzSP/r9y3njE
   q1FzglV44U8rTFBoggVXD1arlLQ1XKltBibF1m1tK0Qx23cyUgG0FRbe6
   g==;
X-CSE-ConnectionGUID: 4MdQfKH6Q2a8cw27LcFvKg==
X-CSE-MsgGUID: 1wtNcw+uRp6AXbNo83DSfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="235473259"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="235473259"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:39:50 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 062001C01699
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:50 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id AF59C18000D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id D401A1801122;
	Wed, 15 Jul 2026 10:39:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 09/44] proftpd: upgrade 1.3.9b -> 1.3.9c
Date: Wed, 15 Jul 2026 18:38:39 +0800
Message-ID: <20260715103914.2120-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128182

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Issue 2135 - ExecEnviron values not passed due to regression since 1.3.8.d.
- Issue 2146 - Stack buffer overflow in MLSD/MLST handling for long path names.
- Issue 2158 - MaxTransfersPerUser no longer enforces configured limits.
- Issue 2163 - AdminControlsACLs for config, get actions not honored as they
  should be.
- Issue 2166 - Memcached/Redis-cached JSON TLS session/OCSP entries decoded
  into fixed buffers without bounds checking.
- Issue 2173 - RewriteMap unescape builtin use causes one-byte out-of-bounds
  write, fails to reject illegal characters.
- Issue 2188 - SQL group name lookup concatenates client-provided group names
  without escaping.
- Issue 2190 - Authenticated SFTP sessions can overflow the SFTP packet buffer.
- Issue 2210 - Default Controls socket ACLs unintentionally allow all users
  access for sending Controls requests.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../proftpd/{proftpd_1.3.9b.bb => proftpd_1.3.9c.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9b.bb => proftpd_1.3.9c.bb} (99%)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9c.bb
similarity index 99%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.9b.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.9c.bb
index 3da67c9e1c..95c9f3919c 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9c.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-SRCREV = "390b21555268bbc64b66d2dfa7ae40476419b80f"
+SRCREV = "78a1bea439969913d7002bfb16ee7f0f60e262b4"
 BRANCH = "1.3.9"
 
 SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https;tag=v${PV} \
-- 
2.43.0


