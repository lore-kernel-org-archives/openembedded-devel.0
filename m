Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 34D76703CF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 08:41:40 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id f8so1182622wiw.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 01:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ue0SC1SU7H4MeHkET7u1mH76+uCJh8ODO1iIwSpTDsw=;
	b=QneP1rO3y74xVGlhp9f0HB4Ntod/Z/TWsTOBAG54etXt4J4AhlxmEFGKlO+CpTizPR
	D/c4JmKzTCz4KVxnC14SM2HlA3kEHDEDUzbZqsNHETIDdnQ8LBpz2vmHrUTSsgnTJhmB
	Efor5HLw/ogk2FjsFmEeHVLuLKBU6ndufsffIGKCJ8zxMGupKDW5xPtUdtO9uoH0peqN
	5CP53yrvkXQd07Jq2b1UwNULGZOCGeweQY3GERfSw1pOCsMQyjIgP74TSIB7SQNliJBr
	Ie/2WBqYp3AixiqY2iRrBUu+avECv8r96Dnjc0Ktz9venBwITSCiLDBLiDi7AZOUoBbK
	6uzw==
X-Gm-Message-State: ALoCoQn9zoMsZyIwFdcFxWjF4JJmd1+3TclqwdHpd9w2QYMYE3iX+cvPrpeVQoZwzw//7FXzXyKg
X-Received: by 10.194.11.74 with SMTP id o10mr17676956wjb.82.1405327301230;
	Mon, 14 Jul 2014 01:41:41 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id l2sm24012479wjw.31.2014.07.14.01.41.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jul 2014 01:41:40 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Jul 2014 10:41:34 +0200
Message-Id: <1405327294-4030-2-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1405327294-4030-1-git-send-email-koen.kooi@linaro.org>
References: <1405327294-4030-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH 2/2] libhugetlbfs: fix packaging
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jul 2014 08:41:48 -0000

Libhugetlbs doesn't generate proper .so.X libs, only two .so files. Package those in ${PN} and silence the resulting QA warning. This fixes:

 ERROR: QA Issue: libhugetlbfs-tests rdepends on libhugetlbfs-dev

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index af7ed3e..d3b64bf 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -25,6 +25,7 @@ COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64).*-linux*"
 
 LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
 EXTRA_OEMAKE = "'ARCH=${TARGET_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' ${LIBARGS} V=1"
+PARALLEL_MAKE_pn-${PN} = ""
 CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
@@ -46,12 +47,15 @@ do_install() {
           install-tests
 }
 
-PARALLEL_MAKE_pn-${PN} = ""
 
 PACKAGES =+ "${PN}-perl ${PN}-tests "
+FILES_${PN} += "${libdir}/*.so"
+FILES_${PN}-dev = "${includedir}"
 FILES_${PN}-dbg += "${libdir}/libhugetlbfs/tests/obj32/.debug ${libdir}/libhugetlbfs/tests/obj64/.debug"
 FILES_${PN}-perl = "${libdir}/perl"
 FILES_${PN}-tests += "${libdir}/libhugetlbfs/tests"
 
+INSANE_SKIP_${PN} = "dev-so"
+
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
1.9.3


