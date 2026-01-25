Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBB3E63C82
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 07:40:11 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35142.1769326809029086120
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jan 2026 23:40:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ImsRe9zN;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-435a11957f6so2913808f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 23:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769326807; x=1769931607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SItuj1Tohz2RP4w6XOY+ujpdPcIBX7yIyY3UV5PKAg=;
        b=ImsRe9zNDWTbUOq/A7r80wtmr11JSRmH3QplcCjzZkHWuX1nwu6BxJldHooiJPoQIV
         GeWYNa2aeJB/FrxZdDnj1wT9nbpHYhtV5Jgk94jcJTmkdTuSDHse2TAdVi4091S0F2yc
         QPI87ju4P+Sr8EjP/vEKUMLHNA7J0dCuBP+nVrtKW8dF1O9PrYn5vFoRDgjv2nZrFDnz
         +/k7KF0wSeq4eLMd7FVtFzGb83N1//zRYGvRmpMEbaOzgt/ozTt78tR/dKlnwdUY4qEa
         3kDs27IBTAJyT/m7j+s6JLaOLLSm0j9w/LZFcOdNz8FFusosupDV0dP+IfYYgzDwjWb3
         rd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769326807; x=1769931607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0SItuj1Tohz2RP4w6XOY+ujpdPcIBX7yIyY3UV5PKAg=;
        b=lxeu45ZKqfdYyMAM+qOfT76QOTdTrngD2ToC30XndSzovbS8QUh292PQmP+ZACcL9S
         HpMBnXHyExDmIHjB33HCbEj96b8ewm95mMYIdHU/acbXXDt8r3pgAJNrZ7faSpoXbauA
         8KmfE7LnQSovxklB8ZyM/UG9aE6Md2+GNndz7q2cAVKt4hpwo8tmB6ajDE/LkNuaXWk9
         bedhC1LFI+41RkVEZmxd54nY/rHdKWUkszUp7OU3X78UriLsVQOKLuk7Gyq4DLV5x6An
         Fv2/9M/58pHfnl+En767Pzlmx8655dRufh2BZ0R+8HER67X63V2yjpCJ8fL8XuZqgPvx
         cLVA==
X-Gm-Message-State: AOJu0Yz332++aKabalJxZopO/6B318ecOxJ8Kzih0QsOuN1bvre3OBpV
	Xt1mmkL8pw537S9uIWV2n52+LBN3yFLsucvAYbsdIpLGf1zj6/gnh0m/327xbA==
X-Gm-Gg: AZuq6aLm/WcVXdgAnl9fnKYRieBHL7+1G9LYo51tL5totps4qFM0uygKXJXpCgCBXva
	dCZnEkEFcnVqgnSjxU1nNlm2JkphFqNVLKTK0WuBoKRQAQnU9KAOZYMe3ThxG4EiMHhQNAt752E
	CCtDjGAz/WzOCvvQy2s/DAYDou1SBtmoGsa+cK9Ph6TFyfuOvfSJySXM8IIwCmJxCfSvjv5MDAV
	kJ1P/iI7stXwCYzrXKaSMlRusqK8uv3OjGhYPMzkkaHBCe2mVYd4OHrA29CSfnuNjlw5VYLMt8u
	rt4CPsinH4xiMo8xv4PT1dBBgiqIbb/Oyvhx55+4ligwAEmKBExgyKqECyXAeT3JClFR/SqcxQV
	KZpFt9dyv591Zigs36W7Epc5foYqhBIVH20ORECRuIJ4waC+paSaExXl7VO699VW3FMq5baELWS
	GQVty4zhOe
X-Received: by 2002:a05:6000:430a:b0:432:851d:217e with SMTP id ffacd0b85a97d-435ca1aa8e8mr1366377f8f.44.1769326807334;
        Sat, 24 Jan 2026 23:40:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e7156dsm20265542f8f.20.2026.01.24.23.40.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 23:40:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 2/5] gjs: upgrade 1.72.2 -> 1.72.4
Date: Sun, 25 Jan 2026 08:40:03 +0100
Message-ID: <20260125074006.244692-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125074006.244692-1-skandigraun@gmail.com>
References: <20260125074006.244692-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 07:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123833

Changelog:
1.72.3:
- Fix for crash after build against libffi 3.4.2 ported from the development
  branch.

1.72.4:
- Various fixes ported from the development branch.

- Closed bugs and merge requests:
  * log_set_writer_func is not safe to use
  * Gnome-Shell 42 - crash after login (general protection fault)
  * Static methods on classes from GObject introspection are now present on JS
    classes that inherit from those classes.
  * Enabling window-list extension causes gnome-shell to crash when running
    "dconf update" as root
  * Possible errors in cairo enums
  * cairo.SVGSurface need finish() and flush() to finalize painting
  * Handle transfer-none string return value from vfunc implemented in JS
  * GJS freezes, program stops responding, error states Gtk4 EventController
    GestureClick returns incorrect state- Gdk.ModifierType on mouse button press
    in X11
  * gnome-shell crashes on exit in js::gc::Cell::storeBuffer
  * Memory leak with GError
  * GVariant return values leaked
  * GBytes's are leaked when passed as-is to a function
  * Transformed GValues are leaking temporary instances
  * GHash value infos are leaked
  * "flat" arrays of GObject's are leaked
  * Gjs console leaks invalid option errors

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.72.2.bb => gjs_1.72.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.72.2.bb => gjs_1.72.4.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.72.2.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.72.4.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.72.2.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.72.4.bb
index 3170341560..abd888ac30 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.72.2.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.72.4.bb
@@ -8,7 +8,7 @@ DEPENDS = "mozjs-91 cairo"
 
 inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even pkgconfig
 
-SRC_URI[archive.sha256sum] = "ddee379bdc5a7d303a5d894be2b281beb8ac54508604e7d3f20781a869da3977"
+SRC_URI[archive.sha256sum] = "47a2339461f15b4eda244544e525c6ed91a76fd17e4cadc0396c476e12981979"
 SRC_URI += " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch \

