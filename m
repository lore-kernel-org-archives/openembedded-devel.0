Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web11.28.1602186181960520981
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2020 12:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RWWm0hxf;
 spf=pass (domain: gmail.com, ip: 209.85.167.195, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f195.google.com with SMTP id m7so7635600oie.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2020 12:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=btTKWAFNl+IKJ2e/eaDYcEEgal/c96Y3Bap90FIRRBw=;
        b=RWWm0hxfZokyAv+fNrdhBvCvE1W+t9kr6oHSQRYD+vgsLSD+6+FzLh9kec/B91uAQY
         gWReyUZiOGsFLrW4fM27NJLEusV+d2JTBjdtqQRoKI1Z+5fx/dZsilU1X894xGVWKOJM
         o0O/Q4gM/7sCVcsIsWp9b5+e9yfWS8qSM9l/keBiE23XyUh0ri5TmzRUopnLT75mEK13
         ugelagQp15ttwG5rixrpwFFpSC5gEltIRspobU2xLnc909FwKPD5LqbtPWzVoWLL6ljJ
         scy3dxtnTHHbAG2j1sKGPt6qFJV29hNLYCjW8uQcJwyT1zIgWyYe6wenl1TBD4rXQJJ5
         wE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=btTKWAFNl+IKJ2e/eaDYcEEgal/c96Y3Bap90FIRRBw=;
        b=LYpZX+tmqgxtJexhR/qyZGz4QAg4v4bXafLYXW8iM/wFPLNH3UdAwjUAzuleIVWQ7x
         34AMjaeBC6olXHJRXwz2SopzunQbto6oeVKEdm7xi3WLxCUp5xHc4RB3vejB1PDdguaZ
         isxAPyLfLCaee0bh/WZ6zLkxCbfSc+4SSdn9TguSvvnzDEJMXc5abUXLvZuARcXf0P8y
         j5IK4VmsZAL35/zMBa/i0mqt6l5xtOjiNUyPMHNk+OG0ZIUIANshVKKGkics0i5lb+H5
         WpYgGPgIRpqPnUCCkB2CJ8acDPKriPitfitBIauhL8OEcT0yyrYgbo8Ni9mbGWfe7KVD
         J1qw==
X-Gm-Message-State: AOAM533ciN3nBN5BLBB6+nryYHBn/YmxUvua8JvVvBOUjW27vypF4XYY
	1WoNiYaOXkOi1DAnYNfJyTLwGaEbuHI=
X-Google-Smtp-Source: ABdhPJyx5NdKx82Q+OiGNOeIBuMo34yHF8QgDUi2a77XIzjoESwLpcDBoGPnRFagZUa39i+Khzhw7Q==
X-Received: by 2002:aca:38d6:: with SMTP id f205mr308013oia.6.1602186181073;
        Thu, 08 Oct 2020 12:43:01 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:f1c6:e45a:6950:664b])
        by smtp.gmail.com with ESMTPSA id 92sm4806500otl.1.2020.10.08.12.43.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 12:43:00 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] musl-nscd: add package
Date: Thu,  8 Oct 2020 12:42:59 -0700
Message-Id: <20201008194259.19152-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/musl/musl-nscd_git.bb    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/musl/musl-nscd_git.bb

diff --git a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
new file mode 100644
index 0000000000..50df6706fc
--- /dev/null
+++ b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
@@ -0,0 +1,37 @@
+# Copyright (C) 2020 Armin Kuster <akuster808@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Musl-nscd is an implementation of the NSCD protocol, suitable for use with musl and with standard NSS modules"
+HOMEPAGE = "https://github.com/pikhq/musl-nscd"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9bf479a145bcaff8489e743da58afeee"
+SECTION = "utils"
+
+PV = "1.0.2"
+
+CFLAGS += "-fcommon"
+
+SRCREV = "8f278675e1b6a3a02c8ee1b8ca000f80570dc5d6"
+SRC_URI = "git://github.com/pikhq/musl-nscd"
+
+UPSTREAM_CHECK_COMMITS = "1"
+
+inherit autotools-brokensep
+
+S = "${WORKDIR}/git"
+
+do_configure () {
+    ${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+}
+
+do_compile () {
+    oe_runmake
+}
+
+do_install () {
+    make DESTDIR=${D} install
+}
+
+INSANE_SKIP_${PN} = "already-stripped"
+
+COMPATIBLE_HOST = ".*-musl.*"
-- 
2.17.1

