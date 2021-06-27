Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.2653.1624825352632568180
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W6bVNwvV;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id g21so10593859pfc.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Bckf1Jx+GxS6nTR6k60qM+nd8tpUzOcRtiThr8yfGG4=;
        b=W6bVNwvVUv5uGspukuEaZY+dpaMf9u46L58JBAhSp3uLTvqndTkqPpA7ockZQQKU7d
         NFsAEeblr3CrVpY4+gUnXcrXWFFW8x9sKJvMDg4sIKXeJk+qcZ1gmS3Ngd/D080hUe16
         6UeYjahhoZT8CDfBemd1l5bNNAVIS1wI3o7x1y180OFmlI8oPhpOpRon+WgW2jpQV3pp
         1IEh3Yvtl4JEMaC++4Wsc0+yYcgh9epBcp6y5gWnn7R1LJgD9EKBoZArDc7y6+dy1YOG
         cuF5uxqPzgMvc16ZWMco0S0xsf7+f2tOTdzdWaPAnJZ+fHSSPE7BY/U32mmw86X2YyEz
         iwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Bckf1Jx+GxS6nTR6k60qM+nd8tpUzOcRtiThr8yfGG4=;
        b=mUWUmwUCGlij16JBgviGAtmCk2BjCtHOnZGFYRfKf8iq6HEEko9S3+3JZRZRLjd26y
         HsNZYcfl1viuKFx6Jd0qyTUqIZCxH7VudmgQukjqD1artL1COkMY8f1bFDTSkPey0kdJ
         R/79yAfJITScBsvRynlrOUFSlP0fIKghtEWdRnjC3A+D/N3OSKY/SoPK1IxUVo+5U650
         2hEUz4VWZrfV+32ZDKxQU6WGl5gVKuCrpEWxfrLRiE5ZUlPWF8I9VRlu7kYBKSphOjxj
         VBo3dhvNqRiSIK1bDU16jNXb8ce2KeygU2UWscmSfFqsdkxJKI7sg13B7IDn+rwRpi81
         FuwQ==
X-Gm-Message-State: AOAM531h6/Em9h+oYtdL76yygANSLDm7NTwyCEeUK6AAqMEwDDndv2r5
	1wY4OJF5bysWdibngMtQVqGANLoqb3q4zA==
X-Google-Smtp-Source: ABdhPJzA2qCE5Zs6VIPd81YWyNOn2Xe6qhC+aMKeitA42IJshJJvXceif2FDgLHiAMDDWw/eNBkDiQ==
X-Received: by 2002:a65:528d:: with SMTP id y13mr20208715pgp.276.1624825352119;
        Sun, 27 Jun 2021 13:22:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:31 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 15/20] cifs-utils: set ROOTSBINDIR to /usr/sbin if DISTRO_FEATURES has usrmerge
Date: Sun, 27 Jun 2021 13:22:10 -0700
Message-Id: <a83c773ddd3d3e36d17a560103531657f915f6fe.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: Geoff Parker <geoffrey.parker@arthrex.com>

Fixes cif-utils recipe build when DISTRO_FEATURES includes 'usrmerge'

Add do_configure_prepend() to override ROOTSSBINDIR environment variable
so that the utilities are installed in /usr/sbin rather than /sbin.
Setting --exec-prefix or --prefix in EXTRA_OECONF does not work.

Update do_install_append() to NOT remove /usr/bin /usr/sbin if usrmerge
is set in DISTRO_FEATURES

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3c1e72d62ccf2c2f94bf280a2500e23fdb01a57c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/cifs/cifs-utils_6.13.bb     | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb b/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
index 41a9b8e76a..bf8b18043a 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
@@ -22,10 +22,21 @@ PACKAGECONFIG[pam] = "--enable-pam --with-pamdir=${base_libdir}/security,--disab
 
 inherit autotools pkgconfig
 
+do_configure_prepend() {
+    # want installed to /usr/sbin rather than /sbin to be DISTRO_FEATURES usrmerge compliant
+    # must override ROOTSBINDIR (default '/sbin'),
+    # setting --exec-prefix or --prefix in EXTRA_OECONF does not work
+    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','fakse',d)}; then
+        export ROOTSBINDIR=${sbindir}
+    fi
+}
+
 do_install_append() {
-    # Remove empty /usr/bin and /usr/sbin directories since the mount helper
-    # is installed to /sbin
-    rmdir --ignore-fail-on-non-empty ${D}${bindir} ${D}${sbindir}
+    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','false','true',d)}; then
+        # Remove empty /usr/bin and /usr/sbin directories since the mount helper
+        # is installed to /sbin
+        rmdir --ignore-fail-on-non-empty ${D}${bindir} ${D}${sbindir}
+    fi
 }
 
 FILES_${PN} += "${base_libdir}/security"
-- 
2.17.1

