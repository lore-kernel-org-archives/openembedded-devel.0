Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.29592.1599765009934931737
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 12:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=vrKVMc3O;
 spf=neutral (domain: kynetics.com, ip: 209.85.221.67, mailfrom: diego.rondini@kynetics.com)
Received: by mail-wr1-f67.google.com with SMTP id e16so8165598wrm.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2020 12:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/HQRwphsvT/EY4Xfqk9M1BRIqbctrB5tOm4hqJWZR6o=;
        b=vrKVMc3OQcuxLoYReF9wmamSfB4aCvR7Kc/JGN83zMF0mX6RjxHWQ+WqvCT1rdekDd
         6s5JvMeOwHqLUpaejfsuG+4/afTLV5K/p7W0dlBS5Gi8/YddSEaU18UVIuLTMZLNxyvP
         eZ5igBW4N+ZRE0fRTUbEQV0dtLFOsZKMLhytMpO8T5LP24px6ssoqOUNhZhBMFtrM8TP
         89sZAKIkb7+Xb+kiRXLTDNh6VnZog0jSvSovIpnLVrkSfSEfhNOG7D9Go6mv2eEqLmnZ
         ZbuI2ZJzUMsseaXyihPx4zulIo1SB9dQYMhcO6zpk4Ro90HgSby3/ii1OVNR/8Zx54Jk
         FQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/HQRwphsvT/EY4Xfqk9M1BRIqbctrB5tOm4hqJWZR6o=;
        b=CbwGApvEycZ5dVRrTKJBY/pPESThV2L/fJwfA2YyHSGTrS+4d4qOAvxyEgfUhOX91R
         LfxsmKe0EXF9dYkZgqYNXQSOicRA+SGi7j4PPhQjlzpKito+o2NJHf7UT4s1oItT5d1d
         iSAzS5BcnG4ddjA4V0eOCO6nC5F42eHSmj73j+JoGI2M8E5berUn8Sser2IJs4Dj0wTm
         BZvwi1VI97FgEdrrlocdx9yznzXLQlTchDIRfzpmMTFrrqh9W80ux77251KPGLSDbjSp
         gp6LybtItl6F8mzUvFZE7frnEeG8z2PEZD2rX7/c7H1zb+/gq4/3zqv6KRIqCN9ZF6D9
         Zkug==
X-Gm-Message-State: AOAM531hz4Pqvybxh5br/LkNhM/FRDCuOYexGwy442BqZfgohvxlti3M
	e/Y+UoAZgN/7oBSmupR0q3eFH4JTRsth4w==
X-Google-Smtp-Source: ABdhPJy8UAENfxdOkT4mzeyBSqn1iwqoTpBXwpPzd8cQILoBzyRAGjHKTUdYIttaV6UGuoNThpF45Q==
X-Received: by 2002:a5d:4645:: with SMTP id j5mr10604573wrs.230.1599765008053;
        Thu, 10 Sep 2020 12:10:08 -0700 (PDT)
Return-Path: <diego.rondini@kynetics.com>
Received: from localhost.lan (mob-176-247-160-75.net.vodafone.it. [176.247.160.75])
        by smtp.gmail.com with ESMTPSA id h186sm4987121wmf.24.2020.09.10.12.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 12:10:07 -0700 (PDT)
From: "Diego" <diego.rondini@kynetics.com>
To: openembedded-devel@lists.openembedded.org
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [meta-oe][PATCH] hplip: use libexecdir
Date: Thu, 10 Sep 2020 21:09:56 +0200
Message-Id: <20200910190956.37235-1-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In oe-core commit:
2ce6ef29b9bb4f16ed9d78e166d455b7a6d968bf
cups crossscripts have been fixed to report the correct serverbin folder, so
backend, filters, etc, need to go in ${libexecdir} now.

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 meta-oe/recipes-extended/hplip/hplip_3.19.12.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-extended/hplip/hplip_3.19.12.bb b/meta-oe/recipes-extended/hplip/hplip_3.19.12.bb
index 883a6ffe9..457a97453 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.19.12.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.19.12.bb
@@ -39,8 +39,8 @@ EXTRA_OECONF += "\
         --enable-foomatic-drv-install \
         --disable-foomatic-ppd-install \
         --disable-foomatic-rip-hplip-install \
-        --with-cupsbackenddir=${libdir}/cups/backend \
-        --with-cupsfilterdir=${libdir}/cups/filter \
+        --with-cupsbackenddir=${libexecdir}/cups/backend \
+        --with-cupsfilterdir=${libexecdir}/cups/filter \
 "
 
 EXTRA_OEMAKE = "rulessystemdir=${systemd_unitdir}/system/"
@@ -52,7 +52,7 @@ do_install_append() {
     sed -i -e "s|/usr/bin/python|/usr/bin/env python3|g" ${D}${datadir}/hplip/*.py
 }
 
-PACKAGES += "${PN}-ppd ${PN}-cups ${PN}-backend ${PN}-filter ${PN}-hal"
+PACKAGE_BEFORE_PN += "${PN}-ppd ${PN}-cups ${PN}-backend ${PN}-filter ${PN}-hal"
 
 RDEPENDS_${PN} += " \
         python3\
@@ -70,15 +70,15 @@ RDEPENDS_${PN}-filter += "perl"
 
 # need to snag the debug file or OE will fail on backend package
 FILES_${PN}-dbg += "\
-        ${libdir}/cups/backend/.debug \
+        ${libexecdir}/cups/backend/.debug \
         ${PYTHON_SITEPACKAGES_DIR}/.debug \
-        ${libdir}/cups/filter/.debug "
+        ${libexecdir}/cups/filter/.debug "
 
 FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/*.la"
 FILES_${PN}-ppd = "${datadir}/ppd"
 FILES_${PN}-cups = "${datadir}/cups"
-FILES_${PN}-backend = "${libdir}/cups/backend"
-FILES_${PN}-filter = "${libdir}/cups/filter"
+FILES_${PN}-backend = "${libexecdir}/cups/backend"
+FILES_${PN}-filter = "${libexecdir}/cups/filter"
 FILES_${PN}-hal = "${datadir}/hal"
 
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/*.so"
-- 
2.26.2

