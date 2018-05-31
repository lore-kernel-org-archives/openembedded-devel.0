Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A804C608B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 23:13:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2018 16:13:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,464,1520924400"; d="scan'208";a="44374626"
Received: from mmuhamm2-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.65.213])
	by fmsmga008.fm.intel.com with ESMTP; 31 May 2018 16:13:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jun 2018 11:12:42 +1200
Message-Id: <43e47f1b67764ba909535ba52f21b9a25f3f5cb5.1527808350.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1527808350.git.paul.eggleton@linux.intel.com>
References: <cover.1527808350.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 1/1] mosquitto: upgrade to 1.4.15
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
X-List-Received-Date: Thu, 31 May 2018 23:13:17 -0000

Security update - fixes CVE-2017-7651 and CVE-2017-7652, as well as a
number of other non-security issues.

For more details see the release announcement:

  https://mosquitto.org/blog/2018/02/security-advisory-cve-2017-7651-cve-2017-7652/

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../mosquitto/{mosquitto_1.4.14.bb => mosquitto_1.4.15.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.4.14.bb => mosquitto_1.4.15.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
index 13ce3811d..939bad54e 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
 "
 
-SRC_URI[md5sum] = "6b0966e93f118bc71ad7b61600a6c2d3"
-SRC_URI[sha256sum] = "156b1fa731d12baad4b8b22f7b6a8af50ba881fc711b81e9919ec103cf2942d1"
+SRC_URI[md5sum] = "546cb1ce35cc3f7d23e6d2f1f9a962e7"
+SRC_URI[sha256sum] = "7d3b3e245a3b4ec94b05678c8199c806359737949f4cfe0bf936184f6ca89a83"
 
 inherit systemd update-rc.d useradd
 
-- 
2.14.3


