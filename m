Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.7477.1588931474901631004
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 02:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZNpjZOB5;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id g12so9921959wmh.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2020 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=FIOlmLj2K2LHQQt6Fqspq1thmpdaacX3WdWTWjWwjCs=;
        b=ZNpjZOB5Ch7V4zBSyMk6hOUDsHOZ5nYLk2bJBak0UUjJi8eDUMILTDfGxNjJo8otjH
         BDwYDIL2vA3fgAA1MAg6uf2Vv5D6NAUmSBf0hoWgwxceErDnXtj0p+tfSzcY6LZaoQAe
         96/R5XzC0NwU1vLkp5Gwr/vICON6ImcBNWp5T/OUsDUodvOr/185OWg/TQW/rYBr3G2S
         lGHIoXxanyx5byqk5UKe4BXlOOdQwPjLpw6eiawXGIwzih/8vL6K3jAJMb/BockkH+av
         F3UGgLEIOnR/wG/otx5nl9ATzYC65EkWIrBcCxRgj9JT+r6FY282bJo8AMG3OsVRedbu
         owKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FIOlmLj2K2LHQQt6Fqspq1thmpdaacX3WdWTWjWwjCs=;
        b=X1SkbY8DQWggmpIfxn5895X0+3mhRSuoo6aaV/7QvyXsR1aOkAS28M0fPB+4GjMd8M
         XUym2ydTLSRQVw65qK24P4WuU8eSw3/9p0Mr+ZElHu+94hmb01RteqK+9QrQw4DXmtv+
         dC/BIut/OxxQ3az5IUtAOawdOZYuyYSE/79uD7LJ3lMhxH7d8U8u1NORIUlgAQVfJ//t
         wwkpusyuSfXS4xocpl0rayMURs31FufwqsKwDHi/8lasuPj85XkDVueLdLlHiGfX3995
         HODAgk9zc8U30uHVmF6+B0KzK/i/UqBSiOI6RwbEV4ud28PI9qrjotnkI/zq3zED3uIa
         jkZA==
X-Gm-Message-State: AGi0Pub9wB9IKKS+Z8zMKp+eHpFZSxcsClsyfznFNSvC1Lb5/z+S55wq
	dApytdicHWabHcjZREGwy9hS/Rcx3cjQARdC
X-Google-Smtp-Source: APiQypLfyk3hDP87X7Bba0QsmBUVWlfuHklMUeY5j9IooC4Ahok6ToI29kspKOW9RPJllmpUxPdIpg==
X-Received: by 2002:a7b:c4c9:: with SMTP id g9mr14962223wmk.171.1588931473336;
        Fri, 08 May 2020 02:51:13 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from t460s-2.res.training (ppp-94-65-43-120.home.otenet.gr. [94.65.43.120])
        by smtp.gmail.com with ESMTPSA id o18sm2061924wrp.23.2020.05.08.02.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 02:51:12 -0700 (PDT)
From: "Robert Berger" <oecore.mailinglist@gmail.com>
X-Google-Original-From: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
To: openembedded-devel@lists.openembedded.org
Cc: richard.leitner@skidata.com,
	Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
Subject: [meta-java][PATCH v2] do_unpack_extract_submodules: WORKDIR and ARCHIVER_WORKDIR support
Date: Fri,  8 May 2020 12:50:56 +0300
Message-Id: <20200508095056.15810-1-robert.berger@ReliableEmbeddedSystems.com>
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

