Return-Path: <clopez@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48101CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 22:25:02 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [178.60.130.6])
 by mx.groups.io with SMTP id smtpd.web11.269079.1697581497263299267
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Oct 2023 15:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=mhGB54hT;
 spf=pass (domain: igalia.com, ip: 178.60.130.6, mailfrom: clopez@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RXqq7uAkCWMD0d4xalVFFWDmAMEJoFmlEQuZVrj2ZdM=; b=mhGB54hTUEDnBTGJcLrLSEKkNR
	XDKza9D/Z2U7B4i68huwDdxna84WWieiWsD0ClWcVB8YV1ZAzmXihLcO2/NyFtMnT0b4PlvhpJQSt
	ZaXnyUKGpZ7KppWHzCpVd26lF9rtnNVN6ZLcJsFohDWbxE77uks6LhDU6xN1N8xoWkO1o/Av+5zKs
	0YM/pw3gc8tIpZdw/xVLklSrFy/Z9U5HskkLTE/epzPGgh6TtdEDR2KSnHs4tAdEbtJbLyguASkfY
	3zU8a8PMniGWtigQKbiO/9lj4CymWTBg15EuJ7NMTkSvJbfIQGkzMUpPDXGlEqkrnRCkJN7Ueznqh
	lfU5sQAw==;
Received: from bl14-19-118.dsl.telepac.pt ([85.247.19.118] helo=trinity.bot.igalia.com)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1qssUg-001bIh-N1
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 00:24:54 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libbacktrace: Update version and enable shared library.
Date: Tue, 17 Oct 2023 23:24:54 +0100
Message-Id: <20231017222454.26684-1-clopez@igalia.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 22:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105563

* Update to the last version as of today.
* Fix typo: EXTRA_OECONF
* Enable building a shared library (.so)
* Disable building a static library (.a)
* Manually passing `-fPIC` is not longer needed because that
  flag is already enabled by autotools when building the
  shared library.
* Enable the RISCV64 build-recause libunwind supports this
  archicture since OE-Core-rev: 2b2f6ff01efd

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 .../recipes-extended/libbacktrace/libbacktrace_git.bb    | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb b/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
index 609e55f4a..46fa81866 100644
--- a/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
+++ b/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
@@ -11,20 +11,17 @@ DEPENDS += "libunwind"
 SRC_URI = "git://github.com/ianlancetaylor/libbacktrace;protocol=https;branch=master"
 
 PV = "1.0+git${SRCPV}"
-SRCREV = "4f57c999716847e45505b3df170150876b545088"
+SRCREV = "9ae4f4ae4481b1e69d38ed810980d33103544613"
 
 S = "${WORKDIR}/git"
 
 inherit autotools
 
-EXTR_OECONF += "--with-system-libunwind"
-
-CFLAGS += "-fPIC"
+EXTRA_OECONF += "--with-system-libunwind --enable-shared --disable-static"
 
 do_configure() {
     oe_runconf
 }
 
-# libunwind does not support RISCV yet
-COMPATIBLE_HOST:riscv64 = "null"
+# libunwind does not support RISCV32 yet
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.30.2


