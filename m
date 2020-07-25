Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web12.8272.1595677602946099177
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 04:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=h/Rr7G3C;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.179, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f179.google.com with SMTP id x9so12543160ljc.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 04:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vtSXoN2jIN4IkRnTadhvRA90AnSFoNu+KeyG/9u1aLU=;
        b=h/Rr7G3CXcsANPR0Kr/EgxL4RX2y0UMlP+FMndrrgNnF0dIEChi+KKnvMMBI+NocNY
         wOES+dY93gXUYYJNABTi0D0hrsbWH3CZJCE0dYGeLCkjrn6ksJSqH/nocgKnkGedFDEB
         iMFgrt94DlnaXyH+tLARHO/C/Gg3K62rk+PPn8vXRw/Nn3qY4xw7sWiAl3H1ZKUaL2bh
         TUQzfxkSXyIbicedpnWO6BHOwIbJbZLdNuuUBzJXFQraWscqB4ssHP7s1dKIvn4gsi1R
         7ALxu6INk5kwMoMQ/NIrHE2jJlWDQ0sdZ5iCwgGBPy7uws5hMuM2CLBIQnF9+UAdAAgW
         Ydlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vtSXoN2jIN4IkRnTadhvRA90AnSFoNu+KeyG/9u1aLU=;
        b=jRi9S8AvbKY3dxHgV59GvIwLF6i0QzVYePZZFSZsVD6INOYenTpPy2q3QOmQzvH4Ft
         SVXph8RsM74+Klny+6iEupu10nBzefQNASi/h1n0+5SALGctRza/ZSgWl/WQdo01dzcK
         VYhbqKvij8zHB9l+TWbOt/AZnQsXEA5WLHDlT9Y9FGUgPLkNk7uYJf78GAEYRABQGqSv
         as5QiDiOfs9mB9X+jU63/WZg128NGL5bkkrBx/7blmyl8OTHsjvByEtMoLPtEwnWaaOQ
         Peh/+vQl9EZ3bVQTwWDm3c7pLOagthVo5LvjWcfXvGcRtYFEKthN8UhhJOooRgqmCPB5
         21Ug==
X-Gm-Message-State: AOAM531rHDlWpUUW18DMgRWgkMgpnCluTdLMMrW5xJK5fdbhBrX/wR7P
	ukMVV00M4tvmeyC0nMsPiaR7jMsLJ9s=
X-Google-Smtp-Source: ABdhPJxYuWDbfOw9Hd3MrTMX9lX8OCtZlNNxv40Q93+e79XPJ6tg4Lnrgj9rGvuU1jvRfe50YIyNUw==
X-Received: by 2002:a05:651c:156:: with SMTP id c22mr6577271ljd.453.1595677600714;
        Sat, 25 Jul 2020 04:46:40 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id u10sm1230268lfo.39.2020.07.25.04.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 04:46:40 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libcec: update to 6.0.2
Date: Sat, 25 Jul 2020 13:46:37 +0200
Message-Id: <20200725114637.2298336-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libcec/{libcec_git.bb => libcec_6.0.2.bb}                 | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-extended/libcec/{libcec_git.bb => libcec_6.0.2.bb} (94%)

diff --git a/meta-oe/recipes-extended/libcec/libcec_git.bb b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
similarity index 94%
rename from meta-oe/recipes-extended/libcec/libcec_git.bb
rename to meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
index 39ceb489e2..894ee52f96 100644
--- a/meta-oe/recipes-extended/libcec/libcec_git.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
@@ -9,9 +9,7 @@ DEPENDS = "p8platform udev ncurses swig-native python3"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11 libxrandr', '', d)}"
 DEPENDS_append_rpi = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', ' userland', d)}"
 
-PV = "5.0.0"
-
-SRCREV = "43bc27fe7be491149e6f57d14110e02abdac2f24"
+SRCREV = "29d82c80bcc62be2878a9ac080de7eb286c4beb9"
 SRC_URI = "git://github.com/Pulse-Eight/libcec.git;branch=release \
            file://0001-CheckPlatformSupport.cmake-Do-not-hardcode-lib-path.patch \
            file://0001-Enhance-reproducibility.patch \
-- 
2.25.1

