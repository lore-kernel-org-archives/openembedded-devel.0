Return-Path: <net147@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 00127608F7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2013 13:53:45 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id 3so2224538pdj.33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2013 06:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=W67EA4fakf/MTZsjNP6IAlQwbOXHNz0KcwuB617eNRw=;
	b=NamrmjiE8Ah+0u1HgM/dZEHEKrQFuKNSs/NnvMrzArARKKZ/w79TY1VVfZZyKlbNtr
	c72jnZoStCvbbaVYABHISCKORYJELdNhwkvZYAEeXzeSAcb8DYt0KTY4QhBobAXlw+Y/
	kW3KDXqI7I0k5oOy7LjMq9nHZc3gbOwp9s58pOZLqYqbSoIodUX/zjYwkvwc6g0PwXJ1
	lryJpoIyxXKlwxDUu1Y6q1kS11zxVCtrUbb/FieZeUFnmsFMoq6WRHW0RduV/0X60SFh
	pFLjx7Zwr82cPEv6TWBpAiEOtjs0H5KY7BAxS6PD+/F5JZO+82r8A7n6KSXaCh3N3/6y
	bzag==
X-Received: by 10.68.100.98 with SMTP id ex2mr13408989pbb.19.1370008427178;
	Fri, 31 May 2013 06:53:47 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id 3sm46763035pbj.46.2013.05.31.06.53.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 06:53:46 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 May 2013 23:48:54 +1000
Message-Id: <1370008134-25208-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [meta-oe][PATCH] llvm: install llvm-config in crossscripts
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
X-List-Received-Date: Fri, 31 May 2013 13:53:46 -0000

The llvm-config script was being installed to the native sysroot but not
in crossscripts. As a result, recipes would pick up the native
llvm-config which would give flags for native LLVM instead of target
LLVM and result in compile errors.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
index a56fda0..59f4f25 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -160,6 +160,7 @@ llvm_sysroot_preprocess() {
 
         install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
         install -m 0755 bin/llvm-config${LLVM_RELEASE} ${SYSROOT_DESTDIR}${bindir_crossscripts}
+        install -m 0755 bin/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}
 }
 
 do_install_virtclass-native() {
-- 
1.8.3


