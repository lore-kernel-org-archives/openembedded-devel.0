Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHGTJ-0001ds-JD
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Apr 2012 17:25:37 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so2131488wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2012 08:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=ElJk3bScdqsIHlyYbs/shI+faB6WRkTqSE2waeehb6E=;
	b=Fb/GZwWcOvjBzsffyIhromiTdB1Q1HdA97E1CuQbBmFLrBzH6OvLPwIlOQ+QVF45Oz
	zZg1JlM3/LupkVYYE3ymCP6quwNJHlnuVh2ggNlLVms3x1DZlz91Kzvggx2uO3x6mdmD
	UAwiWvmpGynwXM1fjfe0198h7hsye/U4UlREyZhQIhYGs+HIHqDVMWpHs2eB6vnwcHtH
	mOSlIEzWA/AUeUU33P3eaptSN+Sc/Y1AkhgbOc10xQ7OPEifzIIzN4Z9hzbh2lBjt8Cj
	vDVzyd2bkEp/xQvUPeGPlzzmN3108+G5Ul45GBE9Y6v+f6/BueqdBK7ArYaGmmndzHJ/
	ocmA==
Received: by 10.216.137.27 with SMTP id x27mr4375501wei.70.1333984582972;
	Mon, 09 Apr 2012 08:16:22 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id l5sm30956006wia.11.2012.04.09.08.16.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 08:16:22 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Apr 2012 17:16:07 +0200
Message-Id: <1333984573-28464-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
References: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQk+eEB/cinbUTS5j5QFLd7VdJ8/NF98WMhCm1cnbzE1UiylAr+jBh0d82sVjIaLNElov29S
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 04/10] cloud9: add 0.6
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
X-List-Received-Date: Mon, 09 Apr 2012 15:25:37 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../cloud9/{cloud9_0.5.1.bb => cloud9_0.6.bb}      |   32 ++++++++-----------
 1 files changed, 14 insertions(+), 18 deletions(-)
 copy meta-oe/recipes-devtools/cloud9/{cloud9_0.5.1.bb => cloud9_0.6.bb} (82%)

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
similarity index 82%
copy from meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
copy to meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
index 4f74edb..96b1583 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
@@ -3,17 +3,14 @@ HOMEPAGE = "http://c9.io"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
 
+DEFAULT_PREFERENCE = "-1"
+
 DEPENDS = "libxml2 nodejs-native"
 
-PR = "r16"
-
 SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
            git://github.com/ajaxorg/o3;destsuffix=o3;name=o3 \
            git://github.com/ajaxorg/ace.git;destsuffix=git/support/ace;name=ace \
            git://github.com/ajaxorg/ace.wiki.git;destsuffix=git/support/ace/doc/wiki;name=acewiki \
-           git://github.com/ajaxorg/cockpit.git;destsuffix=git/support/ace/support/cockpit;name=cockpit \
-           git://github.com/ajaxorg/dryice.git;destsuffix=git/support/ace/support/dryice;name=dryice \
-           git://github.com/ajaxorg/pilot.git;destsuffix=git/support/ace/support/pilot;name=pilot \
            git://github.com/ajaxorg/apf.git;destsuffix=git/support/apf;name=apf \
            git://github.com/ajaxorg/async.js.git;destsuffix=git/support/asyncjs;name=asyncjs \
            git://github.com/ajaxorg/connect.git;destsuffix=git/support/connect;name=connect \
@@ -31,20 +28,18 @@ SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
            git://github.com/ajaxorg/lib-v8debug.git;destsuffix=git/support/lib-v8debug;name=lib-v8debug \
            git://github.com/ajaxorg/socket.io.git;destsuffix=git/support/socket.io;name=socketio \
            git://github.com/LearnBoost/socket.io-client.git;destsuffix=git/support/socket.io-client;name=socketio-client \
+           git://github.com/ajaxorg/treehugger.git;destsuffix=git/support/treehugger;name=treehugger \
            git://github.com/ajaxorg/UglifyJS.git;destsuffix=git/support/uglify-js;name=uglify-js \
            file://index.js \
            file://cloud9.service \
            file://cloud9-avahi.service \
           "
 
-SRCREV_cloud9ide = "e61d37c19b981e8750084a1c3df60365f3436c19"
-SRCREV_o3 = "49ccc189a12728475875e9e7a9040553ab0b2316"
-SRCREV_ace = "9ec72ff319c06c4a1f93dae3157021eefbac338d"
-SRCREV_acewiki = "cc5ccde4565f7b21c81345f47e941e011e94b810"
-SRCREV_cockpit = "33f02ab3af5d755c98b3c58309ac2c62fc6de736"
-SRCREV_dryice = "375d9a339646d70846ad40eddaad406198dd9d40"
-SRCREV_pilot = "48ddaa841476ddf9210ccbb2b310952db8212084"
-SRCREV_apf = "d8d24b52829803d7e55fec90607a2595975402b8"
+SRCREV_cloud9ide = "c4e2574896a22bb749f0500b25f41c888d346bed"
+SRCREV_o3 = "302cd3a6d5039f53a9fa3932bed88b53281c1e1e"
+SRCREV_ace = "0fc5392cbe46fb134052c3065a238ad8e3b31cfd"
+SRCREV_acewiki = "d2a65d0addc2e5ab922bbff9cb6022a4652b4f13"
+SRCREV_apf = "2560b762b2b0e5a8b46f8a4062f927a9a9d239f4"
 SRCREV_asyncjs = "d36ead408e2959b1e99572114ef3a1b6a48c1072"
 SRCREV_connect = "6bec95b51f2286b942bc7f340d62d816bcdc13d4"
 SRCREV_coffee-script = "a53c104db16d3ac9d13cf9f16834edec250b9749"
@@ -52,15 +47,16 @@ SRCREV_expresso = "7f10ab7fa655299b4e2f519065b0495e6ac34ef2"
 SRCREV_jscoverage = "0d4608a6b4275b020ba665389aa75897d5d4a584"
 SRCREV_less = "a2807288008587b95c6c2f8ba5cac16f1bcab98f"
 SRCREV_sass = "4dfd4c699e7a8baf226215ab044854c4507f4420"
-SRCREV_jsdav = "b06a73920ebdb1a671e86e2e47ee67400ba14785"
+SRCREV_jsdav = "f04ebf3d012cc8aeabfcfb2b8fab8966d52929e9"
 SRCREV_async-js = "92fb710a70efd3cdc2376ebfba71a7fb3a4f1651"
-SRCREV_formidable = "0cba820cabc23250d47754e57d9f61cc73d12f2a"
-SRCREV_jsftp = "f93b4eeb6d96ffebbc378c8c040684cf82a63885"
+SRCREV_formidable = "a37292d4b7d6d76a38909ed670334c9068d40871"
+SRCREV_jsftp = "e3f10c8927347c170cdd0150ef38e18272acf942"
 SRCREV_streamer = "1a7f75d4065819171ac91a09974199b932dbe17d"
 SRCREV_sftp = "a0539345134970d7535a19cb2608e3d1bc119d71"
-SRCREV_lib-v8debug = "29b20d01e6854da2173e1665ea141dab6b5a8104"
+SRCREV_lib-v8debug = "7c11897f4bc77c7275c2b6dff5becc72ac018662"
 SRCREV_socketio = "735d5239b325df2ba67d2b9bb4ec32442283bc06"
-SRCREV_socketio-client = "d12e0714e96490dfff770dc1d184e672549c6477"
+SRCREV_socketio-client = "4375ef1344ecb8ad75a3848a00af6b391822f86b"
+SRCREV_treehugger = "436d0d6dd0ce43782e6be08ad12c356730626996"
 SRCREV_uglify-js = "941c845c4a01e4e47a158458fe846eb36d0828ad"
 
 SRCREV_FORMAT = "cloud9ide"
-- 
1.7.2.5



