Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tl0g3-000728-NR
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 18:10:08 +0100
Received: by mail-ea0-f180.google.com with SMTP id f13so366323eai.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=7ZAQ99oul/Q7Y2mWtp5Bpnha+VqmudCdwoowN2J3nWM=;
	b=a3BIk1BvEp2gy+RvpWkZl454eQ7NUy31fMl+lPnixgzA/5GHTk/7zwkUCVroq9Nkhx
	twjiMaDjwlmV/2bZ3gw+/8QK2GqoKNWUBDTkoya311lheBAgbENF7LlJCZTIep1kBFKV
	GjjNmGMR3Y92dVpWglrSaTYyiutUqKapl61nxaTB8uvj0GgblHt2tdiDlmslr7tuafgS
	mPLdsVLlZMkyVarRxrJ2bzza+DmxlxyKmm9CuxxBfPAJXFkCYH4qgMTm3McU0lVre3N8
	/tzUtJ+XrJ4AvNm8iczTKJylJYv8vwoUJ9W3zbC0KKztebeWt4qExf1oCd7y6mG9QArj
	i67Q==
X-Received: by 10.14.215.197 with SMTP id e45mr7323551eep.0.1355849718050;
	Tue, 18 Dec 2012 08:55:18 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d3sm4212302eeo.13.2012.12.18.08.55.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 08:55:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2012 17:55:04 +0100
Message-Id: <a140e9a352a2ce801281b5cdee57780f69594dfb.1355849280.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 05/10] terminology: upgrade to 0.2.0
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
X-List-Received-Date: Tue, 18 Dec 2012 17:10:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/conf/distro/include/efl-from-svn-recipes.inc                 | 2 +-
 .../recipes-efl/e17/{terminology_0.1.0.bb => terminology_0.2.0.bb}    | 4 ++--
 meta-efl/recipes-efl/e17/terminology_svn.bb                           | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-efl/recipes-efl/e17/{terminology_0.1.0.bb => terminology_0.2.0.bb} (41%)

diff --git a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
index 52da95f..ade5b80 100644
--- a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
+++ b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
@@ -38,4 +38,4 @@ PREFERRED_VERSION_python-edje ?= "${EFL_PREFERRED_PYTHON_VERSION}"
 PREFERRED_VERSION_python-emotion ?= "${EFL_PREFERRED_PYTHON_VERSION}"
 PREFERRED_VERSION_python-evas ?= "${EFL_PREFERRED_PYTHON_VERSION}"
 
-PREFERRED_VERSION_terminology ?= "0.1.0+svn%"
+PREFERRED_VERSION_terminology ?= "0.2.0+svn%"
diff --git a/meta-efl/recipes-efl/e17/terminology_0.1.0.bb b/meta-efl/recipes-efl/e17/terminology_0.2.0.bb
similarity index 41%
rename from meta-efl/recipes-efl/e17/terminology_0.1.0.bb
rename to meta-efl/recipes-efl/e17/terminology_0.2.0.bb
index 7a04069..44370df 100644
--- a/meta-efl/recipes-efl/e17/terminology_0.1.0.bb
+++ b/meta-efl/recipes-efl/e17/terminology_0.2.0.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "30867692e44799cd9bbe6562d69ae62d"
-SRC_URI[sha256sum] = "87f32089b2731c3e9a72b5bde92695eb91097fa79dbb70388774c9dcb5442ebb"
+SRC_URI[md5sum] = "61301df6b068b84e1670c85b7696f28d"
+SRC_URI[sha256sum] = "e300dba5f77af7949471c81251c38af765c337b86c8ae9b98ec1dd0d6efbc1c9"
diff --git a/meta-efl/recipes-efl/e17/terminology_svn.bb b/meta-efl/recipes-efl/e17/terminology_svn.bb
index 9fa1304..2518dba 100644
--- a/meta-efl/recipes-efl/e17/terminology_svn.bb
+++ b/meta-efl/recipes-efl/e17/terminology_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 DEFAULT_PREFERENCE = "-1"
-PV = "0.1.0+svnr${SRCPV}"
+PV = "0.2.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
 
-- 
1.8.0.2



