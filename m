Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 33EB96CFFE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 10:55:52 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id hm11so3602757wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 02:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=j+lBwPfoLU3FnNheASLV2j1Gke+kNt2AqbDpgtEvM1Q=;
	b=cdFmXtm+vc5eVJaWUNpl+cThHgU5TXbq0DmauZZl6O/u3kNJWk3pqjR/4Aj9DtUALm
	ItR8ZbbjkPYSrhrFmz29xCaQ8l8jSZIog6NF4JZVHi5570CtSaoz/3idKkqcrYHIhZJz
	K8A0f4LXrytt0BDKegoU9Oz5CffklKRGPAWmw8STti2xzvPR82OZVquMtqfoUOdoknOl
	Z0i7ii5O5Q/zI31j3toMWMfsCrbOlgOp3F8TSV9yM6cssMWEqYTHS1184kjNT0nnwCEK
	X6Vwy5xe/FSvCq+nNF4VrFx7SLhkXxL1xPjHKNIh43GjRpwoCh7Yvq1f1+DIxkvIEG5M
	X05g==
X-Gm-Message-State: ALoCoQlsOAoUQM8NgAiH5LzAvzMohoEv3UlaJQdqy75ZV1QuK896yQrGCoYDUgyfVqLscg3PrLSO
X-Received: by 10.194.94.167 with SMTP id dd7mr964046wjb.43.1384772153337;
	Mon, 18 Nov 2013 02:55:53 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dn2sm22974426wid.1.2013.11.18.02.55.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 02:55:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Nov 2013 10:55:40 +0000
Message-Id: <1384772140-11095-1-git-send-email-ross.burton@intel.com>
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
X-List-Received-Date: Mon, 18 Nov 2013 10:55:53 -0000

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


