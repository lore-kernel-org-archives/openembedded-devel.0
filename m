Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SjYHl-0003YA-3g
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jun 2012 18:06:37 +0200
Received: by dalh21 with SMTP id h21so75170dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2012 08:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=pdXbFbOWK2W1QwTiaGPfwXi5sn8jSMw5so63+cjZ/j0=;
	b=xXd4WOmcdtoDWVvnunMzJSC1ntYO+dEvFTknbbbZxPgc8lJJkBkqTv/+2ocxnFRbut
	QHx1oJwalzkhysznkuEXvdxQl+PASXZTOYOE0mixhg9pIsgI/OCHL77fRiPI8BZjkRo4
	JRL360+OSZ3ny0lG3WfkQv+9CvgilX3FL7bGXLXjq6M4HaZ8iRMRln+VLBCcHxEGiQic
	V2ENALn4Mw95x42NQFXiFuNeYgmXFlzeSyrnCtFtPz/XP08leXuTo07XQxrjutaamswW
	A3rSTi2xO5jI52EY/knl34HPU5bdlGyFGIYVhixgg8efdFaidmVSit+aiMSvtu6PjpJ5
	I63w==
Received: by 10.68.227.198 with SMTP id sc6mr53094295pbc.138.1340726144003;
	Tue, 26 Jun 2012 08:55:44 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id wf7sm12210523pbc.34.2012.06.26.08.55.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jun 2012 08:55:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jun 2012 08:55:24 -0700
Message-Id: <1340726124-30861-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1340726124-30861-1-git-send-email-raj.khem@gmail.com>
References: <1340726124-30861-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] mini-iconv: Add package recipe
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
X-List-Received-Date: Tue, 26 Jun 2012 16:06:37 -0000

mini iconv can be used to replace GNU libiconv
it does not do all translation but it good for small
systems especially uclibc based

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/mini-iconv/mini-iconv.bb |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/mini-iconv/mini-iconv.bb

diff --git a/meta-oe/recipes-support/mini-iconv/mini-iconv.bb b/meta-oe/recipes-support/mini-iconv/mini-iconv.bb
new file mode 100644
index 0000000..7d5bc68
--- /dev/null
+++ b/meta-oe/recipes-support/mini-iconv/mini-iconv.bb
@@ -0,0 +1,21 @@
+# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "A minimal iconv implementation w/ support for UTF-8, ASCII, ISO-8859-1"
+HOMEPAGE = "http://tinderbox.dev.gentoo.org/portage/local/misc/mini-iconv/"
+LICENSE = "MPL-1.1"
+SECTION = "libs"
+DEPENDS = ""
+PROVIDES = "virtual/libiconv"
+PR = "r0"
+LIC_FILES_CHKSUM = "file://iconv.c;startline=1;endline=6;md5=35af9d9924327fe8a0a1fe3a2cb454c8"
+SRC_URI = "http://mirror.meleeweb.net/pub/linux/gentoo/distfiles/mini-iconv.tar.bz2"
+SRC_URI[md5sum] = "84412221e26505a2b3855d4a1cdcd0e0"
+SRC_URI[sha256sum] = "3552262bf1bcf8e859a2a3a7adfb0367af8593383e730c492e981477aac0a0d4"
+
+
+S = "${WORKDIR}/${PN}"
+
+do_install() {
+	oe_runmake install DESTDIR=${D} PREFIX=${prefix} LIB=${base_libdir}
+}
-- 
1.7.9.5



