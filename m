Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 998A47404E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 15:46:26 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so245930015wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 08:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XFn+8YUPXetn/WBiQye0K+QiHi99vnp6A9EJ7+rRXAA=;
	b=DQql+NlitqWn05nxNkY/W1AS8yBGPHjPsuzplhR0Y9v7N7+7M1epF9wota26FYpA6F
	UZ5L6/iWWlKT36Hz/+k2CaIxNeHiJ94WW37QPHooSKhtVm78Q/zUDgElLtqHRAu9p710
	jsfFFSaRUEFFi8nDS5PcjLOdten4/mlTRtNpBTIACLMF9AKuIk4hSbhohhmk902eB6IB
	2EUosb5YiqYlCfv2kzKVrU+D3ZMklTQQg+YABAJNSSqR/AsM+euBCBjpf6/PvZ3Vq6Ue
	/9RDh1qAz1ijb2YDMe7wmkh0sL2x3YZT9M1Jj2QJWgdBDz83FiE3PVFH1R4J3e1qn9wl
	lYCA==
X-Received: by 10.180.88.198 with SMTP id bi6mr5005589wib.75.1443023186186;
	Wed, 23 Sep 2015 08:46:26 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id l1sm7886878wjx.13.2015.09.23.08.46.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Sep 2015 08:46:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Sep 2015 17:46:34 +0200
Message-Id: <1443023194-22810-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.3
In-Reply-To: <20150901190134.GC2458@jama>
References: <20150901190134.GC2458@jama>
Subject: [PATCH][meta-oe] sblim-sfcCommon: rename to sblim-sfc-common
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
X-List-Received-Date: Wed, 23 Sep 2015 15:46:28 -0000

* to resolve QA warnings:
  sblim-sfcCommon-1.0.1: sblim-sfcCommon-dev doesn't match the [a-z0-9.+-]+ regex [pkgname]
  sblim-sfcCommon-1.0.1: sblim-sfcCommon-staticdev doesn't match the [a-z0-9.+-]+ regex [pkgname]
  sblim-sfcCommon-1.0.1: sblim-sfcCommon doesn't match the [a-z0-9.+-]+ regex [pkgname]
  sblim-sfcCommon-1.0.1: sblim-sfcCommon-doc doesn't match the [a-z0-9.+-]+ regex [pkgname]
  sblim-sfcCommon-1.0.1: sblim-sfcCommon-dbg doesn't match the [a-z0-9.+-]+ regex [pkgname]
  sblim-sfcCommon-1.0.1: sblim-sfcCommon-locale doesn't match the [a-z0-9.+-]+ regex [pkgname]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../sblim-sfc-common_1.0.1.bb}                                         | 3 +--
 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.8.bb                | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/{sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb => sblim-sfc-common/sblim-sfc-common_1.0.1.bb} (90%)

diff --git a/meta-oe/recipes-extended/sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb b/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
similarity index 90%
rename from meta-oe/recipes-extended/sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb
rename to meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
index ebd2199..37694a8 100644
--- a/meta-oe/recipes-extended/sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb
+++ b/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
@@ -9,8 +9,7 @@ SECTION = "Development/Libraries"
 
 DEPENDS = "cmpi-bindings"
 
-SRC_URI = "http://downloads.sourceforge.net/sblim/${BP}.tar.bz2 \
-          "
+SRC_URI = "http://downloads.sourceforge.net/sblim/sblim-sfcCommon-${PV}.tar.bz2"
 SRC_URI[md5sum] = "8aa2655d97bdea54c4750f220b40990c"
 SRC_URI[sha256sum] = "b9b1037173d6ae0181c3bd5a316ddab5afd6a342ad0dbdc18e940fc0ad2c3297"
 
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.8.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.8.bb
index dc5e4d0..81f47ba 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.8.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.8.bb
@@ -9,7 +9,7 @@ HOMEPAGE = "http://www.sblim.org"
 SECTION = "Applications/System"
 LICENSE = "EPL-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f300afd598546add034364cd0a533261"
-DEPENDS = "curl libpam openssl sblim-sfcCommon"
+DEPENDS = "curl libpam openssl sblim-sfc-common"
 
 SRC_URI = "http://downloads.sourceforge.net/sblim/${BP}.tar.bz2 \
            file://sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch \
-- 
2.5.3


