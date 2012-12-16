Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIoG-0007cC-JG
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:19:32 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1966345eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 10:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=xy4Nxhe8gacYQqeZN64+IlEVClX0hyrfNCmqRpm8wLI=;
	b=cas55rQASQqR6OvSkh/GgS0qxpIfB/AgBMqTCK4FZvaEVJYND6cvQQKQy8YadMosIM
	ego9Yvntb70++quh/TK46ORl1IWtk5kTnIWOdzBTSvq7UH4AMm/k4xwRJ837c1hZEh2g
	AUtaI2hIzpo2saA7C06xzZLoJcdFE6BbLxRN+Xgwkx0LNXIxe0CIl3utiEqSFIVzNaC/
	szgRSI6fjigKmZ/qD39E4utIhJXFRm/Yb0o6W86FHE87Y0G1X9sprsgGRKkJaQwLLXf3
	8Rfp1aflJFfvHgh/OURbAfRgKKP+PqbuCxrqvDhc4ucgkPyjHZptmynuI/d0CC8vzllv
	Mu1g==
Received: by 10.14.213.134 with SMTP id a6mr33845043eep.45.1355680720457;
	Sun, 16 Dec 2012 09:58:40 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 44sm23880573eek.0.2012.12.16.09.58.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:58:05 +0100
Message-Id: <c471eaa1fffb514440bebb5ead13fb9fff49fa6d.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 22/26] krb5: import from OE-Classic
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
X-List-Received-Date: Sun, 16 Dec 2012 18:19:32 -0000

From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>

Add building of MIT Kerberos implementation.

The recipe was picked from OE-Classic & updated to new version

Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/krb5/krb5_1.8.5.bb | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/krb5/krb5_1.8.5.bb

diff --git a/meta/recipes-connectivity/krb5/krb5_1.8.5.bb b/meta/recipes-connectivity/krb5/krb5_1.8.5.bb
new file mode 100644
index 0000000..2f497a3
--- /dev/null
+++ b/meta/recipes-connectivity/krb5/krb5_1.8.5.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "A network authentication protocol"
+HOMEPAGE = "http://web.mit.edu/Kerberos/"
+SECTION = "console/network"
+PR = "r0"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${S}/../README;md5=5595a75ae6fab5f825f579a817baa618"
+DEPENDS = "ncurses util-linux e2fsprogs-native"
+
+inherit autotools binconfig perlnative
+
+SRC_URI = "http://web.mit.edu/kerberos/dist/krb5/1.8/krb5-1.8.5-signed.tar"
+
+S = "${WORKDIR}/${PN}-${PV}/src/"
+
+EXTRA_OECONF += " --without-tcl --with-system-et"
+CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regcomp=yes \
+                  ac_cv_printf_positional=yes ac_cv_file__etc_environment=yes \
+                  ac_cv_file__etc_TIMEZONE=no"
+
+CFLAGS_append += "-DDESTRUCTOR_ATTR_WORKS=1 -I${STAGING_INCDIR}/et"
+LDFLAGS_append += "-lpthread"
+
+FILES_${PN}-doc += ${datadir}/examples
+
+krb5_do_unpack() {
+	tar xzf ${WORKDIR}/krb5-1.8.5.tar.gz -C ${WORKDIR}/
+}
+
+python do_unpack() {
+	bb.build.exec_func('base_do_unpack', d)
+	bb.build.exec_func('krb5_do_unpack', d)
+}
+
+do_configure() {
+	oe_runconf
+}
+
+SRC_URI[md5sum] = "48b17caedf19d07d714a8d7a25422c95"
+SRC_URI[sha256sum] = "7d6989efaaf0b3330ce5b329edb1d0bf33250ca78b789fdd117e02c49c238812"
-- 
1.8.0.2



