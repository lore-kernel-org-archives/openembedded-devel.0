Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS5H-0005cR-Fm
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:48:47 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6973088eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8N8cqxQACb4laYvEAMq94KdU9+oXAKdKooRDH/ByuJM=;
	b=XNCZAEFbh6vIQZiLIw9DToOPyGf3Dwy5sYiTOZMnI05/f4jySB6pNkyjOKrkYQ2FNX
	bbR7BYPD62XgSjyOWWpXkCVELSgEuD8gHMZSeCxrZOgF3zORyRq1hSI/uVnvt4P5CvA0
	hX5SAtNbN8ops7Wwq8jpAwNiW+XVs6bWPYcYFo9hXKWnbgArF4+dHmG7ayLvGqhSgKUA
	0Mde7lht/5zNKOVx6Rnssc4Arnra3cMVKLwtwiLXGjS7pJJdP9FaQR5yZ/XhSDioME4A
	Akry+J9ufIx6Ym5UnT9QB6zqlEzU58hPognz1pDzvRzwTgB7M/NGgLowQWde0ER/VTN4
	IMZQ==
Received: by 10.14.221.5 with SMTP id q5mr61740477eep.33.1354048476361;
	Tue, 27 Nov 2012 12:34:36 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q2sm42842240eem.13.2012.11.27.12.34.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:34:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:41 +0100
Message-Id: <e19fd3423eb564f2fcca4444cca30fb5f6ee03be.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 04/21] elementary-theme-efenniht: update path to shared images
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
X-List-Received-Date: Tue, 27 Nov 2012 20:48:47 -0000

* moved to images subdirectory in r78304

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
index 8fb2dab..fa635c0 100644
--- a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
@@ -16,6 +16,7 @@ SRCREV_ELM_REV ?= "${EFL_SRCREV}"
 
 SRCREV_FORMAT = "THM_REV"
 PV = "0.0+svnr${SRCPV}"
+PR = "r1"
 
 inherit e-base allarch
 
@@ -26,7 +27,7 @@ SRC_URI += "file://LICENSE"
 S = "${WORKDIR}/${SRCNAME}"
 
 do_compile() {
-    ${STAGING_BINDIR_NATIVE}/edje_cc -id ${S}/images -id ${WORKDIR}/themes/ ${S}/elm-efenniht.edc -o ${S}/elm-efenniht.edj
+    ${STAGING_BINDIR_NATIVE}/edje_cc -id ${S}/images -id ${WORKDIR}/themes/images ${S}/elm-efenniht.edc -o ${S}/elm-efenniht.edj
 }
 
 do_install() {
-- 
1.8.0



