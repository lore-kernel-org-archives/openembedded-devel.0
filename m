Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.12376.1599654210551227064
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 05:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=oAsjDJ9D;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.193, mailfrom: fabio.berton@ossystems.com.br)
Received: by mail-qk1-f193.google.com with SMTP id p4so2193977qkf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2020 05:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :organization:content-transfer-encoding;
        bh=evVaCx/RtggdmE/XXH/za4ucU2ihJxZY766GhhThzx8=;
        b=oAsjDJ9D4dJABVM9NLG3LoZ088kFSzbpckt74bYprOBmzJOJfhJKIihDS05lreHkI1
         BopBcOShV8dVrByVVjBd+oeH8VzQNsfI/0SecoDENFG/6IQqt7Lv5aMelz2qXTzRFoPb
         c9nuVjRm0y9RqOk1pD/aUGFwNQHg/NC75/wyYi27QviT/8EbQHDDDyShI5qREmDLfZdi
         XdDL87aZpLLuqkG8oa1gEsv1fzCP8MnKl/9BNcLUFAb6fEGVwNFgzz7Muf0w4/gMo2DJ
         OHy2p8DKdsWtISBsP73vtBZR7ywJl45T5l8h2QAnPG+dk+rH6MYb1w8AA5fYSTuRWC19
         0Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=evVaCx/RtggdmE/XXH/za4ucU2ihJxZY766GhhThzx8=;
        b=A41XKucnii7gLw77dMmhXk/tzt6+5gh0amB2j+E4EdTbsu84w5btc9aWhX6l5OE9ad
         NmTliOElFZP/XzY1Y6UOw2HmgVJt9SLGHRobYkLeXRIELmtM9M6TISyKeDD5FFn6bZCd
         06EfmXh3CGEbn0iVpXB0dDW1yRHtuRC1NqNWbaufdfczJowCCuc0rg4LWUGxM+JlDgzj
         JKapZNbHhxheKIOTAHlOnMb/ai/PsYUYRQ0NPLvIhG7ETJohFDAuyGbn0CRO8Uehw8rV
         QmUTUMXcpybtp9OQyB0QgeSfwp6WM8G6OpamBEhH8JlOwkpGbkWUiZFK48SfjQ/AZQOU
         kayw==
X-Gm-Message-State: AOAM5337+YUy/Iy/QiPEIoHU9XRrW8d1ZIF0o8Af7R7iITbPjNh2ZAOr
	9Ul8cwoVEb2JnB3gTFSvK6elWJf9pcWEm2Se
X-Google-Smtp-Source: ABdhPJzeDPWrpdobN1WJhAljr9GgHxXzg4tuUbOiw6q+qZ6Q+gVFL6z/+8JWouU/sjrvc4uJaPrrhA==
X-Received: by 2002:a37:6109:: with SMTP id v9mr2911445qkb.418.1599654209212;
        Wed, 09 Sep 2020 05:23:29 -0700 (PDT)
Return-Path: <fabio.berton@ossystems.com.br>
Received: from centrium.lab.ossystems ([181.220.78.182])
        by smtp.gmail.com with ESMTPSA id z74sm2455222qkb.11.2020.09.09.05.23.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 05:23:28 -0700 (PDT)
From: "Fabio Berton" <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] libqmi: Update 1.26.0 -> 1.26.4
Date: Wed,  9 Sep 2020 09:23:22 -0300
Message-Id: <20200909122322.12899-2-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200909122322.12899-1-fabio.berton@ossystems.com.br>
References: <20200909122322.12899-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

Switch to autotools-brokensep to use the same directory for build and source avoiding error:

  configure: error: source directory already configured; run "make distclean" there first

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../libqmi/{libqmi_1.26.0.bb => libqmi_1.26.4.bb}            | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.26.0.bb => libqmi_1.26.4.bb} (78%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.4.bb
similarity index 78%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.26.0.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.26.4.bb
index 3a1b70b80..2d1a4c47e 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.4.bb
@@ -10,12 +10,11 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "glib-2.0 glib-2.0-native"
 
-inherit autotools pkgconfig bash-completion gobject-introspection
+inherit autotools-brokensep pkgconfig bash-completion gobject-introspection
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "8da95a97e893311878f8ce12dcf8fad0"
-SRC_URI[sha256sum] = "7f0429e0ae58792e21512d09ca2412537840ea42696762795af1284a65fd6e40"
+SRC_URI[sha256sum] = "c0adcb84ba452e3e13edeb3f94f7b003ea927b354bc187629e05efb333ce270b"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.27.0

