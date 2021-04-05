Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.5925.1617634476253321452
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b2LGJdeO;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id s11so8328011pfm.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Apr 2021 07:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=AxwRfRGurVdeo0RNSLoXpDPRo489tcZLb7aa57vycNk=;
        b=b2LGJdeO++hnbuIQUG0FatRj+4SeqB5GNIaWUp5Lpnbh+Rb2uJrxKpXT8Epj7GTS/T
         /NUY0HtQHFjBmphPXHEitWMXPjo+jKBvNJoWlJzDJyflh5HmOzpEA0M60DPHSXyw+k9o
         Feq05XN7gDIXYvoSZeXjrbDgimk8pevL0hi6XDKIe9MLACycBK8o2W+oI4tHGk9iByaz
         ZJoBizsI9BYrXtXfbtrToMSFy0+7D0trhIwBWoBsIQ6hawpu8Q1XqjuKkbfunS4cbOyk
         wNhDEBYnRDLs3yLRB5/bn5yU9OAcjKMxqXwfstXwwKtd4BVKU68go/h5bWibZi0bxWL/
         1k4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=AxwRfRGurVdeo0RNSLoXpDPRo489tcZLb7aa57vycNk=;
        b=PSdvh8NrPeQkKf/qHsA8aOsv1iwDojQNB7Stcn3KOXSnmJT4o2OkVn6P1SXH03DGB1
         MczY5Hf/TxqOND8gft7+0WMaDgazT4shAYPmNzdvIiXOBEbjeaXOBrPNaeQhFe39O0yJ
         wcDUykfPLguYbJ4VG62LBvn9FKNMg3S03nlORVJqFxIpiUrPainyrl4NFSrqyHpsxEgQ
         9EfJnbzxKtcKmjYIKdSZrJzBjqK0dSFTggJ/tatOT99e8ucAh36x/3hdg6hFP/9pSmCy
         an7UYcfsgI17pKd27/2uri9DxnM9gJzdSge9jI3vrDN2a0CJBG1WOblYBLmsUPAHmB33
         s7WQ==
X-Gm-Message-State: AOAM531KEbs/ZObBPFgYX1LPu+6KWWB75ibvei8Rdz2q6pa7+sNaQjNc
	1FWN6Ju7XZFzsdecHOugfqnYeqPJx30=
X-Google-Smtp-Source: ABdhPJxL7AhJ/s+8QLmybfBFa1VWLw/+mUamTNWqND6bdDcc0uVZGI3ukmhE3BwfI/f+45pwkbTMMQ==
X-Received: by 2002:a63:dc49:: with SMTP id f9mr23044701pgj.361.1617634475612;
        Mon, 05 Apr 2021 07:54:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:cb2:3225:c999:3d47])
        by smtp.gmail.com with ESMTPSA id k11sm16501654pjs.1.2021.04.05.07.54.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:54:34 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Dunfell patch review 05/11] guider: Upgrade to 3.9.7
Date: Mon,  5 Apr 2021 07:54:18 -0700
Message-Id: <fc8b6bd98595f2548d13d2b2f36b3812749bd57d.1617634345.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617634345.git.akuster808@gmail.com>
References: <cover.1617634345.git.akuster808@gmail.com>

From: Peace Lee <iipeace5@gmail.com>

Signed-off-by: Peace Lee <iipeace5@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 93c9a20bf358bc10c2d99fc1d3c7247145344c29)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/guider/guider_3.9.6.bb   | 39 -------------------
 .../recipes-devtools/guider/guider_3.9.7.bb   | 19 +++++++++
 2 files changed, 19 insertions(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.6.bb
 create mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.7.bb

diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb b/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
deleted file mode 100644
index f0590021612..00000000000
--- a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "runtime performance analyzer"
-HOMEPAGE = "https://github.com/iipeace/guider"
-BUGTRACKER = "https://github.com/iipeace/guider/issues"
-AUTHOR = "Peace Lee <ipeace5@gmail.com>"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
-
-PV = "3.9.6+git${SRCPV}"
-PR = "r0"
-
-SRC_URI = "git://github.com/iipeace/${BPN}"
-#SRCREV = "${AUTOREV}"
-SRCREV = "fef25c41efb9bde0614ea477d0b90bd9565ae0b4"
-
-S = "${WORKDIR}/git"
-R = "${RECIPE_SYSROOT}"
-
-inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "distutils", "", d)}
-
-GUIDER_OBJ = "guider.pyc"
-GUIDER_SCRIPT = "guider"
-
-do_install() {
-    python ${S}/setup.py install
-
-    install -d ${D}${bindir}
-    install -v -m 0755 ${STAGING_BINDIR_NATIVE}/${GUIDER_SCRIPT} ${D}${bindir}/${GUIDER_SCRIPT}
-
-    install -d ${D}${datadir}/${BPN}
-    install -v -m 0755 ${STAGING_LIBDIR_NATIVE}/python${PYTHON_BASEVERSION}/site-packages/${BPN}/${GUIDER_OBJ} ${D}${datadir}/${BPN}/${GUIDER_OBJ}
-}
-
-RDEPENDS_${PN} = "python-ctypes python-shell \
-                  python-json python-subprocess"
-python() {
-    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
-        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
-}
diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.7.bb b/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
new file mode 100644
index 00000000000..2b799fd5e45
--- /dev/null
+++ b/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
@@ -0,0 +1,19 @@
+SUMMARY = "runtime performance analyzer"
+HOMEPAGE = "https://github.com/iipeace/guider"
+BUGTRACKER = "https://github.com/iipeace/guider/issues"
+AUTHOR = "Peace Lee <ipeace5@gmail.com>"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
+
+PV = "3.9.7+git${SRCPV}"
+
+SRC_URI = "git://github.com/iipeace/${BPN}"
+SRCREV = "c87269d6d4669d12c99a2a7b9b07c39a5dd24ac6"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+RDEPENDS_${PN} = "python3 python3-core \
+        python3-ctypes python3-shell python3-json"
-- 
2.17.1

