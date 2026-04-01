Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F49D35149
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 06:46:12 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6993.1775025962358922595
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 23:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q25rNDmh;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486b96760easo71912025e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 23:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775025961; x=1775630761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3U+XZ9dRKgvQwtN2MUX/squa53yzvOhqt9OHn92ctLM=;
        b=Q25rNDmhL3I2poo+wQXdO7+vNGJ0LckqcegZofe/jnVeD00nEbtuvBLLcvLs5CXZcf
         Q4cawc+GsgWsGrdBciRQ5BjPx4Te826anRu4i1pawbjo4JWENj338NmPzFGuMMSzrpdo
         a/RbFyPqsHKoJN/ZblhFSEDyVj7c3oQTqp2Y2m/2GyjPHmKegwlZSBYKYHQBhGjksZb1
         szD8e9EmO3vCIu4DywcAA27sGNzdGlHGunLH8lmLeZOeqm9zqeL+IPb3V2reYw79aQ0a
         zzx7nIOaxrLhh0eCz3zh0bgIiXC3NLr8Tu9U9JmUf7JXPik8T89JOBNRknIrGUDZW5Ns
         4esQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775025961; x=1775630761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3U+XZ9dRKgvQwtN2MUX/squa53yzvOhqt9OHn92ctLM=;
        b=j4qyDP8sLi/0wumLqYlGEv48snHqFh1kRXjeikj86AYmztvyL0AALFHe93zYJB+0j6
         3c/dqpAL7+L2gdnfpqDHKty0qQheMnCclmlGFovuIe7k4aOeD2C5CX0OdBidu4SHBzVD
         d3lqm4c07mVwtjeTXmwnqJPwnGf3T72EG3Yb2T3WIUiVsJ5i8d4JPzOdvLYtfFXFr8oV
         ooHXI8CioyD7F9RWowmoewjSS45wPYWOB/bkGW948GjSs4ybUZvFva7gcycJqp0dFbEo
         lhlapIZPamdpih27IYp81PqPQ0P3/3UOZNVtTEf969eoKOQETcbMyDQKKAf9uwk5u10L
         RE2A==
X-Gm-Message-State: AOJu0YzLQboGvIfUu6zrvlrZV70hQbVbiAbuhcXSr6KyyWTsk5nqD1W9
	w063lZPL502QVbCFiyZNVgCpYUhK2VqzdQhYrUIF2cs51E2PgYppIbPoXkHu+A==
X-Gm-Gg: ATEYQzzNQG4Irc7XeWil2RwlnVhKgk5vUyrJSeTJf0PfxRlcYqQDeCY/QnZbEBnGMmQ
	EhYiOZoJ9E+Eo3KMzvfW8SVxSSkJFjhZoGOdF/SOxsU/BLHRI9UzuFiE7tH3idyP4pqH1zuAx5x
	NZw15gefmAo1d845fmj4tPoBFIA3D5Ho65+4phz1fe6wEh0RxvE95f24t07ceBiHDVDoHJVHFMD
	AEJSslJBnZVgF7gdypK7S7kuCcGZcP/avpD8K7NfFxbKXGGPkLC6yyUcAVduXnDk2xl+QgxMyPq
	kwxIYOtxyrOJsMrZ8AG0mSpx9UYG/jcWNfvN+6r02LWsxroTSozrQvXqRNcyMSBtONAjQuTgn9f
	1H6E+FCTvXeck2CGy0pvy1XZTUejROppMaeKbrpZHbx0suRqlXUGW+LjE0IazmFjBeREKhDdjE5
	qcE8SkM2ODTl6tOEqfOmVR
X-Received: by 2002:a05:600c:5303:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-48883562da4mr36844825e9.9.1775025960454;
        Tue, 31 Mar 2026 23:46:00 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c751158sm50971615e9.6.2026.03.31.23.45.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 23:46:00 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] tigervnc: upgrade 1.16.0 -> 1.16.2
Date: Wed,  1 Apr 2026 08:45:58 +0200
Message-ID: <20260401064559.243277-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 06:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125897

Contains fix for CVE-2026-34352.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tigervnc/{tigervnc_1.16.0.bb => tigervnc_1.16.2.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.16.0.bb => tigervnc_1.16.2.bb} (98%)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb
similarity index 98%
rename from meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
rename to meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb
index 6e8e80f283..c9b0cd2404 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb
@@ -16,9 +16,9 @@ REQUIRED_DISTRO_FEATURES = "x11 pam"
 # out-of-tree builds.
 B = "${S}"
 
-SRCREV = "dc50022844dfad0a0e195d54b8499fcf242fff0c"
+SRCREV = "b555312d70d7ff017f866649a7e7167af4eb8fca"
 
-SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.16-branch;protocol=https \
+SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.16-branch;protocol=https;tag=v${PV} \
            file://0001-do-not-build-tests-sub-directory.patch \
            file://0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
            file://0003-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \

