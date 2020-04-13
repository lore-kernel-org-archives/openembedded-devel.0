Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web11.10256.1586758799309949944
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2020 23:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tYcUNdac;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id x26so2874223pgc.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Apr 2020 23:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q6sFSo/U8B4/osjkWEIF1rPDoUkdFogi1GSs4e0lmo0=;
        b=tYcUNdacB3cvpqbX6g/2pSaWCucmTPgFwA2Y2jnhPYCMu3tXbhTNFJGwd89bgrimAx
         JT8nc97fLz1hGjtEMhzxFvteKJxNLmodNnYhnoeFsWfHbIYm/Jb4NBa4LfbUpCaKsxSA
         hR686GO2pdJycbARoVUsO+47LZ+9dm0GTfIK9CT9JsKg/ONTBuzHEGbOhImmh669hT5P
         ZM0O30UbSdFGHaZaoJnM5LOdu5327gYVVufSce3dGLABATg+/pzSLZ3Vl9Syz3y1kzP7
         oeqV3OtAJyAg5EbjdbXFWBD2Y3FO7dHsJedJb6huF2q46fhvKUq06qmchjNwb6E+1D0S
         OVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q6sFSo/U8B4/osjkWEIF1rPDoUkdFogi1GSs4e0lmo0=;
        b=DdCa1Qy2Hz7zehmvcrJZof6WAApMOKmdw2SfDnalkBcS93jco6/ja5AxPNykPp9DDr
         b9rcvG6T6MuRgO0FwgGIFe1QamniF+sfG+QTFmGdKCqCqHwKfWQ/nLAgME7DPqPN3tc7
         kTBM9qBN7dx9C+6MQPtaawZ4Yx9dd+uObk5iBLt2GHKcsggKxGIUFjd9oSCNVdnZ3bsa
         pWdbDOFiDww5Ud/CdDbq+72L3wG/d86EL+6zVDRsvsxfJM14b7YeS9+C1R175xfRvqCb
         j0b0yTW/bjPv5cBx1i/LNAa2ihFWyzvWOsUQx+THnud2RBRLXF9FRhI+gsIYU/ya8hp0
         9e+w==
X-Gm-Message-State: AGi0PuZkChlUIUMcl3pKmR3wVf5rhCoKxTYLSfb7DRB6TfTjtq6cCGaR
	1H/TDq9CLyPfVJYi8k4QA2u6Dc9TDaQ=
X-Google-Smtp-Source: APiQypLwi1W2eWfAl0Bb0WHTr/t8syTG3VJG7D2vUQ91wruFONjbj5tP8KSgtRS+Y94gmm7bGu6FIA==
X-Received: by 2002:a62:6503:: with SMTP id z3mr16790824pfb.232.1586758798108;
        Sun, 12 Apr 2020 23:19:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id g197sm6177777pfb.54.2020.04.12.23.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2020 23:19:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] file-roller: Add packagekit support via packageconfig
Date: Sun, 12 Apr 2020 23:19:54 -0700
Message-Id: <20200413061954.1416321-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable packagekit support only when x11 is in distro features

Fixes

../file-roller-3.32.4/src/dlg-package-installer.c:26:10: fatal error: 'gdk/gdkx.h' file not found
         ^~~~~~~~~~~~
1 error generated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/file-roller/file-roller_3.32.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.4.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.4.bb
index 0e57848c5c..a95735c9b9 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.4.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.4.bb
@@ -16,7 +16,10 @@ inherit gnomebase gsettings itstool gnome-help gettext upstream-version-is-even
 SRC_URI[archive.md5sum] = "21982b8d298cb2994a99494399dcb2d5"
 SRC_URI[archive.sha256sum] = "1b3b2cbfcb444e0d150bfd063add9d5181c8ab24f0593e5a8894399297214017"
 
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'packagekit', '', d)}"
+
 PACKAGECONFIG[nautilus] = "-Dnautilus-actions=true,-Dnautilus-actions=false,nautilus"
+PACKAGECONFIG[packagekit] = "-Dpackagekit=true,-Dpackagekit=false,"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.26.0

