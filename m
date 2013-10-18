Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5B04F6C76F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 08:48:16 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id x55so3292209wes.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 01:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LGyyk4XrZ1qYXaNDBZQprkiSxpTDlqi7VUprUG4rso8=;
	b=CIrYhu8Oat6j2k+xGd77e87RVOm8RaTokp/4HrZmmc+FyJEXEllPup8UKhori5+QgZ
	Oom5kqcC3i/brduQVCZaFCWzdAxFJG4IlZWAq0Jhd8AbpKjYep3fkN/n5qY2JLh5JA+v
	mA35b42tBheXdxAfT4UA7jj1Rq6QpDPXg/1UyjrDDrOUZjv1o0Gyxi4KHiq5OoDDLCGX
	dTNPBmHUeqlJvnldXizullKCobGxSiGR4k0Nvme9eeJgD/zWTio2CsG5w+w6DuO7y+sn
	K3yvMROYQWRrkm0Ce8tpeNqInpifSdDzb1OPSoPs6IM9m0bzT+pXn6hwRenHMu48NLKb
	Lntw==
X-Gm-Message-State: ALoCoQlRoNt/nygndtaZzi7gVenSoPjwhJaH4gfJvIyCoXWQCacglO39Hhw04uXAlUPJwfA22q78
X-Received: by 10.194.175.133 with SMTP id ca5mr1498837wjc.19.1382086097738;
	Fri, 18 Oct 2013 01:48:17 -0700 (PDT)
Received: from localhost ([2001:610:612:0:21f:c6ff:feaa:c5fb])
	by mx.google.com with ESMTPSA id ey4sm1206965wic.11.2013.10.18.01.48.16
	for <multiple recipients>
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Fri, 18 Oct 2013 01:48:16 -0700 (PDT)
From: koen@dominion.thruhere.net
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Oct 2013 10:48:06 +0200
Message-Id: <1382086086-4070-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.7.10
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] libhugetlbfs: kill /opt usage
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
X-List-Received-Date: Fri, 18 Oct 2013 08:48:16 -0000

From: Koen Kooi <koen.kooi@linaro.org>

/opt should never be used for packages built by OE, so install the tests in a more standard location.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 24480c3..d29dee1 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -37,8 +37,8 @@ do_configure() {
 
 do_install() {
         oe_runmake PREFIX=${prefix} DESTDIR=${D}  \
-          INST_TESTSDIR32=/opt/libhugetlbfs/tests \
-          INST_TESTSDIR64=/opt/libhugetlbfs/tests \
+          INST_TESTSDIR32=${libdir}/libhugetlbfs/tests \
+          INST_TESTSDIR64=${libdir}/libhugetlbfs/tests \
           install-tests
 }
 
@@ -47,6 +47,6 @@ PARALLEL_MAKE_pn-${PN} = ""
 PACKAGES =+ "${PN}-perl ${PN}-tests "
 FILES_${PN}-dbg += "${libdir}/libhugetlbfs/tests/obj32/.debug ${libdir}/libhugetlbfs/tests/obj64/.debug"
 FILES_${PN}-perl = "${libdir}/perl"
-FILES_${PN}-tests += "/opt/libhugetlbfs/tests"
+FILES_${PN}-tests += "${libdir}/libhugetlbfs/tests"
 
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
1.7.10


