Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2756B70181
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 09:59:57 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id r20so9047230wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 02:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=W6xvD4Ep+KpXhesqd8z1JpsK/5FK4qlZYA3VLh5F3So=;
	b=NGuAD2eyiUNwQVJBi5N40sZ+xxygS1/C54dW2Gg/8R9XeQWejHKl9l+t/owIgpxZ/w
	P+7S3sQ/lSW/8HuNMSe/ek5C0tvLWer33TfPS64HJKCj+BR4lkEuyMagCxKMgSNrJ9cU
	Ix6ly9eTVpggBW1OwAArQ9uF+GDDDs3dFhLJYNHfrhFzEVmBJJxt3VokRAKf7rRDIjMC
	UVFqEeKafsoGg8N7Ygf3rZyG2YCkHgCysj/UHCF3XAV61sdBiDoe7PSHiAAC/dKuD7DG
	a49PjQO9Lp+XwnC61RbWDX7kCoBlUYKbRBxnSykHKG5gOkBBcAS9n/Sy8Kavuoh14yXd
	F2cA==
X-Received: by 10.180.81.72 with SMTP id y8mr5022871wix.7.1403171998301;
	Thu, 19 Jun 2014 02:59:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hi6sm7671541wjc.32.2014.06.19.02.59.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 02:59:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:32 +0200
Message-Id: <1403171993-26208-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 04/25] imlib2, mcnavi: Blacklist because of broken imlib2 after freetype2-config was removed
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
X-List-Received-Date: Thu, 19 Jun 2014 09:59:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/imlib2_svn.bb             | 2 ++
 meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-efl/recipes-efl/efl/imlib2_svn.bb b/meta-efl/recipes-efl/efl/imlib2_svn.bb
index 8bd8032..9806de7 100644
--- a/meta-efl/recipes-efl/efl/imlib2_svn.bb
+++ b/meta-efl/recipes-efl/efl/imlib2_svn.bb
@@ -7,6 +7,8 @@ PROVIDES = "virtual/imlib2"
 PV = "1.4.5+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
+PNBLACKLIST[imlib2] = "BROKEN: needs to be updated to use freetype2 pkg-config"
+
 inherit efl binconfig
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
index d07b143..1a6e4a0 100644
--- a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
+++ b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
@@ -4,6 +4,8 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 DEPENDS = "ecore evas imlib2 gpsd edje edje-native mysql5"
 
+PNBLACKLIST[mcnavi] = "BROKEN: depends on broken imlib2"
+
 SRC_URI = "http://www.gps-routes.info/debian/pool/main/m/mcnavi/mcnavi_${PV}.tar.gz"
 SRC_URI[md5sum] = "6860cde5c02a9f93c829da4b10e5a226"
 SRC_URI[sha256sum] = "ee7f65155e91386175875fc4f72f4bc94e4e9cdb8258112632da94520ef2c349"
-- 
2.0.0


