Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.12915.1617719179446375646
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 07:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XmE0Oc7X;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id u21so22244268ejo.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Apr 2021 07:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PfGX+cSVQRuSNrjizCoesQ4+VlG6oNAKWK4FDiVI8Wc=;
        b=XmE0Oc7XvhlAqjR8NFGoRcd7zHh0RF+V6wagiR1Pd1yYCSzGr4WQduy8JEA8VWyQ7h
         P7ySUXNyWY1HFUCYmhZwbo7HUC/hbhtMhnG8nqEZ83uC+knq0vSsHDvoVzK7zwi8ZB7y
         blDLZAnqEBSq6R7m6+mjdD5zjYXPpC8JnCxNBLJYZGOKoPtdxskHjeR74KOWSub/CGiF
         ZdrevepFIjw514f2iXBgv3BUPlUYOAlx3sDgMeatKycknEg9gQG3BdgLfrEGmPp6IZQ8
         /1Pf7bED4vKpiokGe2W00he+ya7ccumyANgY6F//55W6xHILSGr7EBIA4AUB0W0wGnyo
         i3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PfGX+cSVQRuSNrjizCoesQ4+VlG6oNAKWK4FDiVI8Wc=;
        b=gNrSdwJbR3fCgkcCpOCZnpUTqFvqnxGddecrbblaGizjSao84NVo+u9FCtO16a2y5m
         AKV8s0NhEW9ZxMxtezaQmuDqDDREE58j24tba3LnaB7E6asT83/LREbH2rJ7dF4B+IP7
         i1zRj5dLiuMK2ZBK2jO8OyVegn1yOnOEC3qivFlerw1TjvN+lWQDEwi6ZFy5OiQNmbbp
         ilXIGgA6PvJJu46Bd31vTFc3yZorcRNwkiQGnyoRN0evatad63TOeJ1meHdtVZe3KrPs
         ojZYWpXdfHJiRMuj4tZlEmVMmR/2IemVYytHWw7PMeGzCo+6sJCP8zycnknTxQxpOvfq
         Jo7w==
X-Gm-Message-State: AOAM533NFOeaxj0qKwULmrKnk36KKR+71P1wU/mZNJx0vmIdIFoqhz/s
	yHbN3Pt8GzpL1xyo0ZtvUbDIq+eYA/I=
X-Google-Smtp-Source: ABdhPJz6tbD/lRwZ3p62fcvQbR2tQ9CMcnlhPAyX0lA9+phYGffp5EnI8/3qWIZU1D8JZUNuGXOm+w==
X-Received: by 2002:a17:906:d04d:: with SMTP id bo13mr11394604ejb.157.1617719177954;
        Tue, 06 Apr 2021 07:26:17 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id rk11sm4710356ejb.60.2021.04.06.07.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 07:26:17 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] libsmi: use /bin/sh instead of ${base_bindir}/sh to silence QA error with usrmerge
Date: Tue,  6 Apr 2021 16:26:16 +0200
Message-Id: <20210406142616.1494746-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* with usrmerge ${base_bindir} is /usr/bin/sh and libsmi fails with:
  ERROR: libsmi-0.5.0-r0 do_package_qa: QA Issue: /usr/bin/smistrip contained in package libsmi requires /usr/bin/sh, but no providers found in RDEPENDS_libsmi? [file-rdeps]
  ERROR: libsmi-0.5.0-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.

* this is a bit strange as busybox does install /usr/bin/sh file:
  ./1.33.0-r0.usrmerge/image/usr/bin/sh
  ./1.33.0-r0.default/image/bin/sh

  but also adds /bin/sh to RPROVIDES_${PN} for usrmerge in DISTRO_FEATURES:
  RPROVIDES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/sh', '', d)}"
  added in:
  https://git.openembedded.org/openembedded-core/commit/?id=1f6c14939c8daa5e09103789c3ff5031cc888d16

  and 1.33.0-r0.usrmerge/pkgdata/runtime/busybox:FILERPROVIDES_/usr/bin/busybox.nosuid_busybox
  correctly contains /usr/bin/sh

* adding runtime dependency on busybox as /usr/bin/sh provider would silence the QA warning
  but people might not like adding busybox to their image

* using /bin/sh silences the QA warning as well, because /bin/sh is explicitly ignored in file-rdeps insane.bbclass:
  https://git.openembedded.org/openembedded-core/tree/meta/classes/insane.bbclass?id=1f6c14939c8daa5e09103789c3ff5031cc888d16#n907

  if "file-rdeps" not in skip:
    ignored_file_rdeps = set(['/bin/sh', '/usr/bin/env', 'rtld(GNU_HASH)'])

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index 212b1e797c..ae76fade73 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN} += "wget"
 
 inherit autotools
 
-EXTRA_OECONF = "ac_cv_path_SH=${base_bindir}/sh ac_cv_path_WGET=${bindir}/wget ac_cv_path_AWK=${bindir}/awk"
+EXTRA_OECONF = "ac_cv_path_SH=/bin/sh ac_cv_path_WGET=${bindir}/wget ac_cv_path_AWK=${bindir}/awk"
 
 do_install_append () {
     install -d ${D}${sysconfdir}
-- 
2.30.2

