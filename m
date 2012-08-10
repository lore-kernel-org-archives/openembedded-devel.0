Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpl5-0004Sp-Fs
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 16:00:13 +0200
Received: by wibhq4 with SMTP id hq4so1197427wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ehiqnxBoCiTdQKWlfEzvDjp5vmIifHVsx5RMBefPZdI=;
	b=iOjYOfTOtUx1fImaGajmguYntzh6/MTh0Zy+lLt2RKBteYHu0phMis3fGVWn3U90DF
	Z07cp1Yli63KSDVv6v1QypBrCQby5OVZ+lYTE0a+C2tfiZrPu+oi6ncpys8af8c57nry
	/45yA8R+vUgXwj0/2GLgAdmNB5NLk6qTsHc/BtSJNfujC/FULp7yN5Cy3fB2veWEi2dX
	ph7Wp3H3N/so5MHDk5ytvZywHrHM1fTk5Ho5+vtMfVHUrTKIACjqJrfzgI6fdwFDwbJ5
	iNvLVW+xbc3OU0AhHKnpOuVMK7z+IwcstjjHqDDebZ8EJDID82liZ9g0rErx6BkgkHza
	E5YQ==
Received: by 10.216.42.65 with SMTP id i43mr1650748web.208.1344606501922;
	Fri, 10 Aug 2012 06:48:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ef5sm11650387wib.3.2012.08.10.06.48.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:48:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:29 +0200
Message-Id: <3db9d3ab03258821fd9186b4ad2d2fabb550926e.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 34/46] eet: move eet binary to own PN-utils package
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
X-List-Received-Date: Fri, 10 Aug 2012 14:00:14 -0000

* nobody would expect it in libeet-tests

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/eet.inc |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/eet.inc b/meta-efl/recipes-efl/efl/eet.inc
index de17e05..089e92e 100644
--- a/meta-efl/recipes-efl/efl/eet.inc
+++ b/meta-efl/recipes-efl/efl/eet.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=da947f414a2ca4323245f1abb1980953"
 inherit efl
 
 BBCLASSEXTEND = "native"
-INC_PR = "r0"
+INC_PR = "r1"
 
 EXTRA_OECONF = "\
   --enable-openssl \
@@ -16,3 +16,9 @@ EXTRA_OECONF = "\
   --enable-old-eet-file-format \
   --disable-assert \
 "
+
+PACKAGES =+ "${PN}-utils"
+
+FILES_${PN}-utils = "\
+  ${bindir}/${PN} \
+"
-- 
1.7.8.6



