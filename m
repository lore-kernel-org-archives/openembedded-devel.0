Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id C5C5573694
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 12:52:16 +0000 (UTC)
Received: by qgeu79 with SMTP id u79so31132464qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 05:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization;
	bh=5/Bk1wjjoMN4ngbBu89h9eJuzwl1XE2Al1AHQyEUZwA=;
	b=AYc2mRAeBNdF+974rTTY/4BDW00yxUnbSvGQGS68G6SRQmlyWR6xOHWFHZppodFYW1
	/k3BY514tCBTAkz6orq9gShzd9PTkKeGEsKFam84IGnTsIULDqut3cUaz2cgEG+5t2O2
	KckxTp5Qep3gUivJYoTNDTJaYGvUYdOKVxubDnPPPA2FJKYCBPpTyK4oeTyeTTFgDt2l
	9kZvK7uhBYzgh462vudLUbSI6+dAJb7rGukBvpRmv8yJoyrfo7vNB7cr8xGnCmnC3Fnb
	+EtILPc2nkZ+iIBZLBYpAkdfwQWzdi2B/G32COFD74+MEF4CJ8Rwy2fa+yE6H1Mq7vL3
	/oYg==
X-Received: by 10.140.92.241 with SMTP id b104mr5870508qge.55.1437483136632;
	Tue, 21 Jul 2015 05:52:16 -0700 (PDT)
Received: from localhost ([179.105.243.19]) by smtp.gmail.com with ESMTPSA id
	o3sm12683982qga.36.2015.07.21.05.52.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jul 2015 05:52:15 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 21 Jul 2015 09:52:10 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jul 2015 09:51:55 -0300
Message-Id: <1437483116-22509-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.4.6
In-Reply-To: <1437483116-22509-1-git-send-email-otavio@ossystems.com.br>
References: <1437483116-22509-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v2 3/4] glmark2: Convert recipe to fetch from Git
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
X-List-Received-Date: Tue, 21 Jul 2015 12:52:18 -0000

The development has been moved for github thus it makes sense to use
this, instead of the tarball.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../glmark2/{glmark2_2014.03.bb => glmark2_git.bb}                | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-benchmark/glmark2/{glmark2_2014.03.bb => glmark2_git.bb} (83%)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_2014.03.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
similarity index 83%
rename from meta-oe/recipes-benchmark/glmark2/glmark2_2014.03.bb
rename to meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 708b6d2..57acad5 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_2014.03.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -13,10 +13,12 @@ DEPENDS = "libpng12 jpeg virtual/libx11"
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
+PV = "2014.03+${SRCPV}"
 
-SRC_URI[md5sum] = "739859cf57d4c8a23452c43e84f66e56"
-SRC_URI[sha256sum] = "bded41aaf918ce062d9b81e42cc5be943e6a80bc4ff9d046983b96102c3df6b5"
+SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https"
+SRCREV = "fa71af2dfab711fac87b9504b6fc9862f44bf72a"
+
+S = "${WORKDIR}/git"
 
 inherit waf pkgconfig distro_features_check
 
-- 
2.4.6


