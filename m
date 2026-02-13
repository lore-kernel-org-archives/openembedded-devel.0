Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05802EDF158
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 12:13:32 +0000 (UTC)
Received: from smarthost01b.sbp.mail.zen.net.uk (smarthost01b.sbp.mail.zen.net.uk [212.23.1.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70232.1770984803332970360
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 04:13:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=hXWuqyv8;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.3, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01b.sbp.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97)
	(envelope-from <mac@mcrowe.com>)
	id 1vqs2z-00000002U4w-1s8a
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2026 12:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=UbcYJIiD/6vWAQty6HhF69a1GTPWAxdbf8pEKN3jfRs=; b=hX
	Wuqyv8UfXopkakMCxovRcl385YMfLCf2bHXERhUppuGYDnAgySu58tAN/AYOwMB2aOhMabMtRjDl7
	mGD6zlHFFAxfqjqwFjnCskZHnw3lLL0eZdBTGXmvS9RnZbUEIykboJZQPFqAdGHmh/NJAbqu9NRoW
	4KnfKofnnmABTdm4ABQaoSTMBAyQGHpA5mX7egDDzV9f4nvPboirXE6IWtgku2UeLH5AsAqyA83XK
	7pAIakWlOQPV0NfWHZd3LxwcqzNtuy2uhe9WHRttnUYFKmk5IJWkiRv3+c+WhGVL3Ff5xSU4Eo4gM
	tOh1yZQjaEAVV7ljMjJk7Rpa0JmQOdiQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.98.2)
	(envelope-from <mac@mcrowe.com>)
	id 1vqs2x-00000009hQR-2S7L;
	Fri, 13 Feb 2026 12:13:19 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [meta-oe][PATCH] waylandpp: Move wayland-scanner++ to -dev package
Date: Fri, 13 Feb 2026 12:13:15 +0000
Message-ID: <20260213121315.3342785-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-smarthost01b-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 12:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124387

wayland-scanner++ is only used during development so it's not usually
required to be installed on the target. wayland-scanner++.pc is already
in the -dev package.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta-oe/recipes-graphics/wayland/waylandpp_1.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.1.bb b/meta-oe/recipes-graphics/wayland/waylandpp_1.0.1.bb
index 485915db35..93c00bda03 100644
--- a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.1.bb
+++ b/meta-oe/recipes-graphics/wayland/waylandpp_1.0.1.bb
@@ -37,6 +37,8 @@ EXTRA_OECMAKE:class-target = " \
 	-DCMAKE_EXE_LINKER_FLAGS="-Wl,--enable-new-dtags" \
 "
 
+FILES:${PN}-dev += "${bindir}/wayland-scanner++"
+
 do_install:append:class-target() {
     sed -i -e 's|${S}||g' ${D}${libdir}/cmake/waylandpp/waylandpp-targets.cmake
     sed -i -e 's|${STAGING_DIR_HOST}||g' ${D}${libdir}/cmake/waylandpp/waylandpp-targets.cmake
-- 
2.47.3


