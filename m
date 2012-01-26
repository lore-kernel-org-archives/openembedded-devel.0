Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1RqWVS-000529-SQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 22:05:18 +0100
Received: by bkaq10 with SMTP id q10so862876bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2012 12:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=IiUU3V1ZboQmShNWLq52zLYN/TnvPGu2GyaxZOPrn74=;
	b=mJsr7oUrlk0/nFFqOPgyvM1+QrYJbq4mH8pD8+S9dKnVOeOGfb9uIJRKfvnfaQOZBW
	S3a1Yx5pX1+eLftPlQ6x56eXjaNczd6rpgw4pT0mbn+coBOzL2lwfGdFFxUHSkd5SwlO
	/nOohWI/6zcA+31Q7jxyYGbAYy6i8UvnNSWsQ=
Received: by 10.204.150.82 with SMTP id x18mr1836890bkv.51.1327611048957;
	Thu, 26 Jan 2012 12:50:48 -0800 (PST)
Received: from localhost.localdomain (leased-line-46-53-195-130.telecom.by.
	[46.53.195.130]) by mx.google.com with ESMTPS id
	fg16sm11287877bkb.16.2012.01.26.12.50.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 12:50:48 -0800 (PST)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Received: from jek by localhost.localdomain with local (Exim 4.77)
	(envelope-from <jek@jeknote.loshitsa1.net>)
	id 1RqWHN-00020f-00; Thu, 26 Jan 2012 23:50:46 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Jan 2012 23:50:41 +0300
Message-Id: <1327611041-7681-1-git-send-email-yauhen.kharuzhy@promwad.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <20120126054457.GE5566@sakrah.homelinux.org>
References: <20120126054457.GE5566@sakrah.homelinux.org>
Subject: [PATCH v2] Add recipe for krb5
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
X-List-Received-Date: Thu, 26 Jan 2012 21:05:19 -0000

Add building of MIT Kerberos implementation.

The recipe was picked from OE-Classic & updated to new version

Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
---
 meta/recipes-connectivity/krb5/krb5_1.8.5.bb |   39 ++++++++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)
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
1.7.7.6



