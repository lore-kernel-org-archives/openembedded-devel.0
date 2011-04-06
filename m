Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7MzE-0007x9-Kh
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 09:17:08 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so887124fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 00:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=SC15kOvBoydFffAoTAIC4JrfzxeYVrRBaYSwAsK4yhQ=;
	b=HR7fo8mLKduCZoZGpqgNYeeD+rHaeitFYO6cykMmugLZWcsBf9HY24lC2o7S3ofAJY
	eVYzRtg4UOkGAA+9D1Npq5Vlobd2DGESvHCixA5GLRWjCwBuuxOndTgRgJTAWucy5SPd
	gCrTtQJBdM0f7hfibM2XfDQCTettqk/RBczkQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=EDmhPsysDAmHTOfpfzB+/x+TPK5pzgksxCPhCYhsa3sgkqA3agadwSRRu1k+223n/n
	x+EyCBPPQW9zzneoY9HFyL+YYOlxYFIso0SICMMC29qDLLn7cCJlAfxQIDZPagzBGS6b
	F+YivF/1TjKWmXZ6wAgvLmLs9ci7iiBCntHy4=
Received: by 10.223.110.21 with SMTP id l21mr659502fap.70.1302074104471;
	Wed, 06 Apr 2011 00:15:04 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j11sm80803faa.20.2011.04.06.00.15.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 00:15:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 09:14:57 +0200
Message-Id: <be0148f6b6febf52d39f8d950e97c6c3235975ee.1302074016.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302074016.git.Martin.Jansa@gmail.com>
References: <cover.1302074016.git.Martin.Jansa@gmail.com>
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: [PATCH 1/8] eio: new recipe and include file for eio
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
X-List-Received-Date: Wed, 06 Apr 2011 07:17:08 -0000

From: Philippe De Swert <philippedeswert@gmail.com>

Signed-off-by: Philippe De Swert <philippedeswert@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/eio.inc    |    8 ++++++++
 meta-efl/recipes-efl/efl/eio_svn.bb |   13 +++++++++++++
 2 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/eio.inc
 create mode 100644 meta-efl/recipes-efl/efl/eio_svn.bb

diff --git a/meta-efl/recipes-efl/efl/eio.inc b/meta-efl/recipes-efl/efl/eio.inc
new file mode 100644
index 0000000..0edc07e
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eio.inc
@@ -0,0 +1,8 @@
+DESCRIPTION = "Enlightenment Input Output Library"
+LICENSE = "LGPLv2.1"
+DEPENDS = "ecore eina"
+
+inherit efl
+
+BBCLASSEXTEND = "native"
+INC_PR = "r0"
diff --git a/meta-efl/recipes-efl/efl/eio_svn.bb b/meta-efl/recipes-efl/efl/eio_svn.bb
new file mode 100644
index 0000000..6a12dcf
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eio_svn.bb
@@ -0,0 +1,13 @@
+require eio.inc
+
+SRCREV = "${EFL_SRCREV}"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=403f20cf42c847686ac2956f14bfa30f"
+
+SRC_URI = "\
+  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
+"
+S = "${WORKDIR}/${SRCNAME}"
-- 
1.7.4.1



