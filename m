Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id B07E875E80
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 12:17:54 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id k12so7038550lfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 05:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZxKK3twDYuJP8L1n1+FG7Oh+qhficuzj7mvWhkWxcmQ=;
	b=q/Gpt5UDeXX49mq6tbp6/4It5jKUW5XILpxDka5Zr179apAtm/bIZ2P9AUtNja6brn
	Y7/FRFjHPK96gv/RJR5hUvsmhigDCixIAPy/8Zrtx8qVNpm/51Ug5uuqDtYAP/Wi6vDg
	g4SaQGZyG2RsJy2BxRW3NFUsfqc/PsT/wcBlBkWrJkUC+9yEudXRNuJ/rkJZgGYXaKnM
	VGuNuor59zJqXLcb2OaE3mvaKi7cjxr20TaZ80bHVbzNC2tzX4k44YPO3NkYeUxF2qtE
	zEzBqRNWfR1bbs8j5YGnvrppWtVqXiyivVWDYyj4L0bDBoHMe/alDJdlwO8flbfVSOWF
	Lb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZxKK3twDYuJP8L1n1+FG7Oh+qhficuzj7mvWhkWxcmQ=;
	b=GGjRTAkQDcEszGjMsrghMOF9Gvy8hLJjI3HbQ0Zp7vAwugY6Y7IfT4UA9PjKzPXGj4
	W0h+MItY5vcvQZGTroDYAP9q3L9aTEQJdDhzLAS596kJFJsCRyrebvu7ECh408+yxG73
	ggRDQZnDbdG1hcVHgP5x8n/XXPzGnNXMrhR/yf2DxK/DqWCfqor7lfAsgL5v6Sv8OtnA
	psVEbYbUgzd0o7aJ7ctA5rHKmUVhUQNf31O2u80RAwixy76E7XFduBxysv6O/AMr+IyU
	QLsurpHe82/hpzbi17iIBRjgzVoO+BOgdAto0bDpwyoDDgSmcFh1FOyCSt4vFWDxvtC7
	7Uaw==
X-Gm-Message-State: AE9vXwPjiJwD/Eo9Fh0ywwcMDa89MC2jjr8kD1r4IzjZ18Iq7dH7fmPrWPnozlRavLxYCw==
X-Received: by 10.25.25.145 with SMTP id 139mr6510365lfz.117.1473769074549;
	Tue, 13 Sep 2016 05:17:54 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id i80sm3910286lfg.6.2016.09.13.05.17.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Sep 2016 05:17:53 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Sep 2016 14:17:49 +0200
Message-Id: <20160913121749.11771-2-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160913121749.11771-1-ricardo.ribalda@gmail.com>
References: <20160913121749.11771-1-ricardo.ribalda@gmail.com>
Subject: [meta-java][PATCH 2/2] xpp3: Remove bashism
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
X-List-Received-Date: Tue, 13 Sep 2016 12:17:56 -0000

ERROR: xpp3-1.1.3.4.O-r0 do_compile: Function failed: do_compile (log
file is located at
		/var/lib/jenkins/workspace/qt5022-cesium/build/tmp/work/all-poky-linux/xpp3/1.1.3.4.O-r0/temp/log.do_compile.10141)
ERROR: Logfile of failure stored in:
/var/lib/jenkins/workspace/qt5022-cesium/build/tmp/work/all-poky-linux/xpp3/1.1.3.4.O-r0/temp/log.do_compile.10141
Log data follows:
| DEBUG: Executing shell function do_compile
|
/var/lib/jenkins/workspace/qt5022-cesium/build/tmp/work/all-poky-linux/xpp3/1.1.3.4.O-r0/temp/run.do_compile.10141:
108:
/var/lib/jenkins/workspace/qt5022-cesium/build/tmp/work/all-poky-linux/xpp3/1.1.3.4.O-r0/temp/run.do_compile.10141:
Bad substitution
| WARNING: exit code 2 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
		/var/lib/jenkins/workspace/qt5022-cesium/build/tmp/work/all-poky-linux/xpp3/1.1.3.4.O-r0/temp/log.do_compile.10141)

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 recipes-core/xml-commons/xpp3_1.1.3.4.O.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
index bedb8a9f8f55..c3d697821a99 100644
--- a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
+++ b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
@@ -19,7 +19,7 @@ do_compile() {
     mkdir -p build-oe
 
     sourcepath="src/java/api:src/java/builder:src/java/dom2_builder:src/java/mxp1_min:src/java/mxp1_standard:src/java/parser_pool:src/java/sax2_driver:src/java/serializer_impl:src/java/util:src/java/wrapper"
-    findpath="${sourcepath//:/ }"
+    findpath="src/java/api src/java/builder src/java/dom2_builder src/java/mxp1_min src/java/mxp1_standard src/java/parser_pool src/java/sax2_driver src/java/serializer_impl src/java/util src/java/wrapper"
 
     javac -sourcepath $sourcepath -d build-oe `find $findpath -name "*.java"`
 
@@ -33,7 +33,7 @@ do_compile() {
     mkdir -p build-xpath
 
     sourcepath="src/java/xpath"
-    findpath="${sourcepath//:/ }"
+    findpath="src/java/xpath"
     javac -sourcepath $sourcepath -cp build-oe -d build-xpath `find $findpath -name "*.java"`
 
     fastjar -C build-xpath -c -f xpp3-xpath-${PV}.jar .
-- 
2.9.3


