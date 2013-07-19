Return-Path: <net147@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3EF6B2D1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2013 05:32:57 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id wz7so3962839pbc.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2013 22:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=D3bbXLwxWOcnKZwOhbdZjondbiAKtG99JcBTLfFOa84=;
	b=dCEXwl40yHAjoYKIe3NcpJ+dcQqh/khwAa6Avpg1SAg6IYf+d/4TdJrcn90gi9NS3i
	1cZJTUryXHc/h5oSChFHA7ZtBHkvi2shDa4S+7B0R8N5K9uCSeJYCpJHwHEmkBT6Y/zp
	T6Xb7Sxv0R8kTI5HQUbEzT1v3xf31HLzksYeZbeFTSQe+Uh+BfiF66ql+ABFzTWqDNrD
	hBooYgz9Y/09T6C65Fxmuohm10XiCsRsMh0DyOQKO+XV8kJFhpIcSL15g+mQ/SJPx7hg
	tn6vK/kCdMmVyqW16t4/ImAGsRqVpXEN7HSA4VPBc+cGhVt8qqK4zSWfb6xHT8M6T0fO
	kExw==
X-Received: by 10.68.212.229 with SMTP id nn5mr15531092pbc.44.1374211978298;
	Thu, 18 Jul 2013 22:32:58 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	py4sm17459810pbc.14.2013.07.18.22.32.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Jul 2013 22:32:57 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Jul 2013 15:48:37 +1000
Message-Id: <1374212917-15330-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] llvm3.3: append --enable-zlib to EXTRA_OECONF instead of overwriting
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
X-List-Received-Date: Fri, 19 Jul 2013 05:32:57 -0000

The options added to EXTRA_OECONF in llvm3.inc were being overwritten
with --enable-zlib in llvm3.3_3.3.bb.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm3.3_3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
index 132ec8f..65db1a8 100644
--- a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
+++ b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
@@ -2,7 +2,7 @@ require llvm.inc
 require llvm3.inc
 
 DEPENDS += "zlib"
-EXTRA_OECONF = "--enable-zlib"
+EXTRA_OECONF += "--enable-zlib"
 
 SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
 SRC_URI[md5sum] = "40564e1dc390f9844f1711c08b08e391"
-- 
1.8.3.2


