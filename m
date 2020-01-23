Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2D3BD7FD7D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 16:44:10 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so3838532wrn.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 08:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vr9n/FEurqAMIB1tVoghcA5RkODIrHW75vfMLHKLT0A=;
	b=uohlh3UJf08bKFQKB1DA2LRp6aAuBfqhZq5SkZmqz7SjBmgp4RxTsHzt4+XJGcS2Tf
	osCmO5UhQNISZXuMEL2Zyzr77NNGmFGeecJYC8+Z8wjPcVmrbDRH341+JWtTMhMB9XKj
	zaycZF/DYnPdc4BkNm6/4rVwRgkTmBIStrw4VtdJ2XufRGy7MoREXRe9x+X7nJ8sWjn2
	l4GusTHMJJKLwZVzby9R+DvqHouwEMyhm0v7sfkWrBZUz5AT19wvzem2dazBeOhZZeRI
	SNgNyBih93M4CnywynMD+DwMPQWycOyeXzvBqf+UFuZlTZMyLd03aNi9yCFg6aofa9tK
	aggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vr9n/FEurqAMIB1tVoghcA5RkODIrHW75vfMLHKLT0A=;
	b=soT8+u1nt8FLlSlvlMxc3qbDGd3jpJA1PW+B3QTl18uGGsrbg6L1TopEzmwXMpmulY
	4ndc1Z3NikYPVVhDgREnCJ5kcwXEDa5ZKHQo8ZziE1biVl/lglXDKKqG0MZVwx+Cc6dm
	2ckzyGdDHBXhtHlA2c4Y4Mwedus5/jcsb3TUvW2exIEb1eI6Nd2LSeyYt/F9/visrvSg
	q9ZIrZ7kZXUIno16nBRF71++8HrbXp4BGJVHf6K7tVfMCjxIVeuTpujokaKMY8OD8Ox1
	jYnJfNSQgs2Jha6HnV1LNlft7lqMomBWPjY0RCNME74jEMal1dE9tIWrX+KayW2LuR5p
	q7Ag==
X-Gm-Message-State: APjAAAXT6bZIzl2swwFCW6d4OkUqnScjU6O3LW6vf3ZjpaK9lwXvWEyA
	rhMa0CwYroF1XRZgoVoCos/ALuYt
X-Google-Smtp-Source: APXvYqzjD8+7P0KbPogYimfGBkSGhMR7gvF2aO4qedshAP7k6SruyaxHI9SxiYVuK1lSV0JtqUxdsw==
X-Received: by 2002:adf:e2cf:: with SMTP id d15mr18698324wrj.225.1579797851320;
	Thu, 23 Jan 2020 08:44:11 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	e18sm3543696wrw.70.2020.01.23.08.44.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 08:44:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jan 2020 17:44:06 +0100
Message-Id: <20200123164407.5600-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] nodejs: use python3native
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
X-List-Received-Date: Thu, 23 Jan 2020 16:44:11 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/nodejs/nodejs_12.14.0.bb  | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
index 35abb8f1f0..e4a2aa18c4 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=be4d5107c64dc3d7c57e3797e1a0674b"
 DEPENDS = "openssl"
 DEPENDS_append_class-target = " nodejs-native"
 
-inherit pkgconfig ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "pythonnative", "", d)}
+inherit pkgconfig python3native
 
 COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
@@ -96,7 +96,7 @@ do_configure () {
     export LD="${CXX}"
     GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
     # $TARGET_ARCH settings don't match --dest-cpu settings
-   ./configure --prefix=${prefix} --without-snapshot --shared-openssl \
+    python3 configure.py --prefix=${prefix} --without-snapshot --shared-openssl \
                --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
                --dest-os=linux \
                --libdir=${D}${libdir} \
@@ -111,6 +111,10 @@ do_compile () {
 
 do_install () {
     oe_runmake install DESTDIR=${D}
+
+    # wasn't updated since 2009 and is the only thing requiring python2 in runtime
+    # ERROR: nodejs-12.14.1-r0 do_package_qa: QA Issue: /usr/lib/node_modules/npm/node_modules/node-gyp/gyp/samples/samples contained in package nodejs-npm requires /usr/bin/python, but no providers found in RDEPENDS_nodejs-npm? [file-rdeps]
+    rm -f ${D}${exec_prefix}/lib/node_modules/npm/node_modules/node-gyp/gyp/samples/samples
 }
 
 do_install_append_class-native() {
@@ -142,16 +146,10 @@ do_install_append_class-target() {
 
 PACKAGES =+ "${PN}-npm"
 FILES_${PN}-npm = "${exec_prefix}/lib/node_modules ${bindir}/npm ${bindir}/npx"
-RDEPENDS_${PN}-npm = "bash python-core python-shell python-datetime python-subprocess python-textutils \
-    python-compiler python-misc python-multiprocessing"
+RDEPENDS_${PN}-npm = "bash python3-core python3-shell python3-datetime \
+    python3-misc python3-multiprocessing"
 
 PACKAGES =+ "${PN}-systemtap"
 FILES_${PN}-systemtap = "${datadir}/systemtap"
 
-
 BBCLASSEXTEND = "native"
-
-python() {
-    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
-        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
-}
-- 
2.20.1


