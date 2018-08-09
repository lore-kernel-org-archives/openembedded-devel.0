Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f53.google.com (mail-yw1-f53.google.com
	[209.85.161.53])
	by mail.openembedded.org (Postfix) with ESMTP id CD8296086F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 00:27:32 +0000 (UTC)
Received: by mail-yw1-f53.google.com with SMTP id s68-v6so2998007ywg.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Aug 2018 17:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IgtTfbDaRuGJptclhc0euWyJ4cOgaGT/ZTMpaaHpQfY=;
	b=AsQlQ3U4TAXNPVoK4hdopZ5ppQypPSowTksNlwiFoY/9aPCDm/5Qn4djCY5TLM/rD9
	a8/OoG5cRE1f36hUHhgxDVUZ0E8SyBTY9qRJTW43DTO9mCvmHDkCDHa8MEmfbiPEpKc9
	s6EzcO3kVHcKquIhxYiBifRTqU6qdeNJ/Cdj1fI9W/eoAwa2BQNK9MKDXzg3CPxDB4xm
	97sf8wxT1grpnwHhHxyDiliQc7XiImsL2Xf/uN04wLcVD/bga5zW1dmaV0Vfw8gJOv7p
	qQ8xsvGITETMQAj8VB2wrUYzQXyOxmnU24PDCOyJgWN68tK/hCz56HErFh123xbGaVM5
	WJqw==
X-Gm-Message-State: AOUpUlEylh1j09KYCRwLx2kOHlvDBZrEoe3xv/NiogLpql8gWHVd+B5G
	gwKIjyLMawSrp37QQ65HuSo/qCBv
X-Google-Smtp-Source: AA+uWPxqQ+olvgVq1CRQcj+E3CmqlWjblct/l6lNpggpH1U7yauZs5kz/4ET6MlTyMAihBb9nWr/Tw==
X-Received: by 2002:a25:a091:: with SMTP id
	y17-v6mr2526246ybh.525.1533774453492; 
	Wed, 08 Aug 2018 17:27:33 -0700 (PDT)
Received: from tfsielt31850.jci.com (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	124-v6sm2354470yws.25.2018.08.08.17.27.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 17:27:32 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Aug 2018 01:27:30 +0100
Message-Id: <20180809002730.22163-1-git@andred.net>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [meta-java][master-next][PATCH v2] openjdk-8: update to 8u172b11
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
X-List-Received-Date: Thu, 09 Aug 2018 00:27:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v2:
* file checksums for aarch64 updated because archives were
  regenerated server-side
---
 ...e_162b12.bb => openjdk-8-native_172b11.bb} |  0
 .../openjdk/openjdk-8-release-161b15.inc      | 33 -------------
 .../openjdk/openjdk-8-release-162b12.inc      | 49 -------------------
 .../openjdk-8-release-172b11-aarch64.inc      | 33 +++++++++++++
 ...nc => openjdk-8-release-172b11-common.inc} |  0
 .../openjdk/openjdk-8-release-172b11.inc      | 36 ++++++++++++++
 ...penjdk-8_16xbyy.bb => openjdk-8_172b11.bb} |  7 ++-
 ...penjre-8_16xbyy.bb => openjre-8_172b11.bb} |  7 ++-
 8 files changed, 75 insertions(+), 90 deletions(-)
 rename recipes-core/openjdk/{openjdk-8-native_162b12.bb => openjdk-8-native_172b11.bb} (100%)
 delete mode 100644 recipes-core/openjdk/openjdk-8-release-161b15.inc
 delete mode 100644 recipes-core/openjdk/openjdk-8-release-162b12.inc
 create mode 100644 recipes-core/openjdk/openjdk-8-release-172b11-aarch64.inc
 rename recipes-core/openjdk/{openjdk-8-release-16xbyy.inc => openjdk-8-release-172b11-common.inc} (100%)
 create mode 100644 recipes-core/openjdk/openjdk-8-release-172b11.inc
 rename recipes-core/openjdk/{openjdk-8_16xbyy.bb => openjdk-8_172b11.bb} (92%)
 rename recipes-core/openjdk/{openjre-8_16xbyy.bb => openjre-8_172b11.bb} (91%)

diff --git a/recipes-core/openjdk/openjdk-8-native_162b12.bb b/recipes-core/openjdk/openjdk-8-native_172b11.bb
similarity index 100%
rename from recipes-core/openjdk/openjdk-8-native_162b12.bb
rename to recipes-core/openjdk/openjdk-8-native_172b11.bb
diff --git a/recipes-core/openjdk/openjdk-8-release-161b15.inc b/recipes-core/openjdk/openjdk-8-release-161b15.inc
deleted file mode 100644
index 0a4434c..0000000
--- a/recipes-core/openjdk/openjdk-8-release-161b15.inc
+++ /dev/null
@@ -1,33 +0,0 @@
-require openjdk-8-release-16xbyy.inc
-
-CORBA_CHANGESET_aarch64 = "f73da600c483"
-SRC_URI[corba.md5sum] = "bf884b82fcc6de466946fcb87d24ebf3"
-SRC_URI[corba.sha256sum] = "ebf73d96185fc05e502088ae89a8d6494c3971dd220458deeff3876f72396b6c"
-
-HOTSPOT_CHANGESET_aarch64 = "a600839824fa"
-SRC_URI[hotspot.md5sum] = "20c88ba26f8f45a2769f4edf32afd593"
-SRC_URI[hotspot.sha256sum] = "6d0d1b9c2df3392ad6e21ca3eae39d06b50632a4a419da3d4363248943ea8b97"
-
-JAXP_CHANGESET_aarch64 = "b1e2af899046"
-SRC_URI[jaxp.md5sum] = "219582b26d7de2973b75f4329b53ec7d"
-SRC_URI[jaxp.sha256sum] = "907cc4dfb01a3a2a6d74dfa90fa6fcb5b3df55600f41ba44dcdc94b47e85a382"
-
-JAXWS_CHANGESET_aarch64 = "0002ed323fe5"
-SRC_URI[jaxws.md5sum] = "44935b81e3405fcaef675d5d08c2149e"
-SRC_URI[jaxws.sha256sum] = "0d1d52f1cf254a643ece1bd6cd8628fae1a4d56e8b59388cc9ad73b3caf151a1"
-
-JDK_CHANGESET_aarch64 = "c2ba2ed87d18"
-SRC_URI[jdk.md5sum] = "f4c0393a157dcb8b90ee7c7d80cbdfbf"
-SRC_URI[jdk.sha256sum] = "c84a17451b47242f9d96bf431011607afc3776f285a6ad9a60190fba2d434c49"
-
-LANGTOOLS_CHANGESET_aarch64 = "cdb217c578cb"
-SRC_URI[langtools.md5sum] = "608cf07781259d916d1663d6a5ced26d"
-SRC_URI[langtools.sha256sum] = "ad28e75bfaba1b64fdd02ea316db3ba3cba68007f90c5fa2be2418ce8bc0074d"
-
-NASHORN_CHANGESET_aarch64 = "505d0eb2fafe"
-SRC_URI[nashorn.md5sum] = "be981a6c55f9e602ff129fed65505a8c"
-SRC_URI[nashorn.sha256sum] = "14419ccd773e1db83b600d05aca3cbac9f24be77abda9a132d12305d8821d6d7"
-
-OPENJDK_CHANGESET_aarch64 = "917454da25c1"
-SRC_URI[openjdk.md5sum] = "1e4b3eca032742b7448731f9b8fcb426"
-SRC_URI[openjdk.sha256sum] = "1e17e2d8384a7b808a89b982e7c09c4feb8598b7a66b93697bfb8759c1005974"
diff --git a/recipes-core/openjdk/openjdk-8-release-162b12.inc b/recipes-core/openjdk/openjdk-8-release-162b12.inc
deleted file mode 100644
index bc2b342..0000000
--- a/recipes-core/openjdk/openjdk-8-release-162b12.inc
+++ /dev/null
@@ -1,49 +0,0 @@
-require openjdk-8-release-16xbyy.inc
-
-# We do not yet work for aarch64.
-COMPATIBLE_HOST = "^(?!aarch64).*"
-
-CORBA_CHANGESET = "f6b6ad6feb6e"
-SRC_URI[corba.md5sum] = "0358300224b63f3deeba63d3de7d765c"
-SRC_URI[corba.sha256sum] = "54da09fd0c76834094d9f167c03ff1ac2373f5e46fb26d24d0d018cdc59a2842"
-
-HOTSPOT_CHANGESET = "d2e3920d2fd0"
-SRC_URI[hotspot.md5sum] = "17a1da8be42ad0c7778e7090ea5003c1"
-SRC_URI[hotspot.sha256sum] = "3f07ee7a49cb4258ef00a8a896b0f7f87e85f06dc31f6c0db698d8058926b365"
-
-JAXP_CHANGESET = "e8a1a2db69dc"
-SRC_URI[jaxp.md5sum] = "9b344a6cf317ca485b8790e67ccc2467"
-SRC_URI[jaxp.sha256sum] = "fbd0eaed48415c2918a47e7d76ce276416bab792e1959b1d3dee2b703aa76f5a"
-
-JAXWS_CHANGESET = "7b4329f78e52"
-SRC_URI[jaxws.md5sum] = "b1da20ee79382eb5bb72077eb02addd4"
-SRC_URI[jaxws.sha256sum] = "ffd31d467c6fe7fc0956e801c08168d48ba02b4dea38b7dedbafc054092ca8f0"
-
-JDK_CHANGESET = "d201d8b87f48"
-SRC_URI[jdk.md5sum] = "bced8a322e53083472b39f01e938b21a"
-SRC_URI[jdk.sha256sum] = "6e057ceb02a7d8bb66233d52b23d246120b5c0d72e7a71cb6fb0ace84e8bb581"
-
-LANGTOOLS_CHANGESET = "034738d4f1d2"
-SRC_URI[langtools.md5sum] = "fbc6faea65cfc248f93f54e634d7bf50"
-SRC_URI[langtools.sha256sum] = "91615ade480c706f58062e74ee112f95ab947e1c5366a29a7d9b2b6b0a2f72d3"
-
-NASHORN_CHANGESET = "81ce60cabe97"
-SRC_URI[nashorn.md5sum] = "318993c189f16894abe94db14a067618"
-SRC_URI[nashorn.sha256sum] = "8df64026be98e6efad200ef8639e2f7e96a783e262b402afcb8045f46709e457"
-
-OPENJDK_CHANGESET = "4be07cb28b21"
-SRC_URI[openjdk.md5sum] = "24d30b66aaaef51af9b598c8989c1c82"
-SRC_URI[openjdk.sha256sum] = "8f9ecc5fc5f9c6df671a2ef07949f86080823c89954b2b87f6727a82af679eca"
-
-
-#CACAO_VERSION = "e215e36be9fc"
-#CACAO_FILE = "${CACAO_VERSION}.tar.gz"
-#CACAO_URI = "http://icedtea.wildebeest.org/download/drops/cacao/${CACAO_FILE};name=cacao;unpack=false"
-#SRC_URI[cacao.md5sum] = "79f95f0aea4ba04cf2f1a8632ac66d14"
-#SRC_URI[cacao.sha256sum] = "4966514c72ee7ed108b882d9b6e65c3adf8a8f9c2dccb029f971b3c8cb4870ab"
-#
-#JAMVM_VERSION = "ec18fb9e49e62dce16c5094ef1527eed619463aa"
-#JAMVM_FILE = "jamvm-${JAMVM_VERSION}.tar.gz"
-#JAMVM_URI = "http://icedtea.wildebeest.org/download/drops/jamvm/${JAMVM_FILE};name=jamvm;unpack=false"
-#SRC_URI[jamvm.md5sum] = "d50ae193d01a9251e10679c7a2cc6ff1"
-#SRC_URI[jamvm.sha256sum] = "31810266666c23822942aac62a78019c2c4589e1c5ee48329cbf42652d4437bc"
diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-aarch64.inc b/recipes-core/openjdk/openjdk-8-release-172b11-aarch64.inc
new file mode 100644
index 0000000..dddae6a
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-release-172b11-aarch64.inc
@@ -0,0 +1,33 @@
+require openjdk-8-release-172b11-common.inc
+
+CORBA_CHANGESET_aarch64 = "3a04a7c080af"
+SRC_URI[corba.md5sum] = "758b29d6cf714fd894df8674afd78e17"
+SRC_URI[corba.sha256sum] = "564113dbeadc57ac5831ccc056e0b920adbd3b74558cf750aa899f5de25ceb5e"
+
+HOTSPOT_CHANGESET_aarch64 = "1ced2ae00e35"
+SRC_URI[hotspot.md5sum] = "1db8a0e5e63352f1743e9d41ab6ed5cf"
+SRC_URI[hotspot.sha256sum] = "6993c3138035a7c0d2782b1ca7aabdb43452b1abbcc60448042f5c9207b03ab5"
+
+JAXP_CHANGESET_aarch64 = "ab8087f496fe"
+SRC_URI[jaxp.md5sum] = "0e7d8755af72aaf9ec7521514d8bb541"
+SRC_URI[jaxp.sha256sum] = "6e70c1535d738dc2c4e3a2fb9e6e11c660172b6d2ce905ec33e8924f8c208978"
+
+JAXWS_CHANGESET_aarch64 = "1e71aeefeecf"
+SRC_URI[jaxws.md5sum] = "16ff9ba1007aee21ad3df472b1f5c55e"
+SRC_URI[jaxws.sha256sum] = "b6ccb2855c2e9cd5778b193b5ad47f2e13496cbbbad74497c70216cd04b4c7dc"
+
+JDK_CHANGESET_aarch64 = "e8e6553e7ca9"
+SRC_URI[jdk.md5sum] = "52b35732c17e9048e506b7b46c1282f8"
+SRC_URI[jdk.sha256sum] = "ffaa79dad3b126af77ac9c230c54805b224c5d6517830a37c7272678407c99da"
+
+LANGTOOLS_CHANGESET_aarch64 = "14d381cbe563"
+SRC_URI[langtools.md5sum] = "d14425cc0334ed46ce695c9930bff6d5"
+SRC_URI[langtools.sha256sum] = "a4334c8859fe48bf2eae3b076785ff2e36a5ae80cf5840aef32731c3099a2274"
+
+NASHORN_CHANGESET_aarch64 = "c667b467b394"
+SRC_URI[nashorn.md5sum] = "0389c953bdd14c804d873d95ff4b3033"
+SRC_URI[nashorn.sha256sum] = "7cd87e641f0781481635593c144c8030f20d97cfc048ca57bd56381bab8e7d92"
+
+OPENJDK_CHANGESET_aarch64 = "74564d40b0d6"
+SRC_URI[openjdk.md5sum] = "13f7f15386f7aa0cc3383e9d1e98d2f1"
+SRC_URI[openjdk.sha256sum] = "a6425e11700edcdc0761df9da75b28b48adc664f3d8259c49ced1c85af3dc502"
diff --git a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
similarity index 100%
rename from recipes-core/openjdk/openjdk-8-release-16xbyy.inc
rename to recipes-core/openjdk/openjdk-8-release-172b11-common.inc
diff --git a/recipes-core/openjdk/openjdk-8-release-172b11.inc b/recipes-core/openjdk/openjdk-8-release-172b11.inc
new file mode 100644
index 0000000..fdf7b39
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-release-172b11.inc
@@ -0,0 +1,36 @@
+require openjdk-8-release-172b11-common.inc
+
+# We do not yet work for aarch64.
+COMPATIBLE_HOST = "^(?!aarch64).*"
+
+CORBA_CHANGESET = "875a75c440cd"
+SRC_URI[corba.md5sum] = "66242dd6e749f39a5ef6add34f5ecb2f"
+SRC_URI[corba.sha256sum] = "f1618be7ad88619c7d7c1eed9800c528d0646e1c9f039e20a57b3e72ae3d3512"
+
+HOTSPOT_CHANGESET = "32ba4d2121c1"
+SRC_URI[hotspot.md5sum] = "a3e1d2f91ba8873f71e9a72043e2644a"
+SRC_URI[hotspot.sha256sum] = "680b1f5100786910bfceeef90ce28d74fcf6eacfdd3b92dfc76dcf3216060e99"
+
+JAXP_CHANGESET = "30586bb50743"
+SRC_URI[jaxp.md5sum] = "b413b1cb709d74e513f13c586215366d"
+SRC_URI[jaxp.sha256sum] = "ba36dd8ad72ff3d8bda38b7d6773037e18c3c68ebadd61f1e1f7fc167a506baa"
+
+JAXWS_CHANGESET = "452a6a5a878e"
+SRC_URI[jaxws.md5sum] = "5c3c4d1fec19398128cf818aef5486a9"
+SRC_URI[jaxws.sha256sum] = "89aa34e6bc3410a85ea697aa4ae70c21f7099efdacef78a6e5a46747421e86f9"
+
+JDK_CHANGESET = "5ccc572f4ffe"
+SRC_URI[jdk.md5sum] = "29dd4772e3862193e56007a0bb0d6886"
+SRC_URI[jdk.sha256sum] = "4d1758ceec155fcd2cd786f11071ed614947a9720373d704221d78ed98beadec"
+
+LANGTOOLS_CHANGESET = "34ee52bc68a4"
+SRC_URI[langtools.md5sum] = "b195802f2aaa5c95c06cc50021bb42a6"
+SRC_URI[langtools.sha256sum] = "0403bd2c9a45e4c0dc2148907028e0cdfd087be512e6d6b3763a01411936663a"
+
+NASHORN_CHANGESET = "7efd6152328e"
+SRC_URI[nashorn.md5sum] = "3aa4b31fdbf330baf28194e21697b8d6"
+SRC_URI[nashorn.sha256sum] = "8b5cbd29e9dbace477a57d7c07a127312dd3cf6b8e648b0b64026616d12c6862"
+
+OPENJDK_CHANGESET = "33d274a7dda0"
+SRC_URI[openjdk.md5sum] = "105f62e8f22a68b8c4151c68a447f76e"
+SRC_URI[openjdk.sha256sum] = "bf49215fe1e43e6f110470c911fce32722c843e03efb68e40cc7a832eb80faea"
diff --git a/recipes-core/openjdk/openjdk-8_16xbyy.bb b/recipes-core/openjdk/openjdk-8_172b11.bb
similarity index 92%
rename from recipes-core/openjdk/openjdk-8_16xbyy.bb
rename to recipes-core/openjdk/openjdk-8_172b11.bb
index 522d6b5..9c2a7a1 100644
--- a/recipes-core/openjdk/openjdk-8_16xbyy.bb
+++ b/recipes-core/openjdk/openjdk-8_172b11.bb
@@ -1,7 +1,6 @@
-PV = "162b12"
-PV_aarch64 = "161b15"
-
-require openjdk-8-release-${PV}.inc
+INC_FILE_SUFFIX = ""
+INC_FILE_SUFFIX_aarch64 = "-aarch64"
+require openjdk-8-release-${PV}${INC_FILE_SUFFIX}.inc
 require openjdk-8-cross.inc
 
 do_install() {
diff --git a/recipes-core/openjdk/openjre-8_16xbyy.bb b/recipes-core/openjdk/openjre-8_172b11.bb
similarity index 91%
rename from recipes-core/openjdk/openjre-8_16xbyy.bb
rename to recipes-core/openjdk/openjre-8_172b11.bb
index e6454ea..220dc01 100644
--- a/recipes-core/openjdk/openjre-8_16xbyy.bb
+++ b/recipes-core/openjdk/openjre-8_172b11.bb
@@ -1,7 +1,6 @@
-PV = "162b12"
-PV_aarch64 = "161b15"
-
-require openjdk-8-release-${PV}.inc
+INC_FILE_SUFFIX = ""
+INC_FILE_SUFFIX_aarch64 = "-aarch64"
+require openjdk-8-release-${PV}${INC_FILE_SUFFIX}.inc
 require openjdk-8-cross.inc
 
 do_install() {
-- 
2.18.0


