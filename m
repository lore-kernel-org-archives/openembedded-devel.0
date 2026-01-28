Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F3AD3567B
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 05:51:30 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6994.1769579482379760200
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 21:51:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Saks56j/;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fb2314f52so3854623f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 21:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769579481; x=1770184281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4oQzL3O7wDPSh0A8R55232JOThFkCN1Ymb2nhru2GM=;
        b=Saks56j/Zp7j3RoAv8nJBo4lYMKkrxK4nWuJe9LLp38Xsfbs2oQ/MaKYkW0OAzP41i
         6CkMHer6gfXD99VtebVavOK2YRVCNM2ZZ0e5T4WZNF6OPHCG+xxjjYoZfku2eeGMi3T0
         JPSLj4J2p8wbRehJM977CvatyH7uTX1OulSCYiAYx0V/JIsPPheLVFAIdtkWvZJd0K/E
         aH7UjMKy2cEmITxgHjO+JQn3NOlTzflPZz+myE1MNkUm5eQy7Rfi/vuFd6TNjm0i6wCd
         T8BqAylvcc0uQdXsUHfTSS18LwT0rUjJbMDEOfhtcpqXpGzkbC6POX5Qb8bnJgqaX7Dq
         j/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769579481; x=1770184281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W4oQzL3O7wDPSh0A8R55232JOThFkCN1Ymb2nhru2GM=;
        b=VZvJtKeCIsRLnyNgHHBM31utgWAPOUKf1dSwZkgL3cAySNvYx1T6nxzasUjga1hJrC
         D7oIOF0hwvW5NOta5hon0jXLE6pjwUyekrH/PPpaiUk+9qXpFx5rueszga3LBV4j0Snp
         gHMpIl0g3eKhmT5GYToAn7LaIG5+aFGfzTS7Bm+lAHpzJyyDi27ZGtC2jG2NhPtwpTmQ
         e56nl9+x1YGhG4yexEgW986fMNV5dOTjkQV/CCicTFOrBzXmdUB0yu2dKgkeX5E/aca2
         m7c37JB/TjiGCBeaJgVw5q2KyGdv3E7QUKkLlt6JtPByiG8NliXBbubs1JF9rsCLooUe
         lcPw==
X-Gm-Message-State: AOJu0YxvgCMwiisMMV8moNeTAUg/BnBYnEK/uld5oXrp+7VvCbXxENv7
	qSfEp26uZbEq10QZQp6Z5el0TDj1cq7+ZjioR1+y4MvNkVJyiRwkKMKVrpm7CA==
X-Gm-Gg: AZuq6aIEiLgY2kIJaJcqm75JiYUuXJVL9skiCQlxZTvbznjAjGWK2Q0q9aGY1hWX9iY
	o6RvYLUx4qF/tCiR3FizIdiNljmiFp/qG/m/8s/mLT+iyhhvAq3oxKI2ZWokT8rLXh7Vjr2Bvg8
	leOSrCpEQRIDXplA1xVP5GZEq3ar5vxBAa0Xt+vH/HvWuPcr0tc5avcFhHKDq+Z4sflVL0Dx0qz
	F/hwSNbd4pNuG9rJa7GFCDACdTWaHg7q1wvRUQCmGAHNcFdyC002wq4eYmxQ+prH54plcKaGXzT
	3c085lMdda3qwCMOTErUEtqtXR2hRqe6lZjKWzOaPMHkXruvaQF7VJe/nb4YWFz9QW1TNqM9/zp
	GJXTti+8UEgkdCdgbUQtt7Nf2pbXh8VUaunfKS7ENVvcn01rQEg3KVdeLA/LzbaylxxTBWMlHPO
	IchNiwhdUv
X-Received: by 2002:a5d:5f49:0:b0:435:dba0:736c with SMTP id ffacd0b85a97d-435dd1ce09cmr5864706f8f.56.1769579480702;
        Tue, 27 Jan 2026 21:51:20 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10f82aesm4371777f8f.19.2026.01.27.21.51.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 21:51:20 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][kirkstone][PATCH 3/5] catfish: upgrade 4.16.3 -> 4.16.4
Date: Wed, 28 Jan 2026 06:51:16 +0100
Message-ID: <20260128055118.2011068-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128055118.2011068-1-skandigraun@gmail.com>
References: <20260128055118.2011068-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 05:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123966

Changelog:
- Add "Open with" right click item and dialog
- Add a command-line option for setting default sort method
- Add Ctrl+A accelerator for the treeview
- Add option to show file size in binary or decimal
- Cosmetic changes for search entry and delete dialog
- Fix Ctrl+H not always toggling hidden files
- Fix DE detection when launched from Electron apps
- Fix exo file manager lookup for non-existent keys
- Fix file manager lookup outside of Xfce
- Fix GNOME DE detection in Ubuntu
- Improve application menu appearance
- Improve default width for the sidebar
- Prepend the project root directory to sys.path
- Support running without Xfconf (no preference saving)
- Switch to using the super() method
- Use correct executable for elementary Files
- Translation Updates

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../catfish/{catfish_4.16.3.bb => catfish_4.16.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/catfish/{catfish_4.16.3.bb => catfish_4.16.4.bb} (90%)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb b/meta-xfce/recipes-apps/catfish/catfish_4.16.4.bb
similarity index 90%
rename from meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
rename to meta-xfce/recipes-apps/catfish/catfish_4.16.4.bb
index 8fe879b816..1893802090 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_4.16.4.bb
@@ -7,7 +7,7 @@ inherit xfce-app python_setuptools_build_meta gtk-icon-cache mime-xdg
 
 DEPENDS += "python3-distutils-extra-native"
 
-SRC_URI[sha256sum] = "e9a99a62d10981391508dd43f3cbfa2d50a69bd6b7d1eeef7d30ba4c673dcfda"
+SRC_URI[sha256sum] = "6e5c01c534de7a8ce911965c4cd298c5b5d2079e0bc29c91b1e310c9884bb5fc"
 
 FILES:${PN} += "${datadir}/metainfo"
 

