Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35434109192D
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 17:02:06 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18032.1774026122441031876
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 10:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TPwbqZRW;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c107ef474fso426654eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 10:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774026122; x=1774630922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Ez6iv/ALJUxALeIdSLBxuux9sJMEZVYCZay+lvfgXA=;
        b=TPwbqZRWpRaTKAUfNHb3aLflZntwfA/bJSi3F7t1LpfXpRiHGEPr/t68m8Cy1IS7oF
         9R+FIQCRjTFqG8pLkMDcdZXSG2Of1Aze2FsUxmBmE7Ja3/jGytOH6QSSebVAmnMzZgq6
         PA3WkbttABvQO6IMfUNp6dZsx6Gu2A0Kwna6gHMiAFt641S/QzMicWeaGdY+54F8ovs0
         3SoUc36Xs2a8JMGiDPH6JqE39AL67aRIxoBFWZyDYEK6pkZZEvXp8MUCk1M9Tn6xV0Lt
         Xpz6BnpmXdG7N3JI9CXiLFT4Q4UJf7ZfttpU9zF843sIG8S5niEuSwKOugx1bnMexBaO
         dp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774026122; x=1774630922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Ez6iv/ALJUxALeIdSLBxuux9sJMEZVYCZay+lvfgXA=;
        b=oENRzkxY/nEQ55MQBFrTGXTmuioGHK6T7RVzYdJBeZyjkCydwiikm/ZowWPRON0CaD
         bDI48XaldrwnrsH+vhNhxhVnHzr8cXGN0hWfqS5q+3lePvY67IaSM05VdeEVxt8QadQj
         ehHPO9A8LgIz841ezC7JWgLGr+B4oWNkHhXYUfOBOUXHqDLr7+lsULF1swHyS8tgZxQE
         ULpX4cM9Y7jmp0vXGJ+UojMTcDZQ5S+vDqoZ4RoloQNoL74/fMZc5izKGqdeCN/5quI5
         zLy2kUbaUHk0SwuDBozLn2OesqBgYLVpuMPemzRNorOcFo9KK1QdVOBf8sfRbn9WNQPW
         tmYg==
X-Gm-Message-State: AOJu0YyBl1TKTZmIkLzyv7jI2FR2eN+/MstnTeMbhwrSgYBK6JZDt50C
	9GPHd9PIzZK4Co8xbRZ5Cfb+aJLOzyf/gBZUa2JXCEZp4suJRQk3EvzDYjMWWw21
X-Gm-Gg: ATEYQzz68SwB8QC5AAS/Hcd88kuu5U1fHjNdh/17FlAxnL1x3IfJZ/T2HHRotnMU+ul
	mjHL4JmZb4T6CPDjVO1+zKHMoii2inxi4iE43vY256aZvtiTlACFv24PdIlgPnnumuq1cJm2EOP
	Twc6ALRKqVoGFEdhv6Wsnzp/F7woVX0WOip4XHXlL0giNjNh/a3cJS/yD2RskZH3fFgxXqFnAUh
	xFF/DLmGs9eHcuGPC2HJX6MBL4cFsXpVzxk48maobNz0FlaRlUB/5sPYPdEo5OTqTpHrtvUR0tj
	vWflfwCHlxImyULFtMIT0KSfZeuw3ARPXcmA4IwhxfpUhHR0659naIQznlj4qkW56Bn+Sji60lg
	xbXyWl2YilTFs+O8qU+6GK1Ze8AVhvSLc8kGrlOEo+isxSiaV9F8svFL/LEBN6H9t6ZydCAjnDi
	t0K6nqTq7Ton23eLvLv7+JLXLqsRpE5uq+10w6wqKeBWQHJwYUtxn/dIE8oEIontTEBF1zzr0KE
	W6Re3qsAppIePrRL+3ffN6EQFUQCkLlLP/dwqyKNrltNa1W6/evSBdaK6jV
X-Received: by 2002:a05:7301:2b08:b0:2ba:a712:51e3 with SMTP id 5a478bee46e88-2c10974f56dmr1740145eec.21.1774026121495;
        Fri, 20 Mar 2026 10:02:01 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14caf3sm5148632eec.5.2026.03.20.10.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:02:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 3/8] tepl: Upgrade to 6.14.0
Date: Fri, 20 Mar 2026 10:01:50 -0700
Message-ID: <20260320170155.1413929-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
References: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 17:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125443

From: Khem Raj <raj.khem@gmail.com>

Add missing dependencies

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-gnome/tepl/{tepl_6.8.0.bb => tepl_6.14.0.bb}   | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/tepl/{tepl_6.8.0.bb => tepl_6.14.0.bb} (80%)

diff --git a/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb b/meta-gnome/recipes-gnome/tepl/tepl_6.14.0.bb
similarity index 80%
rename from meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb
rename to meta-gnome/recipes-gnome/tepl/tepl_6.14.0.bb
index f4d027ebf7..b6ba7e1a2a 100644
--- a/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb
+++ b/meta-gnome/recipes-gnome/tepl/tepl_6.14.0.bb
@@ -7,7 +7,9 @@ DEPENDS = " \
     glib-2.0 \
     gtk+3 \
     libgedit-amtk \
+    libgedit-gfls \
     libgedit-gtksourceview \
+    libhandy \
     libxml2 \
     uchardet \
     gtk-doc-native \
@@ -20,9 +22,8 @@ inherit meson gobject-introspection gettext features_check pkgconfig


 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-SRC_URI = "git://gitlab.gnome.org/swilmet/tepl;protocol=https;branch=main"
-SRCREV = "16ab2567257a053bd957699f89080fafd0999035"
-
+SRC_URI = "git://gitlab.gnome.org/World/gedit/libgedit-tepl.git;protocol=https;branch=main"
+SRCREV = "d60f7ded17b52ea42091c073ea81090e91f38620"
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 GIR_MESON_OPTION = ""

