Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.2713.1590520822889912116
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 May 2020 12:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=FcPdQhXk;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.173, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f173.google.com with SMTP id b27so11855008qka.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2020 12:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Kvscx4zQN9NKK7wrVixNc/8mpoK6guTM6P8MxFNWFp0=;
        b=FcPdQhXkD0bXm2C9S2EWyTUZODe7WpoQcA/g1BsTEU4nK7Eg/Se9AOLi6DO8xpAIDt
         qKG8dGJvrFRuSA5tbxSxd1eB1pS93KshRlNJ6mr0YYpFGJJua1sDQae8aUmYOqnvDKqq
         UM2ECedNLvlUov/Gve9W7XuTJEMhO+Ki7rFC8bFZPSHyVZIwvJHM6xxClFDjLBb6kZ+B
         BaLbBItPIWA7ucBdpDfaFB8G7hQhyE9/KWHkVAhYjAAK9SALAxelH+RNSO8as5ii18mn
         v8JdEvOQCqynml7qZTkuvQ/ic22kBifdJho5JanXfW+gvXY9+bQK9dukgBwm+5F9iOp4
         eDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Kvscx4zQN9NKK7wrVixNc/8mpoK6guTM6P8MxFNWFp0=;
        b=mL4Bux3jDnnuhdUJ2fkBN9DXHfHYs2CfHRe+naEPAcjSqjnpVrzeeiuCKKqgyLPTkx
         mM2KN9zajguAwiTJMjoANbusgK486Enwo0mt3oXfXI/3UWyi6oqZ/UEKs9LCvQ9maVMz
         MYkkoQoWTGXguUf9od542T5rwC6U9nW2wNkyF43/aH8d50WeJ1FRJLfeXSamNU6seWmX
         ue8xskri6iHksPCNvZQynVChA/eWPuG5tEuvCe2/wRghn+GBPMrBL/gbl7RM8kGbiCqV
         x0tcI7LXb65gJ+Ot/zLhsV4ZKdLy5HjJ9ROARzcbbUG/QxkHGTVVcD91XTT6tlziVUqk
         GD8w==
X-Gm-Message-State: AOAM533pV6A20b2cpCrDJuReEgkd/ey+qF/zCJivmlhe2Xayxwa4/Srh
	fG2DM20kF6JNRtv2KjWRXNOP/eM0rAc=
X-Google-Smtp-Source: ABdhPJxCT4rQCetp8laLtfXJCA+K6xXJEhDZlLpTqV8e4hgjbKycX4V85i2quADn+E8masnsL6iQEw==
X-Received: by 2002:a37:99c6:: with SMTP id b189mr367677qke.240.1590520821647;
        Tue, 26 May 2020 12:20:21 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:d122:133e:cc4c:c1a0])
        by smtp.gmail.com with ESMTPSA id c197sm434453qkg.133.2020.05.26.12.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 12:20:21 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [meta-oe][PATCH 2/4] python3-pytest-html: Update 1.6 -> 2.1.1
Date: Tue, 26 May 2020 16:20:09 -0300
Message-Id: <20200526192011.17024-2-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200526192011.17024-1-domarys.correa@ossystems.com.br>
References: <20200526192011.17024-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 ...html_1.6.bb => python3-pytest-html_2.1.1.bb} | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-html_1.6.bb => python3-pytest-html_2.1.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_1.6.bb b/meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-pytest-html_1.6.bb
rename to meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
index 8ace29ed1..27b768155 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-html_1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
@@ -1,19 +1,24 @@
 DESCRIPTION = "pytest plugin for generating html reports from test results"
-HOMEPAGE = "https://github.com/pytest-dev/pytest-html"
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://../pytest-html.LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
 # Per README.rst the license statement is fetched from
 # https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE
 SRC_URI += "https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE;name=license;downloadfilename=pytest-html.LICENSE"
+SRC_URI[license.md5sum] = "5d425c8f3157dbf212db2ec53d9e5132"
+SRC_URI[license.sha256sum] = "2bfdca60adf803108d4c7f009000bea76ad00e621e163197881b0eaae91b530e"
+
+SRC_URI[sha256sum] = "6a4ac391e105e391208e3eb9bd294a60dd336447fd8e1acddff3a6de7f4e57c5"
+
 
 PYPI_PACKAGE = "pytest-html"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "ac956864a9b3392203dacd287ae450f0"
-SRC_URI[sha256sum] = "a359de04273239587bd1a15b29b2266daeaf56b7a13f8224bc4fb3ae0ba72c3f"
-SRC_URI[license.md5sum] = "5d425c8f3157dbf212db2ec53d9e5132"
-SRC_URI[license.sha256sum] = "2bfdca60adf803108d4c7f009000bea76ad00e621e163197881b0eaae91b530e"
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-pytest \
+"
 
-RDEPENDS_${PN} = "${PYTHON_PN}-pytest"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

