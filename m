Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.12368.1612990554226861700
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 12:55:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ULYAcPzL;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id o24so3130174wmh.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 12:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9sQPJbhzTzxczVVgjSnBo/wanuJpfX1YTIHsNrJzlnI=;
        b=ULYAcPzLFXrHvGvt17epYVCjjmoE3sSUArzaPsVaSV6RGjsmtLnsW3dMG58waD2ouE
         j8gI0ahsYEJ0tnF9PNFz/HIr3wvaRA3hkbPiCwbPH6Re/pI4xLw1/uQIu0hAgH2Q/nK5
         uYeh+x5f2/slGFfhCczzF/OppSOp2YcBel2MNxfAsF57frwXDUOzn8vYrEM9LrJm4CM6
         99kcSwphFuG7fgjvmQVIdKa3RqvyyzIqZJv62GjvtpnfBLRueIC8y7OdcbWdyH+nMk1H
         f82kjKcZDuNi5/k1/WeBgZODCtIIGL5fP1a7BLBJpORVdOgwz/zuzUKvmr54edKE5Skm
         9KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9sQPJbhzTzxczVVgjSnBo/wanuJpfX1YTIHsNrJzlnI=;
        b=UL/1DB97NNPgcPy5cukPvG2fb1V570DFP7UT2zME22PpplQ38hH6DGCGMgJjLbqsuJ
         LGWiumkMy18ztCSM9nDGfcgIT/EHopuMwNVa5t/K1jruDj4RXuiroSPmECk9kPjnB7nJ
         +UNMdPurnmhOCxJ8xptpsQwWAEctRyVn7y/6tA7eS/RA9yJVjjsX/4CYG6CYByODqG9+
         p5SdQ4tn52D5dAByKfUHFoq9ucUruIcmTg04f8DsPmz0c7eN2y/GUjZ+BmmeQhBkIb1u
         TS2oqA50N2vNAsW3RTI+H5kNbYPNlEptk2T78Z+Wc4DpZDcsjyPAoLxEAXk+xGL2sDde
         TU6Q==
X-Gm-Message-State: AOAM531w4Ul5YIlI6K91sxbPlYFZwZ/Fzqm+QiIGhUsP6E869nqj8vyI
	6/7/Ma3pVPg4RgTDqToEJP5XuDtyf7I=
X-Google-Smtp-Source: ABdhPJzee7TTWWdfAFggluAP6oRKXM1bP7CjRaz//DZK+tLmHg6FiyYw/25c5ToNBUbez5uTAaUraA==
X-Received: by 2002:a1c:de54:: with SMTP id v81mr840748wmg.181.1612990552836;
        Wed, 10 Feb 2021 12:55:52 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0b5b377382ef15aac10120.dip0.t-ipconnect.de. [2003:f0:7f0b:5b37:7382:ef15:aac1:120])
        by smtp.gmail.com with ESMTPSA id t126sm4521167wmf.3.2021.02.10.12.55.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 12:55:52 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/13] mousepad: upgrade 0.5.1 -> 0.5.2
Date: Wed, 10 Feb 2021 21:55:28 +0100
Message-Id: <20210210205538.690009-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210210205538.690009-1-schnitzeltony@gmail.com>
References: <20210210205538.690009-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.5.2
=======================
- New Features:
  - Add a "Viewer Mode" toggle (#50, !72)
  - Improve `--quit` option: close all windows interactively (!71)
  - Improve encoding management (#42, !69)
    - Display the current encoding in the status bar
    - Make the default encoding configurable via GSettings
    - Allow to choose encoding in the "Open" and "Save As" dialogs (#42)
    - Add a command line option to choose encoding
  - Add a "Delete Line" action (#13, !66)
  - Make automatic addition of the last EOL character configurable (#53,!65)
  - Switch to GFile for I/O operations (#4, #27, #75, !64)
    - Add file monitoring (#75)
    - Add a setting to create a tilde-backup file when saving (#27)
    - Make saving atomic (#4)

- Appearance Changes:
  - Filter files on mime type in the "Open" and "Save As" dialogs (#2, #35, !67)

- Code Refactoring:
  - Improve encoding management (#42, !69)
    - Make encoding dialog more generic and self-contained
    - Encodings definition review
    - Clarify encoding management when opening files
    - Improve unicode BOM management
  - Switch to GFile for I/O operations (#4, #27, #75, !64)
    - Set the save action sensitivity more precisely
    - Let GFile APIs check for file existence when reading
    - Let GFile APIs check for external modifications when saving
    - Basic switch to GFile for I/O operations

- Bug Fixes:
  - Make "replace" and "replace all" behaviors consistent (#94)
  - Ensure that the page setup is properly applied when printing (#90)
  - Avoid character escape issues in menu item action names (#91)
  - Properly initialize document search properties
  - Avoid illegal memory access when searching with tab changes (!73)
  - Revert to "Wrap Around" always true for the search bar (#83)
  - Prevent too late accesses to the buffer in selection mode
  - Direct call to keybinding signals for "Delete" and "Select All" (#83)
  - Improve editing keybindings consistency (#83)

- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mousepad/{mousepad_0.5.1.bb => mousepad_0.5.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/mousepad/{mousepad_0.5.1.bb => mousepad_0.5.2.bb} (80%)

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.5.1.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.5.2.bb
similarity index 80%
rename from meta-xfce/recipes-apps/mousepad/mousepad_0.5.1.bb
rename to meta-xfce/recipes-apps/mousepad/mousepad_0.5.2.bb
index 47bf1e221..a7e96851a 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.5.1.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.5.2.bb
@@ -7,7 +7,7 @@ DEPENDS = "gtk+3 gtksourceview3 xfconf xfce4-dev-tools-native"
 
 inherit xfce-app gsettings mime-xdg
 
-SRC_URI[sha256sum] = "3d2e277b1ae82dd0f0fa25e27169491fc38c2b70a9a624f2ea472604b317a582"
+SRC_URI[sha256sum] = "30adc5631a4e551df7b3e17ddc1d10e9980080f96518dedccc32170cb18efb8e"
 
 FILES_${PN} += " \
     ${datadir}/glib-2.0/schemas \
-- 
2.26.2

