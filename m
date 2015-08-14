Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF3976707
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 04:15:44 +0000 (UTC)
Received: by ykaz130 with SMTP id z130so59656911yka.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 21:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4gkNXFLYPhjoGqKSK+iOTcEeX87dpha3JGR3a3KDzl4=;
	b=088wkuAhAvixDaW0WpmY5MVuG9hud3NtXYr7A7vcIlkXhuFPd3G1gGejv86Pg+Z3dL
	pi55yEyMr0u6Xh6CsLr4HHkjkSH3FfLIc0G4GW4WciheAiFQD1oTVpEySi7sc/ZKPRwm
	la/hTnN0PyaL3RjbLriTaKDSDuISDHEinaqHt7RU7vl/4PBWXBb6QtPgPKw+vg2i1ysP
	pVXF7empfJnE1u1sWIu3x8i7DQcdPWYg9etT5R6qV/E3V++vFfxgicSD+ka2q775fLNJ
	GX5gCofstgOfEJWl2LNMpPQBtVRNHsDA+1Z1TCaRFmRz3KfuGuGZ/FKahm8Zo9ths/a0
	OMFg==
X-Received: by 10.170.163.6 with SMTP id f6mr43254313ykd.5.1439525744719;
	Thu, 13 Aug 2015 21:15:44 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id
	y203sm4178494ywy.23.2015.08.13.21.15.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Aug 2015 21:15:44 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2015 21:15:26 -0700
Message-Id: <1439525726-31582-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-perl][PATCH] libextutils-parsexs-perl: add 3.24 recipe
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
X-List-Received-Date: Fri, 14 Aug 2015 04:15:45 -0000

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libextutils/libextutils-parsexs-perl_3.24.bb   | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.24.bb

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.24.bb b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.24.bb
new file mode 100644
index 0000000..1566f75
--- /dev/null
+++ b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.24.bb
@@ -0,0 +1,47 @@
+SUMMARY = "ExtUtils::ParseXS - converts Perl XS code into C code"
+DESCRIPTION = "\"ExtUtils::ParseXS\" will compile XS code into C code by \
+embedding the constructs necessary to let C functions manipulate Perl \
+values and creates the glue necessary to let Perl access those functions. \
+The compiler uses typesmapes to determine how to map C function parameters \
+and variables to Perl values."
+
+SECTION = "libs"
+
+HOMEPAGE = "http://metapan.org/release/ExtUtils-ParseXS/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=121;endline=130;md5=10ddb3a673b4c732022ac899968ea9cc"
+
+SRCNAME = "ExtUtils-ParseXS"
+SRC_URI = "${CPAN_MIRROR}/authors/id/S/SM/SMUELLER/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "e6be3f1d493e04ed805576104cf4328b"
+SRC_URI[sha256sum] = "30b60b8208fc9b7746ed934b678bb9618a8f28994dae8774548353a7b550371e"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} = " perl-module-carp \
+                   perl-module-cwd \
+                   perl-module-dynaloader \
+                   perl-module-extutils-cbuilder \
+		   perl-module-extutils-makemaker \
+                   perl-module-file-basename \
+                   perl-module-file-spec \
+		   perl-module-lib \
+                   perl-module-symbol \
+                   perl-module-test-more \
+"
+
+RPROVIDES_${PN} += " libextutils-parsexs-constants-perl \
+                     libextutils-parsexs-countlines-perl \
+                     libextutils-parsexs-eval-perl \
+                     libextutils-parsexs-utilities-perl \
+                     libextutils-typemaps-perl \
+                     libextutils-typemaps-cmd-perl \
+                     libextutils-typemaps-inputmap-perl \
+                     libextutils-typemaps-outputmap-perl \
+                     libextutils-typemaps-type-perl \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.1.0


