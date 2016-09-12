Return-Path: <sujith.h@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id CBA797716F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 08:14:57 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a6so12452721wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 01:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dKWCIFX4hkmc1LGfpty6B1Fka6KEWh/PiBHY61GOVds=;
	b=LHEAafH3HNoeEmZ8Z7RGiUOn6rDU26ZR9pj/xzItmj1ctZUfA/UTOowZXyVVWkd9RG
	D2QgiihdlnRN35rTj0wQk4XfBODWkgF48H3pwfbHK8hMGUTCrWzSlqsgLHFLByA4dzVB
	OHwbg9GZzy4m2mV5Li5LmQOGS20d/8ydHpyTMDYFMnhRfbtNf5ML8UkOubyakmEKzu2M
	kgEI0hrBoXYV5AGsTBorB3GEyrBKkFlg50PdQv0D493Jd0bGD6BeNp3JLAojaN1uUPYd
	J05DLyrBKr1jX8UkVBhH7xnowCCSO61McS1FurD0y3CZlH8S1wvXxe1SCTQ/76+hKM3P
	41eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dKWCIFX4hkmc1LGfpty6B1Fka6KEWh/PiBHY61GOVds=;
	b=fczrOsFS/QohDGFtkJZpaIEI+q3dps5fu4H45+GIe/gEI5D2pC4WsKewYQ4ST0uMyZ
	hZLNYiEt4Ao4s5c6W/U5Tsi66iqMmAaihqNkSOCUkruUJI5F4OTJFVUh0MLIbmc2Qecl
	t3QgDLc8kPyaT4wpxYOb4pDe9xcjquDrIpVqbbf2VKIc5IQh7xRqAZL6ouyL3kOx1hv0
	ibCfXRyQQhgpSJOyJevhxra4d/N54mT0ST/Sz0Ggl9Q7d1M8yW/zUewQxDgJeHemZGgv
	sLGoHBhyP6ePQTRwODeGMGrCSg5JGCfagYVy7yjEPy/xMwmmoLDnjd5TjT7oLSZUq3uv
	fJXg==
X-Gm-Message-State: AE9vXwOc4Ww35bRo6ZytpH1foc45uNyG53O8EmsHI4gnVTUSW3jhXPjXjgn10Pc9vl6lBA==
X-Received: by 10.194.145.229 with SMTP id sx5mr7663840wjb.13.1473668097871;
	Mon, 12 Sep 2016 01:14:57 -0700 (PDT)
Received: from kdekidd0.inp-wifi.mentorg.com ([139.181.35.34])
	by smtp.gmail.com with ESMTPSA id
	de8sm9173381wjc.24.2016.09.12.01.14.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Sep 2016 01:14:57 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Sep 2016 13:44:51 +0530
Message-Id: <1473668091-5615-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-java][PATCH] xpp[23]: fix/remove bashism
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
X-List-Received-Date: Mon, 12 Sep 2016 08:15:01 -0000

From: Christopher Larson <chris_larson@mentor.com>

This was breaking on hosts with dash as /bin/sh.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 recipes-core/xml-commons/xpp2_2.1.10.bb    | 2 +-
 recipes-core/xml-commons/xpp3_1.1.3.4.O.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/xml-commons/xpp2_2.1.10.bb b/recipes-core/xml-commons/xpp2_2.1.10.bb
index d3baca4..c926722 100644
--- a/recipes-core/xml-commons/xpp2_2.1.10.bb
+++ b/recipes-core/xml-commons/xpp2_2.1.10.bb
@@ -19,7 +19,7 @@ do_compile() {
 
     sourcepath="src/java/drivers/jaxp11:src/java/drivers/sax2:src/java/impl/factory:src/java/impl/format:src/java/impl/node:src/java/impl/pullparser:src/java/impl/tag:src/java/intf"
 
-    findpath="${sourcepath//:/ }"
+    findpath="$(echo "$sourcepath" | tr : " ")"
 
     javac -sourcepath $sourcepath -d build-oe `find $findpath -name "*.java"`
 
diff --git a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
index bedb8a9..f264022 100644
--- a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
+++ b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
@@ -19,7 +19,7 @@ do_compile() {
     mkdir -p build-oe
 
     sourcepath="src/java/api:src/java/builder:src/java/dom2_builder:src/java/mxp1_min:src/java/mxp1_standard:src/java/parser_pool:src/java/sax2_driver:src/java/serializer_impl:src/java/util:src/java/wrapper"
-    findpath="${sourcepath//:/ }"
+    findpath="$(echo "$sourcepath" | tr : " ")"
 
     javac -sourcepath $sourcepath -d build-oe `find $findpath -name "*.java"`
 
-- 
1.9.1


