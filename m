Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 09D9D78049
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 12:06:37 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id g21so2441980lfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 05:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=z+DD3nQPOptpdwTzMnS1WSoBZgvLRnIGibdq60Lp4WY=;
	b=sC8clBok/Ai9kPWEWgU+Uh/v30wY+7kpiBTPt+XH/e+1UH0/Ep0dzGOchPxYZSL/Nd
	Af7var8kuU7/WCS73snll+nBQjZA5HfeEQmKPWPMyea1Vno6tXYwjokjGZikai0A5aju
	Gn+IKc73sYqnnDSnGVSMNYTFFT8mwoW9RuvgcjFb63FXj+bJGlU20T65Ou3hYmd8IPCl
	4JPpjXzl4aPfBVnhYn9aC/mTIvViOOCaeUl5Gx9R6FXHoPlWUscPV/k+lrzbpqNg/9Hv
	fBdGO0i5ZRXC+jpKITLv+1lou5ym50l6CajepWiEyvnT4o+TfqKRxYWst5OfqTift0x8
	8K5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=z+DD3nQPOptpdwTzMnS1WSoBZgvLRnIGibdq60Lp4WY=;
	b=rubmXk+rEwpUeQKS0PnVJ90A+qwDblWMlD1mjWO7FQ25TO6880iUt8RE+p/hLEE/ZU
	24pVHPFA/4jzr9XNpr6ZbWo+zQ0eIq7ptDOOO9xsQfRzFKnjdJbNAf3imi99koDzCwbf
	DvEmmi/xmBBzsu46NKI8YPPmnt3KmwJHD1zPSYhhVqpFtS/3VfCEHNQSlb58GWrxX1Ti
	JD0yAApThJLC0RcYJAGMRaJNUjMg2X6/TkHi3C+fX/OrDgI5ml0kgNYZ8cM1ohm26xBi
	QLA/bbQKMPJpWUrqBDw2bm7+Aw0RQxEvBRNr9bYngXlt9KcRAXFxIdSPjBKvzabWe3fR
	wY3g==
X-Gm-Message-State: AIVw113Kg/sOe04tUFqaVUXY+EvRgTi1m63Frv2ooWaa2h4z/MI6opds
	lVZIi9m48xy7T7Yq
X-Received: by 10.80.175.36 with SMTP id g33mr5823998edd.183.1499861197708;
	Wed, 12 Jul 2017 05:06:37 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.112]) by smtp.gmail.com with ESMTPSA id
	g25sm1058584eda.59.2017.07.12.05.06.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Jul 2017 05:06:36 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jul 2017 14:05:44 +0200
Message-Id: <1499861144-30301-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH] librcf: RDEPENDS on protobuf, json-spirit
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
X-List-Received-Date: Wed, 12 Jul 2017 12:06:38 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

librcf only refers some functions defined in protobuf and json-spirit
headers, but does not link to any protobuf or json-spirit libraries,
so technically librcf does not have runtime dependencies on protobuf
or json-spirit. But we still need set it, or else we are missing
do_package* task dependencies between them, hence will lead
protobuf-dev and json-spirit-dev would not be installed during SDK
populating, when building from sstate(do_package* dependencies
skipped by setscene_depvalid optimization).

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
index 4c9683a..cd7bd34 100644
--- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
+++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
@@ -32,8 +32,8 @@ PACKAGECONFIG[sf-serialization] = "-DLIBRCF_USE_SF_SERIALIZATION=ON,-DLIBRCF_USE
 PACKAGECONFIG[boost-serialization] = "-DLIBRCF_USE_BOOST_SERIALIZATION=ON,-DLIBRCF_USE_BOOST_SERIALIZATION=OFF,boost,"
 PACKAGECONFIG[boost-filesystem] = "-DLIBRCF_USE_BOOST_FILESYSTEM=ON,-DLIBRCF_USE_BOOST_FILESYSTEM=OFF,boost,"
 PACKAGECONFIG[boost-asio] = "-DLIBRCF_USE_BOOST_ASIO=ON,-DLIBRCF_USE_BOOST_ASIO=OFF,boost,"
-PACKAGECONFIG[protobuf] = "-DLIBRCF_USE_PROTOBUF=ON,-DLIBRCF_USE_PROTOBUF=OFF,protobuf,"
-PACKAGECONFIG[json] = "-DLIBRCF_USE_JSON=ON,-DLIBRCF_USE_JSON=OFF,json-spirit,"
+PACKAGECONFIG[protobuf] = "-DLIBRCF_USE_PROTOBUF=ON,-DLIBRCF_USE_PROTOBUF=OFF,protobuf,protobuf"
+PACKAGECONFIG[json] = "-DLIBRCF_USE_JSON=ON,-DLIBRCF_USE_JSON=OFF,json-spirit,json-spirit"
 PACKAGECONFIG[ipv6] = "-DLIBRCF_USE_IPV6=ON,-DLIBRCF_USE_IPV6=OFF,"
 PACKAGECONFIG[custom-allocator] = "-DLIBRCF_USE_CUSTOM_ALLOCATOR=ON,-DLIBRCF_USE_CUSTOM_ALLOCATOR=OFF,"
 PACKAGECONFIG[dll] = "-DLIBRCF_BUILD_DLL=ON,-DLIBRCF_BUILD_DLL=OFF,"
-- 
2.7.4


