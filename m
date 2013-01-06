Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmXE-00036i-RM
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:28:58 +0100
Received: by mail-pb0-f46.google.com with SMTP id wy7so9942683pbc.19
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=iXKYQ4YBcEWO0RXsAsgWMcfKplSsnPX6fuZv+S0unRg=;
	b=G1TgcA3sJgKBcx+EWnAXPRytPVXMzj9mckKQdb0V5aIm0t3golsaIpHXRDeWkdzwDm
	9VAumUuv2iSzC6Hg8EIFSS9+VWUmnh5U1xoUBDVuoBrEtuzzowVFQc45n4hoDJG/RsEU
	g94RAzCMPN53JbkM4uJYtlvNd0UwDphH7CZ7sn03IjKBfDyiZYxgpGQip2V6KfwADcAe
	mvHSJFrwWBWvspvaVrMiXolFYPrkh3wzy9gUZlp3/dEsYDDsjY8mdgDKCdsutRTGf646
	pz0kHEABZovNiGuBg3E+WJsVQ3ta30Co8YgXvnEk8uA/Y79/NudTuANwUiUJSGt1fKzZ
	cQQA==
X-Received: by 10.68.241.103 with SMTP id wh7mr177810026pbc.153.1357463624603; 
	Sun, 06 Jan 2013 01:13:44 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:34 -0800
Message-Id: <1357463568-26241-11-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 11/25] cppunit: Upgrade recipes from 1.12.1 -> 1.13.1
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
X-List-Received-Date: Sun, 06 Jan 2013 09:29:04 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/cppunit/cppunit_1.12.1.bb |   16 ----------------
 meta-oe/recipes-devtools/cppunit/cppunit_1.13.1.bb |   11 +++++++++++
 2 files changed, 11 insertions(+), 16 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/cppunit/cppunit_1.12.1.bb
 create mode 100644 meta-oe/recipes-devtools/cppunit/cppunit_1.13.1.bb

diff --git a/meta-oe/recipes-devtools/cppunit/cppunit_1.12.1.bb b/meta-oe/recipes-devtools/cppunit/cppunit_1.12.1.bb
deleted file mode 100644
index 6487a3a..0000000
--- a/meta-oe/recipes-devtools/cppunit/cppunit_1.12.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "CppUnit is a C++ unit testing framework"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/cppunit/cppunit-${PV}.tar.gz"
-SRC_URI[md5sum] = "bd30e9cf5523cdfc019b94f5e1d7fd19"
-SRC_URI[sha256sum] = "ac28a04c8e6c9217d910b0ae7122832d28d9917fa668bcc9e0b8b09acb4ea44a"
-
-inherit autotools binconfig
-
-# Fix a linker ordering problem, we want -ldl *after* -lstdc++
-do_configure_append() {
-	for i in $(find ${S} -name "Makefile") ; do
-		sed -i -e 's:-lm:-lm -ldl:g' $i
-	done
-}
diff --git a/meta-oe/recipes-devtools/cppunit/cppunit_1.13.1.bb b/meta-oe/recipes-devtools/cppunit/cppunit_1.13.1.bb
new file mode 100644
index 0000000..3e525fe
--- /dev/null
+++ b/meta-oe/recipes-devtools/cppunit/cppunit_1.13.1.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "CppUnit is the C++ port of the famous JUnit framework for unit testing. Test output is in XML for automatic testing and GUI based for supervised tests. "
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/cppunit"
+LICENSE = "LGPL-2.1"
+SECTION = "libs"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+SRC_URI = "http://dev-www.libreoffice.org/src/cppunit-${PV}.tar.gz"
+SRC_URI[md5sum] = "fa9aa839145cdf860bf596532bb8af97"
+SRC_URI[sha256sum] = "d5b9f3ffc9f1634d75b20b54f48c02e0817bca6afa1d5160b244889d6bff8e0f"
+
+inherit autotools
-- 
1.7.9.5



