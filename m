Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS6A-0005dI-39
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:49:43 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so4908028eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=pLJjXtmE2Kbtf8WwwdUA8LsX8UZ1Qw5oV48bOnCsBjk=;
	b=YT9K8nL2JjsipA78syD1v+vTUTAgyHveuvyJUD0nX2fFxbJ2QYG/dEsmwud4RDuvJe
	+/645/ayCx2weazsnYTdMaQApmriNgfSaKg+ibLlMF1w+PiNQjnGPa2p2GvBlyS9oamY
	w4wDIPo02vLdNy008yQYOhgbVkXXYYLR8hKLhwICnfGMFSj8tABfehqoFhgUy2FEagCX
	lSFmcDH3hMt7MgzUAp6jEQEpG05xEMaAwlzNqVjJMeV0Jy3VX3PXgjlTjFHjeKVh4Juj
	Q68Tpd0x9F4pzQPiSpepEXeQFq53QibWT4G8b4vyTHfYqJilAwkJrkln2s310+p2NOU8
	wb2Q==
Received: by 10.14.210.200 with SMTP id u48mr61279351eeo.29.1354048530931;
	Tue, 27 Nov 2012 12:35:30 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w3sm22022767eel.17.2012.11.27.12.35.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:35:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:50 +0100
Message-Id: <370375ec27e1001b9e00cd5ed59da715e994940f.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 13/21] e-wm-theme-b-and-w: add recipe for old default theme b_and_w
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
X-List-Received-Date: Tue, 27 Nov 2012 20:49:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb

diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb b/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
new file mode 100644
index 0000000..f826e10
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "b-and-w theme was default E17 theme before alpha3 and some people still prefers it."
+SECTION = "e/utils"
+DEPENDS = "edje-native"
+RDEPENDS_${PN} = "e-wm"
+LICENSE = "MIT BSD"
+# upstream was asked to include license infor in THEME dir
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit allarch
+
+SRCREV = "${EFL_SRCREV}"
+PV = "0.0+svnr${SRCPV}"
+
+inherit e-base
+
+SRCNAME = "b_and_w"
+SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};protocol=http"
+S = "${WORKDIR}/${SRCNAME}/e"
+
+do_compile() {
+	# unfortunately hardcoded edje_cc in Makefile     
+	sed -i "s#\tedje_cc#\t${STAGING_BINDIR_NATIVE}/edje_cc#g" Makefile
+	make
+}
+
+do_install() {
+        install -d ${D}${datadir}/enlightenment/data/themes/
+        install -m 0644 ${S}/b_and_w.edj ${D}${datadir}/enlightenment/data/themes/
+}
+
+FILES_${PN} = "${datadir}/enlightenment/data/themes/"
-- 
1.8.0



