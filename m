Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1B0B86BCD7
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Jan 2014 11:14:15 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so7104962ead.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Jan 2014 03:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=y6YxShLpA2Vl9E5/ak+1dGjQVAcOQF4wCPyLn4H2fXQ=;
	b=HEG/cHg7U64KOIBvTiwVDrTFZO31fjXuDErMHY7nwrpFrqZKlkLiI4BDVMYy6Lhkgm
	Ja2QunJ/Sk3mWMIbTu5qZ5ko6gCxUo1ib6ltfAC6gXIwQ+0973BUu0SI3jdHfJTZ6Y5e
	oJ+J/wIpKwkI9rtUOBMDbrrDUBh8at55Y84RqIbpyuSx95sQ5LfjQ9uP9aegASfWw+ua
	xsH+CBYF6xNBurecw27ELB9YYyD3n5ZyHPkH9ED8uFfPT7Vzm5m2mE46SBuHkErptqqa
	oeOiIg/RyRVlG2BFa6CYgUYQCtA4FWzvRlz2LBpn0hZhUUHlpKEx4O7TE9G3y5aDy4BW
	yItg==
X-Received: by 10.14.179.73 with SMTP id g49mr6154164eem.90.1388834056790;
	Sat, 04 Jan 2014 03:14:16 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	j46sm152643244eew.18.2014.01.04.03.14.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Jan 2014 03:14:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Jan 2014 12:14:04 +0100
Message-Id: <b08b6d79ae52ae169f08c6d8af155bbb1bb21d83.1388833883.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][for-dylan][PATCH 8/9] fbset-modes: Explicitly set MACHINE_ARCH
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
X-List-Received-Date: Sat, 04 Jan 2014 11:14:16 -0000

* bitbake-diffsigs output:
  basehash changed from 2f6aa4302713441e9c3c7207c4edea33 to 3486f2b65998ee4ec5bd5fbbe02cadb0
  List of dependencies for variable TARGET_LD_ARCH changed from 'set([])' to 'set(['TUNE_LDARGS'])'
  List of dependencies for variable TARGET_AS_ARCH changed from 'set([])' to 'set(['TUNE_ASARGS'])'
  List of dependencies for variable TARGET_OS changed from 'set([])' to 'set(['ABIEXTENSION', 'LIBCEXTENSION'])'
  List of dependencies for variable TARGET_CC_ARCH changed from 'set([])' to 'set(['TUNE_CCARGS'])'
  List of dependencies for variable TARGET_ARCH changed from 'set([])' to 'set(['TUNE_ARCH'])'
  Dependency on Variable ABIEXTENSION was removed
  Dependency on Variable TUNE_CCARGS was removed
  Dependency on Variable TUNE_FEATURES_tune-armv5t was removed
  Dependency on Variable TUNE_FEATURES_tune-armv5te was removed
  Dependency on Variable TUNE_ARCH was removed
  Dependency on Variable LIBCEXTENSION was removed
  Dependency on Variable TUNE_FEATURES_tune-armv5 was removed
  Dependency on Variable TUNE_LDARGS was removed
  Dependency on Variable DEFAULTTUNE was removed
  Dependency on Variable TUNE_ASARGS was removed
  Dependency on Variable TUNE_FEATURES was removed
  Variable TARGET_LD_ARCH value changed from 'none' to '${TUNE_LDARGS}'
  Variable TARGET_AS_ARCH value changed from 'none' to '${TUNE_ASARGS}'
  Variable TARGET_OS value changed from 'linux' to 'linux${LIBCEXTENSION}${ABIEXTENSION}'
  Variable TARGET_CC_ARCH value changed from 'none' to '${TUNE_CCARGS}'
  Variable TARGET_ARCH value changed from 'allarch' to '${TUNE_ARCH}'
  Hash for dependent task fbset-modes.bb.do_patch changed from eb8e475b55d64d5c9f6427a90e080ba6 to ee7e89fdd852378ee18ac23cdd92f3d3
---
 meta-oe/recipes-support/fbset/fbset-modes.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fbset/fbset-modes.bb b/meta-oe/recipes-support/fbset/fbset-modes.bb
index 03d4039..e3b26ec 100644
--- a/meta-oe/recipes-support/fbset/fbset-modes.bb
+++ b/meta-oe/recipes-support/fbset/fbset-modes.bb
@@ -13,5 +13,9 @@ do_install() {
 }
 
 inherit allarch
-CONFFILES_${PN} = "${sysconfdir}/fb.modes"
 
+# fb.modes file is MACHINE_ARCH, base.bbclass correctly changes it to MACHINE_ARCH, but too late for allarch.bbclass
+# to disable "all" behavior (found when comparing qemuarm and qemux86 signatures)
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+CONFFILES_${PN} = "${sysconfdir}/fb.modes"
-- 
1.8.4.3


