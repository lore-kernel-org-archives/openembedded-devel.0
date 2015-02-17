Return-Path: <max.oss.09@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3344A65C85
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 09:57:35 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id l18so34187275wgh.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 01:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IYiwVaWug8Mt7PgO1PZbMSsa9OOhDyfq8aNJa61TeEk=;
	b=ZKMRAAawilLMrZ8AXgpbiMmsQUPEiCmixVX+wQyJkkXgntPi20vdpfJLLbFfEgNlRl
	VUklk20hgOMkoY7FBxI2d8NUP64+HMqatCtKngnRWHo66XM949i+e/mWNwgJncR5iH0d
	PiXYbh3BKl6ace9FxPjm4d/dPbPkoQ8XOdFD3hdF+NZhMiQj0EedbH9dSPAUNd5G/7uH
	ZPZu90RggKdZgmB2hIeC7pq16rgthz/esNIf540p9tmKtkyFBnRAShMzVB3pbBrs1Ozg
	DVNApjpND5x/K02uRhgAOG+57k9zpkl0rdQ8F6GJNVwQDPN1unjJY+L57dqZ6/PdxJDE
	cesw==
X-Received: by 10.195.12.71 with SMTP id eo7mr46516649wjd.3.1424167056680;
	Tue, 17 Feb 2015 01:57:36 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id nb9sm13736945wic.3.2015.02.17.01.57.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Feb 2015 01:57:35 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Feb 2015 10:57:10 +0100
Message-Id: <1424167036-15517-1-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
Cc: otavio@ossystems.com.br
Subject: [meta-java][PATCH v2 0/6] Allow build for multiple ARCH in the same builddir
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
X-List-Received-Date: Tue, 17 Feb 2015 09:57:36 -0000

v2: Patch 6/6: mark broken recipes with PNBLACKLIST[recipe] rather than
    documenting them in a README.nonworking


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
changes. Adding a PNBLACKLIST statement to mark them as I don't have the time
to work on these and I guess no one has been interested in years.

Regards
Max

Max Krummenacher (6):
  cleanup whitespace in tasks
  licence: add missing LIC_FILES_CHKSUM
  rxtx: use autotools-brokensep
  java-library: inherit allarch
  antlr: fix override for native build
  mark broken recipes with PNBLACKLIST

 classes/java-library.bbclass                       |  8 ++-
 recipes-core/antlr/antlr_2.7.7.bb                  | 18 +++---
 recipes-core/jakarta-commons/commons-cli_1.1.bb    |  1 +
 recipes-core/jakarta-commons/commons-codec_1.3.bb  |  1 +
 .../jakarta-commons/commons-configuration_1.5.bb   |  2 +
 .../jakarta-commons/commons-discovery_0.4.bb       |  1 +
 recipes-core/jakarta-commons/commons-el_1.0.bb     |  3 +-
 .../jakarta-commons/commons-fileupload_1.2.1.bb    |  1 +
 .../jakarta-commons/commons-httpclient_3.1.bb      |  1 +
 recipes-core/jakarta-commons/commons-io_1.4.bb     |  1 +
 recipes-core/jakarta-commons/commons-jxpath_1.3.bb |  2 +
 recipes-core/jakarta-commons/commons-lang_2.4.bb   |  1 +
 .../jakarta-commons/commons-logging_1.1.1.bb       |  1 -
 recipes-core/jakarta-commons/commons-pool_1.4.bb   |  1 +
 recipes-core/jakarta-commons/jakarta-commons.inc   | 68 +++++++++++-----------
 recipes-core/jakarta-libs/poi_3.0.bb               |  3 +-
 recipes-core/junit/junit4_4.3.1.bb                 |  3 +-
 recipes-core/libmatthew/libmatthew.inc             |  1 +
 recipes-core/servlet-api/jsp2.0_5.5.26.bb          |  3 +-
 recipes-core/servlet-api/servlet2.4_5.5.26.bb      |  3 +-
 recipes-core/xml-commons/dom4j_1.6.1.bb            |  2 +
 recipes-core/xml-commons/jaxen_1.1.1.bb            |  2 +
 recipes-core/xml-commons/jaxme_0.5.2.bb            | 57 +++++++++++-------
 recipes-core/xml-commons/jdom_1.1.bb               |  2 +
 recipes-core/xml-commons/xom_1.1.bb                | 40 ++++++++-----
 recipes-core/xml-commons/xpp2_2.1.10.bb            | 24 ++++----
 recipes-core/xml-commons/xpp3_1.1.3.4.O.bb         | 39 +++++++------
 recipes-extended/hsqldb/hsqldb_1.8.0.10.bb         | 29 ++++-----
 recipes-extended/rxtx/rxtx_2.2.0.bb                |  3 +-
 29 files changed, 188 insertions(+), 133 deletions(-)

-- 
1.9.3


