Return-Path: <andre.draszik@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5D27372ECD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 15:07:29 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id a13so9090327pgu.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 08:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cIeReSUPU932Nk4XObXygBO2oD7I5xN6cTFuEp69OP0=;
	b=rO17XLjjvrI2Qr9GgG5GmNEdtFlS8CKFmMLlmctX73Ig3+uzorV6mGw6XRymhkfZan
	4hEzsWBRYAx3mvB/xcfACn+YG3fBVLY4S+HEMgUqhiEappPYxb3CZWPElkd/BSrxv7nD
	T7Ck4PUDGf8axX+M9j4eRUytZOF9nAoShD+GDEDCKL0dla72ecYJJjey/jmT9ZUDc8uT
	w0q3jkNJTGm+Ny3eAPhXZXitUGTS9TDh3Jvgqav/Ch8D8uqDg9OMmYUnL5Vl41UQnkfO
	KVvf28CTfzKWcOE5y8Ewyp3mqJ5IGv+N26PNDK/ZTWoS6F1QzZhZPuKSsk7G6j2cmgoJ
	w+jA==
X-Gm-Message-State: ALQs6tD4n+rd37FB1cmWQ998UhPatyadWVpaIFBzhq5LbSeZsWutM72n
	tQCk3Rhz0N/kens0vU6aelhprRTK
X-Google-Smtp-Source: AIpwx4/d+s+oHauPwNFzo0K7IyJPIwoJyEiBG1tnrk8kiLfnp4VQaYVN1MSkFSM0J2MX7amYAQAi+Q==
X-Received: by 2002:a17:902:d24:: with SMTP id
	33-v6mr29135405plu.22.1524668850887; 
	Wed, 25 Apr 2018 08:07:30 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id d4sm3032171pfl.24.2018.04.25.08.07.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Apr 2018 08:07:30 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Apr 2018 16:07:24 +0100
Message-Id: <20180425150724.9102-1-git@andred.net>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Subject: [meta-java][PATCH] openjdk-8: update aarch64 version to 8u162b12
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
X-List-Received-Date: Wed, 25 Apr 2018 15:07:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 recipes-core/openjdk/openjdk-8-release-161b15.inc  | 33 ----------------------
 .../openjdk/openjdk-8-release-162b12-aarch64.inc   | 33 ++++++++++++++++++++++
 recipes-core/openjdk/openjdk-8_16xbyy.bb           |  5 ++--
 recipes-core/openjdk/openjre-8_16xbyy.bb           |  5 ++--
 4 files changed, 39 insertions(+), 37 deletions(-)
 delete mode 100644 recipes-core/openjdk/openjdk-8-release-161b15.inc
 create mode 100644 recipes-core/openjdk/openjdk-8-release-162b12-aarch64.inc

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
diff --git a/recipes-core/openjdk/openjdk-8-release-162b12-aarch64.inc b/recipes-core/openjdk/openjdk-8-release-162b12-aarch64.inc
new file mode 100644
index 0000000..ed3e957
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-release-162b12-aarch64.inc
@@ -0,0 +1,33 @@
+require openjdk-8-release-16xbyy.inc
+
+CORBA_CHANGESET_aarch64 = "2c6daa746022"
+SRC_URI[corba.md5sum] = "2ca2413f1e6eaeb49b1c138c5cafcb30"
+SRC_URI[corba.sha256sum] = "3ffcd358e45b4af5a62d9ac1c8abea2e33a9d25b34096084bc77349d846cf4f4"
+
+HOTSPOT_CHANGESET_aarch64 = "b08b1e9e2963"
+SRC_URI[hotspot.md5sum] = "bb632eba37ad0f54e0535c1e0ae3440c"
+SRC_URI[hotspot.sha256sum] = "fcf8369ff8871dbee81de7a15432b625dd2c6dcfe43d2dd5194d9273de0fdbfc"
+
+JAXP_CHANGESET_aarch64 = "413640f7312d"
+SRC_URI[jaxp.md5sum] = "3232a514db9b7ed2ffbc9ebd69acb4fd"
+SRC_URI[jaxp.sha256sum] = "05ed49cea8559bcbd2ef285c8cfcb0b2026aefb1178ec531f9c72e3918c97a9c"
+
+JAXWS_CHANGESET_aarch64 = "8b27752a1bbe"
+SRC_URI[jaxws.md5sum] = "6688b2d40a0c1d5edff1f5594b6ac7a0"
+SRC_URI[jaxws.sha256sum] = "c818df20d14411af78654cb53cd7f87b1c5b42ed0158775869571a42f75f3c84"
+
+JDK_CHANGESET_aarch64 = "9944f808c91d"
+SRC_URI[jdk.md5sum] = "77b1caebd3d9b89af6ee8d57958334f8"
+SRC_URI[jdk.sha256sum] = "d401a0611c90b52d08424d427cb43e81234dda46645a02d90531dbcbb9976b80"
+
+LANGTOOLS_CHANGESET_aarch64 = "7b393a96b373"
+SRC_URI[langtools.md5sum] = "11e7742f439070bfd697866ad6d1a535"
+SRC_URI[langtools.sha256sum] = "bf85f6e224c4634a9f07eae7dd61786b68803bbf95b0cd022553c80abf457967"
+
+NASHORN_CHANGESET_aarch64 = "31efd519fdb3"
+SRC_URI[nashorn.md5sum] = "47c7267b6e3e3dc30fd18b4d87869c20"
+SRC_URI[nashorn.sha256sum] = "bb8aa4e4d9cf5878dd56528b34002c69d3078adaa4de03e6715d6fd56dbf819d"
+
+OPENJDK_CHANGESET_aarch64 = "f8e58f4c29ae"
+SRC_URI[openjdk.md5sum] = "39cc58bdee52d8997d9674a7b4162935"
+SRC_URI[openjdk.sha256sum] = "66fef9d2abfc8a6769fc6ae552891e984921c55312bf06937b2ce619dc97678f"
diff --git a/recipes-core/openjdk/openjdk-8_16xbyy.bb b/recipes-core/openjdk/openjdk-8_16xbyy.bb
index dd0ed1d..0802078 100644
--- a/recipes-core/openjdk/openjdk-8_16xbyy.bb
+++ b/recipes-core/openjdk/openjdk-8_16xbyy.bb
@@ -1,7 +1,8 @@
 PV = "162b12"
-PV_aarch64 = "161b15"
 
-require openjdk-8-release-${PV}.inc
+INC_FILE_SUFFIX = ""
+INC_FILE_SUFFIX_aarch64 = "-aarch64"
+require openjdk-8-release-${PV}${INC_FILE_SUFFIX}.inc
 require openjdk-8-cross.inc
 
 do_install() {
diff --git a/recipes-core/openjdk/openjre-8_16xbyy.bb b/recipes-core/openjdk/openjre-8_16xbyy.bb
index e6454ea..ab78339 100644
--- a/recipes-core/openjdk/openjre-8_16xbyy.bb
+++ b/recipes-core/openjdk/openjre-8_16xbyy.bb
@@ -1,7 +1,8 @@
 PV = "162b12"
-PV_aarch64 = "161b15"
 
-require openjdk-8-release-${PV}.inc
+INC_FILE_SUFFIX = ""
+INC_FILE_SUFFIX_aarch64 = "-aarch64"
+require openjdk-8-release-${PV}${INC_FILE_SUFFIX}.inc
 require openjdk-8-cross.inc
 
 do_install() {
-- 
2.16.2


