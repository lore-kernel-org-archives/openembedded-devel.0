Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S5iEx-0003v2-Gt
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 19:39:03 +0100
Received: by eaae1 with SMTP id e1so193839eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2012 10:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tIddLhQTk8nJWLKow4q+yBDCaPEJ8ympaHkpL0HkzXo=;
	b=ele1eF1VSD95zssuEuWI8yPjAtgHunYO6HujjDECOvorgETSJN+ab2CrSgbtJPebSP
	WgEHAACgFkssMkUPAR9MMcAHpMMzyNUrF5/OaHMkAVclJl6Slu85PQf1hmSa90mkzbWg
	dBj3uB+rGOuIERrKf1WEvSXOC1+TBhqkwanWdKoosYSJIT+NcaiZWV80dEUYIF+5D+/H
	ZZZRcVh+odWTTEobA23hT/IdOb20EGLRRBLprpWigtFs99U57n1x0EjMuBaI4K66aV/e
	YlCTFD5FGE9EwT1aVkNoNNzUKNC6vCNtEAzquDOe9Zi48yqy6fUVQnvLoAwNSddBaO0J
	gbnw==
Received: by 10.213.8.197 with SMTP id i5mr1396128ebi.212.1331231425252;
	Thu, 08 Mar 2012 10:30:25 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y11sm8916644eem.3.2012.03.08.10.30.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 10:30:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Mar 2012 19:30:03 +0100
Message-Id: <05c6dacc3d31b267fb4e0aaa99074638ed4061bd.1331231195.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <3e2b850aecf62479c580875c424f1eb66986f2b1.1331231195.git.Martin.Jansa@gmail.com>
References: <3e2b850aecf62479c580875c424f1eb66986f2b1.1331231195.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1331231195.git.Martin.Jansa@gmail.com>
References: <cover.1331231195.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 2/7] poppler: add tiff to DEPENDS to make builds more deterministic
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
X-List-Received-Date: Thu, 08 Mar 2012 18:39:03 -0000

* it's autodetected

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/poppler/poppler.inc       |    2 +-
 meta-oe/recipes-support/poppler/poppler_0.18.0.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/poppler/poppler.inc b/meta-oe/recipes-support/poppler/poppler.inc
index 85c3983..a624c1b 100644
--- a/meta-oe/recipes-support/poppler/poppler.inc
+++ b/meta-oe/recipes-support/poppler/poppler.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "Poppler is a PDF rendering library based on the xpdf-3.0 code base."
-DEPENDS = "fontconfig jpeg zlib gtk+ cairo"
+DEPENDS = "fontconfig jpeg zlib gtk+ cairo tiff"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
diff --git a/meta-oe/recipes-support/poppler/poppler_0.18.0.bb b/meta-oe/recipes-support/poppler/poppler_0.18.0.bb
index 69d2926..6f1a022 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.18.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.18.0.bb
@@ -1,6 +1,6 @@
 require poppler.inc
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS += "lcms"
 
-- 
1.7.8.5



