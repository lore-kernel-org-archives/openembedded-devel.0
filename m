Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42774C624D7
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:30:12 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9759.1788345008772081999
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oIHL8VPL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788345013; x=1819881013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VQUdqz0NGdKguSK5DXrlkiLkFpV6nuidJPO1+EAEOxI=;
  b=oIHL8VPLLfC5cIQDBRbtE9G0nYrtFqb9sWG8sbLy7GW9ynIH6K05eanm
   QplTNHaWJ/rBO1kuoLLKZEfsk2i/ETOVRf4stxLD6wr7ehn92m6K3UwUL
   /L5S9SMOwtQGFff+c2apFhatuf0qRxUTCx2F41Ev3ijD5vPfXUNV7xWMR
   0DAZUo6NY6FPuAgueMMdRNmdpXARDlKwxwUmtQ0yKfIIgEd/Se3JdVtyx
   jbZOw5cZLmc1YPSF+mQqkoiQDZ0tP6SaDsgRELeEV//eC7dgPk7TdPlSE
   KeD2wbbbzDmIQT2B2VHhiwNmP5Q6tdA6lQExdwgOPnELUycHLzxZh3VDh
   A==;
X-CSE-ConnectionGUID: BRxkNVaeQJiErKz5TF/9rw==
X-CSE-MsgGUID: JhuKAXUfRS6PAVSCUmPdDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="253572166"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="253572166"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:30:11 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 11E06820C13
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:30:07 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id BB199C0055B
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:30:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id BC7372000224;
	Wed,  2 Sep 2026 10:30:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 34/34] xterm: upgrade 410 -> 411
Date: Wed,  2 Sep 2026 18:29:00 +0800
Message-ID: <20260902102900.1296-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129693

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_410.bb => xterm_411.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_410.bb => xterm_411.bb} (95%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_410.bb b/meta-oe/recipes-graphics/xorg-app/xterm_411.bb
similarity index 95%
rename from meta-oe/recipes-graphics/xorg-app/xterm_410.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_411.bb
index e116eedad2..5398bfbe05 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_410.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_411.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=413ff95100710d7a81
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-include-missing-pty.h-header-for-openpty.patch \
           "
-SRC_URI[sha256sum] = "7ba9fbb303dd3d95d06ca24360d019048d84e5822dc6fe722cd77369bdbf231f"
+SRC_URI[sha256sum] = "969be283670deadd66934865c4de6c5ab045e3a3facc2b228decf91a20d8c36c"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.43.0


