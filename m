Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXru1-0004Wz-Dr
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:05:33 +0100
Received: by mail-ey0-f175.google.com with SMTP id c1so1374062eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 01:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=QHjVMDRPvNKEJ/B+XWHM76C2k1ir6r+YreYcnQwUhQk=;
	b=GVp9tKAlWcorz077brvS2aWNB2F0VVSAM0I2mOsbm0LMnXpD7Xzye36AlYDQ8E/5pZ
	7WHKL/AbK63G7R9SOnKhHBS+0aWFAlRS7kJrLyqPPlfvXg6SRBZRt7HMaSCsT0dqNQXi
	cekDRje3/fmOeo2ABACkINXiKLz1MI4hzm4dM=
Received: by 10.213.19.69 with SMTP id z5mr2109537eba.130.1323165522311;
	Tue, 06 Dec 2011 01:58:42 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q28sm69320815eea.6.2011.12.06.01.58.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 01:58:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 10:57:10 +0100
Message-Id: <750a3af6e23a133e3f23b84754d7989b2da688f7.1323165311.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
References: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323165311.git.Martin.Jansa@gmail.com>
References: <cover.1323165311.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-efl 11/16] eeze: RRECOMMEND eject, build time autodetection is now fixed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2011 10:05:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/eeze.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/eeze.inc b/meta-efl/recipes-efl/efl/eeze.inc
index 4b13984..aa4baa4 100644
--- a/meta-efl/recipes-efl/efl/eeze.inc
+++ b/meta-efl/recipes-efl/efl/eeze.inc
@@ -13,3 +13,5 @@ AUTO_LIBNAME_PKGS = ""
 
 FILES_${PN} += "${libdir}/enlightenment/utils/eeze_scanner"
 FILES_${PN}-dbg += "${libdir}/enlightenment/utils/.debug"
+
+RRECOMMENDS_${PN} += "eject"
-- 
1.7.8



