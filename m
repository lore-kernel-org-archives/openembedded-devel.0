Return-Path: <psaavedra@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C89C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 14:31:57 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by mx.groups.io with SMTP id smtpd.web11.9817.1675866712093074144
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 06:31:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=Nes5qQu5;
 spf=pass (domain: igalia.com, ip: 213.97.179.56, mailfrom: psaavedra@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2xAVDJVfph4RkiFYZmVUvWNfcobw9a64JASzI0eyJpQ=; b=Nes5qQu5ZlMRJdqjuCN++InOIm
	fO3KD98V5W7iHaswADzdY24frbkBZtJCP+/Yc4KBJnxRryHi27oZyo5zf/aZFwjqq5Xj3SX9g8HgE
	mLBQmedxAyiPOxrZxOS03VnTc0PLE+MoG50UhFyU/SsODiCoVa5DCkT9q4tF92xeRRZsShFgSvW80
	0bZlrAAGJi0GuxBEc9Z7n4ng/baKmQfeVeZrRbbMePYvdS+LxQMpIucp2GsBqReTh/kPAoOHSp9d5
	yXN5k09Fr74v2MVzzJZHzOR5HCkGaFtnMCj2ll9o3KB++4uDnuazJIKJkk0MQz0EprHaNDTy8yZuj
	mZZbDcjA==;
Received: from static-254-87-62-95.ipcom.comunitel.net ([95.62.87.254] helo=golpe.local.igalia.com)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1pPlUC-00CzPF-Ab; Wed, 08 Feb 2023 15:31:48 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pablo Saavedra <psaavedra@igalia.com>
Subject: [meta-oe][PATCH] graphene: disable neon support on arm 32bits
Date: Wed,  8 Feb 2023 15:31:17 +0100
Message-Id: <20230208143117.1714453-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 14:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100996

This disables neon support on arm devices only because it crashes otherwise.

Upstream-status: Reported [https://github.com/ebassi/graphene/issues/215]
---
 meta-oe/recipes-graphics/graphene/graphene_1.10.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/graphene/graphene_1.10.8.bb b/meta-oe/recipes-graphics/graphene/graphene_1.10.8.bb
index 813ff74ad..1bbe7ecca 100644
--- a/meta-oe/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta-oe/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -17,6 +17,9 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 EXTRA_OEMESON = "-Dinstalled_tests=false"
 
+# Disable ARM NEON support
+EXTRA_OEMESON:append:arm = " -Darm_neon=false"
+
 FILES:${PN} += "${libdir}/graphene-1.0"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


