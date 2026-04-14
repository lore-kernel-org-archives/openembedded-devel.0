Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F31ED7BAF
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:29 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15983.1776163221945097186
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mi2FV001;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163223; x=1807699223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TpKzy8GWOFvH/j8Mpyr/NNyn8CghKSd7/uzFxWrtHuI=;
  b=mi2FV001vlilRw43MygwO+MGZ306++c+RE8Zj1Gr0TJiMoUOS6lYIl8d
   nmFJvxMJyPIDthj+7RDVfSP1/jajeIfMivCzAlw264qwTvM6Ss1/Dka4a
   8H5X9BJUeYO1ppJnOVN29ZZrMwE+3AW1R51SHU912J+tJuysWN9CsWMIT
   aOmQ/bj42rUlxoKxigQ632cltd+EMPIdl+UUwQn7+ammJ/ifFO4WyhHiB
   1z/Dwy5DE7EYVlbKj3OotAZ0XBOwOMTDMZLLgjt4goz6r0TXe6SFSry+J
   +y+ybsrO0vjkqmCNRC78qtG0xmuI8I65s+5NNaENYmqLOquQp33+8ci5R
   A==;
X-CSE-ConnectionGUID: jKcfoJmMSUG9SAvcNxVFPQ==
X-CSE-MsgGUID: Ks77ahb5QL+1vLoJ7ggPww==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="236867081"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="236867081"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:21 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 71C6F1000341
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:20 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 231A11000276
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8663814000EC;
	Tue, 14 Apr 2026 10:40:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/32] python3-imgtool: upgrade 2.3.0 -> 2.4.0
Date: Tue, 14 Apr 2026 18:38:31 +0800
Message-ID: <20260414103845.1728-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126322

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imgtool_2.3.0.bb => python3-imgtool_2.4.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imgtool_2.3.0.bb => python3-imgtool_2.4.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-imgtool_2.3.0.bb b/meta-python/recipes-devtools/python/python3-imgtool_2.4.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-imgtool_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-imgtool_2.4.0.bb
index ed647143cc..6b88fc0535 100644
--- a/meta-python/recipes-devtools/python/python3-imgtool_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imgtool_2.4.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "MCUboot's image signing and key management tool"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://imgtool/main.py;beginline=3;endline=18;md5=0645fb61e2f961a110302fbfdb227446"
 
-SRC_URI[sha256sum] = "fff72e4e793ac0ec02a493c19548715ccc0a2358afaeeaa10b49ccc2e0bd1295"
+SRC_URI[sha256sum] = "ef2db1d9e3f62b9bc9425a8e86c4ea7212c164f0a16e923d55250f0d8743342e"
 
 inherit pypi setuptools3
 
-- 
2.43.0


