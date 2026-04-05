Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9E5EEB577
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 12:50:08 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34603.1775393406297207326
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 05:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=abIJS2zL;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ad9a9be502so20647865ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 05:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775393405; x=1775998205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VwB8Nr1PKDMVjqTno2Lr33NDiRbDJ5xp0pMjqE21Kk=;
        b=abIJS2zLeu8FcULyAFr3kZKu1JnA9Bxpf71wKM3eCH8NSJCyDMjU3xILqPw2ddzLxd
         x94Bn6grW2+aXSqsjp9brDH0TTeBEtcYMB6podFwmsyHE6qjvH7OKn0Qf6u1eXIpkdwu
         ZWakhWZuGJrKVu9D3UeNhTTL4h2BsWaCjC/l0/w9i4kG+Il8BdyRjlJU/xVkARqxug8B
         csP7ZN8qDBd74FOOk1/yWUE9lCBOT/zO5tBcfypVFp6+KX3Ttok6LIBsaBpGejlPDV37
         deBf4uZdRpuvv9Dq/SpBzRDDoDkiERzUbuIYv6sO/yCvIT3xkU4IM4PpIua03My84uDA
         Ir3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775393405; x=1775998205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2VwB8Nr1PKDMVjqTno2Lr33NDiRbDJ5xp0pMjqE21Kk=;
        b=NgrezwyNhVZP5PDaGROanoOYbjOkYqUKa+qaESRdndb+JXQun5rTSby17xEP9mnVHW
         x5XLjZuZ3wz+JTVlANDT4Drb1uBx3rSU9nd86YDcCq7Gc/3e/APsJpPnbxE1TjZrjdcl
         IRer0bBYqaslfaLaY8fP05ZiPhaqNhq40Epv8mW23sZA2zBkRVXqop9ObFqN8ANWdoIh
         uwWmPI4BkBj/VIzGL0RuUh/86q4OjWVGs/vrKgnXvDhnAPRNkc6PwNQiLG8ARsfQ9dPH
         rlKMXM/x7xLJCoXc2ctpZbyTfNLXThRQTYsAvK96bElD2W94h3Q0UO1EEYkDtSdYGd/e
         S1Kg==
X-Gm-Message-State: AOJu0YzHTxKbYKvoO//7vJlfjq/PyRNdL55qgH8WJvX+DJvF/y26mA0y
	c4RL1DnxIob/RVP7mL/88xIg6BVUyxH1OokDSTxa/DGEYY4d+CJ8NX4XeWf0qCbyUwA=
X-Gm-Gg: AeBDievlPzRy+BN0M3Tgm14oCx9MFVR0bbjYlVa+F058leUPA41+R7+uDZPdIR+hyIz
	AvwZkOAtvxb4a4ysttoL8OIWQcoiVPVr1IBmhBySRwXqc2WK0i5L7cf8vJwWa//AjMn/84H3OcE
	M448ZFlgpgYLPzGRTVAhYdXeZEXkCBTmUYH+/Y/o6xS2P5QarWSNeI9pGxAd3khphmgcb9JiiEH
	3gArFjYHgisORaS7u9hR0NzE4yR6BuZU0jQG8oOlU2KLC5PIlNDE4dukWxIpu7SxO7j8XA5NF63
	jZtERn1z7rHbnRICTH1kh/PzRVWEMHmtfgX/N/luxgPCaeEgy/B3nDGKQcVcgqHo418mTxeKoqA
	PNN9HLXPW6OyEwzxuFkVkRTkcIrMuTiSRtr9ChmVA1T1JEQmDzomiuXwCpRHLbdqLY1SwEDmpaD
	/BkKbnSpeCtf+uuXqKaG/zjyAHZDW5LRAjXSA=
X-Received: by 2002:a17:902:f611:b0:2b2:470d:6d0d with SMTP id d9443c01a7336-2b281706f78mr101942905ad.9.1775393405569;
        Sun, 05 Apr 2026 05:50:05 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477736dsm106828025ad.24.2026.04.05.05.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 05:50:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][whinlatter][PATCH 14/14] gjs: upgrade 1.84.1 -> 1.84.2
Date: Mon,  6 Apr 2026 00:49:16 +1200
Message-ID: <20260405124916.2881008-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
References: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 12:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126013

From: Liu Yiding <liuyd.fnst@fujitsu.com>

Version 1.84.2
--------------

- Closed bugs and merge requests:
  * GtkNotebook.pages GListModel is inaccessible from GJS [#686, !992, Philip
    Chimento]

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 3797a82feeff34abd161fe7f2daf88a9fbd05cee)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.84.1.bb => gjs_1.84.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.84.1.bb => gjs_1.84.2.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb
index 55bd38c97c..c41fa6e93a 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb
@@ -7,7 +7,7 @@ DEPENDS = "mozjs-128 cairo"
 
 inherit gnomebase gobject-introspection gettext features_check upstream-version-is-even pkgconfig multilib_script
 
-SRC_URI[archive.sha256sum] = "44796b91318dbbe221a13909f00fd872ef92f38c68603e0e3574e46bc6bac32c"
+SRC_URI[archive.sha256sum] = "35142edf345705636300291ec3a7d583f14969ff3fae0ff30f4a95b1e6740166"
 SRC_URI += " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch \

