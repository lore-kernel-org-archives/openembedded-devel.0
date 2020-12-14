Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.30869.1607925876445270868
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Dec 2020 22:04:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aDw9Finr;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id b5so4477765pjk.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Dec 2020 22:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WJN6N+X9NA3G4PXruzwa6NjxwjYZcMLrkeGS3XWoyNY=;
        b=aDw9Finr2U5jwwNRqs5Uh9wkQdTUpQwwxuQrKY1iWF7brx0eOHwD0h3DrXHqOGB9l+
         ywg9AJA0rQ3QTj77f4azeXnOY62Ul72XPvlY9Ude54r2tPzFM5Eip66IUrwuivvR4j5P
         PhwEeS7WoS8442xeIV/HispggdDPOAOYG3CbXT1DWKWZyLBTCMtkgIqfaXNrvoSveVEG
         qvDpCW1AiCPL2DTBFTof76iS5MRBSSHB7qJKlJeY1hZuG4m0rxk0CqL2iV/dKrfg1uUw
         svbbYgKIhlMPwZJCBq8G57RKpBzRbaQzDXBl5K9uCuDApK8a9EB8823wfj91Z5TEgLDC
         60dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WJN6N+X9NA3G4PXruzwa6NjxwjYZcMLrkeGS3XWoyNY=;
        b=iAVlR4d+NVi5CygEevKtVdSU8Unbunfh6LsHl4dH9WpY9xR+/CUCaRRorH35j5ltrz
         7ioikrjYsJtZhBwltFB00fMCBPeqgDgAU8J9H1DlS/fIqFzGZ4J8nvjgYDuedCzyQbWR
         7fcD+eE4ioydnXyqKPWjq5OBvUAaRy0wGpDMDq1CWg1UzySbW74aUYUXeHa6YqxRZH/h
         v2LhzMXj30C5Xs1wA7jvqPvij+R5ooAcmLPoSw797X3NktW2iqFYmkPAiLIfJ+jj8VAz
         fyM1HLj7fOUDqGOhhQvjEkDJgT4YrSUSxnStXJDJhO8D/tHDAjnm0VKrUYdKsKXCSu9Q
         TnWg==
X-Gm-Message-State: AOAM531t5IHQB+kD2jlNs721RfwQXlvYEGhFEdMSu3rZZlScCxQbBfUA
	Vww60XVsKB42cFX9N4H1rdNDTGgjP40wfQ==
X-Google-Smtp-Source: ABdhPJwuIFHwHyW6c8rFWCD9EjEe3tzcjq2SATqhmuIKh4MlkCaEJOi+pACt8ngWQG/IYmS9ohYa8A==
X-Received: by 2002:a17:902:ee52:b029:da:4dee:1a54 with SMTP id 18-20020a170902ee52b02900da4dee1a54mr21584918plo.29.1607925875638;
        Sun, 13 Dec 2020 22:04:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::64a3])
        by smtp.gmail.com with ESMTPSA id e29sm18071084pfj.174.2020.12.13.22.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 22:04:35 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Roland Hieber <rhi@pengutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] openct: clean up do_install
Date: Sun, 13 Dec 2020 22:04:27 -0800
Message-Id: <20201214060428.2133-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214060428.2133-1-raj.khem@gmail.com>
References: <20201214060428.2133-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Roland Hieber <rhi@pengutronix.de>

* Use sysconfdir and nonarch_libdir instead of hard-coded paths, and be
  consistent with the slashes after ${D}
* Install udev rules into /usr/lib/udev instead of /etc/udev so they can
  be overwritten in /etc, which has higher priority. Also use /usr/lib
  instead of /lib, latter of which isn't searched by udev [1].
* Don't create /usr/lib/udev, it is already created by install -D later
  with the default umask, which is fine
* Make use of do_install[cleandirs]

[1]: https://www.freedesktop.org/software/systemd/man/udev.html

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/openct/openct_0.6.20.bb   | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
index f647786e2b..7ea0d4174f 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -35,7 +35,7 @@ EXTRA_OECONF=" \
     --enable-pcsc \
     --enable-doc \
     --enable-api-doc \
-    --with-udev=${nonarch_base_libdir}/udev \
+    --with-udev=${nonarch_libdir}/udev \
     --with-bundle=${libdir}/pcsc/drivers \
 "
 
@@ -43,7 +43,7 @@ inherit autotools pkgconfig
 
 FILES_${PN} += " \
     ${libdir}/ctapi \
-    ${nonarch_base_libdir}/udev \
+    ${nonarch_libdir}/udev \
     ${libdir}/openct-ifd.so \
     ${libdir}/pcsc \
 "
@@ -55,10 +55,10 @@ FILES_${PN}-dbg += " \
 
 INSANE_SKIP_${PN} += "dev-deps"
 
+do_install[cleandirs] += "${D}"
+
 do_install () {
-    rm -rf ${D}
-    install -d ${D}/etc
-    install -dm 755 ${D}${nonarch_base_libdir}/udev
+    install -d ${D}${sysconfdir}
     # fix up hardcoded paths
     sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
         ${WORKDIR}/openct.service ${WORKDIR}/openct.init
@@ -66,16 +66,16 @@ do_install () {
     oe_runmake install DESTDIR=${D}
     install -dm 755 ${D}${libdir}/ctapi/
     mv ${D}${libdir}/libopenctapi.so ${D}${libdir}/ctapi/
-    install -Dpm 644 etc/openct.udev ${D}/etc/udev/rules.d/60-openct.rules
-    install -pm 644 etc/openct.conf ${D}/etc/openct.conf
+    install -Dpm 644 etc/openct.udev ${D}${nonarch_libdir}/udev/rules.d/60-openct.rules
+    install -pm 644 etc/openct.conf ${D}${sysconfdir}/openct.conf
 
-    install -Dpm 755 ${WORKDIR}/openct.init ${D}/etc/init.d/openct
-    install -Dpm 644 ${WORKDIR}/openct.sysconfig ${D}/etc/sysconfig/openct
+    install -Dpm 755 ${WORKDIR}/openct.init ${D}${sysconfdir}/init.d/openct
+    install -Dpm 644 ${WORKDIR}/openct.sysconfig ${D}${sysconfdir}/sysconfig/openct
 
-    install -d ${D}/${systemd_unitdir}/system
-    install -m 644 ${WORKDIR}/openct.service ${D}/${systemd_unitdir}/system
+    install -d ${D}${systemd_unitdir}/system
+    install -m 644 ${WORKDIR}/openct.service ${D}${systemd_unitdir}/system
 
     so=$(find ${D} -name \*.so | sed "s|^${D}||")
     sed -i -e 's|\\(LIBPATH\\s*\\).*|\\1$so|' etc/reader.conf
-    install -Dpm 644 etc/reader.conf ${D}/etc/reader.conf.d/openct.conf
+    install -Dpm 644 etc/reader.conf ${D}${sysconfdir}/reader.conf.d/openct.conf
 }
-- 
2.29.2

