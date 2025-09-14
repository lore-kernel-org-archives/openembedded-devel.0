Return-Path: <joaohf@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4497CAC587
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 23:41:32 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.20335.1757893283691109293
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Sep 2025 16:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RrT/DTxX;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: joaohf@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-262346a67c9so3045295ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Sep 2025 16:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757893283; x=1758498083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pK4QtfARKPXQxqKciCLu/fBWR2B5+nz7F8Crxw9lRSU=;
        b=RrT/DTxX84jTrgLUVTf4w4iDR6Tl66eZYY5fkqlBAF5XL/ftayS+oMqky3uuTfhj7L
         uAMi6iduzHjwizL/vvHiJpyICcLUNSA+hJ8BBxbrFVD4CeHuRaqO4A3xiSACrrkEPU9c
         NKMO9ruAMQzof3f1fTIxb/YflMQXEeIvhO5IAsFazBm9sMUuOJaUrjuDI5KCDJq5xhF9
         DCQ6OSAIupKH5FPG1XEBFUaBwWx17t+wKB1DR+Zqz8f6lY4Ov+7goL49lBY7ptTiGMK/
         fmpptbPv/oEtIs0rBtxtRxunVW/y94xyxPqbT9AtU35N1eSabYe4WvW1+DBsG2LeH0xS
         st4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757893283; x=1758498083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pK4QtfARKPXQxqKciCLu/fBWR2B5+nz7F8Crxw9lRSU=;
        b=VjfLLNhPUKAhdkKLG935gmegoueqU2/tEki+HTUcrKxm30AJDN0SMf4LFmGhIESJof
         ZdTso8h0arloqYVT3e5qS5+ba6FV8vEBQcWfEA9HNYHiXzEtntJ2H8H2hYX/p7WpSf6D
         0jWybLku5LvRO2JN1hZtuELsueANKDa0ItqvbJuuSEO0B04mwVviodVtD+8EonclhwyQ
         C0syZQYGdwiYeCTQ8x8EVZ0d9NIw8dmuCg3ke+JdepUyL2B+ryKtnz4A06jzNLdQKdvd
         7t0LeYcT19PeutRlxjKJuTIZZDFghUM8gTtLcQc1Jje554lIgRuTyNc34FBGmCNlmEQz
         NxBQ==
X-Gm-Message-State: AOJu0Yye4nAEpnFukz463BqLAFmnlitzFBdQIxTtkkB7aR6XqAHTREi4
	NhDeqGXoOPGC6Alr9JXqBIC0R3A20TjgIsXdR33XTuwgFkIqF6LVvN/8binnTJym
X-Gm-Gg: ASbGncusB1jzIxeGZZo/71UJnIHY1jjIiav6CQwwwZuYNpFCLOKhrSfCkyqS/lbnm8f
	kciYEjHeptcAfn70xoO/4rAAYCxtpwAgkM3jiJ/cLeJlUFxyCCUvuVbtzKBjzSlJF/fiv6hACM+
	dmAm/Sch4lWqVIv9nimV9MY1YuhJyLtAo093F1JgyT7OIpRNjjNagtQHdjk0J2R/80uLL9sGQeu
	9L86mg9s8PLQfCpkzHOXqUN8Po48p7q46LHfTmhvVyrjsG/xUDrdntB8hfnfe+aSzyeT7k8AMKf
	FmdiZw0ZfIJTWBVkZoJCWMxZ5srqMvSxszalKwZciWU81M/0AqSKN/7pmVLpz7ivoxD8IgSwblX
	GGtbf1Ug8zoqFCuxEclfwSZI=
X-Google-Smtp-Source: AGHT+IGKz3rTsVJpaldjuK1B/MW3q+KzX6aH/Hmk+ZSMXhDbqwl6MLdbEpJXHAis0j8+6Ivf6sOZjA==
X-Received: by 2002:a17:902:d4c1:b0:24e:4cb4:8a2f with SMTP id d9443c01a7336-25d24e9c59emr65569585ad.4.1757893282844;
        Sun, 14 Sep 2025 16:41:22 -0700 (PDT)
Received: from porco.. ([179.193.12.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-264c4e98f8csm24714135ad.108.2025.09.14.16.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 16:41:22 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
Subject: [meta-oe][PATCH] wxwidgets: add back the possibility to add packageconfig opengl for native
Date: Sun, 14 Sep 2025 20:40:53 -0300
Message-ID: <20250914234053.3908005-1-joaohf@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Sep 2025 23:41:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119397

Previous commit (ce604d453c9d119e992bdcd7e0e0a01960b8d2de) removed packageconfig
opengl for -native. The removal was done in a way that it is not possible
to append or add opengl from a .bbappend wxwidgets recipe [1].

This commit adds back the possibility to add opengl to packageconfig when native,
using a weak assignment.

1: https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#removal-override-style-syntax
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
index 8d1090a171..fcb30b41b0 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
@@ -52,7 +52,7 @@ PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'gt
 "
 PACKAGECONFIG:append:class-target = " mediactrl ${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'webkit', '', d)}"
 
-PACKAGECONFIG:remove:class-native = "opengl"
+PACKAGECONFIG:class-native ?= "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'gtk', 'no_gui', d)}"
 
 # Note on toolkit-PACKAGECONFIGs: select exactly one of 'no_gui' / 'gtk' / 'qt'
 PACKAGECONFIG[no_gui] = "-DwxUSE_GUI=OFF,,,,,qt gtk opengl"

