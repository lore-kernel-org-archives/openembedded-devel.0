Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVfSr-0008BK-M9
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 09:24:25 +0100
Received: by mail-ee0-f47.google.com with SMTP id c1so154835eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 00:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=IjGS1MaVaQivDXQApz0Rl7+3V14NRLhaWTsmuxhaeas=;
	b=dLTIQA2pG/qeDdp75ca1xgJF6X1ypxDL5wgrBUH/h6j9sqh8YzLaG+qEmVd23YwUN8
	htlSaYkDAZO0Olq3zouxYi0Z9j4fDskOFsJ7RE7wcNX47B514j1viX1f7FrkIYF0swW/
	Qc22lS6e5Sr2k0lq6SWt/UEFK8+puqFJg/W+8=
Received: by 10.14.5.144 with SMTP id 16mr118272eel.171.1322641068056;
	Wed, 30 Nov 2011 00:17:48 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q28sm3663811eea.6.2011.11.30.00.17.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 00:17:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:16:51 +0100
Message-Id: <b61900a3f219e4d4d4065330ddced26d43d38272.1322640506.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
References: <a>
	<55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322640506.git.Martin.Jansa@gmail.com>
References: <cover.1322640506.git.Martin.Jansa@gmail.com>
Subject: [meta-efl 04/11] e-base: bump EFL_SRCREV for 1.1.0 alpha versions
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
X-List-Received-Date: Wed, 30 Nov 2011 08:24:25 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass      |    2 +-
 meta-efl/recipes-efl/e17/elfe_svn.bb |    3 +--
 meta-efl/recipes-efl/efl/evas_svn.bb |    3 +--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 18df79b..d9c2275 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
 # usually tracks svn trunk HEAD
-EFL_SRCREV ?= "64506"
+EFL_SRCREV ?= "65428"
 # revision when 1.0.0 was released, for recipes which don't need rebuild so often
 EFL_SRCREV_1.0.0 ?= "56356"
 
diff --git a/meta-efl/recipes-efl/e17/elfe_svn.bb b/meta-efl/recipes-efl/e17/elfe_svn.bb
index 13fe014..f6d6fdb 100644
--- a/meta-efl/recipes-efl/e17/elfe_svn.bb
+++ b/meta-efl/recipes-efl/e17/elfe_svn.bb
@@ -5,7 +5,6 @@ PR = "${INC_PR}.1"
 
 require e-module.inc
 
-SRCREV = "64510" 
-# EFL_SRCREV
+SRCREV = "${EFL_SRCREV}"
 
 DEPENDS += "elementary"
diff --git a/meta-efl/recipes-efl/efl/evas_svn.bb b/meta-efl/recipes-efl/efl/evas_svn.bb
index be39f65..3712760 100644
--- a/meta-efl/recipes-efl/efl/evas_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas_svn.bb
@@ -1,7 +1,6 @@
 require evas.inc
 
-#SRCREV = "${EFL_SRCREV}"
-SRCREV = "64516"
+SRCREV = "${EFL_SRCREV}"
 PV = "1.0.999+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
-- 
1.7.8.rc4



