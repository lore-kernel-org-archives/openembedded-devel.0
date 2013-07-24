Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 154306B3A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:32 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so216656eak.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=c78XumzEQfhawSoVA1TculaNuAr4VE6vYAXq59doLFM=;
	b=rtTx8gVmMdSQbbep16CWOABQR7zVHvO4/WrfiOqtQMHzmPe2CkDo3oOtT/kEmU9tlZ
	l/gufP+zLrdcd0rYrSm9qDR9tUToqhNrnPibwCMEKKSzCB/391x9bINGia0oky7UhvkH
	zBCUoq43t/MzCEkEXHG1nG8deVO7xhuGs9yzACrfWaUdEeyoDwyq5j9Uj40u3Nzrz12X
	MQlk+kMB1kPIbsNrRgzf+bPrTnfI1jb2PBch5r2Mv/QyqtYYSPK1Z2oyyQQFtHASojjO
	rNgUn+4NueTUeWV75siwTQBm8J2Yf4V7T+jJJusrIJ2C/Vr54ig9WTXz36UTLLttFpu3
	YnJA==
X-Received: by 10.15.27.195 with SMTP id p43mr37789771eeu.5.1374669693415;
	Wed, 24 Jul 2013 05:41:33 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p49sm65918692eeu.2.2013.07.24.05.41.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:41:11 +0200
Message-Id: <99489e00228fdc16bc557e0c3e9712afbad874dc.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 27/29] smbnetfs: add packageconfig for gnome-keyring
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/smbnetfs/smbnetfs_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/smbnetfs/smbnetfs_git.bb b/meta-oe/recipes-connectivity/smbnetfs/smbnetfs_git.bb
index 3bb1c6d..2141137 100644
--- a/meta-oe/recipes-connectivity/smbnetfs/smbnetfs_git.bb
+++ b/meta-oe/recipes-connectivity/smbnetfs/smbnetfs_git.bb
@@ -13,4 +13,7 @@ SRCREV = "ace1c519d45fe488b9b7e6cc77a2bcadb6c83464"
 
 SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;protocol=git;branch=master"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring=yes,--with-gnome-keyring=no,libgnome-keyring"
+
 S = "${WORKDIR}/git"
-- 
1.8.3.2


