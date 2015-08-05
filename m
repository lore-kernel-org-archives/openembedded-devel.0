Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id CD8956E630
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 04:29:33 +0000 (UTC)
Received: by ykoo205 with SMTP id o205so26262227yko.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Aug 2015 21:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pslEu8jnOb/xRF2G/5fYAbJBJdQPSyzLGjI9Rxi9Pbg=;
	b=nbaeLN+zkTzpraCwg2X2Ak6W9S8PPH9Yv0ofOP0dU9onhoLjutaOIefg5LPDAdCobd
	3lQ2/n0T6R9sOlJiNlWnzo20u/DFTSUcTl5OL9eJ+sGro0LlGDDPXMq58/9LoEBJKfvG
	1JVi34+f1GnPbdSwcY+nl21NsVca1dpsz0o/DbD/DFhrxcNjQJI1gTNwOHP/mEKXQ7/w
	BesfE/qw++2+1Zeg6rgg7dMN3hGwe9Kk4QP7YVHhxjUu3PSH/gvc6quxpwh5+SgHMJKs
	cPg8LAW5IxEAsRRW6ekhjrOBoynbH9LR4oQqQLJNVqSx9SNb3ULq4F/pSxsM2DnpDe9d
	ozzg==
X-Received: by 10.129.96.85 with SMTP id u82mr7676272ywb.35.1438748973670;
	Tue, 04 Aug 2015 21:29:33 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id
	b66sm1686975ywe.14.2015.08.04.21.29.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Aug 2015 21:29:32 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Aug 2015 21:29:15 -0700
Message-Id: <1438748955-10126-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-perl][PATCH] libcapture-tiny-perl: update to 0.30
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
X-List-Received-Date: Wed, 05 Aug 2015 04:29:34 -0000

* drop libmodule-build-perl dependency
* add perl-module-overloading dependency

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 ...capture-tiny-perl_0.24.bb => libcapture-tiny-perl_0.30.bb} | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-perl/recipes-perl/libcapture/{libcapture-tiny-perl_0.24.bb => libcapture-tiny-perl_0.30.bb} (78%)

diff --git a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.24.bb b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.30.bb
similarity index 78%
rename from meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.24.bb
rename to meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.30.bb
index 0237485..3a3f843 100644
--- a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.24.bb
+++ b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.30.bb
@@ -13,11 +13,12 @@ HOMEPAGE = "http://search.cpan.org/~dagolden/Capture-Tiny/"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=37a4918a30ace24395020e5b8c03b83f"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Capture-Tiny-${PV}.tar.gz"
-SRC_URI[md5sum] = "718e9d62c4a27a3207cf8506cb99d846"
-SRC_URI[sha256sum] = "9bcf6f8472f8ea50401536cb070ac0c7770837d155c4d6abe212759863aae065"
+SRCNAME = "Capture-Tiny"
+SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DAGOLDEN/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "7b0fbdbf4199724df1e53fe0b3e2ef4c"
+SRC_URI[sha256sum] = "a3b4e55278757e77d50df0b1a79f42e6e8354b7d41db806da39bf161bee63aea"
 
-S = "${WORKDIR}/Capture-Tiny-${PV}"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit cpan
 
@@ -30,7 +31,7 @@ RDEPENDS_${PN} = " perl-module-scalar-util \
                    perl-module-test-more \
                    perl-module-file-temp \
                    perl-module-lib \
-                   perl-module-build \
+                   perl-module-overloading \
 "
 
 BBCLASSEXTEND = "native"
-- 
2.1.0


