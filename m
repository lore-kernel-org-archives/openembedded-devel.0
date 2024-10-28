Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D418D13596
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 11:26:10 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.49296.1730114767504397014
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 04:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lhRQ68tT;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a26a5d6bfso642897766b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 04:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730114766; x=1730719566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G13t69yG08RC7Ty7eNJJWdq5KVyFWgBVi1hf18aZikI=;
        b=lhRQ68tTjnU3m5B7qT7I0ADmEH/LoQ3min5CHaPR4LAbnVVVCAffn1FD0p6S+Ie7Nl
         lKijrKyxoee2UPf5SzlrwgX7J1AIFyCLrN2iB+ORyju4vaDsm2Dameq0vjpj2LpWheJ8
         4WzWf+imQD7XSfkwXp1d+eqRo5WTg9Q3YZqMtAQW6LmxElIIzK9vMjCZ9KGFuzTs1pqU
         ERXuml1B1jWaRvHu/+My2i4MAa2sTdci3deVTceaNh6TeJM98z3ApIvn0TK78YeesnMK
         8NwFJy+s2uV5Q5/jPorgmcnaC0oXPi1RARgRh7Y7Um+1Z54cy9IOSpCzx1ME04Kfu4/t
         BXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730114766; x=1730719566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G13t69yG08RC7Ty7eNJJWdq5KVyFWgBVi1hf18aZikI=;
        b=TylL4+ecygt6GKHqJ2I7HdSWSR1U9EmdE78nk1+zhSqcMJeUlmYk35R+msJ2iv6Xk7
         gi/0BqpZvpnZAB2VWCJhF+48NBjSbBVkS7lwy5xOxTfoajKrIaxnkgIABbb5VMqMtM4I
         7KtoNR0xjtkjFU19IduZ1sRefGkLp2/a5oW0GnW6jsdZSbzV3AbJhrRAOXjex2BYKvse
         5TM5S4cjDEqHovxcmQnz1IR/1Z55hDuKvMQ2H6/kLU3QlaxMrnvCUlv2L2lkIm+rMtYN
         6dJ1ZSWYWe5H+5BP5pi+oPGP0EUc1Bcsr3RuMadW3BpzR011M8dlS7RKOHjNimqfHbGW
         j/Uw==
X-Gm-Message-State: AOJu0Yw7sgD7SLbzVm9APOUYdO1oMMoNfs7ZxmiMpMk9pwk6uHBzkf6x
	FXtmovSFn1rBvCR7h1Ii3kGC7ajAFozZKxKv/qvmdT88X3H1oR5UHWI+YA==
X-Google-Smtp-Source: AGHT+IFMkhicbkwr6zAG/qMrYoSk2UchDdzttMLe9Fsp68u6sQvynWOmmuea6R4edqophqOUhacOMw==
X-Received: by 2002:a17:907:97c6:b0:a9a:4158:494a with SMTP id a640c23a62f3a-a9de615bc4emr668170466b.41.1730114765360;
        Mon, 28 Oct 2024 04:26:05 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1e0b2356sm367679566b.30.2024.10.28.04.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 04:26:05 -0700 (PDT)
From: max.oss.09@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH] libgpiod_2.2: depend on glib-2.0
Date: Mon, 28 Oct 2024 12:24:50 +0100
Message-ID: <20241028112450.2793248-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113260

From: Max Krummenacher <max.krummenacher@toradex.com>

In my setup a build fails with

| checking for gobject-introspection... configure: error: gobject-introspection-1.0 is not installed
| NOTE: The following config.log files may provide further information.
| NOTE: /var/home/krm/build/oe-core_master/build/tmp/work/cortexa55-tdx-linux/libgpiod/2.2/build/config.log
| ERROR: configure failed

From config.log this seems to be related to glib-2.0 not found:

| configure:22484: $PKG_CONFIG --exists --print-errors "gobject-introspection-1.0"
| Package glib-2.0 was not found in the pkg-config search path.
| Perhaps you should add the directory containing `glib-2.0.pc'
| to the PKG_CONFIG_PATH environment variable
| Package 'glib-2.0', required by 'gobject-introspection-1.0', not found
| configure:22487: $? = 1
| configure:22491: error: gobject-introspection-1.0 is not installed

Note that glib-2.0.pc is present in recipes-sysroot-native but not
in recipes-sysroot.

Adding glib-2.0 to depends allows successful build of libgpiod 2.

Fixes: 117d09ce43c7 ("libgpiod: update to v2.2")
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb | 2 ++
 1 file changed, 2 insertions(+)

I'm unsure if that is the correct fix.
I would have expected that if gobject-introspection-1.0.pc depends
on glib-2.0 to be present, then the inherit of gobject-introspection
would have done the needful.
However I'm not really familiar with gobject-introspection in the
first place.

Max

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
index b55da72f7b7f..3d9758e27af7 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = " \
     file://LICENSES/CC-BY-SA-4.0.txt;md5=fba3b94d88bfb9b81369b869a1e9a20f \
 "
 
+DEPENDS += "glib-2.0"
+
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
 
 SRC_URI += "file://gpio-manager.init"
-- 
2.42.0


