Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.291.1597264894324365679
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 13:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h4YKKbiE;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id r11so1599172pfl.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 13:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SiP/mKXsHtHFBTj4Cg705riWsmDinlxVKlqlItTxwGc=;
        b=h4YKKbiEGpu4iEYci8xsXl4eWcbN2X/TbrJXLA1Qg4g3WJ/FMloRCvfTaTJ4bSyDod
         eep/iTBG8x6gIirMr+mcRLLA3+EqEI4IOl3pUUM7pTNSdj4EfiLF2cEuWSvCp8VTw7cY
         nr6Orc3i+hGDUD2O5cIHM3dPs6S8BS1dK8FdoJYfOrB97Iconu5IgYoF5Z1qDSZMCOdO
         hwbV/dYX1PsXGiZsmJbPOEVLCzIC4TzLjf4QrAk2JkB3RGR/lnm9ldA8N9K3T0GMPRHI
         ALGDZ+iowr01mqSLTUvozskA1Xfs8Buk2NWOCQoOWtNRE2geBwgxZJ3InjzV/6MvPNNC
         b9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SiP/mKXsHtHFBTj4Cg705riWsmDinlxVKlqlItTxwGc=;
        b=b5piKaR2XoBcLJ7ByonLcdhYP/NQ23PJshpfBZ7+1XQ82CoYEHCfSyU3nPu/tas0D4
         F793fwW7lPtz5RWaB7i17ieHIucRjshyFL4KXLg5VaFH2Vzk2McEDOaWQ9W9aIIxhlbR
         pU8ibcok4+7AWxKNy6CAury59D40Kq4228kurI9VmYYV49CQRoMvo49EgP/4RDPts5bb
         aTqUQwPvdLFWlMB0MDvNIE+wX4OewuHsAaxM9TjovBDhA4XWcvF+52/bReuDhOokTwcC
         tUH+QM9eS+che5Rp460lhuloL7zw+YXVmkDGm0GifaeHHfoh6y7n5QEU7T3uMSkHbbxg
         YXmg==
X-Gm-Message-State: AOAM530Nscl7Bco2r1NGAnsgvwAjEmat9osW0VhGZXV6GdbiOAqW3Y4m
	XCB7IY5j+d8AENxwY9ZMn4yQZ6JxLxM=
X-Google-Smtp-Source: ABdhPJx51tdh+hARsLy+Jhd4Nk7rT4jbmnal/R11YbZuvFihRVOsCKMIYl2UZKKOas889DomRC5LzQ==
X-Received: by 2002:a63:1d51:: with SMTP id d17mr824405pgm.162.1597264893564;
        Wed, 12 Aug 2020 13:41:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l22sm2984287pjy.31.2020.08.12.13.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 13:41:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 02/18] dialog: Turn X11 support into a packageconfig option
Date: Wed, 12 Aug 2020 13:41:14 -0700
Message-Id: <20200812204130.1012160-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812204130.1012160-1-raj.khem@gmail.com>
References: <20200812204130.1012160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable it only if x11 is in distro features

Ensure patch to X includes/libs is pointing into sysroot otherwise it
starts to poke at build systems includes/libs dirs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/dialog/dialog_1.3-20200327.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20200327.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20200327.bb
index 5ac9b89020..4c3177c05f 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20200327.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20200327.bb
@@ -18,6 +18,10 @@ S = "${WORKDIR}/dialog-${PV}"
 
 inherit autotools-brokensep pkgconfig
 
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+
+PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--without-x,virtual/libx11"
+
 EXTRA_OECONF = "--with-ncurses \
                 --disable-rpath-hack"
 
-- 
2.28.0

