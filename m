Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id AC1D160438
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 18:23:28 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id f8so1563993wiw.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 11:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j1pjR8vJuZAS3mK9s2xxqhUla8HAGdG+p9v5PgCiJP4=;
	b=uIInRezdd09HaOfehMfg55mpp9NoqaSxXeZgbpl7mcOzwSu4fagZLJ/N4VELjmSL79
	CXVOt0TafsNcIENFL6LzeEG5s91x0wDXiCDKqxBHfzyQe3bANAlYY+qJhisCfR/sLDxZ
	Z9sdbDfW8cn/XyKKP82gFdyX+vAT7o2VeQpcyKeUP5BxTXwlEEAuKN7nEtZpg5eNdLUq
	Uc8Glwi1FFm6sKdoOaAUyxBPWVeykSTdYaAfCNwJoCCGx409M9ZHLWluwpubjuTL9Zrd
	RHZiBpkNk6+61tKMu0hByG9GW6ADYHzkZLbDlDzUFuqmzQsT/ErtxGHLUqK/dgafaWvR
	oYUg==
X-Received: by 10.194.157.195 with SMTP id wo3mr9616764wjb.130.1405707809406; 
	Fri, 18 Jul 2014 11:23:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lk7sm15984230wjb.24.2014.07.18.11.23.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jul 2014 11:23:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 20:23:36 +0200
Message-Id: <1405707818-12348-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1405707818-12348-1-git-send-email-Martin.Jansa@gmail.com>
References: <1405707818-12348-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 2/4] llvm.inc: Merge all llvm*-dbg and llvm*-staticdev to just one PN-dbg and one PN-staticdev
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
X-List-Received-Date: Fri, 18 Jul 2014 18:23:30 -0000

* if you need debug or staticdev on device then you can probably live
  with other libs as well.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
index f590a7f..4ec1b6d 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -33,9 +33,7 @@ LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
 ALLOW_EMPTY_${PN} = "1"
-ALLOW_EMPTY_${PN}-staticdev = "1"
 FILES_${PN} = ""
-FILES_${PN}-staticdev = ""
 DOTDEBUG-dbg = " ${bindir}/${LLVM_DIR}/.debug \
                  ${libdir}/${LLVM_DIR}/.debug/BugpointPasses.so \
                  ${libdir}/${LLVM_DIR}/.debug/LLVMHello.so \
@@ -55,14 +53,10 @@ INSANE_SKIP_libllvm${LLVM_RELEASE}-llvm${LLVM_RELEASE} += "dev-so"
 python llvm_populate_packages() {
     libdir = bb.data.expand('${libdir}', d)
     libllvm_libdir = bb.data.expand('${libdir}/${LLVM_DIR}', d)
-    split_dbg_packages = do_split_packages(d, libllvm_libdir+'/.debug', '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s-dbg', 'Split debug package for %s', allow_dirs=True)
     split_packages = do_split_packages(d, libdir, '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s', 'Split package for %s', allow_dirs=True, allow_links=True, recursive=True)
-    split_staticdev_packages = do_split_packages(d, libllvm_libdir, '^lib(.*)\.a$', 'libllvm${LLVM_RELEASE}-%s-staticdev', 'Split staticdev package for %s', allow_dirs=True)
     if split_packages:
         pn = d.getVar('PN', True)
         d.appendVar('RDEPENDS_' + pn, ' '+' '.join(split_packages))
-        d.appendVar('RDEPENDS_' + pn + '-dbg', ' '+' '.join(split_dbg_packages))
-        d.appendVar('RDEPENDS_' + pn + '-staticdev', ' '+' '.join(split_staticdev_packages))
 }
 
 PACKAGESPLITFUNCS_prepend = "llvm_populate_packages "
-- 
2.0.0


