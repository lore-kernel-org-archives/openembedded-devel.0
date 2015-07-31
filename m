Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8622D761DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 14:25:47 +0000 (UTC)
Received: by ykay190 with SMTP id y190so60286107yka.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 07:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6Zde/m1voHfnKuHNVV+WkpPHDxMflwI4/xEOdfKVQ1s=;
	b=APqRKN56x35kwAYZuOI0uriQt4emaiZYPgAfMMvdgjhB86DbX0cfVemkYC4BnNHrEu
	6WATbgKbNvgFsz0rmL4nhaj5H2SFFH707cKp8/iA+q0+yf12cgK6HtEb0rD+I78M1M6o
	R17DUGKHc9XjRzcpUfwoNidL5RP0DUp2mmM2SaG9Q987c1ILtnatM/sXcg2d+aDw3F+F
	uO9k8+3aqiPFNo3vyXeHgncbS+tkcVigSe37QX5h1UjQBrj9iuiiHndVpv5WWXdbnevG
	pGE3VOkNbTLd+70J/1Swvur6kFkXLD4np/j4esxJROUm9S36dQDpzBRNQXmDYlbsc3qN
	4bcQ==
X-Received: by 10.170.216.194 with SMTP id i185mr3611681ykf.80.1438352748212; 
	Fri, 31 Jul 2015 07:25:48 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id l70sm4183057ywe.2.2015.07.31.07.25.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jul 2015 07:25:47 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Jul 2015 07:25:29 -0700
Message-Id: <1438352729-28129-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [=meta-oe][meta-perl][PATCH] libmodule-runtime-perl: update to 0.015
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
X-List-Received-Date: Fri, 31 Jul 2015 14:25:48 -0000

* Convert from Module::Build to ExtUtils::MakeMaker
* Temporarily use github repository until upstream merges change

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 ...ntime-perl_0.014.bb => libmodule-runtime-perl_0.015.bb} | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename meta-perl/recipes-perl/libmodule/{libmodule-runtime-perl_0.014.bb => libmodule-runtime-perl_0.015.bb} (76%)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.014.bb b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.015.bb
similarity index 76%
rename from meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.014.bb
rename to meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.015.bb
index d68ae2a..b92842c 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.014.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.015.bb
@@ -17,19 +17,19 @@ SECTION = "libs"
 HOMEPAGE = "http://search.cpan.org/~zefram/Module-Runtime/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://README;beginline=43;endline=44;md5=62e24a93342fede7221d66335c716f34"
+LIC_FILES_CHKSUM = "file://README;beginline=45;endline=46;md5=62e24a93342fede7221d66335c716f34"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/Z/ZE/ZEFRAM/Module-Runtime-${PV}.tar.gz"
-SRC_URI[md5sum] = "a6597bc25536a30476f0d75b64d35734"
-SRC_URI[sha256sum] = "4c44fe0ea255a9fd00741ee545063f6692d2a28e7ef2fbaad1b24a92803362a4"
+SRCNAME = "module-runtime"
+SRC_URI = "https://github.com/moto-timo/${SRCNAME}/archive/${PV}.tar.gz"
+SRC_URI[md5sum] = "ad6ca179c978aa02ac8aa29244ef9beb"
+SRC_URI[sha256sum] = "59effa82b3f6986d28de6154a8f2428157691004d951f936a81e851f4dbcb045"
 
-S = "${WORKDIR}/Module-Runtime-${PV}"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit cpan_build
+inherit cpan
 
 RDEPENDS_${PN} = " perl-module-test-more \
                    perl-module-strict \
-                   perl-module-build \
 "
 
 BBCLASSEXTEND = "native"
-- 
2.1.0


