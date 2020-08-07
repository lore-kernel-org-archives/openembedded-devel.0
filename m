Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.1433.1596784002294279833
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Aug 2020 00:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uhcl2I5Q;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id t6so469464pjr.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2020 00:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DInSETXG+hHsoUbyYRo515ovTPTAD8SPC7PhxmfNYng=;
        b=uhcl2I5QkTtq90+c2wAS5L1Yg4Dg+IYu7ueCSxUnmPyMHofp0qJiy9bdX5apUU5try
         gJXOyP0VdMfxFCdY2YbNSzkGA7OFXyQiOI4bH2+EfYHSWJfmoUnivF8/p1qW4nanECnd
         oyWKKfI8MAaQ6GqN6iOe7lZOB4HazjOG49jvPVhXIVyT2A5l6/oSX4FfYHAM932kGR8r
         emHjvF0z22dMBG8SbVypLdN551JmwMIWNOZhPAttoEmo+w31g6LHdEbhjd3wxa2EObTF
         iywhI643F/WJZlveYEZxdAG5gdHj2P6rsWqXGpRd4gyNyjdd2wT48LYUPU0rv8+fkkiM
         FVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DInSETXG+hHsoUbyYRo515ovTPTAD8SPC7PhxmfNYng=;
        b=dGdikQi4u8ajyzup8yaMv1/oBANQAkwzKb/bSJ8m8TYLFjJC18KGg/PrqTlNluxppb
         4PWBjL4ls/KCQWszc353BAwkzi1DfEOWfWoMtOWNpGV96AlYvH9ty0/LL+LsOw8kWhgT
         p56AAqncNLT/PxCfeivmU5hoGhh3VX/neN5B9GNPioCtBn43BOVWLSNxBEKnTOSG9tSy
         DPADiZMLBS9gIPLIwR1NlX41ccWsQIQpQ6DwLtadBQW3fZMf4cSPx9OXdYlzliXz+q+j
         aG10IpUmiGnc8ivaGvxFEPIxQ61JTrrRT5V64Tgfrjh7toITCi/xCFg+nXZilq5Ub4NV
         V1UA==
X-Gm-Message-State: AOAM531DxrW0XMXwcyzMycbjMlwCgpBjqgJ1DNdM6GCmOa6n/scP1KnR
	HO1kr84VhwI3LCrEl1gJrxydlUWw28A=
X-Google-Smtp-Source: ABdhPJzPg+MFzwEpd2zDAppYMZOCdspCLpRgvhu1vo82L2M939sCzEOHXjAdq+32vDf41LZykZXgNA==
X-Received: by 2002:a17:902:6a8b:: with SMTP id n11mr11176919plk.264.1596784001449;
        Fri, 07 Aug 2020 00:06:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id e26sm10344715pgt.63.2020.08.07.00.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 00:06:41 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-ipython: add recipe
Date: Fri,  7 Aug 2020 00:06:38 -0700
Message-Id: <20200807070638.2335454-1-raj.khem@gmail.com>
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

