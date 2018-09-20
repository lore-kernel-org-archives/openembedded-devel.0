Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 076A5745AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Sep 2018 22:37:15 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u12-v6so10943147wrr.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Sep 2018 15:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xvukoEL5WrhZHXBOAxDX5oUwgdWjubATxrtUz5K9nYM=;
	b=hi9tPubWBZ/+eAbGYfKRSKWoF22vknKQHPsYhX60kRITWpjyasOpIZjNarQNV042t/
	LWAWeq4o2P7LxicEQ8x7i2/gOldENfT05FMuH0nhrRdZhMxopBvnXgLJcHtW5Ai9PkiX
	0hMHv25CmzLkL+j2PZZDBoeFdLZqOQwoJignEvCcdBiXNh0V1Oc/8baSB9pUqlspmD0n
	NZLhIEdZ85XTQaaMM3CzVIN6K4g8+koMjRPq86BLAnivwfTES0/UDD8tH7hZfaPTl6nw
	wc8eYtdWlD/ZkKDKMPJd8XwS1DAr3Vyk3Uh/JC15vREotJiQka85CGy9WXVojiUfVFfj
	gXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xvukoEL5WrhZHXBOAxDX5oUwgdWjubATxrtUz5K9nYM=;
	b=DHaSjOq8Qrz9NmpU0c6mIj7Gp/Zb7dV6Fk1qRlxvj2YpzC9gk051TCMf/J28lEe16j
	2yCJuvCUwb6rBQ3zxIDSSQhPvFt88b8Pnb6xb9aIRAewxgPgscYKI8GrpXkVa8dlgIra
	uaqhvbP7lay1XNB3uprbs+iGar112woXG+p8Sv/LCfGS/9W+QBxnZUUsTNbpwSD17V/w
	STk7OvCBCzRmSohbnm5aZCrT38h8E7ls8GS4JmaUOxvT/aNABHkZl55NQom3PI60EPUp
	e2fFF5HfcuXxNYJfA7muHwV5P8EmgYEbT4SycQxGsTl2i+g0UdpkA9EEeG8OvFPVN78l
	1izw==
X-Gm-Message-State: ABuFfoixNFQqbIu83Xwwjf0/3fDD/cacJ07Uu4PD120ECmZ1jLjOqAwj
	VyR8sBLOrLVGtWG4AbCxGYPJk02v
X-Google-Smtp-Source: ACcGV61HaHsS9ag0pnB6R7owCjztY9gnHbj/zdsnks5w45/VFhMZ7cLBZ1ddlDz5SiKZJpm2mcSaAA==
X-Received: by 2002:a5d:6209:: with SMTP id y9-v6mr115619wru.179.1537483036235;
	Thu, 20 Sep 2018 15:37:16 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b124-v6sm2053572wmg.47.2018.09.20.15.37.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 20 Sep 2018 15:37:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Sep 2018 22:37:12 +0000
Message-Id: <20180920223712.5107-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python-thrift: set downloadfilename to prevent conflicts with thrift itself
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
X-List-Received-Date: Thu, 20 Sep 2018 22:37:16 -0000

* I was building thrift-0.9.3 from meta-oe and do_fetch was failing with wrong checksum
  because my premirror already had thrift-0.9.3.tar.gz from python-thrift, unpacking
  the archives to find what's wrong revealed what's wrong:

thrift-0.9.3.old/thrift-0.9.3/:
PKG-INFO  setup.cfg  setup.py  src  thrift.egg-info

thrift-0.9.3/thrift-0.9.3/:
aclocal     appveyor.yml  build    CMakeLists.txt  compiler       config.guess  config.hin  configure     contrib          debian   doap.rdf  install-sh        lib      ltmain.sh    Makefile.in  NOTICE        rat_exclude  sonar-project.properties  tutorial
aclocal.m4  bower.json    CHANGES  compile         composer.json  config.h      config.sub  configure.ac  CONTRIBUTING.md  depcomp  doc       json-schema.json  LICENSE  Makefile.am  missing      package.json  README.md    test                      ylwrap

  you can get the same by comparing:
  http://mirror.switch.ch/mirror/apache/dist/thrift/0.9.3/thrift-0.9.3.tar.gz
  http://sources.openembedded.org/thrift-0.9.3.tar.gz
  the later is the python-thrift one from:
  http://git.openembedded.org/meta-openembedded/commit/?id=5cc904be9d6551f6e9a6465e990df1e2de940004

  your premirror might already be polluted by this and thrift-0.10.0.tar.gz + thrift-0.11.0.tar.gz from:
  http://git.openembedded.org/meta-openembedded/commit/?id=c0416d417115fbae55d83c2d9fa3f3fca1a9e1a0
  http://git.openembedded.org/meta-openembedded/commit/?id=960ae72e101d753b712e8bc40d8bdb4a0bcb0c5e

* this should be backported all the way to morty where the conflicting
  archive was introduced and manual cleanup on sources.openembedded.org
  will be needed as well

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/python-thrift/python-thrift_0.11.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.11.0.bb b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.11.0.bb
index 8047ec77b9..10cff425e8 100644
--- a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.11.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.11.0.bb
@@ -7,6 +7,9 @@ SRC_URI[sha256sum] = "7d59ac4fdcb2c58037ebd4a9da5f9a49e3e034bf75b3f26d9fe48ba3d8
 
 inherit pypi setuptools
 
+# Use different filename to prevent conflicts with thrift itself
+PYPI_SRC_URI_append = ";downloadfilename=${BP}.${PYPI_PACKAGE_EXT}"
+
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-six \
-- 
2.17.1


