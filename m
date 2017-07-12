Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id D5F7A78082
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 11:05:32 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k67so4951022wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 04:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=z+DD3nQPOptpdwTzMnS1WSoBZgvLRnIGibdq60Lp4WY=;
	b=IbDXmhDH0QwAYR+JKtP5b2SAA1oVQoLZXphWXbBtqBh666tjwjlXAAzzEFE9o4NfuU
	waRUCAyZ986q2+CxvBkGc7E5cX8XzABb0XCnpBT24MwQf3mqJqRE5/L6S6knjlBMyHsG
	Y6rzxOc8/sotFXci/dZuyVOCR64yzU8moZ5JpNqcqHBvNbKbQrM9EpDpWlMh+tfH04ZZ
	aoFVift933NTOa6RSt63Pj9C9p6HMFyjSDF48iDQ12lB6JQHJKRp0psbxozNIgion5n3
	/HR5uxmwzoBbiGmirCi42wq54qgVfjkjBf2Y3nOf9vt4FVFUFyA6Lp4OACkBma8Va54g
	y9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=z+DD3nQPOptpdwTzMnS1WSoBZgvLRnIGibdq60Lp4WY=;
	b=evZYlX8F/+BPpqINhbAiTEfk9B86SzkY8DKUXeyJaoW+KDzTraq+tlMBW9apUFD7YC
	kfFdA0vEzV/eeSKb3RydukrHBsWAYcwtLkms0czvA3Lm9E95xeqDoiajLFLl2UaeYDg7
	8/M9I/HFVhjsYZxMXl8X5kavgC0/e2AKJbqH9MWFhMSdQrFuBLDpjS6TYfCq2RBuz2Tv
	WVwzIVcrgIwZmG9bzH2E80f5xpgfkGsL2JGcMtZGS1VSCTB894z20sS7NmeLQ8mR8/dz
	95OHBs+2LvQ1Ni/xeYyZe+BjzlLKBkRiK7hLhwD+skrJuBy22qrlGcTmS9H4opqnZdL3
	k4Zg==
X-Gm-Message-State: AIVw1137CjlOO/Qlx4d+AsT6tLL7zJBUi+QAOipCiaAa8tEuR9UeQ1K3
	esOkb2r/I2TtfpLn
X-Received: by 10.28.189.214 with SMTP id n205mr2237363wmf.122.1499857533260; 
	Wed, 12 Jul 2017 04:05:33 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.112]) by smtp.gmail.com with ESMTPSA id
	g63sm1913896wrd.11.2017.07.12.04.05.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Jul 2017 04:05:32 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jul 2017 13:05:24 +0200
Message-Id: <1499857524-11156-1-git-send-email-liu.ming50@gmail.com>
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
X-List-Received-Date: Wed, 12 Jul 2017 11:05:33 -0000

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


