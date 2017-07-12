Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3650A77E88
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 15:56:15 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id g21so3463593lfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 08:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=z+DD3nQPOptpdwTzMnS1WSoBZgvLRnIGibdq60Lp4WY=;
	b=vCwoOxTh7OpJEKdZrZCEENFTs1UvN3j9NLuzUyUrObeBDQOb3fK9zLbPNkdwyDQWls
	1+knJzyNk1wHf6gJmC3E0umcEjWSoZpddL9zNsQSO5CURBwmE8asJK2Sl+pwce88TuhS
	XQDFCqsmbjbmE1EhaAvgapBEWyCYjudc+ol9Vppts5OsMYNJduptmyGayP4+5ld7Jqmx
	aDGgMa52SkfHQr6YrfG1nrRhZzVcOxollkeo7bDdNYWaPEIyCWpEII9t/nm1Fg1Af7sI
	sv4qc222sRWA1RkCOBN3OhFWvxc9FCADOEp2E7WpqcztGzniU79lbwbWAV7TdfH1WVin
	iGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=z+DD3nQPOptpdwTzMnS1WSoBZgvLRnIGibdq60Lp4WY=;
	b=cmmZIFdnny/WUKsgc04PhllCLYiwQz2metsOglqGWuISZzvnH1IU2d5kVXqIkUYeda
	zeP/O/FKv+7Pil5gDQ1sh/2mPWNEKFwlsKaFWpgvwmP309rAvuQc3KicW9TNfuvAgXrC
	lYp//PBMTyagn/P5638jdqYoxx8RY9uqAhnruyWsdnMv/lZVPExTvkgmjrks8PHtZ0/v
	G4PWxapXs6d1VOKKnSK8kMJRj7RJu8kPl+aAqunYi/3tAL7NRNN9+bmgfqfrNrv6gQRj
	tYf5y524jKCfEtDnOUrEs+/wgGm31jqVkxjDSvco04gDWCrdh3EecmyfsCSA4dTz12+A
	SZ9w==
X-Gm-Message-State: AIVw112z7zto4pc64qzso1hR+wQBJY+0LfL/YgmHoLE6yaMFoGnXtWCM
	7b/3RV18Gx7V5upr
X-Received: by 10.80.170.218 with SMTP id r26mr6671143edc.113.1499874976506;
	Wed, 12 Jul 2017 08:56:16 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.112])
	by smtp.gmail.com with ESMTPSA id 2sm2080801edt.36.2017.07.12.08.56.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Jul 2017 08:56:15 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jul 2017 17:56:04 +0200
Message-Id: <1499874964-6155-1-git-send-email-liu.ming50@gmail.com>
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
X-List-Received-Date: Wed, 12 Jul 2017 15:56:17 -0000

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


