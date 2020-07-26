Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.21209.1595724950118628435
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 17:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=QrPdpyhf;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.54, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f54.google.com with SMTP id d2so1509995lfj.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 17:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hqi0RPQ3t1v0ioqlf0BhPaet0pJHX+WPgkhWiHBSv04=;
        b=QrPdpyhf9763doJiG0KeU0YXhn94cARpx/WC/NyiNG2JMXu3Og6eM5M3v78oy9rFON
         3/t8zL2glZ6EoGlno1f+cNeurxBoL/0t30ISIi2fbzlnDZoIuF2ec7f9PSvPZJRVU/BF
         84UGtvIuv7oQjSdY6YjZdF0ePlXEmdm7/ZS3GbFcxi7xmntGHyEEHWvbFV46/KvUB4ng
         IvVIQ0aC310JKU3U/F2w4xvde3HjNtlT0ZMNrWKfOwWg2s9VXcNtx2d4ucEMeRLOSocj
         69KaHu02LAZQoBDqDDuISyz5ywSX13dtwm9WimSEzczpk8NPSYBA+fuuF2dcT8WfS+2L
         3DjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hqi0RPQ3t1v0ioqlf0BhPaet0pJHX+WPgkhWiHBSv04=;
        b=pnnQomNZrFtuX+v62139cJAGmbFOtlE/kDAz3R2qaDZDWYsxmZ4horgtXPY7XTsBXH
         zVLM86Resiim4B3FVXoHcphlX8H6WcWbrB9/sPdB/PP0G8UOWSEzVxThqoBJqICMW1Ha
         j5QSt6YDY20Q/IeID2OlNGSMKCvtafmCT2/KAUziiLVCg57WB02E/KIT97PcwjIYoIwd
         WI6KEH7oavig6H4NP9psKP+4TuyGdpi6+0ncFzKQm8x2mhzwW/yCAh63pTrrbRZDMfnN
         Gi27VVBbNBVnbPR/HoOXKp91UA6yc+4wcWIae5qMtDPmoeqTeNdbCr9Qm1ZPS++jz9zc
         sJ6Q==
X-Gm-Message-State: AOAM531nCpFywaleo8Z9SFqvLEFnA+3htN83ZR1BH0TBGc5oaadWUlZZ
	acLo2mn7wCD1DELKE1Fj0UtcJjTNgMc=
X-Google-Smtp-Source: ABdhPJxnkCI6L6wcdHk1Rc05EiOdyiKKBYZJK84LYL+qGeqalheIlD+gBlUOLIR5TDVTXapjxYi3BQ==
X-Received: by 2002:a19:be53:: with SMTP id o80mr8365857lff.33.1595724947557;
        Sat, 25 Jul 2020 17:55:47 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id f9sm1852490lfc.43.2020.07.25.17.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 17:55:47 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libpeas: update to 1.26.0
Date: Sun, 26 Jul 2020 02:55:44 +0200
Message-Id: <20200726005544.3645042-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libpeas/{libpeas_1.25.3.bb => libpeas_1.26.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-gnome/libpeas/{libpeas_1.25.3.bb => libpeas_1.26.0.bb} (80%)

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.25.3.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
similarity index 80%
rename from meta-oe/recipes-gnome/libpeas/libpeas_1.25.3.bb
rename to meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
index 57419a4275..888525e085 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.25.3.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
@@ -10,8 +10,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache
 
-SRC_URI[archive.md5sum] = "08bfff8f9688cf630dcb0f950617661f"
-SRC_URI[archive.sha256sum] = "1c9bbb29740c29cd6e1dd0c9964722ff08cd5e6f68f1b5c135bc391a6ce97639"
+SRC_URI[archive.md5sum] = "f7723bf8433b7984121157e1e9a629b5"
+SRC_URI[archive.sha256sum] = "a976d77e20496479a8e955e6a38fb0e5c5de89cf64d9f44e75c2213ee14f7376"
 
 PACKAGECONFIG[python3] = "-Dpython3=true,-Dpython3=false,python3-pygobject"
 
-- 
2.25.1

