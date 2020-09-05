Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.3129.1599324968337122135
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bAWB7GDm;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id s10so2569944plp.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=qoDc1959gjUbt/XEpSOPp2ZcVDKwQwVbbWNLDN0T9FQ=;
        b=bAWB7GDmLlXuT1oRIlxYDmW8wKmWaJ8G53Cwq6D8WceI4vFjYblPxTUL7BFA3El2pR
         BA18RcPTvmh32n+sEWt9e+kGbNc8SBMOxi2VaGl12lKU6E42bcspSD4VNCo8+5zTITlK
         BgumewyvsxNOhAwfq+I/eFBcXddwqXM/ohUt+NP/+/D+0ly2bEsYOd57AcsmS6SSQpEX
         yqR7yjfVCLWfcykpaOoo2h0wvLfWxVwviYF2OajRsiHXRdEcAkHJu3O6w/uxHG9ydSjS
         +0n4zHDPIwdIbcN4knSZjVqqETa9kWQmDr229fiwPYbio4vWROGE2/mx1Z9fKWZc5F7X
         +BUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=qoDc1959gjUbt/XEpSOPp2ZcVDKwQwVbbWNLDN0T9FQ=;
        b=ltQn25GRYlg4Iac7eYDPEUhYQEE6bpx8NdI7taysCxStVg5JLG+PFjwTJtkkl2/lnk
         l9zlt+GNbKzK7lHqXC5w6WMxBQJ1muLYITgestzcoW0b3m8P7JqJJ1TUL1bsVWOHvprM
         /LSFVtM3V6Q/zdn/1xU2q3ECqSdE/IZHyg+Pzfn1Tk2wAbW/fX7rsz3RiZuDNurG26yz
         UKIEd6SMFo7pxpG6dV4PlUduovMiQGw2EO4ImVaDRW6nfHiStmUC0FAKlb45NTxv8FjS
         oEgUAgpQJ3kj6VGVZSC0MuXSD05z5JY6K6oMqjwm6WNw0EzOw0DrJIWc7Acnr0eKPeNS
         91dw==
X-Gm-Message-State: AOAM532AZcWxV41fbLwg8SH6S6mDqV06nL3BOPsUfp8mNtxm6VgvftSO
	gh0Znaak1TThDU6AXa4ZrUDAraZHaXU=
X-Google-Smtp-Source: ABdhPJxWvUtgZq5Z36Aeg3wdy7zrCTlBoz8bDCRvVd2vNmgBmLKYJlHxbay4WY6+SkjKUbhWRpKYhg==
X-Received: by 2002:a17:90a:9708:: with SMTP id x8mr1101118pjo.213.1599324967442;
        Sat, 05 Sep 2020 09:56:07 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:07 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 01/20] lvm2: remove service template from SYSTEMD_SERVICE
Date: Sat,  5 Sep 2020 09:55:44 -0700
Message-Id: <1e19fc4d9caacba9aeb82a04a293d8de65b5c3c9.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
References: <cover.1599324864.git.akuster808@gmail.com>

From: Kai Kang <kai.kang@windriver.com>

Remove systemd service template lvm2-pvscan@.service from
SYSTEMD_SERVICE. It should be started/stopped in udev rules file
69-dm-lvm-metad.rules.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d85613d8d1d285c9a1f9cf3cf8b13655220cd8cf)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2_2.03.06.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.06.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.06.bb
index e2b551bbc6..bc86810ecb 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.06.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.06.bb
@@ -32,7 +32,7 @@ PACKAGE_BEFORE_PN = "${PN}-scripts ${PN}-udevrules"
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'dmeventd', 'lvm2-monitor.service dm-event.socket dm-event.service', '', d)} \
-                         blk-availability.service lvm2-pvscan@.service"
+                         blk-availability.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
@@ -52,7 +52,11 @@ FILES_libdevmapper = " \
     ${sbindir}/dmstats \
 "
 
-FILES_${PN} += "${libdir}/device-mapper/*.so"
+FILES_${PN} += " \
+    ${libdir}/device-mapper/*.so \
+    ${systemd_system_unitdir}/lvm2-pvscan@.service \
+"
+
 FILES_${PN}-scripts = " \
     ${sbindir}/blkdeactivate \
     ${sbindir}/fsadm \
-- 
2.17.1

