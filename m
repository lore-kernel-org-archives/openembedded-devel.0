Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pepka-00088H-3y
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 15:08:04 +0100
Received: by fxm17 with SMTP id 17so5967259fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 06:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=sOhXJ8NfOwZ5wgszlgC8gai7rw5/vJpQvyuk5UgKwBU=;
	b=qb9GEav/eIZLz4902cCKqs+5F4XOX30mVKkdApwoTGH6i+KDAXsBAdPAa88SFA/SBX
	iQBgKxhGA2LRJdgEPEPuqr4v0CXa64GfBBPSrENiJMmEKkuhCFukCqkqrgCuhkMhDLlz
	P+LKOcKKDmWRWYbKd0PLUM32XcUL/RTFaGKZc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=U+IB/yDhBo0vB68A9IKXjXQvjln3zr4XxXErDIt3uQXMNfloLqFVyYyp6dWAq01got
	cpNOvzxbq14vayYVksTObXwFda9iCyCfi8oUL+s4mmV/cTbrScC6WJ8vLahjw6uX8y3U
	MjDxddhvDXbeUXjt4KFVoNQmoZMj/ATGUBTjk=
Received: by 10.223.102.77 with SMTP id f13mr4898768fao.113.1295273246657;
	Mon, 17 Jan 2011 06:07:26 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e17sm1647097fak.10.2011.01.17.06.07.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 Jan 2011 06:07:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jan 2011 15:08:00 +0100
Message-Id: <1295273280-1875-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc2
In-Reply-To: <AANLkTi=pJidryLnDDNjJi0xqcq7UuRc2Xp5oWV=wRkzZ@mail.gmail.com>
References: <AANLkTi=pJidryLnDDNjJi0xqcq7UuRc2Xp5oWV=wRkzZ@mail.gmail.com>
Subject: [PATCH] apr: add version 1.3.12 and fix build with libtool-2.4
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
X-List-Received-Date: Mon, 17 Jan 2011 14:08:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/apr/apr_1.3.12.bb |   36 ++++++++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 recipes/apr/apr_1.3.12.bb

diff --git a/recipes/apr/apr_1.3.12.bb b/recipes/apr/apr_1.3.12.bb
new file mode 100644
index 0000000..60624c9
--- /dev/null
+++ b/recipes/apr/apr_1.3.12.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Apache Portable Runtime (APR) library"
+SECTION = "libs"
+LICENSE = "Apache License, Version 2.0"
+
+SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.bz2 \
+           file://configure_fixes.patch \
+#	   file://cleanup.patch \
+           file://configfix.patch"
+
+SRC_URI[md5sum] = "6f19af60a161480cc16bb6adb9820040"
+SRC_URI[sha256sum] = "cdc5eff894239344cb35e06f10e8d39a5b46d4250750c6c4ac4058ffbfb6ae80"
+
+inherit autotools lib_package binconfig
+
+OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
+
+do_configure_prepend() {
+	cd ${S}
+	echo "top_builddir=@apr_builddir@" >> build/apr_rules.mk.in
+	cp build/libtool.m4 .
+	./buildconf
+}
+
+FILES_${PN}-dev += "${datadir}/build-1/* ${libdir}/apr.exp"
+
+do_install_append() {
+	install -d ${D}${datadir}/apr
+	cp ${S}/build/apr_rules.mk ${D}${datadir}/apr/
+	sed -i s,apr_builddir=.*,apr_builddir=,g ${D}${datadir}/apr/apr_rules.mk
+	sed -i s,apr_builders=.*,apr_builders=,g ${D}${datadir}/apr/apr_rules.mk
+	sed -i s,LIBTOOL=.*,LIBTOOL=\$\(SHELL\)\ ${TARGET_PREFIX}libtool,g ${D}${datadir}/apr/apr_rules.mk
+	sed -i s,\$\(apr_builders\),${D}${datadir}/apr/,g ${D}${datadir}/apr/apr_rules.mk
+	cp ${S}/build/mkdir.sh ${D}${datadir}/apr/
+	cp ${S}/build/make_exports.awk ${D}${datadir}/apr/
+	cp ${S}/build/make_var_export.awk ${D}${datadir}/apr/
+}
-- 
1.7.4.rc2



