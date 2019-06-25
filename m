Return-Path: <prvs=072d76755=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 0CECB7D71B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 11:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1561463640; x=1592999640;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=tpfzeYXZybnUXADgLCu359IEpwOh+HSyUDT6sUfMrr0=;
	b=VgqkGwnrsJ4a7kENMX7ZrEPFMJq5osNYsfx7CKXhZBNh8JX5Kx5PezXc
	nshvQPjygnhS9PrcbvoyNNZQaJ/+PAtE1obB8TSKW68lIY8YckLeSw0oQ
	nnPj7fdYxayROSqKmxiCn9etCqjwy8U9gYvVjtfqMLHSalPFODCI7d/2y
	irOm7GVr+x0DtZ6ncNoCkztratse0oEeAzpNP3w6uKCk5869sMGj8KuUY
	d/8iPWfOTsBkfQ+ocPPH28HgPMWtPaBMvke9LP33dkJSCASwqiWzhAOsX
	QvcQBn5l9KtAowAQ6INu2l9MUqkWue/8va0KruHOajkSU8If6cemClyRJ w==;
IronPort-SDR: Lr9sClwcjZqAYvKULPNMSSCEhDMH2q9Zxaj1xB07jwOg/6J9k2kgvCl+I5yDEgAvtNqKK3I/Se
	GqPqfOtmOjCAi7g3Z5PU42QnYJupTk/8GDRLjzR/agXIjPyowc1sevImZLrHKX62NrhNSKO43m
	LJuejvbYoBvtwiMkuY2XGQEb1B91+ZCKC4jF2J7fMkZJ4XjncrSL7FEqMIZb7mlU9qJXSA27Jh
	7fFrPs1G2ZRgurNCS/4e0Rv2yzsB9IMid+ghj9DJEyFyjqp/RdC950tKDZ/52pjevz2EGG2ASp
	USU=
X-IronPort-AV: E=Sophos;i="5.63,415,1557180000"; d="scan'208";a="17958593"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Jun 2019 13:53:24 +0200
Message-ID: <20190625115327.9314-2-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625115327.9314-1-richard.leitner@skidata.com>
References: <20190625115327.9314-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 1/4] cacao: update to latest staging tip 2d6f6c14daf9
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
X-List-Received-Date: Tue, 25 Jun 2019 11:53:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 .../cacao-1.6.1-do-not-rely-on-absolute-paths.patch        | 0
 .../system-boehm-gc.patch                                  | 0
 .../cacao/{cacao_1.6.1.bb => cacao_2d6f6c14daf9.bb}        | 7 ++++---
 3 files changed, 4 insertions(+), 3 deletions(-)
 rename recipes-core/cacao/{cacao-1.6.1 => cacao-2d6f6c14daf9}/cacao-1.6.1-do-not-rely-on-absolute-paths.patch (100%)
 rename recipes-core/cacao/{cacao-1.6.1 => cacao-2d6f6c14daf9}/system-boehm-gc.patch (100%)
 rename recipes-core/cacao/{cacao_1.6.1.bb => cacao_2d6f6c14daf9.bb} (89%)

diff --git a/recipes-core/cacao/cacao-1.6.1/cacao-1.6.1-do-not-rely-on-absolute-paths.patch b/recipes-core/cacao/cacao-2d6f6c14daf9/cacao-1.6.1-do-not-rely-on-absolute-paths.patch
similarity index 100%
rename from recipes-core/cacao/cacao-1.6.1/cacao-1.6.1-do-not-rely-on-absolute-paths.patch
rename to recipes-core/cacao/cacao-2d6f6c14daf9/cacao-1.6.1-do-not-rely-on-absolute-paths.patch
diff --git a/recipes-core/cacao/cacao-1.6.1/system-boehm-gc.patch b/recipes-core/cacao/cacao-2d6f6c14daf9/system-boehm-gc.patch
similarity index 100%
rename from recipes-core/cacao/cacao-1.6.1/system-boehm-gc.patch
rename to recipes-core/cacao/cacao-2d6f6c14daf9/system-boehm-gc.patch
diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao_2d6f6c14daf9.bb
similarity index 89%
rename from recipes-core/cacao/cacao_1.6.1.bb
rename to recipes-core/cacao/cacao_2d6f6c14daf9.bb
index 1074ff5..91a03fc 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_2d6f6c14daf9.bb
@@ -10,13 +10,14 @@ PROVIDES_class-native = "virtual/java-native"
 DEPENDS = "zlib libtool classpath virtual/javac-native bdwgc"
 RPROVIDES_${PN} = "java2-runtime"
 
-SRC_URI = "http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-${PV}/cacao-${PV}.tar.xz \
+SRC_URI = "https://bitbucket.org/cacaovm/cacao-staging/get/${PV}.zip \
            file://system-boehm-gc.patch \
            file://cacao-1.6.1-do-not-rely-on-absolute-paths.patch \
 "
+S = "${WORKDIR}/cacaovm-cacao-staging-${PV}"
 
-SRC_URI[md5sum] = "2c18478404afd1cffdd15ad1e9d85a57"
-SRC_URI[sha256sum] = "eecc8bd1b528a028f43d9d1d0c06b97855bbf1d40e03826d911ebbc0b6971e12"
+SRC_URI[md5sum] = "5157d0bb9eb1332f7a6b6186eaac01aa"
+SRC_URI[sha256sum] = "34b51d660d69c2a83225fd75eab5e1fac002fb5974cb4a74b7478baf923a76cd"
 
 inherit java autotools-brokensep update-alternatives pkgconfig distro_features_check
 
-- 
2.20.1


