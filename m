Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709F0C7EE2F
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 04:27:07 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.13896.1684816024642664169
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 21:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=AAKiOMFN;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-64d1a0d640cso4085625b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 21:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684816024; x=1687408024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PsmaCfV8fMxjJZdo+td/15rTNdVcD8l0/6WVXZVKVYM=;
        b=AAKiOMFNt7Aqxx1Gt2ZK8pNZ8vbuYv5+KMC85ccFSC6ALDSDieTIwdW/bZqSMVXW0p
         D/TSVQ7E3QHDG2Fs1gwIDlojrDWaT1GiLLZYj7B8HKdLYbNAMT5O6eW0iMvobpvjLze9
         p5P3TwGlSkrUSa37qvw4pqw0/hB21DLP7TnkvVZb5+NdLSyFiRI4P5KdIlu13R/Gjxlo
         m+gF0RB9vjYRbamuJhoL8tC2WncSRu4p3jGgv2fLhlzj4zPPEBMvuOhaUJQgwuI7Absv
         8wt5gmw8frBGp8HgNmvgBG2GCg2hpp4PKXUCU3ftQpN85l5jMdZGtwsnZFKkm9JD9Z+2
         5+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684816024; x=1687408024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PsmaCfV8fMxjJZdo+td/15rTNdVcD8l0/6WVXZVKVYM=;
        b=IBQJJMZ7r09cJWPbbOMHgtp1LqJaoCeS57AiwPQrVuzEtK4D2MDs78Kau7LnsM6Qpu
         MCx6zP3l66vrBShxt/7EpCeq8gLmz+9w8QIEOj++nDNpEz+v2/b6WpFIwqsL3J544zSH
         j8l5var13gWwiyKyPCKjQ2u2jvAgy+Upg8GBnY1Dw6uh0Yrcs666TDA3o8JHjgMu75X0
         Hv9J32P3dZ2TFyBzxvkUpdBbnYk9Rinkfy1HaF2Q7wJsauMvBD49riWFmM8GIedA0uE0
         CU5M3saDhOLeCW5nCf3/d0KWfxKBcRJ+RdLbb55+IW3i67fluWNpxSGIAMkPF94ZDUJ5
         95+g==
X-Gm-Message-State: AC+VfDySP8kt/CW8KVmMDbSDBUovWihwp40QJDhFCKnc/OAzUr4om7bR
	Na4Rfpwn0+GbtBS9h7unX97M6v9q1sg=
X-Google-Smtp-Source: ACHHUZ4y2+xZr8A+wjBB+2+bwjEOSAJX3ALHGTCbnU2UKCv57vTVsT1bxlPStQap3KWRPfVhOPqxHw==
X-Received: by 2002:a05:6a00:1783:b0:64a:5cde:3a8c with SMTP id s3-20020a056a00178300b0064a5cde3a8cmr15520832pfg.28.1684816023554;
        Mon, 22 May 2023 21:27:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id n7-20020aa79047000000b0064d2c7ac49fsm4844332pfo.31.2023.05.22.21.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 21:27:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 06/11] dovecot: Upgrade to 2.3.20
Date: Mon, 22 May 2023 21:26:53 -0700
Message-Id: <20230523042658.4159559-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523042658.4159559-1-raj.khem@gmail.com>
References: <20230523042658.4159559-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 04:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102721

- Re-enable LTO again, it works ok.
- Turn systemd into a packageconfig and enable it when systemd is in
  distro features

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{dovecot_2.3.14.bb => dovecot_2.3.20.bb}  | 22 ++++++++-----------
 1 file changed, 9 insertions(+), 13 deletions(-)
 rename meta-networking/recipes-support/dovecot/{dovecot_2.3.14.bb => dovecot_2.3.20.bb} (81%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb
similarity index 81%
rename from meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb
index d8c483191f..7729bb4a8b 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb
@@ -12,9 +12,7 @@ SRC_URI = "http://dovecot.org/releases/2.3/dovecot-${PV}.tar.gz \
            file://0001-not-check-pandoc.patch \
            file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
            "
-
-SRC_URI[md5sum] = "2f03532cec3280ae45a101a7a55ccef5"
-SRC_URI[sha256sum] = "c8b3d7f3af1e558a3ff0f970309d4013a4d3ce136f8c02a53a3b05f345b9a34a"
+SRC_URI[sha256sum] = "caa832eb968148abdf35ee9d0f534b779fa732c0ce4a913d9ab8c3469b218552"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
@@ -22,9 +20,10 @@ LDFLAGS += "-ltirpc"
 
 inherit autotools pkgconfig systemd useradd gettext
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ldap pam', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ldap pam systemd', d)}"
 
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
+PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd,"
 PACKAGECONFIG[ldap] = "--with-ldap=plugin,--without-ldap,openldap,"
 PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 
@@ -42,12 +41,7 @@ CACHED_CONFIGUREVARS += "i_cv_signed_size_t=no \
 
 # hardcode epoll() to avoid running unsafe tests
 # BSD needs kqueue and uclibc poll()
-EXTRA_OECONF = " --with-ioloop=epoll \
-                 --with-systemdsystemunitdir=${systemd_unitdir}/system"
-
-# Uses hidden symbols
-# libssl_iostream_openssl.so: undefined reference to `ssl_iostream_handshake'
-LTO = ""
+EXTRA_OECONF = " --with-ioloop=epoll"
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE:${PN} = "dovecot.service dovecot.socket"
@@ -56,9 +50,11 @@ SYSTEMD_AUTO_ENABLE = "disable"
 do_install:append () {
     install -d 755 ${D}/etc/dovecot
     touch 644 ${D}/etc/dovecot/dovecot.conf
-    install -m 0644 ${WORKDIR}/dovecot.service ${D}${systemd_unitdir}/system
-    sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/dovecot.service
-    sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/dovecot.service
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
+        install -m 0644 ${WORKDIR}/dovecot.service ${D}${systemd_unitdir}/system
+        sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/dovecot.service
+        sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/dovecot.service
+    fi
 }
 
 USERADD_PACKAGES = "${PN}"
-- 
2.40.1


