Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 53C196B675
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 09:49:36 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id e53so5401035eek.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 01:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Hq88xDmAEtIbacqlPRp+CSyCKzCwNbT06tzg6WTo3KU=;
	b=CrjVFnfHAlCrI7f0gTnHP+QJhbPsA/BFycvEURkeM6enasAAQatpSNPRRqVUkZAmv0
	tCcMtHowkg573cBfeeIiUxgr1J6vst0OTVOVjQdVHDupGqia23HVZ878LG6LqSZsX9kh
	5SjvvS02nAOEdLdXWeHAkIleJN3M8+Q1JCMPwIXyUWe1e9ZNCxu9WS/8B9TGz776GuE/
	GOOqhRkCj0/xAaByBp254elWTaCCGXDxmCuAjOMxgkNr99T4FLejKB7MOzu0E4wzcS0V
	xWEtAzUk86tOG40XbkZAex+O9zqsz49asy29N2VYhwEoHPCEzxTREmW7cjwKQcjwHytq
	lkrw==
X-Received: by 10.14.209.129 with SMTP id s1mr58998587eeo.21.1388483377073;
	Tue, 31 Dec 2013 01:49:37 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 44sm116626056eek.5.2013.12.31.01.49.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Dec 2013 01:49:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Dec 2013 10:49:21 +0100
Message-Id: <1388483363-28575-9-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][for-dora][PATCH 09/11] zram: Drop allarch
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
X-List-Received-Date: Tue, 31 Dec 2013 09:49:37 -0000

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


