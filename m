Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.9003.1596906251678942486
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Aug 2020 10:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bc6SNBak;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id 74so2797476pfx.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Aug 2020 10:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DInSETXG+hHsoUbyYRo515ovTPTAD8SPC7PhxmfNYng=;
        b=bc6SNBakI/5nH7Gp8+QEO+kowdUute/7plvr3J2m8mOnRcvdiWeHmNLmaMzSWl4WIj
         5wl0oU/QxD6H7UVeYEqdNiSLYOuRdRUOoYm5cajOIUjArCXhOZyn1sySoMz40gcWKnv9
         RH4G86g2OjwDvcAEp3rWi4LmCOw00+HHYg3ZtCrS6mKq71GKtwL9RduVZ8SUyQXghvdG
         LcvzITrxiSGjNkpCxU/qWvI55p/jSfgS1w7q1On/EVTLuOkQ0pzSVJPA5JGNOEaaY2lH
         2CcWH8Tsx8MY/3oYunddBSR2hYLyqybDwt+ddJns2nr/GMq6HCaekB6/F3Z3j77TRjhe
         UyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DInSETXG+hHsoUbyYRo515ovTPTAD8SPC7PhxmfNYng=;
        b=i13uUGrdWx3kIlJJWBG/p79xa0oGvqOz7M+12+3WmSsLFLk+caZPUuxE3/P4oPl98l
         L4chUlevDrNJg/TaAZpkxBl3WIgaJ+mRIncOFfsXBzibJIei/a7TeCzCTWbXReRNT57F
         2iExukccPvsuXeCp9pJ4lij+KTkeMY2LUtHSCNyLdkmHSCgpQqUPpzWI91NerVwQCoDa
         rC9WTUOoRuJLG7N/0pFfbVwL7LckW1XlCJ+jYoibKXc8JNMn8pIuW+PnnHMSSJl/CUCN
         bBdT8MaBfOX966fmW/kntfC4floJc1T6Ogk+RR8lPDlgyRh7WWbcwTRwpn0golHrFY38
         nd0A==
X-Gm-Message-State: AOAM530p49GYdMLXbLyuV2Bq8kEq4PPnSlCuK75COZ4C7ASyRFqIhpD5
	YuMEmsBBC5Wx7RRaQxJgG/h9pYIoa3c=
X-Google-Smtp-Source: ABdhPJxnWDLwQgWvDl2S7yLWTR8oSoYWr1FTKqZmsNoTiFmb5epfWn4XPwkGWyVVGUiK9JrMCEmKzw==
X-Received: by 2002:a62:7ac2:: with SMTP id v185mr18661156pfc.277.1596906250816;
        Sat, 08 Aug 2020 10:04:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id j130sm14280225pgc.76.2020.08.08.10.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 10:04:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 1/9] python3-ipython: add recipe
Date: Sat,  8 Aug 2020 10:03:59 -0700
Message-Id: <20200808170407.2326879-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shlomi Vaknin <shlomi.39sd@gmail.com>

Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-ipython_7.17.0.bb          | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb
new file mode 100644
index 0000000000..ddcddd60b8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb
@@ -0,0 +1,29 @@
+SUMMARY = "IPython: Productive Interactive Computing"
+HOMEPAGE = "https://ipython.org"
+AUTHOR = "The IPython Development Team <ipython-dev@python.org>"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
+
+PYPI_PACKAGE = "ipython"
+
+SRC_URI[md5sum] = "1f2257d771de9d2fb40d9e3cfcea429d"
+SRC_URI[sha256sum] = "b70974aaa2674b05eb86a910c02ed09956a33f2dd6c71afc60f0b128a77e7f28"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-jedi \
+    ${PYTHON_PN}-decorator \
+    ${PYTHON_PN}-pickleshare \
+    ${PYTHON_PN}-traitlets \
+    ${PYTHON_PN}-prompt-toolkit \
+    ${PYTHON_PN}-pygments \
+    ${PYTHON_PN}-backcall \
+    ${PYTHON_PN}-pydoc \
+    ${PYTHON_PN}-debugger \
+    ${PYTHON_PN}-pexpect \
+    ${PYTHON_PN}-unixadmin \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-sqlite3 \
+"
+
+inherit setuptools3 pypi
-- 
2.28.0

