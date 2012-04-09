Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHGTL-0001du-ET
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Apr 2012 17:25:39 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so2626913wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2012 08:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=m6YOO7Kfj12UnJ8cbwuywDUANmkNq2Em61u1HoVI1es=;
	b=CINFy5XIUEnsdvGnrOzncelWYRdabmJCQgz7Swa8MjnbxeFyhkWAkTpLj+cvpBEt/A
	I60W1Iy7ET73U6sLjx7Gi8JDCjbK5ANX7mAztNag0mwaOkYI6OhNpMeACuSZMv9jOdnB
	D2A4qQLF4He245Y4BRnJDFQ6llFpX9ZS1GW94+CWhEYp5/vpn4m9JGC/J6KWSV86lVvG
	hn7L+HHGI3F3AbvbUWdMymlgMFIjpx3oGyxD0MDAoCeFdTX+w9VBrZkPYlgehs0gu90b
	1SLrek4plqzONlZunvmUiU79LqzoCX4bpJTRPHQGWoS5kP+P5FSn/soPWJC1HFWnU8sq
	FSKg==
Received: by 10.180.78.40 with SMTP id y8mr16778072wiw.15.1333984585122;
	Mon, 09 Apr 2012 08:16:25 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm50083383wib.8.2012.04.09.08.16.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 08:16:24 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Apr 2012 17:16:08 +0200
Message-Id: <1333984573-28464-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
References: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm+3R8gfIGq3QNQslI2DPViTWAujTunAXwUuyWolWVOA2gL8iZHw7eLjoqqFiKWZzU7M+By
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 05/10] cloud9: remove 0.5.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Apr 2012 15:25:39 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb |  114 -----------------------
 1 files changed, 0 insertions(+), 114 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
deleted file mode 100644
index 4f74edb..0000000
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
+++ /dev/null
@@ -1,114 +0,0 @@
-DESCRIPTION = "Meet Cloud9, development-as-a-service for Javascripters and other developers"
-HOMEPAGE = "http://c9.io"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
-
-DEPENDS = "libxml2 nodejs-native"
-
-PR = "r16"
-
-SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
-           git://github.com/ajaxorg/o3;destsuffix=o3;name=o3 \
-           git://github.com/ajaxorg/ace.git;destsuffix=git/support/ace;name=ace \
-           git://github.com/ajaxorg/ace.wiki.git;destsuffix=git/support/ace/doc/wiki;name=acewiki \
-           git://github.com/ajaxorg/cockpit.git;destsuffix=git/support/ace/support/cockpit;name=cockpit \
-           git://github.com/ajaxorg/dryice.git;destsuffix=git/support/ace/support/dryice;name=dryice \
-           git://github.com/ajaxorg/pilot.git;destsuffix=git/support/ace/support/pilot;name=pilot \
-           git://github.com/ajaxorg/apf.git;destsuffix=git/support/apf;name=apf \
-           git://github.com/ajaxorg/async.js.git;destsuffix=git/support/asyncjs;name=asyncjs \
-           git://github.com/ajaxorg/connect.git;destsuffix=git/support/connect;name=connect \
-           git://github.com/jashkenas/coffee-script.git;destsuffix=git/support/connect/support/coffee-script;name=coffee-script \
-           git://github.com/visionmedia/expresso.git;destsuffix=git/support/connect/support/expresso;name=expresso \
-           git://github.com/visionmedia/node-jscoverage.git;destsuffix=git/support/connect/support/expresso/deps/jscoverage;name=jscoverage \
-           git://github.com/cloudhead/less.js.git;destsuffix=git/support/connect/support/less;name=less \
-           git://github.com/visionmedia/sass.js.git;destsuffix=git/support/connect/support/sass;name=sass \
-           git://github.com/ajaxorg/jsDAV.git;destsuffix=git/support/jsdav;name=jsdav \
-           git://github.com/fjakobs/async.js.git;destsuffix=git/support/jsdav/support/async.js;name=async-js \
-           git://github.com/felixge/node-formidable.git;destsuffix=git/support/jsdav/support/formidable;name=formidable \
-           git://github.com/ajaxorg/jsftp.git;destsuffix=git/support/jsdav/support/jsftp;name=jsftp \
-           git://github.com/Gozala/streamer.git;destsuffix=git/support/jsdav/support/jsftp/support/streamer;name=streamer \
-           git://github.com/ajaxorg/node-sftp.git;destsuffix=git/support/jsdav/support/node-sftp;name=sftp \
-           git://github.com/ajaxorg/lib-v8debug.git;destsuffix=git/support/lib-v8debug;name=lib-v8debug \
-           git://github.com/ajaxorg/socket.io.git;destsuffix=git/support/socket.io;name=socketio \
-           git://github.com/LearnBoost/socket.io-client.git;destsuffix=git/support/socket.io-client;name=socketio-client \
-           git://github.com/ajaxorg/UglifyJS.git;destsuffix=git/support/uglify-js;name=uglify-js \
-           file://index.js \
-           file://cloud9.service \
-           file://cloud9-avahi.service \
-          "
-
-SRCREV_cloud9ide = "e61d37c19b981e8750084a1c3df60365f3436c19"
-SRCREV_o3 = "49ccc189a12728475875e9e7a9040553ab0b2316"
-SRCREV_ace = "9ec72ff319c06c4a1f93dae3157021eefbac338d"
-SRCREV_acewiki = "cc5ccde4565f7b21c81345f47e941e011e94b810"
-SRCREV_cockpit = "33f02ab3af5d755c98b3c58309ac2c62fc6de736"
-SRCREV_dryice = "375d9a339646d70846ad40eddaad406198dd9d40"
-SRCREV_pilot = "48ddaa841476ddf9210ccbb2b310952db8212084"
-SRCREV_apf = "d8d24b52829803d7e55fec90607a2595975402b8"
-SRCREV_asyncjs = "d36ead408e2959b1e99572114ef3a1b6a48c1072"
-SRCREV_connect = "6bec95b51f2286b942bc7f340d62d816bcdc13d4"
-SRCREV_coffee-script = "a53c104db16d3ac9d13cf9f16834edec250b9749"
-SRCREV_expresso = "7f10ab7fa655299b4e2f519065b0495e6ac34ef2"
-SRCREV_jscoverage = "0d4608a6b4275b020ba665389aa75897d5d4a584"
-SRCREV_less = "a2807288008587b95c6c2f8ba5cac16f1bcab98f"
-SRCREV_sass = "4dfd4c699e7a8baf226215ab044854c4507f4420"
-SRCREV_jsdav = "b06a73920ebdb1a671e86e2e47ee67400ba14785"
-SRCREV_async-js = "92fb710a70efd3cdc2376ebfba71a7fb3a4f1651"
-SRCREV_formidable = "0cba820cabc23250d47754e57d9f61cc73d12f2a"
-SRCREV_jsftp = "f93b4eeb6d96ffebbc378c8c040684cf82a63885"
-SRCREV_streamer = "1a7f75d4065819171ac91a09974199b932dbe17d"
-SRCREV_sftp = "a0539345134970d7535a19cb2608e3d1bc119d71"
-SRCREV_lib-v8debug = "29b20d01e6854da2173e1665ea141dab6b5a8104"
-SRCREV_socketio = "735d5239b325df2ba67d2b9bb4ec32442283bc06"
-SRCREV_socketio-client = "d12e0714e96490dfff770dc1d184e672549c6477"
-SRCREV_uglify-js = "941c845c4a01e4e47a158458fe846eb36d0828ad"
-
-SRCREV_FORMAT = "cloud9ide"
-
-S = "${WORKDIR}/git"
-
-do_configure () {
- cd ${WORKDIR}/o3
- node-waf -vv configure
-}
-
-EXTRA_CXXFLAGS = "-Idefault/include -I../include -Idefault/hosts -I../hosts -Idefault/modules -I../modules -Idefault/deps -I../deps -I${STAGING_DIR_NATIVE}/usr/include/node -fPIC -DPIC"
-
-do_compile () {
- cd ${WORKDIR}/o3
- node tools/gluegen.js
- cd hosts
- ${CXX} ${TARGET_CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o sh_node.o node-o3/sh_node.cc
- ${CXX} ${TARGET_CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o sh_node_libs.o node-o3/sh_node_libs.cc
- cd ..
- ${CXX} ${TARGET_LDFLAGS} hosts/sh_node.o hosts/sh_node_libs.o -o o3.node -shared -Wl,-Bdynamic -lxml2
-}
-
-do_install () {
- install -m 0755 -d ${D}${datadir}/cloud9 ${D}${bindir} ${D}/var/lib/cloud9
- rsync -r --exclude=".*" ${S}/* ${D}${datadir}/cloud9
-
- touch ${D}${bindir}/cloud9
- echo "#!/bin/sh" > ${D}${bindir}/cloud9
- echo "node4 ${datadir}/cloud9/bin/cloud9.js -l 0.0.0.0 -w /var/lib/cloud9 -p 3000" >> ${D}${bindir}/cloud9
- chmod 0755 ${D}${bindir}/cloud9
-
- install -m 0755 -d ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml
- install -m 0644 ${WORKDIR}/index.js ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/index.js
- install -m 0644 ${WORKDIR}/o3/modules/o3.js ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/o3.js
- install -m 0755 ${WORKDIR}/o3/o3.node ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/o3.node
-
-  install -m 0755 -d ${D}${sysconfdir}/avahi/services/
-  install -m 0644 ${WORKDIR}/cloud9-avahi.service ${D}${sysconfdir}/avahi/services/
-}
-
-FILES_${PN}-dbg += "${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/.debug \
-                    ${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/.debug \
-                   "
-
-RDEPENDS_${PN} = "nodejs4 gzip"
-
-inherit systemd
-
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE_${PN} = "cloud9.service"
-- 
1.7.2.5



