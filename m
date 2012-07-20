Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ss5nF-0005hh-KX
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jul 2012 07:30:25 +0200
Received: by ggnp4 with SMTP id p4so3370383ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 22:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=m0hZdHt3Pvnzldxy4UCzWi6403H626dDXPlDjEMAp7o=;
	b=zVjItxle/IlO0AtLo3L4leD5VyP1qj6XQn10VWpOlA6vAyzlEEhbv7SGqiK8fdwmOt
	6z+i5trEbjUhw9ve9LDYFVlZBhhWpBpdh+QXvPDWQQ3LOI8v04DPQUl0OPyn30tptSWT
	dD2htbrMxOPCCeM7+9iEuibC3Houh2jOOk4DIk0p0lFoCGC/1La4zoUeAPLTVYC7Qqjb
	YsQfddi1w1PfBIWYGQ4+HQkY8zMVM2L8prb2xtwBVxWcAQ8ub0o1ZQXW3vj+td2mKF9N
	LksYLTD+LdBoHhIEP2Ui/sBpRQVk08X/Wz3KYlWvREnW6xqsli0yrfvPhXmYYPjvsFPl
	9GVw==
Received: by 10.66.83.39 with SMTP id n7mr8582003pay.82.1342761542353;
	Thu, 19 Jul 2012 22:19:02 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ng8sm3217474pbc.13.2012.07.19.22.19.00
	(version=SSLv3 cipher=OTHER); Thu, 19 Jul 2012 22:19:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 22:18:55 -0700
Message-Id: <1342761538-19890-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1342761538-19890-1-git-send-email-raj.khem@gmail.com>
References: <1342761538-19890-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-java][PATCH 2/5] hsqldb: Add recipe
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
X-List-Received-Date: Fri, 20 Jul 2012 05:30:25 -0000

Fixes

ERROR: Nothing PROVIDES 'hsqldb' (but
meta-java/recipes-core/xml-commons/jaxme_0.5.2.bb
DEPENDS on or otherwise requires it)
ERROR: Required build target 'jaxme' has no buildable providers.
M

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-core/hsqldb/hsqldb_1.8.0.10.bb |   40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 recipes-core/hsqldb/hsqldb_1.8.0.10.bb

diff --git a/recipes-core/hsqldb/hsqldb_1.8.0.10.bb b/recipes-core/hsqldb/hsqldb_1.8.0.10.bb
new file mode 100644
index 0000000..e886ae4
--- /dev/null
+++ b/recipes-core/hsqldb/hsqldb_1.8.0.10.bb
@@ -0,0 +1,40 @@
+DESCRIPTION = "Lightweight 100% Java SQL Database Engine"
+# BSD-like
+LICENSE = "HypersonicSQL"
+
+AUTHOR = "HSQLDB Development Group"
+HOMEPAGE = "http://hsqldb.org"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/hsqldb/hsqldb_1_8_0_10.zip"
+
+S = "${WORKDIR}/${PN}"
+
+inherit java-library
+
+DEPENDS = "fastjar-native servlet2.4"
+
+do_compile() {
+  # Build instructions according to build/buildJDK14.bat
+        mkdir -p classes
+
+        oe_makeclasspath cp -s servlet-api-2.4
+
+        javac -sourcepath src -cp $cp -d build `find src -name "*.java" -and -not -wholename "*test*"`
+
+        mkdir -p classes/org/hsqldb/util
+        mkdir -p classes/org/hsqldb/util/sqltool
+        mkdir -p classes/org/hsqldb/resources
+
+        cp src/org/hsqldb/util/*.gif classes/org/hsqldb/util/
+        cp src/org/hsqldb/util/*.png classes/org/hsqldb/util/
+        cp src/org/hsqldb/util/*.properties classes/org/hsqldb/util/
+        cp src/org/hsqldb/util/sqltool/*.text classes/org/hsqldb/util/sqltool/
+
+        cp src/org/hsqldb/resources/*.properties classes/org/hsqldb/resources
+
+  fastjar -C classes -c -f ${JARFILENAME} .
+}
+
+SRC_URI[md5sum] = "17410483b5b5f267aa18b7e00b65e6e0"
+SRC_URI[sha256sum] = "d30b13f4ba2e3b6a2d4f020c0dee0a9fb9fc6fbcc2d561f36b78da4bf3802370"
+
-- 
1.7.9.5



