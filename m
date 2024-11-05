Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1ABD2B955
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:50 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.19500.1730817403882995315
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W60KCxpw;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e290200a560so5316081276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817403; x=1731422203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMHO/aVkVK0rxmblYHpkCP+pW++DhNGM85YtnyDxmo0=;
        b=W60KCxpwDn3gSUmNM+1QzGfstf+IDHUGIzybTZbwheofqv4ofZSQ0m16J9cXvPSsoi
         xrlG3naQmChNGWkainUY3WU4/I8i5MIm1GLamfoExlwZ2DTe4h8Kk1G/ZHuyiWNvvmtc
         WXLiz5BxzXdwMf9QAodH7sru2f+5SpYX7sZIYbQZKpU+9sM9eMeub0/y2eWprpXGop55
         a3Mhn2zv+Hw+vZlyPY7AMGAp2dDjC9qd1YnlW6sAdFY7fFQLhbiGjbXAuTlPQ94+iQDc
         Zz0zVV+ADGF3ICMC0rOYCaPmSMQ/2mFCWx+5KmSui+fcBkvNUv76kTEWzV2KYiVKShSc
         b6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817403; x=1731422203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CMHO/aVkVK0rxmblYHpkCP+pW++DhNGM85YtnyDxmo0=;
        b=QX+IGBabiPnB6ZiqZbwAbHbCPofasuuzqPbxgTPR0K6xzFAzdvEVDbpGKpAPvtZ/05
         3x6+zNXB0G0tD+my1Bcc04RnrPQ8gM/uibdQQbsxB8HTl+GkzASIbZJgNIick355PHNe
         DODlWCH5ESeXBthz55CaRgyzRvE+ysMKWG2Fh0eJyS3ejhqSllOksnLe3ovwx+tZ9G9p
         D9//AGlYJNmrEhZKciC+4EuYva7KOoNZL1BeC3jcBNcajOYB0rwPk8383O+htwyG/sNz
         WSCPpVi12Z0ctJyJTcPa1Vetxswb5p8zYXCtiqzPPwuDusVjjIYg5J0EWnv4CmDENKsM
         9viA==
X-Gm-Message-State: AOJu0Yzdn3jwxPmFOR/edDCgpnnkO2M23f1bj/0Ky3zWM7yRCCpNCHJf
	u8HNRCRdrwcNwZpsrP6gos6MaamNCIT/0zakdYGTm1uTi8IrKn9JPfx/8w==
X-Google-Smtp-Source: AGHT+IGf/bc24z8x5nbrYMYQazS9Jw50NWjdGDxewtmYapWRXPaj2JM/TAXibVM0ZeH4IUJfiqNaXg==
X-Received: by 2002:a05:690c:4801:b0:6e5:907a:5170 with SMTP id 00721157ae682-6ea64c10a6cmr162042307b3.43.1730817401480;
        Tue, 05 Nov 2024 06:36:41 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 04/90] gnome-chess: upgrade 46.0 -> 47.0
Date: Tue,  5 Nov 2024 09:34:29 -0500
Message-ID: <20241105143638.2301245-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113425

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix appdata screenshot URL
- Updated translations
- Use modern libadwaita widgetry
- Fix incorrect shortcuts on shortcuts help dialog
- Change First/Last history shortcuts to Up/Down key
- Miscellaneous code modernization and improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../gnome-chess/{gnome-chess_46.0.bb => gnome-chess_47.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-chess/{gnome-chess_46.0.bb => gnome-chess_47.0.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_47.0.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb
rename to meta-gnome/recipes-gnome/gnome-chess/gnome-chess_47.0.bb
index bb53b58df7..e3365f6181 100644
--- a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_47.0.bb
@@ -22,13 +22,13 @@ DEPENDS = " \
 
 RRECOMMENDS:${PN}  = "gnuchess"
 
-SRC_URI = "git://github.com/GNOME/gnome-chess.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/GNOME/gnome-chess.git;protocol=https;branch=main"
 
 inherit meson pkgconfig gobject-introspection gtk-icon-cache vala features_check mime-xdg gsettings
 
 GIR_MESON_OPTION = ""
 
 S = "${WORKDIR}/git"
-SRCREV = "c3625ee59ab3acfd7566ef04300b15ddbadaaac3"
+SRCREV = "91476257c2404945bfa30238c38391343bf4737b"
 
 FILES:${PN} += "${datadir}"
-- 
2.43.0


