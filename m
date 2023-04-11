Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CD4C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 13:15:31 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.13147.1681218930463434950
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Apr 2023 06:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=wZfsdGhS;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f42.google.com with SMTP id v6so7496344wrv.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Apr 2023 06:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1681218929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wgb3WF3ClZHUUo8SPVwfKWBSe7V6BebzCiOXHJCKB0=;
        b=wZfsdGhSKA6QePIJbPBE9aRUTes/pJkPqDnOOqmQD+enquqkkrEcqTTUNJiQV7koVI
         P4343vVsR2BMUrYlhCDercEwN3fZwP5HqpGB5aETZPW9a0a475VCYyh8dn85N8IUJMTc
         jayhw1FCwrw9fCIxAdwCWZ1gu6NytuaaV8BW1jQFv13uw+srpDBuKKAXAWX/q3tY43rC
         9Glz4HBFW6AvTeLnh4pYkgTXbZO9DE9GU0vgpOKMYZ20qc0Jtj7TCreRB0t2lI3kzw3W
         VKTv2vmfWVvvJphcONpRIl7oU8cBNz4v8aJLlj6DFxHhp2FUq8+6qmdFVDsq9AvwedQ9
         +YQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681218929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wgb3WF3ClZHUUo8SPVwfKWBSe7V6BebzCiOXHJCKB0=;
        b=D5NMVQ8MXznfAtZUj92kIKSkJg48PUUrEEYMY36BmcDLEtlTM55qGzgedExO3ox/lS
         mvHcnioR2p1/dFcuNQBQXxdJ+yKD346NYG9SGx4dcvYGhvJerYxg+REJl4bk2KSQC2VY
         n5mGQNF65puEQgHMkxLl1c54wzaiJMZamlB0AxLUbraG9D140STWUPKR2vWY/yr5aFp2
         G3cjlv6XN14ieSlxo9bAKIY17x+if6BIe6wCr1QHL1LnWZZGjCzPDYiGzBTyTsy7PHPQ
         FUaMvIZ4KkkFRlfmtEmMo0uHFZ4V+skCCgdn9RNS2AyetjjU2ZILM+Y12ptG4RGlomXS
         x3Jg==
X-Gm-Message-State: AAQBX9esSYB9h17iNhnKF6XRUkwKNGI6z54vi5+HXMaZKK8Wt2yWz7Vq
	V3Wnqo5J6sP+sb3AtpknmEnh5g==
X-Google-Smtp-Source: AKy350b/unpq/6nv0p1gXpYVaZPh1RTspqN7ZnzKZ08lrc6Z1PPzuOIfKYotlo+9tXjamBMDD2dLmg==
X-Received: by 2002:adf:dbc3:0:b0:2d6:d05a:1fe0 with SMTP id e3-20020adfdbc3000000b002d6d05a1fe0mr6401474wrj.64.1681218928919;
        Tue, 11 Apr 2023 06:15:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a099:fc1d:c99a:bfc3])
        by smtp.gmail.com with ESMTPSA id m13-20020a5d4a0d000000b002efebaf3571sm7995168wrq.64.2023.04.11.06.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 06:15:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH 4/4] libgpiod: update to v2.0.1
Date: Tue, 11 Apr 2023 15:15:18 +0200
Message-Id: <20230411131518.401912-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230411131518.401912-1-brgl@bgdev.pl>
References: <20230411131518.401912-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Apr 2023 13:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102057

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is a bug-fix release addressing bugs discovered since the release
of v2.0.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../libgpiod/{libgpiod_2.0.bb => libgpiod_2.0.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.0.bb => libgpiod_2.0.1.bb} (90%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
similarity index 90%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
index bdfd72f2e..50b9203a7 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
 
-SRC_URI[sha256sum] = "f74cbf82038b3cb98ebeb25bce55ee2553be28194002d2a9889b9268cce2dd07"
+SRC_URI[sha256sum] = "b5367d28d045b36007a4ffd42cceda4c358737ef4f2ce22b0c1d05ec57a38392"
 
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = "--enable-tests --enable-tools --enable-bindings-cxx --enable-gpioset-interactive,--disable-tests,kmod util-linux glib-2.0 catch2 libedit"
-- 
2.37.2


