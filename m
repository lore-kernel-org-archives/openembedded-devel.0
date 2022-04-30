Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A58C4321E
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:01 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.26014.1651346338330106380
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q213r+n2;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 15so8903471pgf.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ekJh0Pj7hzSx1Ho+njpQvXbXtlcDCHlNCGu6QF570XA=;
        b=q213r+n2pAOMGkIQvR1RDSfCQN/azVFq1QM6drYXjg+PyldCn2eJa+zuugSjry6iEf
         LUn8EIJnUrrErvjt/U0Jq5bQEIUYs/nvGKRa3VLwY6DBpWKY17U+W/lyFJBythhK2lMp
         ma9pvIATsTBSegBjXIZVbvDXnJJpYbYh7pL0lB6mSu64rZn0HLAImX/SjqR5FPK2nNkm
         1dNGDHJX7wLMpsDMxGcTjH2aGma/8G8RDH/qc68KooQHBjOk86dRxhVdZb8wOGNW+d+C
         txtt54yGWHmZ+jhN8fQDyYleBc5PWmAAudBEuVL7fqcfKIXuJYW9/vJ7sVZOXnETa4LV
         zuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ekJh0Pj7hzSx1Ho+njpQvXbXtlcDCHlNCGu6QF570XA=;
        b=qWmz8De6ERA7rpORknd3yxEqjBzSYlvJq6C/HvQeaGwAg3RE7TonLEiqctHcn6IPu4
         zuCs/uYBWZOCFaUjI7+N5yX3CYPE/+JoiQTVNr7fTASKaUHxlm5AbT2fts1mRbUZNaNo
         hvLjJfv8w0kS3C97SlqnL7igVQ3QAxjW7oPRkXBCbvPfOSSvCEYGUI6n6DI4mBJm2Wze
         +IQkn2/B2AaPCGJ4MB3tIECVB6MmvKj6EcOEMfOvPiCtKjzxobTA1p2qbI33L59HWRDu
         1pLIAehN7Rp2+GrF6BAyetEII8LtuGQXWKoATcu/JaCgo79aqNta7cuHzznc4vqOuARK
         T5Zg==
X-Gm-Message-State: AOAM5317cGLjwr0c3HejcnfUupxAK6bt+Wl+veJApNgtGL4XrCrkbrc1
	eoq01UpT9C5nDsrJ9uk2RL61VbG2Hjsm0g==
X-Google-Smtp-Source: 
 ABdhPJxPKcEVIWp26/DdI1ONAbXi/OpjJL+HzXa+anCuI2HDM/AOunVHLiQLfm/N7fQH4nMN6ut5Ag==
X-Received: by 2002:a63:87c3:0:b0:3aa:fc1b:3459 with SMTP id
 i186-20020a6387c3000000b003aafc1b3459mr3936336pge.210.1651346337460;
        Sat, 30 Apr 2022 12:18:57 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 20/39] libadwaita: upgrade 1.1.0 -> 1.1.1
Date: Sat, 30 Apr 2022 12:18:00 -0700
Message-Id: 
 <09047b876f368228c012e082bbc4b42b3a9fb0fb.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96887

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
- AdwAvatar
  - Fix initials not updating after setting custom-image
- AdwSplitButton:
  - Avoid state changes during dispose
- AdwViewSwitcherTitle
  - Clear pending idle callback on unrealize
- AdwPreferencesGroup
  - Annotation fixes
- AdwPreferencesGroup
  - Annotation fixes
- AdwTabBar
  - Ensure indicators are clickable with inverted=true
  - Fix resize deferring with non-expanded tabs
  - Fix scroll animation stopping too early
- Mention AdwComboRow:selected type in migration guide
- Fix a Meson error when using as a subproject
- Translation updates:
  - Abkhazian
  - British English
  - Bulgarian
  - Catalan
  - Dutch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6d73127ced18b6702f4bddb9c9ffb1cdcf41b71c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libadwaita/{libadwaita_1.1.0.bb => libadwaita_1.1.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libadwaita/{libadwaita_1.1.0.bb => libadwaita_1.1.1.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.0.bb b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.1.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.0.bb
rename to meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.1.bb
index d4820d1244..8ca3be352e 100644
--- a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.0.bb
+++ b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.1.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gtk-doc vala features_check
 
-SRC_URI[archive.sha256sum] = "aff598803e810cc28266472cf5bf65e5ed5b90bb3523e206b06b14527325010e"
+SRC_URI[archive.sha256sum] = "491169d4f6a11765328996bc088272d05c7235453bc0ee73c20dfd4bd67b401c"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.25.1


