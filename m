Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NadG4-0000f5-DF
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jan 2010 23:54:43 +0100
Received: by mail-fx0-f214.google.com with SMTP id 6so114297fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2010 14:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=XajsaFnIDk7MSz5bOLkZF2nqYa1/3DesYPDWkF4Mz/o=;
	b=hQeFhGZt1Qv1Mmb/It76PIGh080VPLq9eYk6icA6Xw60yHG9X1L4tbYrWc4R6vSWqj
	sTfLUJ0r0EnNO01V057TvbHt8Y/csCdfXnM0Y7sBars2vevIjQRH1n61C+W257aKzVNy
	8YerpIy4+XqaQyeFLiYuGips94aA4oizdmcgA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=YVwEHeMYNYNtKOskXrJTNFKzdaJ7K+00tJLUZYovc+xkNlYdShj66baa4lQKlBM3K4
	JUc/P6dWQvoCepHOJUCYAh+CjqGW6ZGY+3ANy0ryPQKiKQldwIhEz+62+J+WiVra6O/x
	rify+ADngNy4svGlDVrHBrks4j0z3pUuA1i4s=
Received: by 10.87.72.8 with SMTP id z8mr607716fgk.37.1264719139756;
	Thu, 28 Jan 2010 14:52:19 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm234298fxm.10.2010.01.28.14.52.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 28 Jan 2010 14:52:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jan 2010 23:51:23 +0100
Message-Id: <1264719083-19638-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1264719083-19638-2-git-send-email-Martin.Jansa@gmail.com>
References: <1264719083-19638-1-git-send-email-Martin.Jansa@gmail.com>
	<1264719083-19638-2-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.214
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/2] python-cython: add version 0.12
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
X-List-Received-Date: Thu, 28 Jan 2010 22:54:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/python/python-cython-native_0.12.bb |   10 ++++++++++
 recipes/python/python-cython_0.12.bb        |   16 ++++++++++++++++
 2 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 recipes/python/python-cython-native_0.12.bb
 create mode 100644 recipes/python/python-cython_0.12.bb

diff --git a/recipes/python/python-cython-native_0.12.bb b/recipes/python/python-cython-native_0.12.bb
new file mode 100644
index 0000000..95886ae
--- /dev/null
+++ b/recipes/python/python-cython-native_0.12.bb
@@ -0,0 +1,10 @@
+require python-cython_${PV}.bb
+inherit native
+DEPENDS = "python-native"
+RDEPENDS = ""
+
+do_stage() {
+    PYTHONPATH=${STAGING_BINDIR} BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+    STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
+        ${STAGING_BINDIR}/python setup.py install --prefix=${STAGING_BINDIR}/.. --install-data=${STAGING_DATADIR}
+}
diff --git a/recipes/python/python-cython_0.12.bb b/recipes/python/python-cython_0.12.bb
new file mode 100644
index 0000000..846be47
--- /dev/null
+++ b/recipes/python/python-cython_0.12.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Cython is a language specially designed for writing Python extension modules. \
+It's designed to bridge the gap between the nice, high-level, easy-to-use world of Python \
+and the messy, low-level world of C."
+SECTION = "devel/python"
+PRIORITY = "optional"
+LICENSE = "GPL"
+SRCNAME = "Cython"
+PR = "ml0"
+
+SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz;name=archive"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+SRC_URI[archive.md5sum] = "f73ad2258115c92ce982d34d27580076"
+SRC_URI[archive.sha256sum] = "90d611aeff8d017a5ccca3b1e02ec8d6dd0efc7dfd29806f721bc718d3774ea3"
+
+inherit distutils
-- 
1.6.6.1



