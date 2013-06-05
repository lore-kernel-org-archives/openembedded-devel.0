Return-Path: <philip.balister@gmail.com>
Received: from mail-qe0-f42.google.com (mail-qe0-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 43B61601AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jun 2013 21:43:42 +0000 (UTC)
Received: by mail-qe0-f42.google.com with SMTP id s14so1446984qeb.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jun 2013 14:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=Ba553VGFx8qiWY8PDiT1AaJiPsbGH6QnwKkXj+oTCkI=;
	b=MK5FlfH2pSh+NrKDBmIy+sOZ4VNdCWIf5glzR5YMahzNHJwNQbPYDhHcit9jOGduGL
	7gTKDIHVsIs+9Q9WFAkrfkx1WHMZuwTcZBmTRpo9zXEnhAZQ1Cf42lEAJ7911xke36Dl
	54iAFwP3WA8RUfdvL9nxGcmEsiT9XXcHCvu2/8L5yz/cq+IFnh4aEAIw5Anjgxum3rTY
	3ghxbFwdub9f8/hZdsbCHK2s341ulkS8iZtq/H2zGu5OGPgAVomcjbXpOeoLe83Vjel1
	jbA9KVvrgsnLReKf7h/9yhQlzzxAm3t/jXWmA8poG4lT6ObX86D0yKlsJHFgAN+0FIZ+
	HgUA==
X-Received: by 10.229.133.146 with SMTP id f18mr1594101qct.30.1370468622683;
	Wed, 05 Jun 2013 14:43:42 -0700 (PDT)
Received: from localhost.localdomain
	(pool-96-240-166-228.ronkva.east.verizon.net. [96.240.166.228])
	by mx.google.com with ESMTPSA id
	c10sm76595249qao.10.2013.06.05.14.43.41 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 05 Jun 2013 14:43:41 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Jun 2013 17:43:36 -0400
Message-Id: <1370468616-10931-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
Subject: [meta-oe][PATCH] swig : Update to version 2.0.10 and and add nativesdk support.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Jun 2013 21:43:42 -0000

Build tested for armv7a machine.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-devtools/swig/swig.inc       | 2 +-
 meta-oe/recipes-devtools/swig/swig_2.0.10.bb | 9 +++++++++
 meta-oe/recipes-devtools/swig/swig_2.0.9.bb  | 8 --------
 3 files changed, 10 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/swig/swig_2.0.10.bb
 delete mode 100644 meta-oe/recipes-devtools/swig/swig_2.0.9.bb

diff --git a/meta-oe/recipes-devtools/swig/swig.inc b/meta-oe/recipes-devtools/swig/swig.inc
index 0476d53..8e83526 100644
--- a/meta-oe/recipes-devtools/swig/swig.inc
+++ b/meta-oe/recipes-devtools/swig/swig.inc
@@ -40,7 +40,7 @@ EXTRA_OECONF = " \
     --without-tcl \
 "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 do_configure() {
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/Tools/config
diff --git a/meta-oe/recipes-devtools/swig/swig_2.0.10.bb b/meta-oe/recipes-devtools/swig/swig_2.0.10.bb
new file mode 100644
index 0000000..312ce11
--- /dev/null
+++ b/meta-oe/recipes-devtools/swig/swig_2.0.10.bb
@@ -0,0 +1,9 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch"
+
+SRC_URI[md5sum] = "6d5e7ad05b4a404e5e85db9befb70c9a"
+SRC_URI[sha256sum] = "d1eef329e867124ce60838b5ad07c763146b6c8f250dd22a861ead7406f78e63"
+
diff --git a/meta-oe/recipes-devtools/swig/swig_2.0.9.bb b/meta-oe/recipes-devtools/swig/swig_2.0.9.bb
deleted file mode 100644
index 9e9544c..0000000
--- a/meta-oe/recipes-devtools/swig/swig_2.0.9.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch"
-
-SRC_URI[md5sum] = "54d534b14a70badc226129159412ea85"
-SRC_URI[sha256sum] = "586954000d297fafd7e91d1ad31089cc7e249f658889d11a44605d3662569539"
-- 
1.7.11.7


