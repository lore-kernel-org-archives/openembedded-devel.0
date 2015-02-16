Return-Path: <max.oss.09@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id AB3A0606E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 21:55:45 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id x3so31638443wes.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 13:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UZp1ThJEsgul0UAWecdEOs1R0aQpOgz8IL+DUaNkkc8=;
	b=ie3rVzsttoHfR0ecxnxKdFvA/F+GNM3xRn8VwM4JA+VGAZAAWcsc7NzGPUr686VdtC
	cfWsRyoiESRlXnzG1pxRblvMK+IJoeOZdJzYWtSnQHSBTbef4cpwlvumJZKgDMvWAojt
	pyb33rqyYiP/PZhAWNiA1cfFQbnfDXkCi1MR+kQsb6ABPxBTpCeGp9MMLGFuuiGNzPEz
	lPk4Iw7eiTbyGfCWdhzU1tQgK08K7sweQDnuZMRUqhEylTdSKUh5a8q3CgDFtsT6ldTi
	0UrEeh67nlBjFa0ejdrmceu2rqq4PE1p15R+PQKGN8xYywFLxya2bPiQ6Vz1GVTQZr6G
	G/rA==
X-Received: by 10.194.185.68 with SMTP id fa4mr53646937wjc.111.1424123746103; 
	Mon, 16 Feb 2015 13:55:46 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id p1sm365956wib.23.2015.02.16.13.55.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 13:55:45 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Feb 2015 22:55:27 +0100
Message-Id: <1424123733-16696-1-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-java][PATCH 0/7] Allow build for multiple ARCH in the same builddir
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
X-List-Received-Date: Mon, 16 Feb 2015 21:55:48 -0000

Building a recipe which provides packages for allarch and ${TUNE_PKGARCH}
fails if one builds in the same build directory for different TUNE_PKGARCHs.

An example is rhino which fails as follows when one builds first for
armv7at2hf-vfp and then for armv7at2hf-vfp-neon.
    ERROR: The recipe rhino is trying to install files into a
    shared area when those files already exist. Those files and their
    manifest location are:
       /.../ipk/all/librhino-java_1.7r4-r0_all.ipk
    Matched in manifest-armv7at2hf-vfp-rhino-package_write_ipk

The change in package arch is done in java-library.bbclass. Most of the
users of java-library.bbclass don't install any files in the ${TUNE_PKGARCH}
packages or install shell scripts which may also be deployed in an allarch
package.

Most of the recipes including java-library.bbclass no longer build with newer
layer revisions.
This patchset first update the recipes to build again, changes java-library
build all packages in allarch by default and recipes which must have some
of their packages in ${TUNE_PKGARCH} to have all of their recipes in
${TUNE_PKGARCH}.
Finaly some of the recipes I tried did not build before and after the proposed
changes. I document these in README.nonworking. I don't have the time to work
on these and I guess no one has been interested in years.

Regards
Max

Max Krummenacher (6):
  cleanup whitespace in tasks
  licence: add missing LIC_FILES_CHKSUM
  rxtx: use autotools-brokensep
  java-library: inherit allarch
  antlr: fix override for native build
  adding a README.nonworking

 README.nonworking                                  |  6 ++
 classes/java-library.bbclass                       |  8 ++-
 recipes-core/antlr/antlr_2.7.7.bb                  | 18 +++---
 recipes-core/jakarta-commons/commons-cli_1.1.bb    |  1 +
 recipes-core/jakarta-commons/commons-codec_1.3.bb  |  1 +
 .../jakarta-commons/commons-discovery_0.4.bb       |  1 +
 recipes-core/jakarta-commons/commons-el_1.0.bb     |  3 +-
 .../jakarta-commons/commons-fileupload_1.2.1.bb    |  1 +
 .../jakarta-commons/commons-httpclient_3.1.bb      |  1 +
 recipes-core/jakarta-commons/commons-io_1.4.bb     |  1 +
 recipes-core/jakarta-commons/commons-lang_2.4.bb   |  1 +
 .../jakarta-commons/commons-logging_1.1.1.bb       |  1 -
 recipes-core/jakarta-commons/commons-pool_1.4.bb   |  1 +
 recipes-core/jakarta-commons/jakarta-commons.inc   | 68 +++++++++++-----------
 recipes-core/jakarta-libs/poi_3.0.bb               |  3 +-
 recipes-core/junit/junit4_4.3.1.bb                 |  3 +-
 recipes-core/libmatthew/libmatthew.inc             |  1 +
 recipes-core/servlet-api/jsp2.0_5.5.26.bb          |  3 +-
 recipes-core/servlet-api/servlet2.4_5.5.26.bb      |  3 +-
 recipes-core/xml-commons/jaxme_0.5.2.bb            | 43 +++++++-------
 recipes-core/xml-commons/xom_1.1.bb                | 29 ++++-----
 recipes-core/xml-commons/xpp2_2.1.10.bb            | 24 ++++----
 recipes-core/xml-commons/xpp3_1.1.3.4.O.bb         | 39 +++++++------
 recipes-extended/hsqldb/hsqldb_1.8.0.10.bb         | 29 ++++-----
 recipes-extended/rxtx/rxtx_2.2.0.bb                |  3 +-
 25 files changed, 159 insertions(+), 133 deletions(-)
 create mode 100644 README.nonworking

-- 
1.9.3


