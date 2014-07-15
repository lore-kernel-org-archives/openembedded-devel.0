Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 68DC87025F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 05:26:11 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so2942345wgh.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 22:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uEahGQPzUVNBmdpZlAlquxDGnromqtNJ5/NJJqmWYyc=;
	b=HbxIfD/Hw3/ZQcvQ22ikUtvkrb1zDLlg5oxcV2utIEio82P7jP68GOMW00ISP4IWf9
	1vxjy8tLKJwSZt29qsZYA0Le3Z7lZ7XcJyVxVHmqwLTLPZZQP3DGBEKKSpShbAUXIiwO
	n/qZcRwO64cQ+fbqL/GPZ9jhpTWWFsGBUDTN8OEBT8qyP8UG06ctLljc98gBP9yfGDIK
	alcj8VjT0gc6cP9sxrJvvWMo87R9nvwd26ron8CxX+7tkMILaQqCncWDGEu+yXZtiZeT
	AzrojqugFIR0UOIRVad/m0opGCxXQGQu9maG4U7uJcJVKcWbyPAWFyGgny3oADsaP2ln
	I/Gg==
X-Gm-Message-State: ALoCoQkmVJ1B4uz0krTGpsgH4YOn3bIsnlFLTOf4G1MZU7q863HfgsYSLJb3iw/165PIZZnASG20
X-Received: by 10.180.76.68 with SMTP id i4mr2571890wiw.83.1405401972145;
	Mon, 14 Jul 2014 22:26:12 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id 20sm30085044wjt.42.2014.07.14.22.26.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jul 2014 22:26:11 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jul 2014 07:26:07 +0200
Message-Id: <1405401967-9454-2-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1405401967-9454-1-git-send-email-koen.kooi@linaro.org>
References: <1405401967-9454-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCHv2 2/2] libhugetlbfs: fix packaging
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
X-List-Received-Date: Tue, 15 Jul 2014 05:26:18 -0000

Libhugetlbs doesn't generate proper .so.X libs, only two .so files. Package those in ${PN} and silence the resulting QA warning. This fixes:

 ERROR: QA Issue: libhugetlbfs-tests rdepends on libhugetlbfs-dev

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index af7ed3e..f2da16a 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -25,6 +25,7 @@ COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64).*-linux*"
 
 LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
 EXTRA_OEMAKE = "'ARCH=${TARGET_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' ${LIBARGS} V=1"
+PARALLEL_MAKE = ""
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


