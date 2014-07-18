Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 79E436028A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 18:23:27 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ho1so1320389wib.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 11:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JfOFoHxWnNBM6AFh/6oFsgsmrExkK8Jsk+nCxIW8wVQ=;
	b=ki4oc6Xr/lOrpOQqwuZ1UxQpjdxBKnp6YS9c+6x+rWX8fFSqRYpVJXNmo4r3DcOV8y
	ClkOOakYbk42Qs4UtR1m/XdXK59h/8auSU+7J3q4/n5O/xZ9eZFUdONl2fqGA8kGsN4M
	9D5TuYne84G+lNvh/KzpKrox3WBrl8xy0d9o87kHX5zRfWoybRMdLlSv8hh6gqUpXZx4
	wXyDtcilJTBf9HdAtovDYxx0jGUD09BCzFuoWj0a/RjwQ8GBroYqLBhAw8bCA7dGmi6+
	w4TdCFRmGL1XE/3FjfPw5tR9AW8qsMafDaD+tJnQ/Hm30cvfVAl8Rtf4QdNg/SgXdznO
	n/GA==
X-Received: by 10.180.102.98 with SMTP id fn2mr35132521wib.39.1405707808217;
	Fri, 18 Jul 2014 11:23:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	d12sm16009230wjx.0.2014.07.18.11.23.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jul 2014 11:23:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 20:23:35 +0200
Message-Id: <1405707818-12348-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][WIP][PATCH 1/4] llvm: set INSANE_SKIP only for one explicit package
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

* now when insane_qa is moved to separate task, we cannot set INSANE_SKIP in do_package task

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
index 525dd3c..f590a7f 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -50,6 +50,8 @@ FILES_${PN}-dev = "${bindir}/${LLVM_DIR} \
 
 PACKAGES_DYNAMIC = "^libllvm-.*$"
 
+INSANE_SKIP_libllvm${LLVM_RELEASE}-llvm${LLVM_RELEASE} += "dev-so"
+
 python llvm_populate_packages() {
     libdir = bb.data.expand('${libdir}', d)
     libllvm_libdir = bb.data.expand('${libdir}/${LLVM_DIR}', d)
@@ -58,8 +60,6 @@ python llvm_populate_packages() {
     split_staticdev_packages = do_split_packages(d, libllvm_libdir, '^lib(.*)\.a$', 'libllvm${LLVM_RELEASE}-%s-staticdev', 'Split staticdev package for %s', allow_dirs=True)
     if split_packages:
         pn = d.getVar('PN', True)
-        for package in split_packages:
-            d.appendVar('INSANE_SKIP_' + package, ' dev-so')
         d.appendVar('RDEPENDS_' + pn, ' '+' '.join(split_packages))
         d.appendVar('RDEPENDS_' + pn + '-dbg', ' '+' '.join(split_dbg_packages))
         d.appendVar('RDEPENDS_' + pn + '-staticdev', ' '+' '.join(split_staticdev_packages))
-- 
2.0.0


