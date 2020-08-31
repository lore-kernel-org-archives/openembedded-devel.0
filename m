Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.47585.1598851870641401756
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2020 22:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WTW8aB9+;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id q3so2478393pls.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2020 22:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8RYGac51lZ15/5sKhHDiFfuSiX1VS67BwVxWSnKLLmQ=;
        b=WTW8aB9+yFiEzDlMKP30zBazCZMf9ZYNmhzJUOFfiK2EV6vvuRKNyMKcPyXbMoiU8e
         uqrfetjyvqKJqbSYxOe6iYxpIBzdELtU3M/4S76OEXbikWS3SIpG3tQfbk2GaUY0WN/e
         U/ebTCNoNNs9czSvaruBS7oXlorgJnTm8GyhLI3gXEkbz64QKZsgqZ7n7ZLiXNWE8AxU
         mNyiVUnu204YNMTPS9U91sYJ0Hv8h5TUWbZ1EMWW4ChtvNbwImeKCsoXzp2udpHCxJHM
         LGvL1HMxl+Z8W7FmuUcqnx0mHp8WwE41zH52yYDJ6OvlFlm5lDpX8uz7l6WrklyS+MIk
         4fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8RYGac51lZ15/5sKhHDiFfuSiX1VS67BwVxWSnKLLmQ=;
        b=X4nvkPV3PsbSQzCzr7RwV4kOT576FPCyQtFehFY/ZjDdOfc4LgGuR2Rd9UnCubYN2y
         h+64uMWFX0R8LdtQDNvmHbTiwvnb1RIC/fBZndyiiR1/i+A3kwMk+xGqAQIzUnZi5Uju
         7Lyp+b0MvHAm4XNWqN5WzUuhg1aAGjwBBghNJfn2DXajiYCO/tA+hbh6gwrp8Z+HlF8l
         oxwGs2T3sf6kQTaH0qW245dj/LCYf+nF7gNpAMdw+hfRmr9spi0ZjFgSjz+OmqZ5ka2f
         2Iv63y/gQfsTDb/rCW0p1dulnO6lOb9w7UfE9m9xOhR0xG9QoI0FGsOwBY6HQD/TRiei
         zVWg==
X-Gm-Message-State: AOAM533a/hiz1h05zi1pkIvUBIXeQyn9O7GllLNmzJkLzWla8SI/DiKM
	Zt+xHKretGFUeVqQY9f5ZEnBWUMSCPqFLw==
X-Google-Smtp-Source: ABdhPJwAieSPZ2iEGnZ4GOlLNgz8r1rj9fS+nxAqimcPj2+oa0MtnltwbhEKDiGzOS62W/W9d0zfIw==
X-Received: by 2002:a17:90a:e7ca:: with SMTP id kb10mr74248pjb.217.1598851869489;
        Sun, 30 Aug 2020 22:31:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id y9sm1568350pfn.85.2020.08.30.22.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 22:31:08 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/8] sblim-sfcb: Fix target postinst
Date: Sun, 30 Aug 2020 22:30:56 -0700
Message-Id: <20200831053057.1541321-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831053057.1541321-1-raj.khem@gmail.com>
References: <20200831053057.1541321-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separate out target specific postintalls into pkg_postinst_ontarget_PN

Fixes
/mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/meta-oe-ptest-image/1.0-r0/rootfs//var/lib/opkg/info/sblim-sfcb.postinst: line 6: /usr/share/sfcb/genSslCert.sh: No such file or directory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index 3e4ed7c03c..9a3a66c2a8 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -69,10 +69,10 @@ do_install() {
 }
 
 pkg_postinst_${PN} () {
-    if [ x"$D" != "x" ]; then
-        $INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}
-    fi
+    $INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}
+}
 
+pkg_postinst_ontarget_${PN} () {
     ${datadir}/sfcb/genSslCert.sh ${sysconfdir}/sfcb
     ${bindir}/sfcbrepos -f
 }
-- 
2.28.0

