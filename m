Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.356.1623964295297389190
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jun 2021 14:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BTPSo1ii;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: geoffhp@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id g4so4553585pjk.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Jun 2021 14:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RihAleyrC1TXX5N/GpD0hQbrOkP27P4yj3phUGifiBU=;
        b=BTPSo1iiTJCtvt508qXkyQfoKw5hThK1jYHJ5yRoD6PEsxHFsk2Q/UoGLWkTxqCyPe
         lNz64MsFMpRx2mgZQqhFCcHhEmjMRXH7AFwUUpGcS8++5VlBhdLEmyY/JA2FpZI1p2O5
         NFL1GZGAdk0OYcS9OnszfkFLqJ/+K028D+hw+ErnufWBwMqPLexV7j7dfVVRvDDeZzE1
         3WJe9e3+xWHXlMfWfxK1BCsnrHVhoHD+jXclVWVhuNiXjnKa4Sv1xkHA624DgXGUmdIL
         s56PY8NrZaAEwhZdi1Sy4H7geb5gjq74Br2AdgF2c+F1xmBcJMTevjp/gQE2+2umkVls
         sqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RihAleyrC1TXX5N/GpD0hQbrOkP27P4yj3phUGifiBU=;
        b=KOW6fw6bIXLJXssXi/4st1ClefiqtPWpQFmij8tRl+mq6GZbzFqG4yAs2y8d2Frjit
         jyFR2qIAZfwKcZBRLqGH0/zNjmaRAobtr3tyXhPmtDzQkrKQ0jS858ELDes/dURaO7Kg
         ppLuCX8DTYUNRuLZFOqQvpK5g7KFTFcFYExLfqniDDfUcEMoGRQkkDJ+uhacJj8O0Pv/
         tcP6rzTtdRMUlgcIUc2LIzaKCMolePEpVD3oS3gn+c4n3+VSx8VpiUbbvRspleYe7Ceu
         CVYzHsoxZRAWMTu7J01OsgXgPeBIZA1Nfd4pmfSvfq6k7XjhRnZdo8Zm2ngD72I8AlH5
         ac8w==
X-Gm-Message-State: AOAM533zI2i+yJ/NrsISmzSx9w4b2UNk6q7gENdN2y7wXNMiMgaz/Vc6
	vZ09BxGnC+dxMWhI9QP5HZ4+lkxjPAXz3g==
X-Google-Smtp-Source: ABdhPJxRGv+uvYFBY8KnB6eg2wz1tFxb7b2FbuwD8IJTB2/DGw7BldF3n4cO0QzDJPE2j2yIY9nC6w==
X-Received: by 2002:a17:902:ea0f:b029:10d:6029:780f with SMTP id s15-20020a170902ea0fb029010d6029780fmr1654771plg.66.1623964294632;
        Thu, 17 Jun 2021 14:11:34 -0700 (PDT)
Return-Path: <geoffhp@gmail.com>
Received: from localhost.localdomain (cpe-107-185-48-203.socal.res.rr.com. [107.185.48.203])
        by smtp.gmail.com with ESMTPSA id n17sm5778860pfv.125.2021.06.17.14.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 14:11:34 -0700 (PDT)
From: "Geoff Parker" <geoffhp@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [PATCH] cifs-utils: set ROOTSBINDIR to /usr/sbin if DISTRO_FEATURES has usrmerge
Date: Thu, 17 Jun 2021 14:11:18 -0700
Message-Id: <20210617211118.3664708-1-geoffhp@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Geoff Parker <geoffrey.parker@arthrex.com>

Fixes cif-utils recipe build when DISTRO_FEATURES includes 'usrmerge'

Add do_configure_prepend() to override ROOTSSBINDIR environment variable
so that the utilities are installed in /usr/sbin rather than /sbin.
Setting --exec-prefix or --prefix in EXTRA_OECONF does not work.

Update do_install_append() to NOT remove /usr/bin /usr/sbin if usrmerge
is set in DISTRO_FEATURES

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 .../recipes-support/cifs/cifs-utils_6.13.bb     | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb b/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
index 41a9b8e76..bf8b18043 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
@@ -22,10 +22,21 @@ PACKAGECONFIG[pam] = "--enable-pam --with-pamdir=${base_libdir}/security,--disab
 
 inherit autotools pkgconfig
 
+do_configure_prepend() {
+    # want installed to /usr/sbin rather than /sbin to be DISTRO_FEATURES usrmerge compliant
+    # must override ROOTSBINDIR (default '/sbin'),
+    # setting --exec-prefix or --prefix in EXTRA_OECONF does not work
+    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','fakse',d)}; then
+        export ROOTSBINDIR=${sbindir}
+    fi
+}
+
 do_install_append() {
-    # Remove empty /usr/bin and /usr/sbin directories since the mount helper
-    # is installed to /sbin
-    rmdir --ignore-fail-on-non-empty ${D}${bindir} ${D}${sbindir}
+    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','false','true',d)}; then
+        # Remove empty /usr/bin and /usr/sbin directories since the mount helper
+        # is installed to /sbin
+        rmdir --ignore-fail-on-non-empty ${D}${bindir} ${D}${sbindir}
+    fi
 }
 
 FILES_${PN} += "${base_libdir}/security"
-- 
2.30.2

