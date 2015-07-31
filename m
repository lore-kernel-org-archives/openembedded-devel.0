Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 59C8C761DA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 05:15:26 +0000 (UTC)
Received: by ykdu72 with SMTP id u72so51351463ykd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2015 22:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=24R3a7/LRivaVmQ+w23iDuHjjErxs1SbjR4RlY//cFk=;
	b=Xul5s57i5T3ECOEp3ipGXfR09Zgo6RvuKQk1EgV8/G6XZ6S2oz6Nc7nHCH+skCw7ln
	uvWcE8s4KdqwaTtAFJyV09PQG7WWUSbJtP/F3ILG47FyZ/ZmtBNdSaaLnBHp2mepTXG5
	NFvq3x48om7Lh4f6fR01qTygo9u/P5levpaTZY1hJ59JJP5IOhLdhjStwzUhVhkBjAaN
	MSvyccqNLUg31/4af3iRB4EjyHpOY9FQ6lhbTCup/7tBf0H5p8SDcmP2xDjUgKplHXQk
	yMyzDNZyB06GOMSDRf3/3ft5oeqU11zsReeojThaufiLB9SPVJe2U+aFduPJdcSw9+Fp
	RwNg==
X-Received: by 10.170.203.215 with SMTP id u206mr1165956yke.116.1438319726751; 
	Thu, 30 Jul 2015 22:15:26 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id
	u78sm3101260ywu.13.2015.07.30.22.15.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 22:15:25 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Jul 2015 22:15:00 -0700
Message-Id: <1438319700-20558-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][meta-perl][PATCH] libextutils-cppguess-perl: update to 0.09
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
X-List-Received-Date: Fri, 31 Jul 2015 05:15:27 -0000

* Builds with ExtUtils::MakeMaker rather than Module::Build
* Author change

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 ...ppguess-perl_0.07.bb => libextutils-cppguess-perl_0.09.bb} | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-cppguess-perl_0.07.bb => libextutils-cppguess-perl_0.09.bb} (76%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.07.bb b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.09.bb
similarity index 76%
rename from meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.07.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.09.bb
index 47e0904..d13cb03 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.07.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.09.bb
@@ -11,16 +11,16 @@ HOMEPAGE = "http://search.cpan.org/~smueller/ExtUtils-CppGuess/"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=81;endline=84;md5=84c0390b90ea8c6702ce659b67bed699"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/S/SM/SMUELLER/ExtUtils-CppGuess-${PV}.tar.gz"
-SRC_URI[md5sum] = "350dd7c661189ea770d6c9354ebbc6c2"
-SRC_URI[sha256sum] = "1cd83ee8452351219b987c79ddb25cc25ee8c396318ba36c5211a92b5c87e7a8"
+SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETJ/ExtUtils-CppGuess-${PV}.tar.gz"
+SRC_URI[md5sum] = "f8ada38ee4ad86a4f1e20d8525ce0c99"
+SRC_URI[sha256sum] = "48625195a88c0f2ddc37bbd7a06346aa68ffb6948ba78da3aea47c0db2540f65"
 
 S = "${WORKDIR}/ExtUtils-CppGuess-${PV}"
 
-inherit cpan_build
+inherit cpan
 
 do_install () {
-        cpan_build_do_install
+        cpan_do_install
 }
 
 RDEPENDS_${PN} = " libcapture-tiny-perl \
@@ -32,7 +32,6 @@ RDEPENDS_${PN} = " libcapture-tiny-perl \
                    perl-module-carp \
                    perl-module-file-temp \
                    perl-module-lib \
-                   perl-module-build \
 "
 
 BBCLASSEXTEND = "native"
-- 
2.1.0


