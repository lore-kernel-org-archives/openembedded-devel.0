Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzphK-0001GZ-OM
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:56:18 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1218754wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=oUee9bzMc69ycFzXzySagYb+IsgibX4t0tq3ulD8D+E=;
	b=xCaXCgWuv4VflqSeEs6CfKWKEJEb2I4ChnRCBxp30pSkofiOl6pIATbfwqz8ASOpk2
	4zE8KMnlVl1ut04BjPT73z4TDWbuPY7BjhR2v43uHkYLthqS/SBfoRjf0qirAavDO7nq
	3Ouxd7kDkWNn0fZevDpGHIwzPHHRBWT4mSXFn74S0yXy+8j14+GceI5Na2owuVCF/Nqe
	XmxFeh6eIr+lHVpml2B2mTzmFGzg6uduywHIt369jlnGsUP80Dmn6ZEljHjCtB1Ayy3P
	nkK4fHvH6pw3GJRcalIckSh8ZsYSgY4O/gAKaqX/chtzu+0yHzb/sbhOXOPL4W+XBkpj
	eroQ==
Received: by 10.180.85.167 with SMTP id i7mr6157451wiz.8.1344606271330;
	Fri, 10 Aug 2012 06:44:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ef5sm11624869wib.3.2012.08.10.06.44.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:44:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:01 +0200
Message-Id: <c0e8670a50fd4bfbc3c900feb4509f1a1a915f76.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 06/46] terminology: add recipe for terminal emulator
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
X-List-Received-Date: Fri, 10 Aug 2012 13:56:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/terminology_svn.bb |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/terminology_svn.bb

diff --git a/meta-efl/recipes-efl/e17/terminology_svn.bb b/meta-efl/recipes-efl/e17/terminology_svn.bb
new file mode 100644
index 0000000..2bb4f7c
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/terminology_svn.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Enlightenment Terminal Emulator"
+LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=03f6c2cf2bef233fadf7d0769f5bfda7"
+DEPENDS = "evas ecore edje elementary eina eet emotion"
+
+PV = "0.1.0+svnr${SRCPV}"
+SRCREV = "${EFL_SRCREV}"
+
+inherit e gettext
+SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
+S = "${WORKDIR}/${SRCNAME}"
+
+EXTRA_OECONF = "\
+  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
+"
+
+FILES_${PN} += "\
+        ${datadir}/icons/terminology.png \
+"
-- 
1.7.8.6



