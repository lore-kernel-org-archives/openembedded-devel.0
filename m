Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzplI-0004Sp-EN
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 16:00:24 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so1197427wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=v3oFbaBHKrsIO11gAWHelgRFh1UVN/SdftqSHWOVkbQ=;
	b=cO1QdUaWKHRjo+Dzl5pCbqAIyOZ39X07BnVcjYqKAVrQqSNrmW5E407pksP4YnIy04
	bwjFd/KiTC/vdxTrm6Lyz1tBEmE6362HQRIFMKZVBS46sG8L7/ig8lY1H2YEkug87PUS
	TGE7GXs5GMwEFTeIGgWKxIRjgw80baKHIwtWhojo9+plIkGE7o3aYsT8QuNZjjhG4ii0
	M5D92hHW8kswb08oST8Ydruc56nLSNee71YYNhRAC0w2rw86TVtAE0EXNKmtK2fpGxwQ
	dcJaBa5UKXHrvgRyzlQ59BOzelHBaQrUNNEFABsbRQlcCmb2wsOlrEVC2bHOCiPqZG0Y
	NoYw==
Received: by 10.180.14.35 with SMTP id m3mr6147816wic.16.1344606516932;
	Fri, 10 Aug 2012 06:48:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm11645580wiz.9.2012.08.10.06.48.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:48:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:31 +0200
Message-Id: <37b1e05663af75585a68d44656dee16c983a019e.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 36/46] e-wm: include unpackaged data/favourites in PN
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
X-List-Received-Date: Fri, 10 Aug 2012 14:00:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index cce5ad1..bbe5ef9 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r3"
+PR = "r4"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives gettext
@@ -110,6 +110,7 @@ FILES_${PN} = "\
   ${libdir}/enlightenment/*plugins/*/*/* \
   ${libdir}/enlightenment/preload/e_precache.so \
   ${datadir}/enlightenment/data/icons \
+  ${datadir}/enlightenment/data/favorites \
   ${datadir}/enlightenment/data/input_methods \
   ${datadir}/enlightenment/data/config/profile.cfg \
   ${datadir}/enlightenment/AUTHORS \
-- 
1.7.8.6



