Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 991407FDAF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 15:47:00 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id p9so19479634wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jan 2020 07:47:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=c9quBk62ZhhBbeOyQ4lUuAe6/Hf3OfXTF0jh4n4fRO0=;
	b=k7vaiVQMT5VMiXO/hYwwcWPCzotl/rjSmknzuhrQ1D8bruR380jhYTrccduubQnNaF
	qLBm2BngxNcXhGkv3KvM4VcUaGcvMR1G9fk5b3YG5+j210oRqmSQA7FPwD0A+Own41fY
	5S9MiTz55TtfhaHD7jjFxFS2zkZHGW7O8p91rfz9IDKztoQDmJokEGO/iPwhudEpT7Zs
	nHE3dz6trq+F2NPS9X1L773zPWS1ok7NL/Ed8wtlUM6uTzkdEIrcLHY6QjsRESMVHzFc
	xl16ddMl8GqiA/ID3T1ByWA0Gc4YopJsXGW00QNP/vKsmljbzt1Ot+sPMkeaXoPFc7tT
	xKuA==
X-Gm-Message-State: APjAAAVqNVPW/qXN/N2QnJSSFp6DNoOJ4PoD7KNFM8AHtOCkcnUQ8Zn5
	ScAx5SoxU2DwHrtwI2aGuP3mw4Xh
X-Google-Smtp-Source: APXvYqyS6unH65KKk+aXDRJpXcDmxcKyZ42MhGuWklfVcCL3dNHKcs2CtVO0mxXkHhgOaMbLaJ2KzQ==
X-Received: by 2002:a7b:cbc9:: with SMTP id n9mr41133274wmi.89.1578412021122; 
	Tue, 07 Jan 2020 07:47:01 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id x17sm229104wrt.74.2020.01.07.07.47.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Jan 2020 07:47:00 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jan 2020 15:46:59 +0000
Message-Id: <20200107154659.34711-2-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200107154659.34711-1-git@andred.net>
References: <20200107154659.34711-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] onigurama: enable ptest
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jan 2020 15:47:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: André Draszik <git@andred.net>
---
 ...rial-tests-automake-option-for-ptest.patch | 36 ++++++++++++++
 meta-oe/recipes-support/onig/onig/run-ptest   | 48 +++++++++++++++++++
 meta-oe/recipes-support/onig/onig_6.9.4.bb    | 12 ++++-
 3 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/onig/onig/0001-build-enable-serial-tests-automake-option-for-ptest.patch
 create mode 100755 meta-oe/recipes-support/onig/onig/run-ptest

diff --git a/meta-oe/recipes-support/onig/onig/0001-build-enable-serial-tests-automake-option-for-ptest.patch b/meta-oe/recipes-support/onig/onig/0001-build-enable-serial-tests-automake-option-for-ptest.patch
new file mode 100644
index 000000000..587e5ac1b
--- /dev/null
+++ b/meta-oe/recipes-support/onig/onig/0001-build-enable-serial-tests-automake-option-for-ptest.patch
@@ -0,0 +1,36 @@
+From 8bf8189ec4a0d7ee569f66feb0e590e9602c31b6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
+Date: Mon, 6 Jan 2020 15:10:30 +0000
+Subject: [PATCH] build: enable serial-tests automake option (for ptest)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+For ptest, we need to be able to compile the tests without
+running them.
+
+Enabling the serial-tests automake option will add
+buildtest-TESTS and runtest-TESTS makefile targets, the
+former being what we want.
+
+Signed-off-by: André Draszik <git@andred.net>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index ac51e85..48e63ce 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,7 +3,7 @@ AC_INIT(onig, 6.9.4)
+ 
+ AC_CONFIG_MACRO_DIR([m4])
+ 
+-AM_INIT_AUTOMAKE([-Wno-portability])
++AM_INIT_AUTOMAKE([-Wno-portability serial-tests])
+ AC_CONFIG_HEADERS([src/config.h])
+ 
+ 
+-- 
+2.23.0.rc1
+
diff --git a/meta-oe/recipes-support/onig/onig/run-ptest b/meta-oe/recipes-support/onig/onig/run-ptest
new file mode 100755
index 000000000..ffc855d61
--- /dev/null
+++ b/meta-oe/recipes-support/onig/onig/run-ptest
@@ -0,0 +1,48 @@
+#!/bin/sh -eu
+
+my_cleanup() {
+    [ -n "${workdir:-}" ] && rm -rf "${workdir}"
+}
+
+trap "my_cleanup" EXIT
+for sig in INT TERM ; do
+    # We want sig to expand right here and now, as it's
+    # a loop variable, not when signalled. For $$ it
+    # doesn't matter.
+    # shellcheck disable=SC2064
+    trap "my_cleanup ; trap - EXIT ; trap - ${sig} ; kill -s ${sig} $$" ${sig}
+done
+
+workdir=$(mktemp -d -t onig.ptest.XXXXXX)
+status="${workdir}/failed"
+touch "${status}"
+
+#find test/.libs -perm -111 -type f -exec sh -c '
+find tests/ -perm -111 -type f -exec sh -c '
+    workdir="${1}"
+    status="${2}"
+    t="${3}"
+    t_log="${workdir}/$(basename ${t}).log"
+
+    res=0
+    ./${t} > "${t_log}" 2>&1 \
+        || res=$?
+    if [ $res -eq 0 ] ; then
+        echo "PASS: ${t}"
+    else
+        echo "FAIL: ${t}"
+        echo "$(basename ${t}): ${t_log}" >> "${status}"
+    fi
+    ' _ "${workdir}" "${status}" {} \;
+
+if [ $(stat -c '%s' "${status}") -ne 0 ] ; then
+    exec >&2
+    while IFS=': ' read -r t t_log ; do
+        printf "\n=========================\n"
+        printf "ERROR: %s:\n" "${t}"
+        printf --  "-------------------------\n"
+        cat "${t_log}"
+    done < "${status}"
+fi
+
+[ $(stat -c '%s' "${status}") -eq 0 ]
diff --git a/meta-oe/recipes-support/onig/onig_6.9.4.bb b/meta-oe/recipes-support/onig/onig_6.9.4.bb
index ce9eab9e8..16a8be5a2 100644
--- a/meta-oe/recipes-support/onig/onig_6.9.4.bb
+++ b/meta-oe/recipes-support/onig/onig_6.9.4.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ee043784bdce7503e619b2d1a85798b"
 SRC_URI = "\
     https://github.com/kkos/oniguruma/releases/download/v${PV}/${BP}.tar.gz \
     file://0001-build-don-t-link-against-host-system-libraries.patch \
+    file://0001-build-enable-serial-tests-automake-option-for-ptest.patch \
+    file://run-ptest \
 "
 
 SRC_URI[md5sum] = "a12d2fe997b789bd87cf63799c091879"
@@ -17,6 +19,14 @@ SRC_URI[sha256sum] = "4669d22ff7e0992a7e93e116161cac9c0949cd8960d1c562982026726f
 
 BINCONFIG = "${bindir}/onig-config"
 
-inherit autotools binconfig-disabled
+inherit autotools binconfig-disabled ptest
 
 BBCLASSEXTEND = "native"
+
+do_compile_ptest() {
+    oe_runmake -C test buildtest-TESTS
+}
+
+do_install_ptest() {
+    install -Dm0755 -t ${D}${PTEST_PATH}/tests/ ${B}/test/.libs/*
+}
-- 
2.23.0.rc1


