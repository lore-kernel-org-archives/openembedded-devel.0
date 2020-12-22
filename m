Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.14078.1608655217291195801
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Dec 2020 08:40:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mxh/jGOV;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: toertel@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id i9so15142549wrc.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Dec 2020 08:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2XkS21uTpjfaKXepDu4Yfxae934cK+2JrAnhKMz9+OA=;
        b=Mxh/jGOVhrKa/A7a1tJaos1ZtH0XX9li0d6daUoIIh/g8XQnxAD8gy/Xp6bHkIxwOU
         a/RmTkjfWcahejLtqurWL9p9LN4iY+ERC23oWawlveTIzfjm49KAmfHOnfpKf5XxBr9l
         8Yl1yK7qqz+lp5MJonL3GPCpJvZ+mJTVOWntOtieIzTW4tO9ZOz0jG4sEqmmf+AA0TFv
         rdRLtc7kC4jkzsAz5WRzrq3OG6kxTXdFT7YFGAJrpoLw02NjHRVo8WWyo/TGORZ1AhGV
         NjowEk5LUEBWN27hHHrItDLzi0qMkg9qO+C2wlWiNon1DTjqhsa7IYf3ylVigr/E1AVe
         jxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2XkS21uTpjfaKXepDu4Yfxae934cK+2JrAnhKMz9+OA=;
        b=smu7NmhQO4nFgE3Gs6Devh7ygRdhbbv8paeVdi+IQlv1Ad5UXwxR3CkX7ALJK1YwxR
         E1+ADQLvmwvhizsGFMXQwKFAmXVQO49KqJptxTqDQ1xZZOW/eVjfTsJwnrFfYMFzjG23
         RMQdmr7n69Y9miYhvcukoT4yT7DE5Ax9aGHU4bq/qUpafesdKYn6WTNqdVcX9uzLRH7E
         IO23jvw/zJCC8/SIRD16LRKKeAVyhYK1bSHL+5xcIOF0KSL5U9CqxrN8YAMbLbdIt5Nd
         GC1hkzaBK7PNARJMA3pB0kxGw81WhC9ANYNU8URQKMhDmt9p3K1ohu30Z7r8ktywHWep
         O/yg==
X-Gm-Message-State: AOAM531S7wXjTJWpAfl/70JhNI4BB15zEONbrwYfEI4J6au0tG+OCq47
	wdbYjgI22jZAsMWR8tTLffVvXmyQW8g=
X-Google-Smtp-Source: ABdhPJyafHRuCIx4fAAKZmplsghaqHYEVlPllsAkW4oeeJpx8r2rOw7ewqjceqD/bUWb1suKWaJR2Q==
X-Received: by 2002:a5d:47cc:: with SMTP id o12mr23959486wrc.236.1608655215441;
        Tue, 22 Dec 2020 08:40:15 -0800 (PST)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf2e6900ac7fa3225c5f4f3b.dip0.t-ipconnect.de. [2003:cf:af2e:6900:ac7f:a322:5c5f:4f3b])
        by smtp.gmail.com with ESMTPSA id n8sm31117267wrs.34.2020.12.22.08.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 08:40:14 -0800 (PST)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>
Subject: [meta-oe][PATCH] beep: Update to 1.4.9 in new repository
Date: Tue, 22 Dec 2020 17:39:54 +0100
Message-Id: <20201222163954.472705-1-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous version 1.2.2 of beep was provided by
http://johnath.com/beep and was released in 2002. The latest version 1.3
was released 2010-07-13. On https://github.com/johnath/beep the
development stopped 2013-02-07.

In 2018 a developer worked on fixing CVE-2018-1000532 and realized that
fixing this would be more than just a simple patch. Because the original
repository was unmaintained for several years he created
https://github.com/spkr-beep/beep as the new home for beep.

Debian switched to the new beep with Buster.
    https://packages.debian.org/buster/beep

Alpine 3.11, Arch Linux, Fedora, and Ubuntu 20.04 also switched to the
same new beep.

Signed-off-by: Mark Jonas <toertel@gmail.com>
---
 meta-oe/recipes-extended/beep/beep_1.2.2.bb | 25 ---------------------
 meta-oe/recipes-extended/beep/beep_1.4.9.bb | 21 +++++++++++++++++
 2 files changed, 21 insertions(+), 25 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/beep/beep_1.2.2.bb
 create mode 100644 meta-oe/recipes-extended/beep/beep_1.4.9.bb

diff --git a/meta-oe/recipes-extended/beep/beep_1.2.2.bb b/meta-oe/recipes-extended/beep/beep_1.2.2.bb
deleted file mode 100644
index cafc86964..000000000
--- a/meta-oe/recipes-extended/beep/beep_1.2.2.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "beep is a command line tool for linux that beeps the PC speaker"
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-
-SRC_URI = "\
-    http://johnath.com/beep/beep-${PV}.tar.gz \
-    file://linux-input.patch \
-"
-
-SRC_URI[sha256sum] = "5c0445dac43950b7c7c3f235c6fb21f620ab3fd2f3aafaf09896e5730fcf49a1"
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
-EXTRA_OEMAKE += 'CC="${CC}"'
-EXTRA_OEMAKE += 'FLAGS="${CFLAGS} ${LDFLAGS}"'
-
-do_configure[noexec] = "1"
-
-do_compile() {
-   oe_runmake
-}
-
-do_install() {
-	install -Dm 0755 ${B}/${PN} ${D}${bindir}/${PN}
-}
diff --git a/meta-oe/recipes-extended/beep/beep_1.4.9.bb b/meta-oe/recipes-extended/beep/beep_1.4.9.bb
new file mode 100644
index 000000000..19c208a21
--- /dev/null
+++ b/meta-oe/recipes-extended/beep/beep_1.4.9.bb
@@ -0,0 +1,21 @@
+SUMMARY = "beep allows you to have the PC speaker issue beeps and beep patterns"
+DESCRIPTION = "beep allows you to have the PC speaker issue beeps and beep \
+patterns with given frequencies, durations, and spacing."
+HOMEPAGE = "https://github.com/spkr-beep/beep"
+BUGTRACKER = "https://github.com/spkr-beep/beep/issues"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/spkr-beep/beep.git;protocol=https"
+SRCREV = "8b85ddd09f73b9fd7caa5679298781a57af194ac"
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = " \
+    COMPILER_gcc='${CC}' \
+    LINKER_gcc='${CC}' \
+"
+
+do_install() {
+    oe_runmake install DESTDIR='${D}'
+}
-- 
2.25.1

