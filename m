Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 903666B9D9
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Jan 2014 11:14:12 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so7147728eaj.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Jan 2014 03:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Hq88xDmAEtIbacqlPRp+CSyCKzCwNbT06tzg6WTo3KU=;
	b=msj2eywCEWnv31meOFRg5gRgLC5lfh5F8B5dtnuHVaXpK7ycRi/tboGnmAKPtvBNxR
	bLZrIHgeWQ1Xzm6HLYobpt/GOVWJG2V53bKEmsr1DEo9gLywwkSRNaStRGZSGrAxEQdL
	l7iXkG6bsw+MOLDk5By3SG0Byr4PWo42d/2/fE8vJhZGn0RVyicDx8KiFPiJp5gzwEVl
	glGE3JSPty5etFzNrcdyNN2nrXbEea4575LQs/XlU4uJxc2QkhiuB1Cu9B0A1OuasDA8
	gcjZ3edIgmhaqvNqzhVwaJ9KiQdQIDiAu0bFAIyD/FqvzlanNC/9qw0d9rl/NvNogGky
	QExQ==
X-Received: by 10.14.93.197 with SMTP id l45mr25943766eef.53.1388834053291;
	Sat, 04 Jan 2014 03:14:13 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	b41sm152643091eef.16.2014.01.04.03.14.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Jan 2014 03:14:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Jan 2014 12:14:02 +0100
Message-Id: <4e6cd828882256fef56eef4ee7dfdd3f93e51671.1388833883.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][for-dylan][PATCH 6/9] zram: Drop allarch
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
X-List-Received-Date: Sat, 04 Jan 2014 11:14:13 -0000

* runtime dependencies are TUNE_PKGARCH causing do_package_write_*
  task to have different signature for MACHINEs with different
  TUNE_PKGARCH
* move kernel-module-zram to RRECOMMENDS, because signature handler
  is excluding kernel-module-* dependencies only from RRECOMMENDS and
  also because some machine can have zram enabled in kernel and
  kernel-module-zram won't exist.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/zram/zram_0.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/zram/zram_0.1.bb b/meta-oe/recipes-extended/zram/zram_0.1.bb
index fbeb586..02abb12 100644
--- a/meta-oe/recipes-extended/zram/zram_0.1.bb
+++ b/meta-oe/recipes-extended/zram/zram_0.1.bb
@@ -2,9 +2,10 @@ DESCRIPTION = "Linux zram compressed in-memory swap"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-inherit allarch update-rc.d systemd
+inherit update-rc.d systemd
 
-RDEPENDS_${PN} = "util-linux-swaponoff kmod kernel-module-zram"
+RDEPENDS_${PN} = "util-linux-swaponoff kmod"
+RRECOMMENDS_${PN} = "kernel-module-zram"
 
 PR = "r3"
 
-- 
1.8.4.3


