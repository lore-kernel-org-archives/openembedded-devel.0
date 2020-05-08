Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.7457.1588931353854459752
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 02:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ut2Kz5pN;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id 188so9546282wmc.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2020 02:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=SMcxmg4KGpQp9LtQLB46KA2RlzwuSRy9yc8AQ8e7Las=;
        b=Ut2Kz5pNR9VlH2ZkJQbCMWGuI/fh8ZwqxdJwmbtcMM9W+/5Z2ynFWnobF6VZsW2AI8
         whOkqK6ENJMWj3SFZKC6MVnFgrJoAvMpzwTijblO4xMFOHPqZo7iWZhqw2b8Iiy3QBLM
         FLOxkoX6pZEgbEvJKfaFYot0WiXp9LV/ldz9VVZfjSytL6xNHTpS4eEa/DpE8NEFoOi9
         uNnMegHHZvKm5MsY4WloSJqrmaNVlizuTNAtrBGu/8B20Qb8DLQqR1kPL2+yDUB2sNQZ
         dplGTp2ECFMNa/iCAEwNX+sU7nbQGs6M1Fq5SF3DTKCKgQgvRKvzFn4w8aYBb2KRPwDD
         kq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SMcxmg4KGpQp9LtQLB46KA2RlzwuSRy9yc8AQ8e7Las=;
        b=Zy+Enhx+UQ/G2BtorvAl2EIQiEpoS7qlaMt98w4LOv4sUkdkq3aKiRks6v+Jombi5f
         eUO7jKI+9Z22k+RcOMfZdrj/PINkeM1kuH52CELZo/on/U+en9U83ZuPoU48xplyo3gt
         Cqu+u7ylrwRY/aXOAsPwz1RUV3wJlLYxB8Xb1yRxZawynlWhB9xqNs5pU8/2qBqM77Kt
         03ZgEc80oZZuh01YbaHBFl206LbAGeNF+KVM+Uh8O3PLqy6NYnx2J1d5quBgtJX0QlAP
         9SFtbrTvqKq+vUUZWOgCILaBjXdNnnDAXunra44VbHND/Ehb022lpRVaD/vDlQbRzHN5
         dmpQ==
X-Gm-Message-State: AGi0PuZUFkA3XfhTW1+AaY+NLjKiWBx5DY38M0PHgGGqXQvlpWa0nFz+
	oLsyspfqR8HQCgdE1URXn4NBjik6Fl7qOFDd
X-Google-Smtp-Source: APiQypKnHJpyHneJ6cXLj1VVMbGKtHIKtYygRy9k8QFAwxT8K0be4wOJ4whWOMRdyDS7fmPayNCWHQ==
X-Received: by 2002:a1c:a58b:: with SMTP id o133mr14779333wme.5.1588931352283;
        Fri, 08 May 2020 02:49:12 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from t460s-2.res.training (ppp-94-65-43-120.home.otenet.gr. [94.65.43.120])
        by smtp.gmail.com with ESMTPSA id n25sm12366384wmk.9.2020.05.08.02.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 02:49:11 -0700 (PDT)
From: "Robert Berger" <oecore.mailinglist@gmail.com>
X-Google-Original-From: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
To: openembedded-devel@lists.openembedded.org
Cc: richard.leitner@skidata.com,
	Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
Subject: [meta-java][PATCH] do_unpack_extract_submodules: WORKDIR and ARCHIVER_WORKDIR support
Date: Fri,  8 May 2020 12:48:42 +0300
Message-Id: <20200508094842.14312-1-robert.berger@ReliableEmbeddedSystems.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 26 +++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 5ea83ed..2166147 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -32,14 +32,26 @@ do_configure_prepend () {
 
 do_unpack_extract_submodules () {
     cd "${S}"
+
+    # default WORKDIR - __NOT__ called from archiver.bbclass:do_unpack_and_patch
+    # WORKDIR is __NOT_ modified:
+    SUBMOD_WORKDIR="${WORKDIR}"
+
+    # "special" WORKDIR - called from archiver.bbclass:do_unpack_and_patch
+    # archiver.bbclass set's WORKDIR to ARCHIVER_WORKDIR:
+    if [ "$WORKDIR" == "$ARCHIVER_WORKDIR" ]; then
+       bbwarn " --> Archiver mode <--"
+       SUBMOD_WORKDIR="${ARCHIVER_WORKDIR}/.."
+    fi
+
     # tar --transform
-    tar xjf ${WORKDIR}/${CORBA_FILE_LOCAL} --transform "s,-${CORBA_CHANGESET},,g"
-    tar xjf ${WORKDIR}/${HOTSPOT_FILE_LOCAL} --transform "s,-${HOTSPOT_CHANGESET},,g"
-    tar xjf ${WORKDIR}/${JAXP_FILE_LOCAL} --transform "s,-${JAXP_CHANGESET},,g"
-    tar xjf ${WORKDIR}/${JAXWS_FILE_LOCAL} --transform "s,-${JAXWS_CHANGESET},,g"
-    tar xjf ${WORKDIR}/${JDK_FILE_LOCAL} --transform "s,-${JDK_CHANGESET},,g"
-    tar xjf ${WORKDIR}/${LANGTOOLS_FILE_LOCAL} --transform "s,-${LANGTOOLS_CHANGESET},,g"
-    tar xjf ${WORKDIR}/${NASHORN_FILE_LOCAL} --transform "s,-${NASHORN_CHANGESET},,g"
+    tar xjf ${SUBMOD_WORKDIR}/${CORBA_FILE_LOCAL} --transform "s,-${CORBA_CHANGESET},,g"
+    tar xjf ${SUBMOD_WORKDIR}/${HOTSPOT_FILE_LOCAL} --transform "s,-${HOTSPOT_CHANGESET},,g"
+    tar xjf ${SUBMOD_WORKDIR}/${JAXP_FILE_LOCAL} --transform "s,-${JAXP_CHANGESET},,g"
+    tar xjf ${SUBMOD_WORKDIR}/${JAXWS_FILE_LOCAL} --transform "s,-${JAXWS_CHANGESET},,g"
+    tar xjf ${SUBMOD_WORKDIR}/${JDK_FILE_LOCAL} --transform "s,-${JDK_CHANGESET},,g"
+    tar xjf ${SUBMOD_WORKDIR}/${LANGTOOLS_FILE_LOCAL} --transform "s,-${LANGTOOLS_CHANGESET},,g"
+    tar xjf ${SUBMOD_WORKDIR}/${NASHORN_FILE_LOCAL} --transform "s,-${NASHORN_CHANGESET},,g"
 }
 
 do_unpack_delete_X11_wrappers() {
-- 
2.17.1

