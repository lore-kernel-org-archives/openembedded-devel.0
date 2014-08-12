Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id A2EFD70C8B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 12:24:52 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x48so9944672wes.19
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 05:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=kLOzvAkF6RpDzmxzILzC0dfmQiPqPV1VRfToFz8wHQI=;
	b=z61cdfvC5VcCMxnr9aFmf0s+GbpiPcQ9YUrZmANug7EVz2R7+vJoF4zFc9C4PhYQLy
	DEE5Fh8mlCqFVqHvbSPIZSWt45nCwCcuYbnOCqk3C4+o3sQpGc8RriYYoCUA12I9s0oh
	nmUUallCBoVAi1l5a+FDrA5bZR7otusmT5A1aAEyb6awr+b9Jp6cr2ArN2c05AytaZLi
	Sa4OxLtfaz8+63h9/qTgAATCc3gokOMp4kR8BfEnt3Rmt//Wt9VsWwnVpLzE4dMamVQ/
	e9hPdn39sAMaxYRZxakAN3bc1M++9Q/O3yO9sWuESkY1b5Hu114TIrLCvRinxc7uqiyc
	SF8Q==
X-Received: by 10.194.202.231 with SMTP id kl7mr2702836wjc.134.1407846293133; 
	Tue, 12 Aug 2014 05:24:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	je17sm55673347wic.22.2014.08.12.05.24.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 05:24:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Aug 2014 14:25:15 +0200
Message-Id: <b90153d5981990ea9910c417a868fb26e7e264a4.1407846175.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <cover.1407846175.git.Martin.Jansa@gmail.com>
References: <cover.1407846175.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1407846175.git.Martin.Jansa@gmail.com>
References: <cover.1407846175.git.Martin.Jansa@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [daisy][PATCH 5/5] libgc: add PACKAGECONFIG for libatomic-ops
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
X-List-Received-Date: Tue, 12 Aug 2014 12:24:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libgc/libgc_7.2d.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/libgc/libgc_7.2d.bb b/meta-oe/recipes-support/libgc/libgc_7.2d.bb
index b472a5d..66e6b92 100644
--- a/meta-oe/recipes-support/libgc/libgc_7.2d.bb
+++ b/meta-oe/recipes-support/libgc/libgc_7.2d.bb
@@ -16,5 +16,9 @@ S = "${WORKDIR}/gc-7.2"
 
 inherit autotools
 
+# by default use external libatomic-ops
+PACKAGECONFIG ??= "libatomic-ops"
+PACKAGECONFIG[libatomic-ops] = "--with-libatomic-ops=yes,--with-libatomic-ops=no,libatomics-ops"
+
 PACKAGES =+ "${PN}-docs"
 FILES_${PN}-docs = "/usr/share/gc"
-- 
2.0.4


