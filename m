Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 690866AC37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 13:03:31 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id 6so348916991qgy.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 05:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id;
	bh=w3IGpes+DQbKo/vzmKFsOhqa94oq2LQjsJP/aogQdJ0=;
	b=kIUyARjd1s58hauxkue7Lyccbg4ESRJXAfKjMdL562udBJEErTTlZ0h8SVhnKv6zDJ
	JttWw+UmMVFrNtp65KUE7YlcUtHN7znFJhr+E192pQBCv8FYZAUn1meHiubzg41Zgyvr
	6UhBEakgJY7NLJKnok6f7SgZXqoF2FD4kf7ngDVPIij1p2XhL2E4EI2Vqu+vpgF9wnjL
	45YfAICmaCEPMRxbgNPO9xylQhLrTVHBbltt+d1ibYjl44HsiFQnmGIsBw4mtePT0S1H
	+LU2ars8AX6/q9wYD2cZTCFKpOTqonS++ZEPp4wzlTEAd4Ui2Abyq4jdSS6zUOcHkWKz
	oNeg==
X-Received: by 10.140.150.129 with SMTP id 123mr119172883qhw.14.1452603811516; 
	Tue, 12 Jan 2016 05:03:31 -0800 (PST)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	a66sm47553134qkb.20.2016.01.12.05.03.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Jan 2016 05:03:31 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jan 2016 08:03:23 -0500
Message-Id: <1452603803-3817-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] jq: upgrade to 1.5
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
X-List-Received-Date: Tue, 12 Jan 2016 13:03:31 -0000

update source url and checksums
license checksum update since trailing whitespace removed upstream
disable-maintainer-mode to avoid bison > 3.0 dependency
---
 meta-oe/recipes-devtools/jq/{jq_1.4.bb => jq_1.5.bb} | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/jq/{jq_1.4.bb => jq_1.5.bb} (59%)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.4.bb b/meta-oe/recipes-devtools/jq/jq_1.5.bb
similarity index 59%
rename from meta-oe/recipes-devtools/jq/jq_1.4.bb
rename to meta-oe/recipes-devtools/jq/jq_1.5.bb
index 6e50803..a3c171e 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.4.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.5.bb
@@ -7,16 +7,17 @@ BUGTRACKER = "https://github.com/stedolan/jq/issues"
 SECTION = "utils"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=244a1fb9cf472474a062d67069dec653"
+LIC_FILES_CHKSUM = "file://COPYING;md5=29dd0c35d7e391bb8d515eacf7592e00"
 
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "http://stedolan.github.io/${BPN}/download/source/${BP}.tar.gz \
+SRC_URI = "https://github.com/stedolan/${BPN}/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "e3c75a4f805bb5342c9f4b3603fb248f"
-SRC_URI[sha256sum] = "998c41babeb57b4304e65b4eb73094279b3ab1e63801b6b4bddd487ce009b39d"
+
+SRC_URI[md5sum] = "0933532b086bd8b6a41c1b162b1731f9"
+SRC_URI[sha256sum] = "c4d2bfec6436341113419debf479d833692cc5cdab7eb0326b5a4d4fbe9f493c"
 
 inherit autotools
 
 # Don't build documentation (generation requires ruby)
-EXTRA_OECONF = "--disable-docs"
+EXTRA_OECONF = "--disable-docs --disable-maintainer-mode"
-- 
1.9.1


