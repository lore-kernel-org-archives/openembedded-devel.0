Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAigJ-0005A2-Aa
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 15:35:43 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356292bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qAh8BRGoiJxX6qRLYq5tVaFQf1gJiN731H2Jcbl3OA0=;
	b=Q4HzdTQiC1uMukUzpYMRPj9/9V66YHQzM5KtFwHtMT+j47iuksyYavJFbXcm3BkbIV
	sbVaCqNclCqsE6y5jX9SjKAkfKTEH1xpbBTEtNCu4UpfU2xEvyYaPaWdY67YaNAuPwEQ
	dS3p5fa4UD7RqSsvya7onSriEJ0eNtgOwJn/k=
Received: by 10.204.141.80 with SMTP id l16mr3087866bku.183.1317648613284;
	Mon, 03 Oct 2011 06:30:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j16sm13237502bks.3.2011.10.03.06.30.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:30:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:27:20 +0200
Message-Id: <cfbdba5cd55f8299b1f914a6189d03a7840064a7.1317648011.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
References: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648011.git.Martin.Jansa@gmail.com>
References: <cover.1317648011.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCHv2 22/25] epdf: fix build with poppler >= 0.16
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
X-List-Received-Date: Mon, 03 Oct 2011 13:36:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../efl/epdf/epdf.poppler-0.16.api.change.patch    |   11 +++++++++++
 meta-efl/recipes-efl/efl/epdf_svn.bb               |    6 ++++--
 2 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/epdf/epdf.poppler-0.16.api.change.patch

diff --git a/meta-efl/recipes-efl/efl/epdf/epdf.poppler-0.16.api.change.patch b/meta-efl/recipes-efl/efl/epdf/epdf.poppler-0.16.api.change.patch
new file mode 100644
index 0000000..7c0ae65
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/epdf/epdf.poppler-0.16.api.change.patch
@@ -0,0 +1,11 @@
+diff -uNr epdf.orig/src/lib/poppler/epdf_poppler_postscript.cpp epdf/src/lib/poppler/epdf_poppler_postscript.cpp
+--- epdf.orig/src/lib/poppler/epdf_poppler_postscript.cpp	2011-09-30 20:50:03.580218578 +0200
++++ epdf/src/lib/poppler/epdf_poppler_postscript.cpp	2011-09-30 20:49:11.573219667 +0200
+@@ -84,6 +84,7 @@
+ 
+   // FIXME: fix postscript title
+   ps_dev = new PSOutputDev (postscript->filename,
++                            postscript->pdfdoc,
+                             postscript->pdfdoc->getXRef(),
+                             postscript->pdfdoc->getCatalog(),
+ 			    "PS title",
diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/efl/epdf_svn.bb
index 490b3ce..d479da6 100644
--- a/meta-efl/recipes-efl/efl/epdf_svn.bb
+++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Epdf is the glue between EFL and libpoppler"
 
 DEPENDS = "poppler evas ecore"
 PV = "0.1.0+svnr${SRCPV}"
-PR = "r4"
+PR = "r5"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6 \
 "
 
-SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};proto=http;scmdata=keep"
+SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};proto=http;scmdata=keep \
+           file://epdf.poppler-0.16.api.change.patch \
+"
 S = "${WORKDIR}/${SRCNAME}"
 
 EXTRA_OECONF = "\
-- 
1.7.7



