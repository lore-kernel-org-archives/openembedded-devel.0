Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63ABCAC5BD
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:51 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.14108.1758625606389399399
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lJdRz6l1;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b07e3a77b72so941226466b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625605; x=1759230405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3Ys8bJdiv2pmQLLcIE3qNof2HfymxzK2T8MALgtHpE=;
        b=lJdRz6l1eMwNk9rQPTo1q0M+ua67OEyGB/njCETfGrGqAP6xviCX/yZfTtCl/OD0Pt
         evuv0CNMNhmNieHpoK5fYO9RmmWLaiaPmN/sl1c2yhRgUBe5J4gKR7yGKtyG3Hd2Ybih
         C6AvK4OqHao+I5UlfsAspU3vNgAzIIOJHqlpPgv6LYYYol2twgfxMNjQ45NaUOTE0kPy
         pmOtCh6eQEeI/zR+0kaP9poTN0s5TvEii+6nS+UWOfUntRx/DGgVDuynEwrOE4R+9VjL
         D9+U4oX4F+Wusz9b8oPffD+FRmxAL8KR92c0KDK0lw7MVDGcigL3IZxgl4bYYO69mKVg
         zTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625605; x=1759230405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3Ys8bJdiv2pmQLLcIE3qNof2HfymxzK2T8MALgtHpE=;
        b=Zx/HExxY5AtQex7SquB7D2aJTzjSHGCNnaUJFbngOuBirKaE0nuuL1EwLrJ27wCUkU
         0t1aYkYm0U880aMKDpuorUC+Sxmsmq19WQZmJ7IV526sqM+CDMsDS093Vy03VIIb2Lpq
         kcW6ioqgBaJkNlA4yxlKPU+PFdeP64UvZMrorxZddO8XTpp+H1rOYie1R8YZqx8p1ahy
         a5GCcIpRoIOqJl80WPPb71qlEIwIwSRq/cqiMKKttzt2zQN/GZGlkJOPoeyjJhj1/DfB
         qbAUYQ5MtxfIW4CsAPumjhfe3eY4ruGecLyOYOtl8hTWtUjln8N/fQ+qHWtcyGEkpjLS
         1Puw==
X-Gm-Message-State: AOJu0YwWxp0GqIaO3h5xmwH6a1XvbiDHrl6tTDQm6zttXMhzwUtlynCf
	le+sUwdNPGHOeVUYfRhA2WC8SxFSjZ85iMLIywZhnuIhgcyH3zltGctdLw6pPg==
X-Gm-Gg: ASbGncveJ8JXEO+Uj6q8eWZzd8A+iY3MzlfTZ2jJoDAA38xMw9pzbo7Q7Ooh4UTA7Sb
	jFRQFphqiGaMBrJLIQbWgwbUmqIBB0GArpP1iiED0vo3Z6RhoNo/UnIpr1iFT69raTtCsOoxM91
	wqAay+vlz4IBDf+cpTSbYTOeJtdIIoNhozXUm1/ldwFWXyvl4rCVEYgxtItlbcW5rExqC1x73VS
	sx169Set4zjx6uDTimVzvNJ+NXh395i4S28QFBQpSfz9hPjG45SrETeuurNzsnnbDcMneA6LSOZ
	lPfLmJO7KlyeZNsT8yZEYQtvRlJ1UqLwE2qt8pPZy70hn1xD69OAEY1P2rc7uLsfsJA+VbdeWfH
	ISBXPodcNZoJsEeyDp65N
X-Google-Smtp-Source: AGHT+IGThAbc5CiGfJ7xog/19+JuS4a7foHe6WzC28+yIzE+KRg0nSQ6XdrOy2xvpdiENof1IqN4UQ==
X-Received: by 2002:a17:907:9488:b0:b23:20e7:b480 with SMTP id a640c23a62f3a-b301c94a680mr249165966b.18.1758625604608;
        Tue, 23 Sep 2025 04:06:44 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 11/22] gnome-bluetooth: add opengl to REQUIRED_DISTRO_FEATURES
Date: Tue, 23 Sep 2025 13:06:25 +0200
Message-ID: <20250923110636.3413021-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119675

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: Nothing PROVIDES 'gtk4-native' (but /build/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.4.bb DEPENDS on or otherwise requires it)
  gtk4-native was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gnome-bluetooth', 'gtk4-native']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 06fbe76348f801d28785d8898c79c6c93ec33490)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.0.bb
index 36fe9cf215..f2dd99761a 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.0.bb
@@ -24,7 +24,7 @@ GTKIC_VERSION = "4"
 
 inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspection
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI[archive.sha256sum] = "3d1e2720673bc9a242619dc5d231fd6e776c18a49da29f43cdc433055adb0170"
 

