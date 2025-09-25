Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D3CCAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:03:59 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.9936.1758801829171278927
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O0bq0/jL;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-63053019880so1805239a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801827; x=1759406627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGRagbAfyLT0/v68GJVoiorswhH40qN6o8DzVShm92c=;
        b=O0bq0/jLafln8iYPvNtUsm5qEdzS2RNUVTmHdqd3jddISg2kLoBxlR29CuwUhQKQE6
         cVv02WW+5qBkK+PUrKYgwAAqQP9+13ply1aypJAB/91WUbXGzRom1WLKoSEs4q8CM2dp
         VOqvguuL32arIh7pDvW2yaBoey1AJ3jVQts3TYc54SJXwhorPasPw2jsTDD4dOSotcQ9
         9wde+pA6c0VkHT8+jFJenvaa+gtwdT8wLtGkW0E3paMqQayOUU8oaRVZWC2DLhp3gRWn
         DYojjQzyLjDbIAGrrv8kjb6GHHT7lGQCBDKam6auXDXdQq/O4DT4SbmUvkYGkju+p04+
         Gf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801827; x=1759406627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGRagbAfyLT0/v68GJVoiorswhH40qN6o8DzVShm92c=;
        b=mfzEHCsawesNqLW+cvWdqnEFXXatYC+ZxYmPAqMkMZxL+VtHm4WedZqLI2g4lYd0+R
         UCYp6bVzxqn7/sJnIP8m20JbTejqNWrVMg7resCsCBtD2Iv0RaMMfyyvh8Emhrs4DwWC
         M2QtVXCsgAHxQ0wYhpRZbjEi6322eEjk4rwLE2ZSz3rBueX6sxhFFxyJ+8V6QcCEESHy
         dMdhBnVaS8EkDvvwCk3/n46VKBy0/wlvMEZusG1RKsooMhRRimh2ZN8VTjB4MzdL/v45
         6m2catpeeNTKzx9sfbGkHPt/Kv2SfOMf1bs64YrhkzsFnnHz0xSMmEg88gzvfd+NhXQt
         G2lw==
X-Gm-Message-State: AOJu0YyqNhzsXngBx3so6ga1ACj2BHaP90I7cfAy3ZiZyvoGw2c/oNyJ
	4SgNXpQXjdWABav/XZn/Ln19Ye1sdn//YulZuVqgLcse+41TXjv0FUO7pGg0MyRM
X-Gm-Gg: ASbGnctqZG9NAC+9JifgadMaU1yFIraF9338TbprvmagYciBZHWrpJzwe6HvgYy8/O5
	Jn5K6lV21Mx2BR7IyYk9v7K9MdfqRUEH3znJrNn5g23W4+mirS8Wvr5qooW2CGBzR4y4fvJWd34
	WYlPf+bagtEnkH2AOQ2SU+Vq3IvN7r2Rcqh3s35/i3e8hbjNbiH78h/WOD9lwnYJIRCCrepooml
	Dd5hGq0lS9P1CKQRop2NkAhJtCcLal+/1wd/3Ql7gH7cZHUEoS11+OJjfG6arDYE7tBgAKICSov
	McRXroj8SHfnmSvYvdSw3XFVoGlKHktUTCU0PjKDSvpkMRqAp9gHwFGMQNIiqYHRcnxEi0GNAc9
	J9ncLXQ7ENw87krqL9E/z
X-Google-Smtp-Source: AGHT+IF/eHlGf6D/8Yh54rqwE4crgQDzHuTwlUZI2xwgG3k/My2REzXcUWxt2Fvi91epGgFNTGuBZw==
X-Received: by 2002:a17:907:9495:b0:b2b:613e:b675 with SMTP id a640c23a62f3a-b34be1007f2mr334490766b.49.1758801827358;
        Thu, 25 Sep 2025 05:03:47 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:45 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 05/21] keybinder: set correct license
Date: Thu, 25 Sep 2025 14:03:17 +0200
Message-ID: <20250925120334.1670367-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119865

This package uses MIT license, which is very similar to X11, except that
X11 license has an advertisement clause, which is missing from the MIT.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d2b5523333b762c32e70de36237e2d8e93096189)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-support/keybinder/keybinder_3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
index 971ad90f9c..d46fb6fe50 100644
--- a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
+++ b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "keybinder is a library for registering global key bindings, for gtk-based applications."
 HOMEPAGE = "https://github.com/engla/keybinder"
-LICENSE = "X11"
+LICENSE = "MIT"
 SECTION = "devel/lib"
 DEPENDS = "gtk+3 gobject-introspection-native \
            gtk+ \

