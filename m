Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 946F26080F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Aug 2016 08:00:20 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id p129so57593888wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Aug 2016 01:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=7Be+ZCndwWSqXPkElRggZ28yc2iahg6f2PN5VP2OdRk=;
	b=uQy0PDDu3utAWCW1rGoA53iCooMvUS50c4vEgmdSFxLxQSEXqhi/MLdxemPkhgorjK
	Fcb7BcTpbtVY24hbE58I1pt0jdwXi+E7U7XWvRMkxQ5almJz9n4ZVLrBgyYro2INXnFQ
	8U/59j61ZZKoh3MO64cbCOmMRGGIxAWbWgcuBYV/u0Ub01754NHkS2xsl7JNb5h872I1
	8y9aT9Axfz3+xHK+izJO5E4dD5Qf0unM1rWhP7HHGQHrK2/cilrUOGULmQXzBfRsjANN
	fDV4RxQm/hpizyxDg95HLqSAE9WtGUZcrFxTM3RcQTwDpCmO4sC4UbhhaVcDxWmTCvAi
	bB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7Be+ZCndwWSqXPkElRggZ28yc2iahg6f2PN5VP2OdRk=;
	b=LH3217fxU+m2HUFDlOkENAiQbQ8w7hMTJlXVUkI+l+5qJljELB4PxDLxFfpHRKFLLt
	4PNEZZPKuvUkPh53jIIa5sf0l9bbzOd2xLM4jhEOE4rw1uFANqdn1t6cnmTYoi6W45JL
	wATAqBIPWiIWPL83bxbdQo5L0qle8278N59oRCMEFTwcaAvJ/ziDBCkcoPm+9B04eImZ
	l2ZJHyjntPDNb1MT25qkBkdafMq7pqiAw+WVFf3GVUnNPlwZxLEtVaBfPrtm+GBJPb0g
	lOECHbM7S9xeesmOpvVkGNstHXo9qDXZTVr4yns/5kBOrsRNdjB9DszMUMwLrVNOE8/X
	dV2g==
X-Gm-Message-State: AEkoout1y8dUeptI8vrSdk8WjUha7ylCSSX6c1FA9ZgCCQJmJOuE25mDDo05wEuPMh+a0Xfm
X-Received: by 10.28.168.150 with SMTP id r144mr56159333wme.66.1470124819880; 
	Tue, 02 Aug 2016 01:00:19 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id p1sm1270517wjd.37.2016.08.02.01.00.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Aug 2016 01:00:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Aug 2016 09:00:15 +0100
Message-Id: <1470124815-13360-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [RFC][PATCH][meta-oe] ninja: support target builds
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
X-List-Received-Date: Tue, 02 Aug 2016 08:00:22 -0000

Extend the recipe so that it supports target builds.

Signed-off-by: Ross Burton <ross.burton@intel.com>

---

RFC as I've not actually tested that this works on target, I just did it
to silence my world builds. :)

 .../ninja/{ninja-native_1.6.0.bb => ninja_1.6.0.bb}     | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-devtools/ninja/{ninja-native_1.6.0.bb => ninja_1.6.0.bb} (64%)

diff --git a/meta-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb b/meta-oe/recipes-devtools/ninja/ninja_1.6.0.bb
similarity index 64%
rename from meta-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb
rename to meta-oe/recipes-devtools/ninja/ninja_1.6.0.bb
index c00710a..4d6c47e 100644
--- a/meta-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb
+++ b/meta-oe/recipes-devtools/ninja/ninja_1.6.0.bb
@@ -3,23 +3,28 @@ HOMEPAGE = "http://martine.github.com/ninja/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
-DEPENDS = "re2c-native"
+DEPENDS = "re2c-native ninja-native"
 
-inherit native
-
-SRCREV="484c16336f19bd8970bb6e75322d61b92a229899"
+SRCREV = "484c16336f19bd8970bb6e75322d61b92a229899"
 
 SRC_URI = "git://github.com/martine/ninja.git;branch=release"
 
-S="${WORKDIR}/git"
+S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
 
+do_compile_class-native() {
+    ./configure.py --bootstrap
+}
+
 do_compile() {
-    python ${S}/configure.py --bootstrap
+    ./configure.py
+    ninja
 }
 
 do_install() {
     install -d ${D}${bindir}
     install -m 0755 ${S}/ninja ${D}${bindir}/
 }
+
+BBCLASSEXTEND = "native"
-- 
2.8.1


