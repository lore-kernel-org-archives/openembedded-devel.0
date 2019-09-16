Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB2E7F276
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 23:54:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Sep 2019 16:54:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,514,1559545200"; d="scan'208";a="216383742"
Received: from klim280-mobl1.gar.corp.intel.com (HELO linux.fritz.box)
	([10.255.155.138])
	by fmsmga002.fm.intel.com with ESMTP; 16 Sep 2019 16:54:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Sep 2019 11:54:35 +1200
Message-Id: <3f1a1eae44e7de11c988c69b8b3c728f9c3dc565.1568678019.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1568678019.git.paul.eggleton@linux.intel.com>
References: <cover.1568678019.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 1/1] mosquitto: update to 1.6.5
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
X-List-Received-Date: Mon, 16 Sep 2019 23:54:51 -0000
Content-Transfer-Encoding: 8bit

A lot of changes upstream since the last upgrade, the highlights:
* MQTT v5 protocol support
* Performance improvements
* New mosquitto_rr (request/response) client
* TLS enhancements: OCSP stapling, TLS Engine support, explicit TLS v1.3
  support, removed TLS v1.0 support

For further details, see https://mosquitto.org/blog/

Additionally, SUMMARY and DESCRIPTION were tidied up as needed.

Based upon an earlier upgrade patch by Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../{mosquitto_1.5.8.bb => mosquitto_1.6.5.bb}      | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.5.8.bb => mosquitto_1.6.5.bb} (86%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.8.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.5.bb
similarity index 86%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.8.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.5.bb
index 768b5930fb..4bb0720ca5 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.8.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.5.bb
@@ -1,5 +1,9 @@
-SUMMARY = "Open source MQTT v3.1/3.1.1 implemention"
-DESCRIPTION = "Mosquitto is an open source (Eclipse licensed) message broker that implements the MQ Telemetry Transport protocol version 3.1 and 3.1.1. MQTT provides a lightweight method of carrying out messaging using a publish/subscribe model. "
+SUMMARY = "Open source MQTT implementation"
+DESCRIPTION = "Mosquitto is an open source (Eclipse licensed) message broker \
+that implements the MQ Telemetry Transport protocol version 3.1, 3.1.1 and \
+5, providing both an MQTT broker and several command-line clients. MQTT \
+provides a lightweight method of carrying out messaging using a \
+publish/subscribe model. "
 HOMEPAGE = "http://mosquitto.org/"
 SECTION = "console/network"
 LICENSE = "EPL-1.0 | EDL-1.0"
@@ -14,8 +18,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
 "
 
-SRC_URI[md5sum] = "bbbcceb32db3657d9d436a8440a9db1c"
-SRC_URI[sha256sum] = "78d7e70c3794dc3a1d484b4f2f8d3addebe9c2da3f5a1cebe557f7d13beb0da4"
+SRC_URI[md5sum] = "12a1bd274d5ec454649a06c1bf65d802"
+SRC_URI[sha256sum] = "bc71b38b5a26fc7cc772853e5607c657868db9f9a6d2b15e2b677649a0f85d20"
 
 inherit systemd update-rc.d useradd
 
@@ -79,6 +83,7 @@ FILES_libmosquittopp1 = "${libdir}/libmosquittopp.so.1"
 
 FILES_${PN}-clients = "${bindir}/mosquitto_pub \
                        ${bindir}/mosquitto_sub \
+                       ${bindir}/mosquitto_rr \
 "
 
 FILES_${PN}-examples = "${sysconfdir}/mosquitto/*.example"
-- 
2.20.1


