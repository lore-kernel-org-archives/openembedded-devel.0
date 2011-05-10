Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJlGL-0005ev-Bn
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 13:38:01 +0200
Received: by fxm19 with SMTP id 19so4756090fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 04:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=bNEYx0rZuA8KT28zSe8OSRZIYKTSF9opMthKJzIELGA=;
	b=IV81hH/CbFcmm0vLxbb2ol+aMyyVcJ3nsLScoLqLqZsH9mTRycW0Xqs5b2AXUieSn5
	lmZxRvd6g2vvX1/l8WwHU61Z4HQdL9ItI0AfKin/InWm3nHNwCpwkeZvNGCpPlKIeBBw
	nXK6O9AwT82X/y1vfWTg53Jr1ZrtHaRpEr+Mc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=L3Uuhtowh2iGPGCwZ5a7R+mvFbFpZnvp9rQbOpVZdB2UYAwuzwLy5ILO4tZlJN1u5s
	hpr1xDokJNBpP3h9hDZfah9nEKJC7ntuvE/cr4NjfAjkrf/k+5cpVZnY6y1CFLZXMIzL
	LkWC8AUGQT+/07BUanUYfV4vFIZ8HGTBd18Jo=
Received: by 10.223.145.78 with SMTP id c14mr886919fav.75.1305027313200;
	Tue, 10 May 2011 04:35:13 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id l3sm2343765fap.36.2011.05.10.04.35.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 04:35:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 13:35:11 +0200
Message-Id: <b03eee5c0912627114d5ebe7af9a78a89ace15d4.1305027207.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305027207.git.Martin.Jansa@gmail.com>
References: <cover.1305027207.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 2/2] embryo, epdf: fix LICENSE, from oe.dev
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
X-List-Received-Date: Tue, 10 May 2011 11:38:01 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/embryo.inc  |    7 ++++---
 meta-efl/recipes-efl/efl/epdf_svn.bb |   10 ++++++----
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/embryo.inc b/meta-efl/recipes-efl/efl/embryo.inc
index ab02905..8bb8b6f 100644
--- a/meta-efl/recipes-efl/efl/embryo.inc
+++ b/meta-efl/recipes-efl/efl/embryo.inc
@@ -1,11 +1,12 @@
 DESCRIPTION = "The Enlightenment C-like scripting language for Edje"
-LICENSE = "MIT BSD & CompuPhase"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6aa45e26c1ed178da910fd76b306a875"
 
 inherit efl
 
+LICENSE = "MIT BSD CompuPhase"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6aa45e26c1ed178da910fd76b306a875"
+
 BBCLASSEXTEND = "native"
-INC_PR = "r0"
+INC_PR = "r1"
 
 # Some upgrade path tweaking
 AUTO_LIBNAME_PKGS = ""
diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/efl/epdf_svn.bb
index 1f37629..490b3ce 100644
--- a/meta-efl/recipes-efl/efl/epdf_svn.bb
+++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
@@ -1,8 +1,4 @@
 DESCRIPTION = "Epdf is the glue between EFL and libpoppler"
-LICENSE = "GPLv2 & LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6 \
-"
 
 DEPENDS = "poppler evas ecore"
 PV = "0.1.0+svnr${SRCPV}"
@@ -10,6 +6,12 @@ PR = "r4"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
+
+LICENSE = "GPLv2 LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+                    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6 \
+"
+
 SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};proto=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
-- 
1.7.5.rc3



