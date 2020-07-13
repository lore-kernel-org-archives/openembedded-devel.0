Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.11831.1594608985399052374
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j4V/agBe;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id l63so5394359pge.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=U+CN3sKdbheip9Nqwpr6MJOBkQk0wAml85UmVleNBSM=;
        b=j4V/agBedfZFHYX4IbUzmcF35rbbq0BcnR8uuVB73huMNZtR0PztyuJErB9Uwn/Hd7
         YtevzCopoGAS9M+B6shkBDyfAct31cw+E/Ihu+SCrhOx99W5iJWb1r33OYaQ5JyrEFLc
         L5KmZi8o8enfLdR34b4p7CQOcOfvpS/y3CzigQz43RVRdzF7kikJCAAZlpTZgVBDRfsE
         5wqJdbuewNAF2IDwGuiWsWmWp8J7UYyKOKPIB0bNWRHaIBHjRP1DBfuh2NY14rj1kCZM
         C2dQryT/GLvYTu2UmMCAE5QTeFGxMONLguY9wkNgYvrfP356kOBKLQg4G1mBiKbidIvI
         HyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U+CN3sKdbheip9Nqwpr6MJOBkQk0wAml85UmVleNBSM=;
        b=PmchiMsNf0DR0SCRDlNevurx5TT08lyW7WUCSCyM71gIoTbJimGar+vsJpczoaIwz2
         zZKhyvyn4+QM0g/v7cxqWMdPJj/lDqb/RIypYGLkNUxL9T0Kqjk5vaLQieu2+oE1bwif
         8uOzGTNS6AKNOL9XwQlENovCy/lv3eoPw4h/BDyyyJbvJQC9F1vyOxg/6mqOX2ACUZMw
         5sYLmO7SVxxnc9LBh/L1n6l95gQVYK2rzN7deqlR9Ox04iYfSxKugkkOG0meUHGPKmsA
         FWPRXhmT4vl0RHm3BV7ps/zdPxGz1uV8wua0MYfJctFQHtHyWenHpY+ZwaellzgKC4td
         KhbQ==
X-Gm-Message-State: AOAM53202TGOa3uqwVugWXgo9AX/gom5s8R/EHZ4RH1FmBZikQUZtFUt
	qsCfepHIVJqEXJX252KLhGzzRJ2m6W8=
X-Google-Smtp-Source: ABdhPJwiCae9xmlNF1hd1ZL1c++/mKBgI2wT/X74q7DGWvzYRaZ3gKaoFrHBHAcjs2OprgZeoCgT3Q==
X-Received: by 2002:a62:794e:: with SMTP id u75mr59504534pfc.298.1594608984775;
        Sun, 12 Jul 2020 19:56:24 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e013:ddd8:d9b9:dad6])
        by smtp.gmail.com with ESMTPSA id u19sm13687976pfk.98.2020.07.12.19.56.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 19:56:24 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 07/18] modemmanager: upgrade 1.12.10 -> 1.12.12
Date: Sun, 12 Jul 2020 19:56:03 -0700
Message-Id: <f032374e55cf2560424c428356bc6230b601cdb7.1594608813.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594608813.git.akuster808@gmail.com>
References: <cover.1594608813.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f0a9b8bfab39e6b140bcb63f55cdadb692e7e91a)
[ak: 1.12.x is a stable release]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{modemmanager_1.12.10.bb => modemmanager_1.12.12.bb}   | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.12.10.bb => modemmanager_1.12.12.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.10.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.12.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.10.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.12.bb
index deab6f0466..b0ab46f3f2 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.10.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.12.bb
@@ -11,11 +11,8 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 
 DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 
-SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
-           "
-
-SRC_URI[sha256sum] = "b2b3058bbb72adf98b24707fdbebe58e590644a38145e30d574f685f154bf8aa"
-
+SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
+SRC_URI[sha256sum] = "a4fc4b33c0e8ae9372885f86fa033f3c1a89a76cd59a3458670eff1824222a3d"
 S = "${WORKDIR}/ModemManager-${PV}"
 
 PACKAGECONFIG ??= "mbim qmi \
-- 
2.17.1

