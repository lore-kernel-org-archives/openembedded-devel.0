Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7090476FFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2016 02:48:57 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id p65so9486492ywb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2016 19:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UukjycuFhUKcwwW/tMz5zoUNpniujK3hV7kajEAMui8=;
	b=VfOUm++kHjZHwIhZhEtZeDQRdRFwt1+ekSQ61v/wNaiFnMm088+zByFzodv3F+mXra
	wM4UBdZiLQw82mv5pVn49UYLwEjzfISnlrNczxxpXDmUzWEdZBM6JLqWVG3CocE8IC3o
	5b0KhtMLLBqVvLL/rL3FK6kacyEGluABiYWwo9JYp6cu/1RzQGcfbNxGTGR0RFLz8i2X
	AtqTgCvASpq3wrG3kAnesKyy0LwgvfQYSZZ/MDHS6KmkROdNU9HD3ui1Lgmxsf+WV7ao
	e7xa2yTgL7BpAC1SnnXsCHsXBaA2njvBMF5Ci1DzlXdr0OJ8jWzrLYQUhXlQORKTN3C8
	BV7w==
X-Gm-Message-State: AD7BkJIRtTHyCjP9KsubXp9Y0tEkZkCrkfrckHiaI8BvRZYup4ENsLi+iJxefp537fa1qw==
X-Received: by 10.129.132.135 with SMTP id u129mr303335ywf.7.1459997338327;
	Wed, 06 Apr 2016 19:48:58 -0700 (PDT)
Received: from localhost.localdomain ([12.166.78.2])
	by smtp.gmail.com with ESMTPSA id
	d140sm3666112ywb.48.2016.04.06.19.48.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 19:48:57 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2016 22:48:22 -0400
Message-Id: <1459997302-25271-11-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459997302-25271-1-git-send-email-derek@asterius.io>
References: <1459997302-25271-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-perl][PATCH 11/11] libhtml-parser-perl: update to 3.72
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Apr 2016 02:48:57 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{libhtml-parser-perl_3.71.bb => libhtml-parser-perl_3.72.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libhtml/{libhtml-parser-perl_3.71.bb => libhtml-parser-perl_3.72.bb} (70%)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.71.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
similarity index 70%
rename from meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.71.bb
rename to meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
index be0f4b2..9047d9f 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.71.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
@@ -3,14 +3,14 @@ DESCRIPTION = "This package contains the Parser.pm module with friends."
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 
-LIC_FILES_CHKSUM = "file://README;md5=6c3dacf9f405c7483870ab5f148770c3"
+LIC_FILES_CHKSUM = "file://README;md5=b0459e4426b94753b9a9b8a15f1223b8"
 
 DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/HTML-Parser-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "9128a45893097dfa3bf03301b19c5efe"
-SRC_URI[sha256sum] = "be918b3749d3ff93627f72ee4b825683332ecb4c81c67a3a8d72b0435ffbd802"
+SRC_URI[md5sum] = "eb7505e5f626913350df9dd4a03d54a8"
+SRC_URI[sha256sum] = "ec28c7e1d9e67c45eca197077f7cdc41ead1bb4c538c7f02a3296a4bb92f608b"
 
 S = "${WORKDIR}/HTML-Parser-${PV}"
 
-- 
1.9.1


