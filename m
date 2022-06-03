Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBFFC3F2D4
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:45 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.2395.1654283980548393807
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lBRtR51w;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id 187so7839929pfu.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+ezPlIzuclRUlH1mbBS7e6ZqOJm+RYkYd3AqAM8GiEw=;
        b=lBRtR51wIheRz6LhDT4Hgp3jlPU/l9U0p4gCMIITivj3RxPZq/Wo0m9tS809phneM/
         mR/nQ1/YPYfg/rRrc13T6znpSTJc0vtOAWUzSLRuU1l2SW/oXCSfRvB1tU6++HpQUP+1
         fUBAU6FSOdrgYB3wNJmgUfUKM3c/R8+bugdcRuNKvUR0IyKx4iClhoniOlrAM8OPI3Cd
         A0E3IPmgsxhox6JvpbabH/t3Tg4TkTEH4l+BfzX3ohq2J9wFX9BfXfYM690yVYWKIeCG
         E6ZxAkDmdIy+g+8J8OHsPCL9lF/QeUu5dONDKtJAkAIrLQDMl/Uflf6hc5sRLy2oH/UC
         Gorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+ezPlIzuclRUlH1mbBS7e6ZqOJm+RYkYd3AqAM8GiEw=;
        b=X1LrmogBjyB5BRSppCZ/QiwwnNDSqQ/J7Mk5DKtNJuyLx//wnp+KFTsAFix9SVBnMv
         1Pp2fSGMB8qT53ibyC8U7uSxWccSuOu+WFKMnBMqVde1GAzFjVtMEidkbWpOSXCX0lyF
         PXYtKQVcIEC2WDy9C7BMotC9E3uFsIFqDUnOgxyz1+Oq/LuTmGORqfpCxq5gv+yC5WaE
         qddYG8jtYXhMZ/d/yhmiMvD96yRpJ1to7DfgI5dlc9rCeLtP8s2PiRE3Bic8WSe33SKA
         5YEHPwTHI61xuxpdjhfuhkUw3n/SKYSLZgQdKGrFdiYNA5KnyQkeScstp9INTwgBG+WT
         Mpkw==
X-Gm-Message-State: AOAM533QU72vCZXtEGQ13oBu0Dr3/+0KwkPG1X/MXC+i8aO4F/ZoYD6b
	qozjCf/OwewZ1kAKETK6bGAT4tRa7m4=
X-Google-Smtp-Source: 
 ABdhPJwoWoLlylW/aaAEd3KMTKJiTpGa+Yy43fO4UqRJFeFVLHQmtvZ1eFiyRwo90FpkGfRP2TJEuw==
X-Received: by 2002:a63:8443:0:b0:3fc:a29a:49ae with SMTP id
 k64-20020a638443000000b003fca29a49aemr10255053pgd.592.1654283979792;
        Fri, 03 Jun 2022 12:19:39 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 12/20] libportal: add distro features check
Date: Fri,  3 Jun 2022 12:17:11 -0700
Message-Id: 
 <79e28d1c8748e6ac1044d01fcf0e17daedf137e0.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654282423.git.akuster808@gmail.com>
References: <cover.1654282423.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97401

From: Kai Kang <kai.kang@windriver.com>

Add distro features check for libportal because it depends on gtk+3
which requires one of ${GTK3DISTROFEATURES}.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0baa7793e0df81a21a130e6f0513f27b322cd4ad)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/libportal/libportal_0.6.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libportal/libportal_0.6.bb b/meta-gnome/recipes-gnome/libportal/libportal_0.6.bb
index ec728d78b9..9784f04818 100644
--- a/meta-gnome/recipes-gnome/libportal/libportal_0.6.bb
+++ b/meta-gnome/recipes-gnome/libportal/libportal_0.6.bb
@@ -10,7 +10,9 @@ SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main"
 SRCREV = "13df0b887a7eb7b0f9b14069561a41f62e813155"
 S = "${WORKDIR}/git"
 
-inherit meson gtk-doc gobject-introspection
+inherit meson gtk-doc gobject-introspection features_check
+
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 DEPENDS += "glib-2.0 glib-2.0-native gtk+3"
 
-- 
2.25.1


