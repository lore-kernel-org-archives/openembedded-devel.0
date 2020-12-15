Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.6915.1608011448512334171
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Dec 2020 21:50:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qRkA9TRL;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: rfried.dev@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id w5so14850159wrm.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Dec 2020 21:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=fJJHuq9OkUzRB05hZzAxzd0b+xsbJqQ4cBu4nt62Koo=;
        b=qRkA9TRLinc6Ll12fjxrPtkOWC0kEcN9kAe2d9ZNJJ0h/pzFQckO26zLLkP/MT6t5L
         S0rMoTscSOZ0QbEOFDk6w9Jn0vWq/Smc4Xe04CX0fXMMpYbu0t7p6cOVvzhUg0Y4M1Lo
         qzpaTXodfDhc3AqwUYqY/E04btMz9UguJr8xAJOLlHq6Ta/dosXbDn0c70jAk1kjEYHu
         R6LSgYdgG3RBZMjzJc1AAPDHVoAvGAOtLReFsQ4ElVxGSJT4YbT6L2s2wrkj4HZ/Y0Jx
         Gx5ZpHONXR17KQU2cwkNXCJJKZ1mPjhLB1tUQ5hR2NN/y6xq6HKXL43xpIgvCNjuEa62
         ckvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=fJJHuq9OkUzRB05hZzAxzd0b+xsbJqQ4cBu4nt62Koo=;
        b=BR6lC3nODt7wENKATzPvvzJdE7Plodr6d7VyKpvCXo+SeA6jr2Cua+0p8xhJU24FgY
         k5p3WYnoJTUWgz8vMTj/RDd4GM1NJK0XYJ2vxLCHZzeuh6ZJnA9GbQ2CQeGxOoDAj2jK
         fsn9s5li/NQnVxvh5QAzG8KUuE87m9whJ9bQqXE8SuzrcTshcLAm4tf2jewW6T8JXomi
         fvQ/8vSKWB4lO8byfT33EPR4b0NKrCKwOJ0DoqR49X8bjxE9wZSvaH4kHHDCqwfDVRsI
         ORsERXcm4+ckVfTDlu1hl0pzWtNErkOin4TRygsxKFrSHMbznd9i0daTY5O6o9g5gYet
         CdQw==
X-Gm-Message-State: AOAM531vaCYC9xwLRwv35lJpBBbTSDN4RnxYwNAG3zdF6x7NOKvyKE/P
	NfSpj+CYpUwqalN9To4Y1OGMh5FMeqLZCw==
X-Google-Smtp-Source: ABdhPJyIyhDm8nY796QlMMX41InFQg1/FqX4IvZPnNngNC/ExmEUTn9oXeoO18pJ+DCw3Iek61FiSQ==
X-Received: by 2002:adf:902d:: with SMTP id h42mr31478400wrh.175.1608011446408;
        Mon, 14 Dec 2020 21:50:46 -0800 (PST)
Return-Path: <rfried.dev@gmail.com>
Received: from lotus.nr.ent (82.166.25.98.fix.netvision.net.il. [82.166.25.98])
        by smtp.gmail.com with ESMTPSA id l7sm34251399wme.4.2020.12.14.21.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 21:50:45 -0800 (PST)
From: "Ramon Fried" <rfried.dev@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ramon Fried <rfried.dev@gmail.com>
Subject: [PATCH v2] bitwise: add new recipe
Date: Tue, 15 Dec 2020 07:52:26 +0200
Message-Id: <20201215055226.1395-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.17.1

Bitwise is multi base interactive calculator supporting
dynamic base conversion and bit manipulation.
It's a handy tool for low level hackers, kernel developers and
device drivers developers.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 .../recipes-extended/bitwise/bitwise_0.41.bb  | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-extended/bitwise/bitwise_0.41.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 2c46d21b7..577f2e788 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -307,6 +307,7 @@ RDEPENDS_packagegroup-meta-oe-devtools_remove_x86-64 = "${@bb.utils.contains("TU
 RDEPENDS_packagegroup-meta-oe-devtools_remove_x86 = "ply"
 
 RDEPENDS_packagegroup-meta-oe-extended ="\
+     bitwise \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "boinc-client", "", d)} \
      brotli \
      byacc \
diff --git a/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb b/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb
new file mode 100644
index 000000000..2c4ffb1eb
--- /dev/null
+++ b/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Bitwise terminal calculator"
+DESCRIPTION = "Bitwise is multi base interactive calculator \
+supporting dynamic base conversion and bit manipulation.\
+It's a handy tool for low level hackers, \
+kernel developers and device drivers developers."
+
+HOMEPAGE = "https://github.com/mellowcandle/bitwise"
+SECTION = "console/utils"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
+
+SRC_URI = "https://github.com/mellowcandle/bitwise/releases/download/v${PV}/bitwise-v${PV}.tar.gz"
+SRC_URI[md5sum] = "62514cb4d26771eec56a54901299b09e"
+SRC_URI[sha1sum] = "753662205db576f86de7ab89b303b6e411dcf04a"
+SRC_URI[sha256sum] = "33ce934fb99dadf7652224152cc135a0abf6a211adde53d96e9be7067567749c"
+SRC_URI[sha384sum] = "ff15c72b60e71b2029d316688350ec07119b1b56e3c911d9bf3f23e3939d9f86d43853b9e812ad7ae7a002a71a559fb2"
+SRC_URI[sha512sum] = "fc4a612d73bd34a20a87181420ca46549815a86c2861ad918a6539e3bf15230af5e534724f368080a2de0874deac7052e58075683fd32bce1ee070b777d24a9b"
+
+UPSTREAM_CHECK_URI = "https://github.com/mellowcandle/bitwise/releases"
+
+S = "${WORKDIR}/${BPN}-v${PV}"
+
+DEPENDS = "ncurses readline"
+
+CFLAGS_prepend = "-I${S}/inc "
+
+inherit autotools
-- 
2.17.1

