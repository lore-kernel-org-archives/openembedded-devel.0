Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0401B6E514
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 17:17:54 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d17so1009471eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 09:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=6E5jd+pEy4U4S1TnuoYoSXXWiTBbGsXY6PxuoDYaeVA=;
	b=o6T8klHXQqEk6qbIZpxgxngWqjqP98lZhb3EE+Bf1NDrWSaHgSR3k+yoo00zjp3hGh
	aIABWGMk8UYQStYZomepnglsmazC+2HZtVcMb/kieBkkNBr6Jk31FULl1OXQUrymgpcZ
	xpCu3wnwkZ2SkxjTfe3+840ub/XkytHzBrcDJvvuzsGT6duI7hz78wxHyDknd9YjFNdU
	BLHDs7q7U8kXAmrQLkptHGgqpS0Jbccnk2V0tERPAGOZX9njC8i9zyAZzyD4kZkEst1U
	6YuiJBpCab7mi0awxrswTbmZtg9SVA7ogH76j9S5ZI3PmkLreuZ0qE2zaIJE7aUliVdF
	H9zg==
X-Received: by 10.15.52.136 with SMTP id p8mr5244253eew.11.1389806275559;
	Wed, 15 Jan 2014 09:17:55 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o13sm11752868eex.19.2014.01.15.09.17.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 09:17:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 18:17:57 +0100
Message-Id: <fb6feaa2b3e29d09392c1645bf1e92dafdb00789.1389805976.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1389805976.git.Martin.Jansa@gmail.com>
References: <cover.1389805976.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1389805976.git.Martin.Jansa@gmail.com>
References: <cover.1389805976.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][WIP][PATCHv2 7/7] webkit-efl: Try to disable llint/jit to fix armv[45] build
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
X-List-Received-Date: Wed, 15 Jan 2014 17:17:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb b/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb
index 879ff1f..59a05a0 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb
@@ -37,6 +37,9 @@ EXTRA_OECMAKE = " \
     -DENABLE_ACCESSIBILITY=Off \
     -DENABLE_BATTERY_STATUS=Off \
 "
+# generated ASM code isn't compatible with armv[45]
+EXTRA_OECMAKE_append_armv4 = " -DENABLE_LLINT=Off -DENABLE_JIT=Off -DENABLE_DFG_JIT=Off -DENABLE_FTL_JIT=Off"
+EXTRA_OECMAKE_append_armv5 = " -DENABLE_LLINT=Off -DENABLE_JIT=Off -DENABLE_DFG_JIT=Off -DENABLE_FTL_JIT=Off"
 
 LEAD_SONAME = "libewebkit.so"
 PACKAGES =+ "${PN}launcher-dbg ${PN}launcher ${PN}-inspector"
-- 
1.8.5.2


