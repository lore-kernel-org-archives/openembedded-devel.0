Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 269887754B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jul 2018 09:20:22 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id b8-v6so1172570wro.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jul 2018 02:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=4oN2jyIw+VdcO8+D52SWhj5a+SAHSLJLlsmffiipDtU=;
	b=tnGmpv9uLHRZ7ZQ9wPAFIk4hN3xwd9bYnjF5nvvKFdKIDWiyp/pscBT2Q9aJliKe+K
	dVVhQ9gRBAkNlGz06VXNmrfizaHTd6ej1+H5/U6l6lYHEAcH79X1HkieAJCwlxlDS66z
	MjzgJCUMifrEfgMrYg7QnW1GeADHHADd3lE0dH9lDUSVQBSQYT1/I8Envxmpzw+bItKX
	tdJeyK2OqnoU/9YfG5MPjZup1/BrBjYm9pSpL3/NvHRMu1fjwcF2ccDDstmdqIPlDw++
	npGCNqJWt8sARnrijKJftgp9JuhITqz1ciq6Xa1VpPDUncLDI8H3d4BPO1XdP1iTMvFY
	gq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4oN2jyIw+VdcO8+D52SWhj5a+SAHSLJLlsmffiipDtU=;
	b=pkJbVcgNmCeMQGW7QeyScCoQzKq4sY7387NnG1qDOotlW8IHjF23flNnSLse5JJqzf
	aSdwdzAriXHe1m27jwKKeU0Hg+qDSEKxu96SYTflDVNdHB0NT1gu546pWsp5E3BdgfK5
	vftB4XM08wL0KJuEVnKf/cI/PVFw+Q9hQEzhclJ+Y0lM06X+jFrEXLkotNRlA2TYR49H
	uHZav0iQp2pGfF9JtwJavroXfi3uZYJWbNEp9fq1nTtO92B3dfKkjCrwZQLxllxLe1cM
	PzJnTp7KcwXRIz8umI7GPiSBc06vry7uUSOsgzTyOaiPtr7fxYbl/0ApaPzgEQukByGy
	c80w==
X-Gm-Message-State: APt69E3H/jrxbZTudJmSzWpE/rgpjMqdmSQu+/kqUmqsCfrLxBCzlpZV
	bxLenGvT4qS79HnmPJ3qKrx30a+0
X-Google-Smtp-Source: AAOMgpdSCNFPt4eWaA24U51LhaiUEtKecQ1YkUcVHN90f8FzWtsj/EQWdVvvDuDk2uZDBtrESZelqg==
X-Received: by 2002:adf:9e48:: with SMTP id
	v8-v6mr11843146wre.277.1530609623387; 
	Tue, 03 Jul 2018 02:20:23 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g75-v6sm1041872wmd.38.2018.07.03.02.20.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 02:20:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Jul 2018 10:20:15 +0100
Message-Id: <20180703092018.5018-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/4] phoronix-test-suite: upgrade to 8.0.1
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
X-List-Received-Date: Tue, 03 Jul 2018 09:20:23 -0000

Add a dependency on lscpu as the processor information needs it, and os-release
as that is used to identify the distribution.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../{phoronix-test-suite_7.8.0.bb => phoronix-test-suite_8.0.1.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_7.8.0.bb => phoronix-test-suite_8.0.1.bb} (86%)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.8.0.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.0.1.bb
similarity index 86%
rename from meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.8.0.bb
rename to meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.0.1.bb
index 1f90a71256..b9401f2790 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_7.8.0.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.0.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "console/tests"
 
 SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "850843bd9252823e7e24bc0849773000"
-SRC_URI[sha256sum] = "cd6c869841f28e4ac1e8a5e4cda05fafce9a523a6b4f0f3a47805efd30494d88"
+SRC_URI[md5sum] = "3dc3a0e490e909f188379a9e05fd4780"
+SRC_URI[sha256sum] = "6306549109c7254baf31edb385265b19557b5692217d2dfcf96f6fb17de8e842"
 
 S = "${WORKDIR}/phoronix-test-suite"
 
@@ -29,7 +29,7 @@ do_install() {
 SYSTEMD_AUTO_ENABLE = "disable"
 SYSTEMD_SERVICE_${PN} = "phoromatic-client.service phoromatic-server.service"
 
-RDEPENDS_${PN} += "bash python php-cli"
+RDEPENDS_${PN} += "bash python php-cli util-linux-lscpu os-release"
 
 FILES_${PN} += " \
     ${datadir}/phoronix-test-suite \
-- 
2.11.0


