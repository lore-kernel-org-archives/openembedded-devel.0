Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 695D77F4DC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 00:39:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Oct 2019 17:39:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,278,1566889200"; d="scan'208";a="187791000"
Received: from kwang27-mobl10.gar.corp.intel.com (HELO linux.fritz.box)
	([10.249.75.165])
	by orsmga008.jf.intel.com with ESMTP; 09 Oct 2019 17:39:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Oct 2019 13:39:01 +1300
Message-Id: <980099be7f57170c22abf8a38e8772fbba9fb5e8.1570667753.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1570667753.git.paul.eggleton@linux.intel.com>
References: <cover.1570667753.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] mosquitto: update to 1.6.7
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
X-List-Received-Date: Thu, 10 Oct 2019 00:39:10 -0000
Content-Transfer-Encoding: 8bit

Bugfix release. For details, see:

  https://mosquitto.org/blog/2019/09/version-1-6-7-released/

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../mosquitto/{mosquitto_1.6.6.bb => mosquitto_1.6.7.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.6.6.bb => mosquitto_1.6.7.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.6.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.7.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.6.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.7.bb
index 1f2e0c6021..340f643d4a 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.6.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.7.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
 "
 
-SRC_URI[md5sum] = "529b6de33bac18363c2db46194d8d91c"
-SRC_URI[sha256sum] = "82676bf4201ff102be1511b56b041a9450fbbfeda40b21aa28be0fee56e8de17"
+SRC_URI[md5sum] = "ec9074c4f337f64eaa9a4320c6dab020"
+SRC_URI[sha256sum] = "bcd31a8fbbd053fee328986fadd8666d3058357ded56b9782f7d4f19931d178e"
 
 inherit systemd update-rc.d useradd
 
-- 
2.20.1


