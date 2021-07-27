Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.6251.1627353355944006051
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jul 2021 19:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ODoZtSYE;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id e5so12099480pld.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jul 2021 19:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S/VG06FBCiv3BqUUxpLtZiOahgIsXKITAcmDSESihlI=;
        b=ODoZtSYE5iYyTnzNMUEvc0MptfMeMfsumeNVOkg/y4hB9IpCfA4qNS1YnLBvweNaDs
         v8zeM36W2RcEQHWj+WSMP29ExRoKB1oyLbi19iQyq/UUl+ualPPjjhmC0ttVerN7GFp/
         xvsljH5Rbi3JzoTMFzn+0tQz5qJE/LxmTtzKQvKWJ+RIIJVG5WQoZ7qx+u8dP0YgqKu2
         kOfY0JINMOr/PjmomhrTfAQ1sbe2ZR2jJ1uqfLYmscJ/pR/FT+d1mOOzzs6HqA6No4Cl
         JIvfBH0/PADVwnrEYwciwa2BouMF/KRWHVvFeFIIIAXXIju1qVIXg/qdnLd1ZLO5RoZI
         jCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S/VG06FBCiv3BqUUxpLtZiOahgIsXKITAcmDSESihlI=;
        b=lWxq3MJpLuVd0KrU13BasGnbDSe2n+MZO737KbCeGmfmbmBDPo1MdBnO6L6Ura49us
         AXwv5jrw3U2XX+iuVovBuADUzXpE/i8PC7XYJp8QJP6AE26szOTfAfblT8Q0GOpyXRBD
         g2ZFGu4sFyRIx8Rgx9Sh4nk4d5ythMF5QG6QMLWVvC8CnxI1MQ6Mqelzm+6+lNSHB5tq
         I3bqyE5b6Oaei+YQInlio7rCQLqNQ3jCAP7wRXR042Z9uDNmicTN/Rjx1Z0y6Kg1Q0Ld
         Ll1h9+NkBvIMqfQvtv2H/nEFEmY1L9+2rz8UeLCHHsnHinCjkut1KcBBhFIPKokIxiSX
         p8NQ==
X-Gm-Message-State: AOAM533NPz+6dIaECDXVYdeGgVILG63Dqk+Z5VLPPUaHQIwPk5Fas+Zh
	QlbCXfV8ITOrCVyWRTbW9RCDKlxd/IRhPw==
X-Google-Smtp-Source: ABdhPJw1coqO9xBT4tgNH1RgOGknhDOt1HTUn0+lqVSeGb+eCRhi8Ut+Nnc95IwIKkjDyWMrDhcZBw==
X-Received: by 2002:a65:41c7:: with SMTP id b7mr21194307pgq.81.1627353355348;
        Mon, 26 Jul 2021 19:35:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:84ca:24f2:48ba:ef1a])
        by smtp.gmail.com with ESMTPSA id y82sm1425340pfb.121.2021.07.26.19.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 19:35:54 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH 1/3] php: split out phpdbg into a separate package
Date: Mon, 26 Jul 2021 19:35:51 -0700
Message-Id: <20210727023553.2223746-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>

Since PHP 7.0 the phpdbg debugger is built by default and gets shipped
in the main php package, increasing its size by several MB; split it
out into a php-phpdbg package, following Debian naming.

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c4ffcaa2ab3fbdef1ce58c253b32d82a57a3e2a8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/php/php_7.4.9.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.9.bb b/meta-oe/recipes-devtools/php/php_7.4.9.bb
index 16fc311b0e..451c5e69f8 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.9.bb
@@ -204,7 +204,7 @@ php_sysroot_preprocess () {
 
 MODPHP_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${PN}-modphp', '', d)}"
 
-PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-opcache ${PN}"
+PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-phpdbg ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-opcache ${PN}"
 
 RDEPENDS_${PN} += "libgcc"
 RDEPENDS_${PN}-pear = "${PN}"
@@ -220,6 +220,7 @@ FILES_${PN}-dbg =+ "${bindir}/.debug \
                     ${libexecdir}/apache2/modules/.debug"
 FILES_${PN}-doc += "${PHP_LIBDIR}/php/doc"
 FILES_${PN}-cli = "${bindir}/php"
+FILES_${PN}-phpdbg = "${bindir}/phpdbg"
 FILES_${PN}-phar = "${bindir}/phar*"
 FILES_${PN}-cgi = "${bindir}/php-cgi"
 FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm ${systemd_unitdir}/system/php-fpm.service ${sysconfdir}/php-fpm.d/www.conf.default"
-- 
2.25.1

