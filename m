Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 36249605B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 08:24:37 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u56so4269368wes.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 May 2014 01:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dayjebzSTEl7C9rNuL9/uP+4WkT2BFv9tds6kD52fKA=;
	b=CicV0GB2zYoJlsS+NCuvmjul62dKoTUFA+DZpav2x2L8fRnP9w3B/TnHwoCRDsT0cv
	fUVsOfJq38Cpf2C+wgjqGUUTxaHH7AaMuhYYrjCG5wNfIOl1/Xoe618cIxLdS7mJEobG
	g5eqHg5NUE3dmzYfPgIaNTmknXfYc0TuB3GKpema7/wLwJiv/u1KFIxsgJ0H3vYAxpoe
	3nKazeTjsVE1SEi2xN9D5Iy11cPYH+QEl4SduBTFhhSwFBK0TztMs8xXM2xvxyEmz7PO
	VUi49IKx8fyZDmMPxFjR59wlnXvGOXrAPNl8dYZJNjK+T1gyV2YlEjww8qzhlokzhJ/F
	HIUg==
X-Gm-Message-State: ALoCoQkceC+pS/myDB0mD1WD6rLXzavDeocgwtAXIFkXduUV8pQtYchYdzzVa2FFTcQlYY+zToyi
X-Received: by 10.194.77.50 with SMTP id p18mr97349wjw.68.1399019078089;
	Fri, 02 May 2014 01:24:38 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id u1sm1030808wjx.16.2014.05.02.01.24.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 May 2014 01:24:37 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 May 2014 10:24:35 +0200
Message-Id: <1399019075-15195-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCHv3] git: fix perl binding installation
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
X-List-Received-Date: Fri, 02 May 2014 08:24:41 -0000

Git.pm wasn't ending up in the package because do_install removed it
with a misleading comment about multilib. Workaround the problem so
that Git.pm ends up in the correct dir *and* doesn't get deleted.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-devtools/git/git.inc | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 73e11eb..c6ff843 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -23,15 +23,22 @@ do_compile_prepend () {
 	rm -f perl/perl.mak
 }
 
+# The perl portion fails with -j16
+PARALLEL_MAKEINST = ""
+
 do_install () {
 	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
 		template_dir=${datadir}/git-core/templates \
 		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
 
+	cd ${B}/perl && oe_runmake install DESTDIR="${D}" bindir=${bindir}
+
 	# ${libdir} is not applicable here, perl-native files are always
 	# installed to /usr/lib on both 32/64 bits targets.
+	# Fix up build paths and point to target locations.
+	mv ${D}${exec_prefix}/lib/perl-native/perl ${D}${exec_prefix}/lib/perl
+	sed -i -e s:${D}::g ${D}${exec_prefix}/lib/perl/*/auto/Git/.packlist
 	rm -rf ${D}${exec_prefix}/lib/perl-native
-	rmdir ${D}${exec_prefix}/lib || true
 }
 
 PERLSEDFIXUP = " \
@@ -75,6 +82,7 @@ PERLTOOLS = " \
 PACKAGES =+ "${PN}-perltools"
 FILES_${PN}-perltools += " \
     ${PERLTOOLS} \
+    ${prefix}/lib/perl \
     ${datadir}/perl \
 "
 RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path liberror-perl findutils"
-- 
1.9.0


