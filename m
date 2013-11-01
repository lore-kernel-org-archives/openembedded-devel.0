Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7E64A6CCC9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 17:22:43 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id z12so4328800wgg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2013 10:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=j+lBwPfoLU3FnNheASLV2j1Gke+kNt2AqbDpgtEvM1Q=;
	b=Xaj15j6YqOH1+VnBD+iG5cCp5Xjr9qXg2GGgNs+YrOdhXpN87LhdzINuvdX3ZJsFIu
	X4lZXagLOq4Ba7vXE2CFlAjxYv4qARhaK1lqGcL4jHnai+SVqFeoEq5VR0t/FtCizZyw
	R7D9GZviURuX/BeQ236lLQPRgFZXlQmrG4nj4spBusnI0bP8dzTeR01WW7iF4l5a4/Um
	PQZVJaAe12ffovMG9kkiCq6M+bzFj2pXJ6l8tr5XDhgDtSNYvZ04MJv2MqqYkHaQ4uxm
	JVhF5vh31NVX1qkaEFuC5NhwDdbTTMQVq4F3FZah3GFnqeQ5mIwJgKnPVDcxVZN9SBKh
	TP+g==
X-Gm-Message-State: ALoCoQmr1qMpGpOA6AKYvVB3AnEY8rzDydMlrAKjei4/3CaFqr7NhM7pUPiK43hYE+yEIhqimo/6
X-Received: by 10.180.94.38 with SMTP id cz6mr3212946wib.27.1383326564377;
	Fri, 01 Nov 2013 10:22:44 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id gg20sm8227675wic.1.2013.11.01.10.22.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2013 10:22:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Nov 2013 17:22:38 +0000
Message-Id: <1383326558-24008-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] python-mako: use BBCLASSEXTEND instead of native recipe
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
X-List-Received-Date: Fri, 01 Nov 2013 17:22:43 -0000

There isn't a need for a separate native recipe, so use BBCLASSEXTEND and
overrides.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb |    5 -----
 meta-oe/recipes-devtools/python/python-mako_0.7.2.bb        |    3 +++
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb

diff --git a/meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb b/meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb
deleted file mode 100644
index 05479db..0000000
--- a/meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-mako_${PV}.bb
-inherit native pythonnative
-
-DEPENDS = "python-native"
-RDEPENDS_${PN} = ""
diff --git a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
index 9e381f3..1d2bdd7 100644
--- a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
+++ b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
@@ -17,3 +17,6 @@ RDEPENDS_${PN} = "python-threading \
                   python-netclient \
                   python-html \
 "
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.10.4


