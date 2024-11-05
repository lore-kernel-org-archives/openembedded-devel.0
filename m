Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524F7D2C136
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.19649.1730817437593434766
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PXsUK8PN;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e9ba45d67fso50973707b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817437; x=1731422237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1t77H2ODM87W8uoAkUFSrqyyV0Lsw0kUG7cHBWzbRuc=;
        b=PXsUK8PNSUpScDEzdbIR19Owk/sAH/NvRa+ByLwxzdyyx3zviCaEmWhWgv1htF+L1Q
         bIEjMVXNUvPnapHG2x+/jtC2ZM6A3pquJDtBBFqoJu/BvilblqsSBQrqu8N40T3bvGxb
         bGRuVSCx/mZRA6tXJNda9RA8T7JmrYQXtaBcZ8X02s9Om5WEdPQcNVIMH4L1yzFO+DRi
         axzV975XaR1TGXxV87n5DHD+Q38mq6SI4s+bP/H9kFaNJnK1pZZ343T2Wkwb1s0z4sWZ
         yS+4ywj1tfNdzOA7SH/mZUlwnZxUwXW2Fr6V127tsnbSbQcVr6LK1/qhkNoC3stKlYsv
         KC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817437; x=1731422237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1t77H2ODM87W8uoAkUFSrqyyV0Lsw0kUG7cHBWzbRuc=;
        b=K7G4sIPD+HkmCu0DPTGHt2lkLbBIm+Fmr7wxJYGHNubiT+MvSpQ8XzYoWPx8xgKY7E
         e9OoZuPcrIYfe5QyTqOZx8R/yxxVtNa74ueI7MjvrnYUj29qOZgymn4g+kG9oGaMGucs
         99boDn7p8NDgsKjclKTDzaTwk9KY9my7Vo5XCAgBHgWm6lzFr5WsmmJ133GQ4CiqtS+c
         9YMTsyrYZKlZ1xQtAF1H3CkhBvFTgTvQA9jQvCItgaKOjHhHfmrlfKcjeCbJa13xnjRr
         ae2+aAD9qOY0q41lCWq6CEc7/rbGUTrLnS6wE89m4AMfXCZBPiHGj8WDnzDIi3a9iaXO
         6wsQ==
X-Gm-Message-State: AOJu0YyQfhiAEUS73Lo2so0+6ZnS9IAXxTPvY4t1RldIQRXWeg57ilrY
	cVNi8iLJdfOA/nGgHCgCrNT1cqb6SKsV8G85/CjKcXpPW9Dl1+PxJA+TIQ==
X-Google-Smtp-Source: AGHT+IG0bSOZC7yz6C/xlH6Tjt9XnITV+U4TQMx4Jrikkq3RO7dJvtceqc7o+P0XHNWLDEphfq8PkQ==
X-Received: by 2002:a05:690c:102:b0:6e5:e163:e001 with SMTP id 00721157ae682-6ea3b87e250mr231508847b3.8.1730817436660;
        Tue, 05 Nov 2024 06:37:16 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Liyin Zhang <liyin.zhang.cn@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 80/90] sound-theme-freedesktop: Update SRC_URI
Date: Tue,  5 Nov 2024 09:35:45 -0500
Message-ID: <20241105143638.2301245-81-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113498

From: Liyin Zhang <liyin.zhang.cn@windriver.com>

Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3fbeee6aa5c39dea65d89fc32e5495742250d585)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../sound-themes/sound-theme-freedesktop_0.8.bb                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
index 87320a98e8..508519e4f8 100644
--- a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
+++ b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
@@ -11,6 +11,6 @@ inherit autotools gettext
 
 DEPENDS += "glib-2.0-native"
 
-SRC_URI = "http://people.freedesktop.org/~mccann/dist/${BPN}-${PV}.tar.bz2"
+SRC_URI = "https://people.freedesktop.org/~mccann/dist/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "d7387912cfd275282d1ec94483cb2f62"
 SRC_URI[sha256sum] = "cb518b20eef05ec2e82dda1fa89a292c1760dc023aba91b8aa69bafac85e8a14"
-- 
2.43.0


