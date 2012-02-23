Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0b3E-0003sP-GN
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 16:57:48 +0100
Received: by yhfq46 with SMTP id q46so642114yhf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 07:49:26 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.101.119.9 as permitted sender) client-ip=10.101.119.9; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.101.119.9 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.101.119.9])
	by 10.101.119.9 with SMTP id w9mr1157895anm.24.1330012166604 (num_hops
	= 1); Thu, 23 Feb 2012 07:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=tCxKSiJuK2m59qv6PgXZvTs7Y6sVT0aHWTLdTJ//lDw=;
	b=bBS5JkcjExD0oEjcs4GX8OGecWE5K1Vt2aaj0OP8s6PNEMfAnZmhMD7MKXSaSaZzrv
	FSjH0QykqZ57hVXNgW0bFf48YmzjjWH+SGEiuZtIBmMJ3g0TD0t3chIiTsImPTbXTo2O
	YmN5TGPsbP20rOW2OPZqLNNhw5BHQ8ShihNDA=
Received: by 10.101.119.9 with SMTP id w9mr930613anm.24.1330012166500;
	Thu, 23 Feb 2012 07:49:26 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o11sm2730681anl.11.2012.02.23.07.49.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 07:49:25 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 15:49:17 +0000
Message-Id: <50fc468523586eeb1c2d57252bce1afdaa9cb26c.1330012144.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330012144.git.otavio@ossystems.com.br>
References: <cover.1330012144.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 1/1] toscoterm: add
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
X-List-Received-Date: Thu, 23 Feb 2012 15:57:48 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/toscoterm/toscoterm_git.bb |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/toscoterm/toscoterm_git.bb

diff --git a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
new file mode 100644
index 0000000..d31b529
--- /dev/null
+++ b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "A very small and simple terminal emulator"
+SECTION = "x11/applications"
+DEPENDS = "vte"
+RDEPENDS += "glibc-gconv-ibm437"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://main.c;start_line=5;end_line=16;md5=9ae4bf20caf291afa94530026bd15229"
+
+# 0.2 version
+SRCREV = "8586d617aed19fc75f5ae1e07270752c1b2f9a30"
+SRC_URI = "git://github.com/OSSystems/toscoterm.git"
+
+S = "${WORKDIR}/git"
+
+inherit gitpkgv pkgconfig
+
+do_compile() {
+	oe_runmake \
+		CC="${CC}" \
+		CFLAGS="`pkg-config --cflags vte`${CFLAGS}" \
+		LDFLAGS="`pkg-config --libs vte` ${LDFLAGS}"
+}
+
+do_install() {
+	oe_runmake PREFIX="/usr" DESTDIR="${D}" install
+}
-- 
1.7.2.5



