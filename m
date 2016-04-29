Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7C3ED6FF9D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 19:49:20 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id f74so47195649qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 12:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HhLuAlUTG3rm1+y12qShuLsgnfgQDdEOdkkbVw5YC/k=;
	b=lB0fFfLo25GdijU6ds7Zt/n+btJLo2Cm5bvPJj8VSdre4toNkfXhHZ7OBBRuokTKsR
	axWVtZZGwog0hOnBoortTLwiHvAhpgBMmf+dEfbajeklgPlmH0I3riXhIK3Q/RB6Th9s
	g9YRng8lfX5onnocNjeF4yldCxsWz0FcFFBR5TET0QV/BZ7YBpV+KH/3/cDtMJXrr2pG
	BM68gOKEzv2zTINyesZPNzHoZ2BvMO9YvyukdvzE6lxEuytuVHjhF2S9oCru5P3OsKcx
	fnftwnhK94rGziL1/7iQMlAo2Ix7Tr6lCrK9PDkkiHokud9egNfVjV+DyJmcS/FockJH
	uEDw==
X-Gm-Message-State: AOPr4FVtjTPGfG28eBfEwKteRNv9DXJhAQxWkRwv2NeNumsAFsiHN0lic6+oDX0pZ/FpAw==
X-Received: by 10.140.229.69 with SMTP id z66mr21461600qhb.48.1461959361239;
	Fri, 29 Apr 2016 12:49:21 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	v30sm4904109qge.41.2016.04.29.12.49.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Apr 2016 12:49:20 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Apr 2016 15:49:13 -0400
Message-Id: <1461959353-32423-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] tinymembench: update to version 0.4.0 plus bux fixes
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
X-List-Received-Date: Fri, 29 Apr 2016 19:49:22 -0000

Removed ARM_INSTRUCTION_SET since it builds on qemuarm and qemuarm64 without issues
Also tested the build on qemuppc and qemux86-64

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
index 9898a70..a675bda 100644
--- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
+++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
@@ -6,9 +6,9 @@ HOMEPAGE = "https://github.com/ssvb/tinymembench/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://main.c;endline=22;md5=879b9bbb60851454885b5fa47eb6b345"
 
-PV = "0.3.9+git${SRCPV}"
+PV = "0.4.0+git${SRCPV}"
 
-SRCREV = "95e68477588d41187b2d2e52ecf6be0e7eb06b8d"
+SRCREV = "2c789849709d837b4bd114c11ed2d9bdc65afbc6"
 SRC_URI = "git://github.com/ssvb/tinymembench.git"
 
 S = "${WORKDIR}/git"
@@ -17,11 +17,3 @@ do_install() {
     install -d ${D}${bindir}
     install -m755 tinymembench ${D}${bindir}/
 }
-
-# Fails to build with thumb-1 (qemuarm)
-#| {standard input}: Assembler messages:
-#| {standard input}:66: Error: instruction not supported in Thumb16 mode -- `subs r1,r1,#16'
-#| {standard input}:69: Error: instruction not supported in Thumb16 mode -- `subs r1,r1,#16'
-#| {standard input}:82: Error: selected processor does not support Thumb mode `mla r3,r4,r3,r5'
-#| {standard input}:82: Error: unshifted register required -- `and r8,r7,r3,lsr#16'
-ARM_INSTRUCTION_SET = "arm"
-- 
1.9.1


