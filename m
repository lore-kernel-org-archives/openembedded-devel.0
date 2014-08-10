Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9F63765D5E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 14:01:52 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id w61so7617911wes.37
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 07:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nyGkgqUxCQjmYwsFI/+XuFQjlDvC9mWHIXhvujig/k8=;
	b=F1dgKFCdmVHpopEXp0CFQf3847+lNYmO8swcq8BAdx7OTgded6P55lKLK7qKk14Dbh
	N7Lli+RcaP9GdNy46Bnwp0QV8mTfAWM8raT7BEe5qluIrOwnrWdp4f2WeSb4YWjkaCD0
	dErYrH3u08QM+DXTl0icPPCcFX8D2ByglUaK7G542PlDPlWbBZWJ8XKaghCFN687sHKj
	vYYqGok/FLZsN3w62TzK7El9Yf6ZiGn9J5WRjH05wyySZWfIVTlwQyQNvK92+fpDvJtn
	Pnqnk+QPGEsrQp7BZ8c1P/KoxqDdkKqgMkMnUudSS3oyvaRZ27g+lpRzKTFitwyKPBAe
	SMTA==
X-Received: by 10.194.78.170 with SMTP id c10mr18818067wjx.22.1407679313837;
	Sun, 10 Aug 2014 07:01:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	au7sm32275630wjc.41.2014.08.10.07.01.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Aug 2014 07:01:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Aug 2014 16:02:19 +0200
Message-Id: <1407679345-31695-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-oe][PATCH 1/7] gd: add dependency on libvpx
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
X-List-Received-Date: Sun, 10 Aug 2014 14:01:56 -0000

* fixes floating dependency:
  gd-2.1.0: gd rdepends on libvpx but it isn't a build dependency? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/gd/gd_2.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gd/gd_2.1.0.bb b/meta-oe/recipes-support/gd/gd_2.1.0.bb
index 4bc9867..f03b9b0 100644
--- a/meta-oe/recipes-support/gd/gd_2.1.0.bb
+++ b/meta-oe/recipes-support/gd/gd_2.1.0.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "http://libgd.bitbucket.org/"
 SECTION = "libs"
 LICENSE = "GD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c97638cafd3581eb87abd37332137669"
-DEPENDS = "freetype libpng jpeg zlib tiff"
+DEPENDS = "freetype libpng jpeg zlib tiff libvpx"
 
 SRC_URI = "https://bitbucket.org/libgd/gd-libgd/downloads/libgd-${PV}.tar.bz2 \
            file://fix-the-subdir-objects-error.patch \
-- 
2.0.4


