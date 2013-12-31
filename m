Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6450B6B719
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 09:49:37 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so5435787eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 01:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=y6YxShLpA2Vl9E5/ak+1dGjQVAcOQF4wCPyLn4H2fXQ=;
	b=rkIJWjK4eqSY31WTeN+6Yyxy67EDqeS13qMHi59W50ZQOYGNl0anU2acFeGt8mOOFU
	cdWjrfgmQ5idB6NYkoZMqQNn8Wz/hyNhrKuG3rrbco6visV+nJuvGZ4sMhcqWED6clcw
	nhvdHe6Rqy5086SCFgQvrI5i07/a2HCmB2OfxEp68bs1A7WuHfyOMRBkyEkOt3zOlMET
	dp9qXXUBGe5DIh+VYRPSTc1EE3+q8/+eFbKyk2xv9JZJgZiReGTGLPg3qruv8PJ78lUC
	5aXOd1EqHDlUWpWUxZr2dQpcdyD3ynhTivXogBww9QI5BkQJ49Hs5qugKnTdCAi7GRaT
	ImVQ==
X-Received: by 10.14.220.136 with SMTP id o8mr5803625eep.97.1388483378215;
	Tue, 31 Dec 2013 01:49:38 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	b41sm116594254eef.16.2013.12.31.01.49.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Dec 2013 01:49:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Dec 2013 10:49:22 +0100
Message-Id: <1388483363-28575-10-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][for-dora][PATCH 10/11] fbset-modes: Explicitly set MACHINE_ARCH
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
X-List-Received-Date: Tue, 31 Dec 2013 09:49:38 -0000

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


