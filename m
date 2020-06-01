Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.48771.1591047945499826908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=StOKbCWl;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id x13so1330018wrv.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IDYw37Mr/uOeKW8KB379XHVyfU2GnJYU8Ns0wa/7lPY=;
        b=StOKbCWl8u82ZZlHqHaiZTqCG3NSfxDS7kiYD7c23mNHdtvWgmCi5oVc2m26oPeo3z
         bu3d5JIqsGTfmnTaTyeov9N3MNomcrIGwTprRvPjlkQLXz47pgSXQgMD8a/clirBMj7M
         nHyz21vEI46sJvasZ+xyMFXioALKxrHDem9fMWzubQ3O8tygJVPOygCtJCQfOb07h5r2
         SgTU8kkECWJ3H9ZO53kU/W7aGSNrJjzvw4hEDHc25ECPIj4qJ6pMfjcs+AZz5sx3rewh
         aOnfBAhUeDMJzt8QG6m0j5rurWqhrSHE2SRy3JfL4nKuseYYFVX7s9NZiMff3zsdT867
         QT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IDYw37Mr/uOeKW8KB379XHVyfU2GnJYU8Ns0wa/7lPY=;
        b=l4zVSy5FIZS1Zg4rI6VgQX0Nr4Mfomei6h+lZrG6DZ4T/nKtW9HLGekQImQs1pF9VY
         VoQtQETdOGoGwfL+pgSYCn1GdGqujpmu8fExM6FUu0AB7VtCTJXT6NWTbing1iK3htlf
         117lLMf7ZUkgmAS8Hs3SrwmEMWqukHvm4K/GbOWNsdRLM4Q7D11JmXiZf0SZu6xAuKCt
         TT8JdySh0JjuF1jiGJeYiwx5bM1wgDmIdCuiT/u71tUjXlwQ3e3PgF+sh0oyNwGsqUjY
         lyHuWdFnlQzSwuwfrnG2CCj84n+0hzwev92fDOLIgvOtRxXl7uePcv9NX3tKVHpRza5y
         j1Wg==
X-Gm-Message-State: AOAM530jUVwBmQJcFuwKU/CSIXjpefiBwEUM6zt+Q7Ohwap/CdC+ELiF
	R4QVgSWOPoaTnWCJuXSIcZFcCH1FlLE=
X-Google-Smtp-Source: ABdhPJyFAn/krqKkBSE8tfIlnN9sHKqwfy/xXqFJDOambHzdvW4LJUSIylKQgIlslZfo63yB2SNazQ==
X-Received: by 2002:adf:f74e:: with SMTP id z14mr24325954wrp.338.1591047943798;
        Mon, 01 Jun 2020 14:45:43 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:42 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 16/38] gnome-calculator: upgrade 3.34.1 -> 3.36.0
Date: Mon,  1 Jun 2020 23:44:54 +0200
Message-Id: <20200601214516.26624-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Overview of changes in gnome-calculator 3.36.0
    * Updated Catalan translation (Jordi Mas)
    * Fixed broken markup in XHosa UI translation (Andre Klapper)
    * Updated Swedish translation (Anders Jonsson)
    * Updated Italian translation (Janvitus)
    * Updated Indonesian translation (Kukuh Syafaat)
    * Updated German translation (Tim Sabsch)
    * Updated Dutch translation (Nathan Follens)
    * Fixed broken markup in Dzongka UI translation (Andre Klapper)
    * Updated Czech help translation (Marek ÄŒernockÃ½)
    * Updated Hungarian translation (BalÃ¡zs Ãšr)

Overview of changes in gnome-calculator 3.35.92
    * Updated Spanish translation (Daniel Mustieles GarcÃ­a)
    * Updated Croatian translation (Goran VidoviÄ‡)
    * doc: Don't pass --fatal-warnings to valadoc (Rico Tzschichholz)
    * Updated Lithuanian translation (Aurimas ÄŒernius)
    * Updated Swedish translation (Anders Jonsson)
    * Removed obsolete keyboard shortcut #148 (Robert Roth)
    * Updated Persian translation (Danial Behzadi)
    * Updated Basque translation (Asier Sarasua Garmendia)
    * Update British English translation (Bruce Cowan)
    * Updated Japanese translation (sicklylife)
    * Updated Czech translation (Marek ÄŒernockÃ½)
    * Updated Turkish translation (Emin Tufan)
    * Updated Finnish translation (Jiri GrÃ¶nroos)
    * Updated Brazilian Portuguese translation (Rafael Fontenelle)
    * Updated Hungarian translation (BalÃ¡zs MeskÃ³)
    * Updated Chinese (Taiwan) translation (pesder)
    * Updated Danish translation (Alan Mortensen)
    * Updated Serbian translation (ÐœÐ°Ñ€ÐºÐ¾ Ðœ. ÐšÐ¾ÑÑ‚Ð¸Ñ› (Marko M. KostiÄ‡))
    * help: Update icon for 3.36 (Andre Klapper)
    * Updated Karbi translation (J T)
    * Updated Korean translation (Changwoo Ryu)
    * Updated French translation (Julien Humbert)
    * Updated Polish translation (Piotr DrÄ…g)

Overview of changes in gnome-calculator 3.35.90
    * Updated Greek translation (Efstathios Iosifidis)
    * Updated Indonesian translation (Sucipto)
    * Drop padding around the display !40 (Adrien Plazas)
    * Updated Keyboard Shortcuts (Sabri Ãœnal)
    * Handle Escape and Enter correctly with completion #144 (Robert Roth)
    * Updated Spanish translation (Daniel Mustieles GarcÃ­a)
    * Updated Slovak translation (DuÅ¡an Kazik)
    * Added F10 for primary menu shortcut #148 (Robert Roth)
    * Updated Catalan translation (Jordi Mas)
    * Updated Friulian translation (Fabio Tomat)
    * Updated app icon !43 (Tobias Bernard)
    * Updated Malay translation (Umarzuki Mochlis)
    * Updated Brazilian Portuguese translation (Rafael Fontenelle)
    * Added Rack Units to the conversions !37 (LÃ©o Gillot-Lamure)
    * Updated Karbi translation (J T)
    * Fixed freeze on calculating atan(+/-i) #139 (Robert Roth)
    * Fixed mode shortcuts by removing blocking mnemonics #138 (Robert Roth)
    * Implemented result history browsing using alt left/right #129 (Robert Roth)
    * Added translator comments for possible modes as command line arguments !38 (Rafael Fontenelle)

Overview of changes in gnome-calculator 3.35.3
    * Updated Chinese (Taiwan) translation (Yi-Jyun Pan)
    * Updated Spanish translation (Daniel Mustieles)
    * Updated Swedish translation (Anders Jonsson)
    * Help updates (Andre Klapper)
    * Updated Galician translation (Fran DiÃ©guez)

Overview of changes in gnome-calculator 3.35.2
    * Updated Italian translation (Milo Casagrande)
    * Updated Catalan translation (Jordi Mas)
    * Updated Japanese translation (Ryuta Fujii)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...{gnome-calculator_3.34.1.bb => gnome-calculator_3.36.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_3.34.1.bb => gnome-calculator_3.36.0.bb} (80%)

diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_3.36.0.bb
similarity index 80%
rename from meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_3.34.1.bb
rename to meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_3.36.0.bb
index b09e34d4c..c250981c4 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_3.36.0.bb
@@ -23,8 +23,8 @@ inherit gnomebase gobject-introspection gnome-help vala gtk-icon-cache gettext f
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "9157b93a3f41fdad80df26c062b95c7b"
-SRC_URI[archive.sha256sum] = "4d5348c2fbf01d040a2cb5e84de812c503911e1ea498a83e7eefff52c4417051"
+SRC_URI[archive.md5sum] = "71854fb58671b4a88ac990e2f2439e4f"
+SRC_URI[archive.sha256sum] = "a2e830f9c9856fad65dad1d6c0ae6abad0f0b496c9984ac005315c5cc4220db3"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.21.3

