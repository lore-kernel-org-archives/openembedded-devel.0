Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web10.1578.1586020395105374875
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.67, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f67.google.com with SMTP id f52so10758977otf.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LVd2ee8BYy62KiUMF15o2sZXbub46IyGN7qWhVxztPA=;
        b=VRfxCTY8rJP3kKzaBbfT7us+rIIrEiEOQQEA/dd/CK/nmzECxXjt6ZqCKnYQf1WjjQ
         9tnNFet+tj2IEqDUa19++iVePx09BPUN1/Y9aLe3Rcjy07K6vpeP1d268NmdYA8Qsgrr
         mcMVCZZFnsB+GlRuGf1aYEdLQOJBKZAACh/cOeBZdyaS3g7bbRCWQ7yglYhuaePoG8YR
         7Kb+Mjx8sqBHziFEN8WIcbduqzteBBeZtryfo/5LNbv+RhkcY7qQXi8SURxs39kK319C
         eMouV/7zsdfo0YwTHqtRNaOi31xVsn8OKZhQ8xwha6wGzqkFsX4XzdG1xvzeC0wv3L3E
         dyqg==
X-Gm-Message-State: AGi0Pua+N7VYhRSxDM9lKY1zS9HWsHD6vBxdDFmzzcezO34QyHuOrs8x
	CcwyJF+8kUB8mRvXlm/yq30EkFi455s=
X-Google-Smtp-Source: APiQypL7wO1dV66kfFvCy7EMYprx5uAmgqYCF8hIjHoojhOMZwqQFDy1Zh8EiZg/0aykPlJUMV4jeA==
X-Received: by 2002:a05:6830:15c2:: with SMTP id j2mr10542454otr.107.1586020393853;
        Sat, 04 Apr 2020 10:13:13 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:13 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 07/27] python-supervisord: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:31 -0400
Message-Id: <20200404171251.19823-7-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-supervisor.inc              | 30 -----------------
 .../python/python3-supervisor_4.1.0.bb        | 32 +++++++++++++++++--
 2 files changed, 30 insertions(+), 32 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-supervisor.inc

diff --git a/meta-python/recipes-devtools/python/python-supervisor.inc b/meta-python/recipes-devtools/python/python-supervisor.inc
deleted file mode 100644
index 1ac18bbe69..0000000000
--- a/meta-python/recipes-devtools/python/python-supervisor.inc
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "Supervisor: A Process Control System"
-DESCRIPTION = "\
-Supervisor is a client/server system that allows its users \
-to monitorand control a number of processes on UNIX-like \
-operating systems."
-HOMEPAGE = "https://github.com/Supervisor/supervisor"
-LICENSE = "BSD-4-Clause"
-LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=5b4e3a2172bba4c47cded5885e7e507e"
-
-SRC_URI[md5sum] = "ecea94eedc70ba5127fdeb0665bcca0d"
-SRC_URI[sha256sum] = "2dc86fe0476e945e61483d614ceb2cf4f93b95282eb243bdf792621994360383"
-
-PYPI_PACKAGE = "supervisor"
-inherit pypi systemd
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-meld3 \
-"
-
-SRC_URI += "file://supervisord.conf \
-	    file://supervisor.service \
-	"
-SYSTEMD_SERVICE_${PN} = "supervisor.service"
-
-do_install_append() {
-	install -d ${D}${sysconfdir}/supervisor
-	install -d ${D}${systemd_system_unitdir}
-
-	install -m 0644 ${WORKDIR}/supervisord.conf ${D}${sysconfdir}/supervisor
-	install -m 0644 ${WORKDIR}/supervisor.service ${D}${systemd_system_unitdir}
-}
diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.1.0.bb b/meta-python/recipes-devtools/python/python3-supervisor_4.1.0.bb
index d29e1d6b66..56ab27e0f6 100644
--- a/meta-python/recipes-devtools/python/python3-supervisor_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-supervisor_4.1.0.bb
@@ -1,2 +1,30 @@
-inherit setuptools3
-require python-supervisor.inc
+SUMMARY = "Supervisor: A Process Control System"
+DESCRIPTION = "\
+Supervisor is a client/server system that allows its users \
+to monitorand control a number of processes on UNIX-like \
+operating systems."
+HOMEPAGE = "https://github.com/Supervisor/supervisor"
+LICENSE = "BSD-4-Clause"
+LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=5b4e3a2172bba4c47cded5885e7e507e"
+
+SRC_URI[md5sum] = "ecea94eedc70ba5127fdeb0665bcca0d"
+SRC_URI[sha256sum] = "2dc86fe0476e945e61483d614ceb2cf4f93b95282eb243bdf792621994360383"
+
+PYPI_PACKAGE = "supervisor"
+inherit pypi systemd setuptools3
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-meld3 \
+"
+
+SRC_URI += "file://supervisord.conf \
+	    file://supervisor.service \
+	"
+SYSTEMD_SERVICE_${PN} = "supervisor.service"
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/supervisor
+	install -d ${D}${systemd_system_unitdir}
+
+	install -m 0644 ${WORKDIR}/supervisord.conf ${D}${sysconfdir}/supervisor
+	install -m 0644 ${WORKDIR}/supervisor.service ${D}${systemd_system_unitdir}
+}
-- 
2.17.1

