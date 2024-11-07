Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D963D5D696
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 22:14:33 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.5000.1731017665502098162
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Nov 2024 14:14:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mGcw23Uc;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9e8522c10bso219142066b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Nov 2024 14:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731017664; x=1731622464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=It5RR9agEsL3YTleLcgmCt4JPl3ldArPkS4sVR/Q87Q=;
        b=mGcw23UclFfB7goeNqV0gOrEHLvGvKGAT/V9Y4zTYaZYMclx2KLmU0TiINCeXwg9i1
         Xk/FHpCH+1w7iusd5eO5pvoVnjbJMWMsV6/bKzFcJLp+izMkjqyHsTTHe9pVwAQ6nJlo
         ParYwvOEu66qz5ljYp1mQ4w0ihmPpGz2/gTP7RodeDOC3VpJ2HygEqsvw3eqssvbj2WZ
         vDTLfE0ttC2lKfzZanIQYLutIyGeVxdPKhatwpPIo1TnAdziNXWk/MVYFM6AVc5jiWFR
         tZC6kg9Xwni6ZLYSQbhQp2rgVp59uAkuAAC7lVoVeBOw0TiU1fDlwW+zXeRplxHrq4Yz
         al7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731017664; x=1731622464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=It5RR9agEsL3YTleLcgmCt4JPl3ldArPkS4sVR/Q87Q=;
        b=CrWgG4BNU3xOdIL0O6KWS0NdaCGTzSp77vDaoyY/xau1IcWHUFwNbeQPTyp+sUIX//
         /kS6D9pax5K1YPMN9IakKCCTS9FAHYcWv+0mWVh9IZ8PBrQ6fj0H5ftZgHDFIn1z1GmE
         fSVLZ5MI5asZdYEMRyuBsbGOTYzxqMkISFUNbNUIuHxmFkWfE/udpDXmb3ZHnj2yZhBe
         P5IdpW+smpguRA2RwORRbsV6c8RR8ng2UYCI22sTze97uBj4IUaUKHVi3pV3c4FwjdHJ
         BgRMNW2nDnzq30bsvOesa7i1QmGf28Rz5jOk4d1CIarSimlRLHjyzlVm/tFBVBcfhQrz
         54ng==
X-Gm-Message-State: AOJu0Yx0eWUakWpeZeNYE437mAwDAq+Cl2rbvur1ln4nnCOUqN66Jig5
	d0kwCeiR1ud8MyV2Ne/jc+qEzvuhQZcFNvI+MOWv8Xnl3ZrzvqeOTVMoxQ==
X-Google-Smtp-Source: AGHT+IHC7GHGazX6ySLZ0T1UHGGRXyZbMgn4Pyph3hIjuhqYtD5lMh1JEZVSf46x6FIrzclUxJjcKg==
X-Received: by 2002:a17:906:f598:b0:a9e:b174:9cf7 with SMTP id a640c23a62f3a-a9eefeb4df1mr39991766b.13.1731017663445;
        Thu, 07 Nov 2024 14:14:23 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a1769asm151580766b.1.2024.11.07.14.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 14:14:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] snapper: pass --pam-security=${libdir}/security
Date: Thu,  7 Nov 2024 23:14:10 +0100
Message-ID: <20241107221410.462684-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Nov 2024 22:14:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113759

pam_snapper.so is installed in libdir as the default in configure.ac is:
PAM_SECURITY=${libdir}/security
https://github.com/openSUSE/snapper/blob/master/configure.ac#L66

and depending on multilib configuration this fails with:

ERROR: QA Issue: lib32-snapper: Files/directories were installed but not shipped in any package:
  /usr/lib32/security/pam_snapper.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
lib32-snapper: 1 installed and not shipped files. [installed-vs-shipped]

or

ERROR: QA Issue: snapper: Files/directories were installed but not shipped in any package:
  /usr/lib64/security/pam_snapper.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
snapper: 1 installed and not shipped files. [installed-vs-shipped]

when default libdir doesn't match with nonarch_libdir

Some recipes are using ${base_libdir}/security and some just
${libdir}/security with the usrmerge being the default and required
with systemd I'm not sure which one is better.

Now all files are packaged some in libdir some in nonarch_libdir:

snapper/0.11.2 $ find packages-split/snapper/usr/lib*
packages-split/snapper/usr/lib
packages-split/snapper/usr/lib/systemd
packages-split/snapper/usr/lib/systemd/system
packages-split/snapper/usr/lib/systemd/system/snapper-timeline.timer
packages-split/snapper/usr/lib/systemd/system/snapper-timeline.service
packages-split/snapper/usr/lib/systemd/system/snapper-boot.timer
packages-split/snapper/usr/lib/systemd/system/snapper-cleanup.timer
packages-split/snapper/usr/lib/systemd/system/snapperd.service
packages-split/snapper/usr/lib/systemd/system/snapper-boot.service
packages-split/snapper/usr/lib/systemd/system/snapper-cleanup.service
packages-split/snapper/usr/lib/snapper
packages-split/snapper/usr/lib/snapper/systemd-helper
packages-split/snapper/usr/lib/snapper/plugins
packages-split/snapper/usr/lib/snapper/installation-helper
packages-split/snapper/usr/lib/pam_snapper
packages-split/snapper/usr/lib/pam_snapper/pam_snapper_pamconfig.sh
packages-split/snapper/usr/lib/pam_snapper/pam_snapper_userdel.sh
packages-split/snapper/usr/lib/pam_snapper/pam_snapper_homeconvert.sh
packages-split/snapper/usr/lib/pam_snapper/pam_snapper_useradd.sh
packages-split/snapper/usr/lib64
packages-split/snapper/usr/lib64/libsnapper.so.7.4.3
packages-split/snapper/usr/lib64/security
packages-split/snapper/usr/lib64/security/pam_snapper.so
packages-split/snapper/usr/lib64/snapper
packages-split/snapper/usr/lib64/snapper/testsuite
packages-split/snapper/usr/lib64/snapper/testsuite/directory1
packages-split/snapper/usr/lib64/snapper/testsuite/permissions2
packages-split/snapper/usr/lib64/snapper/testsuite/error2
packages-split/snapper/usr/lib64/snapper/testsuite/simple1
packages-split/snapper/usr/lib64/snapper/testsuite/ug-tests
packages-split/snapper/usr/lib64/snapper/testsuite/xattrs1
packages-split/snapper/usr/lib64/snapper/testsuite/owner3
packages-split/snapper/usr/lib64/snapper/testsuite/run-all
packages-split/snapper/usr/lib64/snapper/testsuite/missing-directory1
packages-split/snapper/usr/lib64/snapper/testsuite/permissions1
packages-split/snapper/usr/lib64/snapper/testsuite/test-btrfsutils
packages-split/snapper/usr/lib64/snapper/testsuite/owner2
packages-split/snapper/usr/lib64/snapper/testsuite/xattrs3
packages-split/snapper/usr/lib64/snapper/testsuite/permissions3
packages-split/snapper/usr/lib64/snapper/testsuite/CAUTION
packages-split/snapper/usr/lib64/snapper/testsuite/xattrs4
packages-split/snapper/usr/lib64/snapper/testsuite/ascii-file
packages-split/snapper/usr/lib64/snapper/testsuite/setup-and-run-all
packages-split/snapper/usr/lib64/snapper/testsuite/owner1
packages-split/snapper/usr/lib64/snapper/testsuite/xattrs2
packages-split/snapper/usr/lib64/snapper/testsuite/error4
packages-split/snapper/usr/lib64/snapper/testsuite/error1
packages-split/snapper/usr/lib64/libsnapper.so.7

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/snapper/snapper_0.11.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
index d8987eeadc..28fa104af0 100644
--- a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
+++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
@@ -17,7 +17,7 @@ SRCREV = "6c603565f36e9996d85045c8012cd04aba5f3708"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF += "--disable-zypp"
+EXTRA_OECONF += "--disable-zypp --with-pam-security=${libdir}/security"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'api-documentation systemd pam', d)}"
 PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
@@ -35,7 +35,7 @@ do_install:append() {
 	install -m0644 ${S}/data/default-config ${D}${sysconfdir}/sysconfig/snapper
 }
 
-FILES:${PN} += "${nonarch_libdir} ${systemd_system_unitdir} ${datadir}"
+FILES:${PN} += "${libdir}/security ${nonarch_libdir} ${systemd_system_unitdir} ${datadir}"
 
 # bash is needed for the testsuite
 RDEPENDS:${PN} = "bash diffutils util-linux util-linux-mount"
-- 
2.47.0


