Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02730CAC59A
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 17:36:52 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.33722.1758476210414214169
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Sep 2025 10:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C0w9u2qZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-ea5d1270b56so3856933276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 10:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758476209; x=1759081009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IS4MJYJCKQpwX33XBBM8XOaIemxQhJKNCJ80h6TK4Cw=;
        b=C0w9u2qZomy2MojKs2HK2CWO2esSprb7MVKhAwMcRjt/hPkqlVxxWkSa5VER9cagCp
         IJlDOP9KMz/Sb/GgzjxecBfy4QWNGyx01B8bLfQSQComncQqTQldzPNPfsR9ttJK5fUa
         q61P1Y/O+/XohcUNVJ5wTfVA3kcg6Xv8rdEwvOHgX7LFkoJkkMRYjBy9xc5/x37XdSkG
         OSOhNvunaa6tE/6AuZSUaWFsds1OoQ2ij+t5fzH8/mqoS/ZfHdTCaQpDHk6H0RZxmOUs
         dfqOMk2ztoiUGZ5z12IINwXbjduuoR9jP04NfozT6v5J/4Gh0MM1GmDAvCiCi3EEM2z8
         FpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758476209; x=1759081009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IS4MJYJCKQpwX33XBBM8XOaIemxQhJKNCJ80h6TK4Cw=;
        b=sYs4iveIG6YYwT8S0YM3cp9c9cQPQwtLXitZSo1+QaSsd5NeLzedFGpJYh8OdJxIQm
         zGjgMyPzv5bOatVn2/86aI0O7FVns8wmDrD1IwLOUT56cO/ucf7j2oESUr1Ep8lOMwpz
         GhYBADb98Fite4oYxbP84licWxqP82MB1voVJH1+0zvDwnWC8wsQkIIqzE+Jff1tjs/1
         QS11CXI/dDR7QmDFdEezLFqbr58/YpWizXGTQI48lt+m+WnE5oX3i5H+aE5Fvg/tFRrN
         KeL7HE/764JfLx8lru9F/NdzxNlPuMKw33yqqeHCyClXwcUw+jk82/j4lVLkp8gzCDWa
         GFmg==
X-Gm-Message-State: AOJu0YxTkMQ6gelt/UzwVXozR6vgLwkjpM6WEOAbats0UssApJlc9pEA
	6eXu9AaY/DyqiiBT/Arl+2yxbWTN8MKY2AJQR4CPh7zk/lAXpZSiRhrA+NfmRUIA
X-Gm-Gg: ASbGncu1U4h/QMli3dPqH0qeJATGs4sx1IbIW9Q4vKx7uLiNhIbhkwBi6NuV5of2MtO
	U94c05fkKVbiaqVXVh5UCb5tn4cOw30A5oLY1vKV4Zudw9SByLcds40sgQtBY38ssYreAI7oHIh
	qayqiRjJZ1jNG2k4md7QFrYP9cHnc1Uc3BtIewi4C3Bph2b4CyA3hAMxg0zXI6Yj6YWPiaoVw7a
	TLnv96R9UpHHK5ZsqSfvZo2r3ssCDwAW3DqVe0TsNpZMpQjFwyfsviOAQ9iEmi/z/f+ud8HJcIn
	HuP+5kDExo/2cA3gKDwved0kAjh1f3mrW+QYvz9UrLRleHoJphgY3YEWN7vjxQpWIMwMaRXWDda
	rKyGcNYMCNbN+mDk9smcNXIljBN+T
X-Google-Smtp-Source: AGHT+IEvghyTx/YKS1dTHE9hcmckX6tTjFyTCt3z8rRu+Z6cobyFoKaF9Bcz/LD8quVdpOd0Bz+2Bg==
X-Received: by 2002:a05:690c:6f81:b0:748:3829:eafe with SMTP id 00721157ae682-7483829edf9mr41341307b3.21.1758476208878;
        Sun, 21 Sep 2025 10:36:48 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-633bccd8fb9sm3445909d50.3.2025.09.21.10.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 10:36:48 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 1/2] libxfce4ui: upgrade 4.20.1 -> 4.20.2
Date: Sun, 21 Sep 2025 13:36:39 -0400
Message-ID: <20250921173640.707116-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 17:36:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119631

Changelog: https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.20.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libxfce4ui/{libxfce4ui_4.20.1.bb => libxfce4ui_4.20.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.20.1.bb => libxfce4ui_4.20.2.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.1.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.2.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.1.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.2.bb
index b2dd9dfa79..d485abc19a 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.2.bb
@@ -13,7 +13,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 # TODO: Check if 0001-... can go
 SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
-SRC_URI[sha256sum] = "ec99f0b8f6d7cd4222c8f8e3bca51d144fb240d719829344b354900eb3a07100"
+SRC_URI[sha256sum] = "5d3d67b1244a10cee0e89b045766c05fe1035f7938f0410ac6a3d8222b5df907"
 
 EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
 EXTRA_OECONF += "--disable-vala"
-- 
2.43.0


