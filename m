Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.43832.1585543720619160040
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 21:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MGwElpwT;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id g2so6259092plo.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2020 21:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=adCBWnzkoKtgv86iQLWWORhxJEgx4Ut9W8FGTo2JK9k=;
        b=MGwElpwTF6XqIDobC9esTA7V8OPfqdZc+TzjTwdE6UuOqhd3n7ySoTByQWtAtrnkpW
         gxbaUgmAPp1gZnwzIBnG568IsySFtAtgZOiJFRxC8Tz5ihRZYpnfLqWglC+j5Le0K2nz
         y2bpRP8snvITV1H4rIa8pFwegS1//0aingA8vO29MmRDqKSy4GiyxgxEMFRFXNCGIgmq
         JugnQvvUqUg0IWSX0/V36MJemed20fheewmHZZFGOXsO2aiDAjxp41yimOeEB4ZyQftj
         VNYoBkfmmAApZcnBYWtP4E7OcmdMDAulwg/pgytNQpgLgsPh7T961qSBtehE6q4yisaj
         PzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=adCBWnzkoKtgv86iQLWWORhxJEgx4Ut9W8FGTo2JK9k=;
        b=cTJ2/qHNh+qBdgAcuTRz9Zeh/VQ4momfSHDIPYW7t6dkh7UF667qbsr0/cEPKzNP7K
         IdpHpaa+/ThOF95vlU2vhz1fIeSY/syV+VTmViXssDYi1bLTMhln2GXYoFYsxZlNyopw
         /RjPSt83jc5dNWsWMFg/He2HYHchCfff+tl1BftWFb0emrIIzBp+crbOBphVi7VNKklk
         SxJ/Fh+zR72q/Gu52SJgJpnQnhXZOKW0RafTWPRcNJWzmKGYQO1ruAeMln2oGcxn29D+
         Nn3/lMmH8liGn2zoHElWELF8TkmkxRKqQNs/076pDlGnbixtpEh6WI+UfZWJv3Ktb/nh
         5KBA==
X-Gm-Message-State: ANhLgQ0U4dGMoSX2ux4BNGx6cA/fX6b/MCYBdkCpEbuAc64fo0egB+Dw
	uV3kCoRj0kNKyjm1eDNwY3EtE4yhIas=
X-Google-Smtp-Source: ADFU+vvzpy+y9YJsux0L6f3JjFuEUDxUKgHWC48yA85tPLgBXZVR+cqvrimt8HEy3Iya6VaKviaEvA==
X-Received: by 2002:a17:902:9a93:: with SMTP id w19mr10966858plp.277.1585543719665;
        Sun, 29 Mar 2020 21:48:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49c5])
        by smtp.gmail.com with ESMTPSA id fa16sm9130949pjb.39.2020.03.29.21.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 21:48:39 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] packagegroup-meta-oe.bb: Move debsums to a bbappend under perl-layer
Date: Sun, 29 Mar 2020 21:48:51 -0700
Message-Id: <20200330044852.1727500-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps avoid dependency on meta-perl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-oe.bb         | 2 +-
 .../recipes-core/packagegroups/packagegroup-meta-oe.bbappend   | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bb
index e04b48f85a..f4931aeeba 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -240,7 +240,7 @@ NE10_armv7ve = "ne10"
 RDEPENDS_packagegroup-meta-oe-support ="\
     anthy asio atop augeas avro-c bdwgc frame grail c-ares \
     ccid ceres-solver ckermit cpprest ctapi-common daemonize \
-    daemontools debsums devmem2 dfu-util dfu-util-native digitemp \
+    daemontools devmem2 dfu-util dfu-util-native digitemp \
     dstat eject enca epeg espeak fbset fbset-modes \
     fftw fltk-native gd gflags glog gnulib gperftools \
     gpm gradm gsl gsoap hddtemp hidapi htop hunspell hwdata iksemel \
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
new file mode 100644
index 0000000000..e7b43204b6
--- /dev/null
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+RDEPENDS_packagegroup-meta-oe-support += "debsums"
-- 
2.26.0

