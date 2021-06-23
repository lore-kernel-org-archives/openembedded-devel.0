Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.3000.1624421595982488310
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jun 2021 21:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FuNOyGLW;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id l11so739691pji.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jun 2021 21:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q+mfh/1wn0uZDHBnFtDVTegoZ+XNzMlueORNDxhb42o=;
        b=FuNOyGLWgbS6wRlaKN31MHfMSEbdcq2o6ngawF/RCSPh6GL2ZetLjWbazvPLHRZEUk
         j35ojsJncmhyKfXKPBi+itTlVu4ZYmZVGdYnhZbqP8N2mNxW7ZZ3uzfW/g6sZgfgaNO1
         /UQXUF5SXSkCWNXlL7Qh9YWe/ayahKHz/Egcibx9EmPA4I9uONIT6Oc5UODCljeutAjJ
         aPbkOAaSQ+/guiuYtjnERArcmxAZ4Ld3QMuEppPW1XfCQ//C2mQO7TImolbM+YTvxUVI
         ckfmbmor2xdTxHEdTIFkCZ3mQqwC8wC1PfxNDl2N+jvOgGmV6U0nXvBi14PWTsXPa6zO
         2nhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q+mfh/1wn0uZDHBnFtDVTegoZ+XNzMlueORNDxhb42o=;
        b=Yc3p9VCt2LrnO3ONg2r5bluYKalWvoIgrzQhHm2a5vFW2lp9BIHsteiT6qsc7KaIDJ
         r0RYqMVdI83nNRN/IRRyM13V/qi3tcalZtTXQHjs3dp5pzHz5GbSO3Nk2MlSMvZagJfD
         Z1vkC63TP1MarAqkRoK9v2kA4o6ILfoI1EG1eDWsLB3oz7moBBQz+WM2LNlDMwUjROLd
         d9FjlXYcRuEQmVJeESMZQ3olcaIiCuP0AMUBaopCq9EuCsJ3kF3sBZQyxp4bhODjsuSr
         bmgB9I1LiMefuwrl498N3JXLyulHCK9ULh7XuH4FFRP85i4UtSlAix3ydl8V/eAZPGG2
         WNYw==
X-Gm-Message-State: AOAM533FbqpRJut6qkfYiNPcppr16VDxs9Fbn1tluBkWrLQnvnhNTVf6
	vyn+mXLl7PdM065V409v8RrMH/eFZeapXg==
X-Google-Smtp-Source: ABdhPJzQ9rysR+a9EhUi3IOeXCUB2OrNRVtcaR+/5a/Ovj/5xqCtGymjevMVEzdY4AfqxIS/nwOkAQ==
X-Received: by 2002:a17:902:6902:b029:106:50e3:b2db with SMTP id j2-20020a1709026902b029010650e3b2dbmr25432028plk.35.1624421595303;
        Tue, 22 Jun 2021 21:13:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bfd0])
        by smtp.gmail.com with ESMTPSA id b5sm17951239pgh.41.2021.06.22.21.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 21:13:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/4] python3-py-cpuinfo: Add ptests
Date: Tue, 22 Jun 2021 21:13:10 -0700
Message-Id: <20210623041310.3976956-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210623041310.3976956-1-raj.khem@gmail.com>
References: <20210623041310.3976956-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing dependency on python3-io for cStringIO
Remove comment about missing modules since _winreg is windows specific
and cStringIO is addressed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-py-cpuinfo/run-ptest       |  3 +++
 .../python/python3-py-cpuinfo_8.0.0.bb        | 21 ++++++++++++-------
 2 files changed, 17 insertions(+), 7 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-py-cpuinfo/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-py-cpuinfo/run-ptest b/meta-python/recipes-devtools/python/python3-py-cpuinfo/run-ptest
new file mode 100644
index 0000000000..b63c4de0d9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb b/meta-python/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb
index 1f81a83230..1b62a7611f 100644
--- a/meta-python/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb
@@ -8,13 +8,20 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b0b97c022f12b14d9e02de0b283ee9e9"
 
 SRC_URI[sha256sum] = "5f269be0e08e33fd959de96b34cd4aeeeacac014dd8305f70eb28d06de2345c5"
 
-inherit pypi setuptools3
+inherit ptest pypi setuptools3
 
-RDEPENDS_${PN} += "python3-core python3-ctypes python3-datetime python3-json python3-mmap python3-multiprocessing python3-netclient python3-pickle python3-pprint python3-shell"
+SRC_URI += "file://run-ptest \
+           "
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS_${PN}-ptest += "\
+    python3-pytest \
+"
+
+RDEPENDS_${PN} += "python3-core python3-ctypes python3-datetime python3-json python3-io python3-mmap python3-multiprocessing python3-netclient python3-pickle python3-pprint python3-shell"
 
-# WARNING: We were unable to map the following python package/module
-# dependencies to the bitbake packages which include them:
-#    _winreg
-#    cStringIO
-#    winreg
 BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0

