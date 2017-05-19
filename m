Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id F2B9D780D8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 20:01:34 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id y201so69816243qka.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 13:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lUVogxGD0Ro6chhmeK3joXXXKyzwQ6I91Q41UVrZFlc=;
	b=JOuD2aHd++LgvhiW9PW/2ZOCWX0N8tZ7K+8M0utrlIlb/AwtkfOeivYzXTxZvlogkq
	FQbuFTY9WoLkdGk8ICaFqbdWhr02KW614OV4EEsgygstSRduMxypFu+dWysa8uagRdPk
	g821H/22YydQMGqorwr/L039T4FiAo+h3wgmQF6q+KIqueOTraP1V1WT33mdwr1QyFsd
	oiMlnAAslnYo+7sXhlWw3vONzTksHl+QBeZB8HMLrg6B6rQMaOj6mvPl4oACOrmDFp/8
	BAk66ptUeNECbrMFyO6bMPmWh1h9C4jHBmEIiOkPk2brecSDB4ZSB9VT4BB1SgRRJ51D
	6eYA==
X-Gm-Message-State: AODbwcAlABGpBQ95u+tkKg+Z11wLDn4zlP0c1/Vt3WXo5FmUhDobIK11
	iNYjoGrgLqtKIw==
X-Received: by 10.55.150.71 with SMTP id y68mr10165661qkd.193.1495224096039;
	Fri, 19 May 2017 13:01:36 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	e70sm6656023qkj.28.2017.05.19.13.01.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 13:01:35 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 16:01:23 -0400
Message-Id: <1495224083-18887-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libnet-dns-perl: update to version 1.10
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
X-List-Received-Date: Fri, 19 May 2017 20:01:35 -0000

Verified the license remains the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../libnet/{libnet-dns-perl_1.06.bb => libnet-dns-perl_1.10.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.06.bb => libnet-dns-perl_1.10.bb} (70%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.06.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.10.bb
similarity index 70%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.06.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.10.bb
index 3702e4a..c92e265 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.06.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.10.bb
@@ -3,14 +3,14 @@ DESCRIPTION = "This package contains the DNS.pm module with friends."
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 
-LIC_FILES_CHKSUM = "file://README;md5=10b1fae0c40a1627bdf0b2a7ac431632"
+LIC_FILES_CHKSUM = "file://README;md5=92d93d8c5bf22de77578531e283dd219"
 
 DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ed17abd6e7e3ba0a8db42649e34a53ae"
-SRC_URI[sha256sum] = "a3587b780ca36a8255180ac723d4f6e11407504b5b9a18e0ec098a11c218a51e"
+SRC_URI[md5sum] = "4fa45b0dfe79667453c1553e16e52c2a"
+SRC_URI[sha256sum] = "ebe53e7f433138fb9a7845b4edae6b8f4dc227da97eaf6b347584816ec63a525"
 
 S = "${WORKDIR}/Net-DNS-${PV}"
 
-- 
2.7.4


