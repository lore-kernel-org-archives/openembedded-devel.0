Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06357C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 19:40:06 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.2070.1635190804556807069
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 12:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UBBOR4ve;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id a26so3869019edy.11
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 12:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UVr4r++s7WyUm/DO5pngoqBL8an6cJ3O3WKFy3mEKMQ=;
        b=UBBOR4veCB85DdnSBhwS7GxXm25V0q27yiHxw3KU8rfD4UEn4p502Anp+9bcAR0CZd
         axaekP9zyKMCvfnhYLu57qzktEYikO7jq/dCEAxvShfhNWu21tCSZgpwiAZoMq0UZS0z
         nTw27u+lkvHsR+aQDh1uwD+p6AraDBITvAN9fO2m3PfmF2bXhtDooW0J7bVpTr/RtFMG
         DNvIUFZJbQXaAXywI1Na2SmloKXkwT5QDiWx3VJ4KNQM5G2D5Wh+5xKwqbYBNP2KG5pl
         jQiFp/udxxtKeqGv0zQ3T2Q/k5mvJm2pgYjooTcg9nQE8+UpyxgwJaXAQU8ye/1THLRJ
         6WRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UVr4r++s7WyUm/DO5pngoqBL8an6cJ3O3WKFy3mEKMQ=;
        b=YSqedNJTF7WyiyLfMQXXZMnGXogprZTSkCq8ecacuRxLdrucTF1zmA436nGjVp839V
         hBXOZ6/KMaoXaJNTEfecBnrSc+MLug2gJaRQkP+764xYs9Mnk9ZQZ3ajDvxRGs0I/6CI
         oy8h13vXV9eKjj4C1z6WzT7m9KTm3W+jeJQ3OygCiSsY5YUZFfaPrtGToyRW5DfJdDCc
         Ms168bjhvAyMt7pdIko+uHfrUyEtm7ZoC9Kcg+n3tNDvMTmhi6a/DOsp9IEN0uTZULxe
         DlA1LvOLsG8UA0qUtpuH+I3v0TRtey86WI6O/Ef0gkkzL18lBH1yBSYB23V+G/lXQRNd
         RFXQ==
X-Gm-Message-State: AOAM532B2pyxQtOcA24CaKLN6TOezYZKtecQk2BddeoG9SAxZnHqfubW
	VhZdgrMriQgQ68FVm9Obuqik8ZEjP24=
X-Google-Smtp-Source: 
 ABdhPJzHyyDeqxx3qUsASfkLxGiQAbgsaxglE3aBp+rKU4tzWZ9YRw+ZPm2QLS0Fm1pcVbaAPusQlg==
X-Received: by 2002:aa7:cb41:: with SMTP id w1mr29478652edt.327.1635190802327;
        Mon, 25 Oct 2021 12:40:02 -0700 (PDT)
Received: from Unimatrix08-Focal.lan ([2.198.125.226])
        by smtp.gmail.com with ESMTPSA id
 hu8sm2740502ejc.82.2021.10.25.12.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 12:40:01 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] boinc-client: unblacklist and update from 7.16.16 to
 7.18.1. Add patch from upstream to fix openssl 3.0 build failure.
Date: Mon, 25 Oct 2021 21:39:46 +0200
Message-Id: <20211025193946.783412-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Oct 2021 19:40:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93576

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../boinc/boinc-client/openssl-3.0.patch      | 25 +++++++++++++++++++
 ...ient_7.16.16.bb => boinc-client_7.18.1.bb} |  6 ++---
 2 files changed, 28 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/boinc/boinc-client/openssl-3.0.patch
 rename meta-oe/recipes-extended/boinc/{boinc-client_7.16.16.bb => boinc-client_7.18.1.bb} (95%)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client/openssl-3.0.patch b/meta-oe/recipes-extended/boinc/boinc-client/openssl-3.0.patch
new file mode 100644
index 000000000..9dcf4bd36
--- /dev/null
+++ b/meta-oe/recipes-extended/boinc/boinc-client/openssl-3.0.patch
@@ -0,0 +1,25 @@
+commit 689dc20ede9768377d4032ff8c70b58269c8dc9c
+Author: Charlie Fenton <charlief@example.com>
+Date:   Mon Oct 18 01:43:08 2021 -0700
+
+    Mac: update dependent libraries to latest: c-ares-1.17.2, curl-7.79.1, freetype-2.11.0, openssl-3.0.0
+    Previously updated to wxWidgets-3.1.5. FTGL version ftgl-2.1.3~rc5  is still the current version.
+
+Upstream-Status: Backport [https://github.com/BOINC/boinc/commit/689dc20ede9768377d4032ff8c70b58269c8dc9c]
+
+diff --git a/lib/crypt.cpp b/lib/crypt.cpp
+index 01249cfc34..9b1f69160b 100644
+--- a/lib/crypt.cpp
++++ b/lib/crypt.cpp
+@@ -672,7 +672,10 @@ int check_validity_of_cert(
+         }
+ #ifdef HAVE_OPAQUE_RSA_DSA_DH
+         RSA *rsa;
+-        rsa = EVP_PKEY_get0_RSA(pubKey);
++        // CAUTION: In OpenSSL 3.0.0, EVP_PKEY_get0_RSA() now returns a
++        // pointer of type "const struct rsa_st*" to an immutable value.
++        // Do not try to modify the contents of the returned struct.
++        rsa = (rsa_st*)EVP_PKEY_get0_RSA(pubKey);
+         if (!RSA_blinding_on(rsa, c)) {
+ #else
+         if (!RSA_blinding_on(pubKey->pkey.rsa, c)) {
diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
similarity index 95%
rename from meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb
rename to meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
index 79aaad9d8..dcbe220fa 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
@@ -16,7 +16,6 @@ global warming, discover sources of gravitational waves, and many other types \
 of scientific and mathematical research."
 
 HOMEPAGE = "http://boinc.berkeley.edu/"
-PNBLACKLIST[boinc-client] ?= "Needs porting to openssl 3.x"
 LICENSE = "LGPLv2+ & GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
@@ -30,11 +29,12 @@ DEPENDS = "curl \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+ libnotify xcb-util libxscrnsaver', '', d)} \
            nettle \
 "
-SRCREV = "df0239e6f074207798a8ecf1358a74545dda9132"
-BRANCH = "client_release/7/7.16"
+SRCREV = "b49adfb118211e11c719766c0d71e7bdfe7f3363"
+BRANCH = "client_release/7/7.18"
 SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \
            file://boinc-AM_CONDITIONAL.patch \
            file://gtk-configure.patch \
+           file://openssl-3.0.patch \
 "
 
 inherit gettext autotools pkgconfig features_check systemd
-- 
2.25.1


