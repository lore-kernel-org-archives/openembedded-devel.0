Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f181.google.com (unknown [74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 94924605B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 13:26:42 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id w61so366173wes.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 06:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MDYEPXZtug491WWkoiD55g1l8rDVgWSfTERrVIm0CAk=;
	b=BLgX40PHb6PxaQDbb+tilCnmKp+aTdLQBdBRDQtUadKKNZbpYFEwxRoGt4uep9b6hq
	W1BSjjztmkcH74EL9Ovqy8osSQLKrYE3WK3p+pxjyv/UpqHLS6aYvfpsT6LCNmVJdu5S
	EewIgFNIpU8ajmYEJWqZnufnTrYE3Swk+R0owbfO8wu4KpKP63fK6G4WINpnlCipVwUv
	e0ZrtReP50cN93Rk/wlTABuV6SXBCvFe0ScNf7LcQud7sfW964rWthWDvSHTO55B9n64
	rNyRTS9ZoWcfpI8e0a0qd+ubFe/3QXnQ9oJQNBn3qi3RmsFot5cUz6uk0pbK6bfywSq3
	vbjg==
X-Gm-Message-State: ALoCoQnEzUMFt989S2aG0RDWvcqQXPcClCDGgcx2apiSZa1880sKp/y9Z4pfUh5B0VnEF4YS0QMe
X-Received: by 10.194.187.50 with SMTP id fp18mr607088wjc.89.1399987144453;
	Tue, 13 May 2014 06:19:04 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id ek4sm21916655wib.9.2014.05.13.06.19.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 May 2014 06:19:03 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 May 2014 14:55:38 +0200
Message-Id: <1399985738-3911-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] rrdtool: fix S!=B failure
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
X-List-Received-Date: Tue, 13 May 2014 13:26:43 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
index 2994df2..df3dc8a 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://oss.oetiker.ch/rrdtool/pub/rrdtool-${PV}.tar.gz \
 SRC_URI[md5sum] = "ffe369d8921b4dfdeaaf43812100c38f"
 SRC_URI[sha256sum] = "956aaf431c955ba88dd7d98920ade3a8c4bad04adb1f9431377950a813a7af11"
 
-inherit autotools gettext pythonnative perlnative python-dir
+inherit autotools-brokensep gettext pythonnative perlnative python-dir
 
 EXTRA_AUTORECONF = "-I m4"
 
@@ -78,11 +78,11 @@ do_configure() {
 	sed -i -e "s:\$(PYTHON) setup.py install:\$(PYTHON) setup.py install \
 	    --install-lib=${D}${PYTHON_SITEPACKAGES_DIR}:" \
 	    -e "s:perl-shared/Makefile.PL Makefile:perl-shared/Makefile.PL:" \
-	    ${S}/bindings/Makefile
+	    ${B}/bindings/Makefile
 
 	#redo the perl bindings
 	(
-	cd bindings/perl-shared;
+	cd ${S}/bindings/perl-shared;
 	perl -I${STAGING_LIBDIR}/perl/$perl_version Makefile.PL INSTALLDIRS="vendor"
 	    INSTALLPRIVLIB="abc";
 	sed -i -e "s| ${libdir}/perl/| ${STAGING_LIBDIR}/perl/|g" Makefile;
@@ -94,9 +94,9 @@ do_configure() {
 
 	#change the interpreter in file
 	sed -i -e "s|^PERL = ${STAGING_BINDIR_NATIVE}/.*|PERL = /usr/bin/perl|g" \
-	    ${S}/examples/Makefile
+	    ${B}/examples/Makefile
 	sed -i -e "s|${STAGING_BINDIR_NATIVE}/perl-native/perl|/usr/bin/perl|g" \
-	    ${S}/examples/*.pl
+	    ${B}/examples/*.pl
 }
 
 PACKAGES =+ "${PN}-perl ${PN}-python"
-- 
1.9.0


