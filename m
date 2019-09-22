Return-Path: <leon.anavi@konsulko.com>
X-Greylist: delayed 1393 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 22 Sep 2019 12:39:31 UTC
Received: from anavi.org (anavi.technology [91.215.217.29])
	by mail.openembedded.org (Postfix) with ESMTP id 1D3267DD70
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Sep 2019 12:39:31 +0000 (UTC)
Received: from lan.nucleusys.com ([92.247.61.126]:54036
	helo=taos.nucleusys.com) by voyager.icnhost.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1iC0mn-00031d-84; Sun, 22 Sep 2019 15:16:18 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Sep 2019 15:15:51 +0300
Message-Id: <20190922121551.1874-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [meta-networking][PATCH] mosquitto: update to 1.6.6
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
X-List-Received-Date: Sun, 22 Sep 2019 12:39:31 -0000
Content-Transfer-Encoding: 8bit

Fix security vulnerabilities. For further details, see:
https://mosquitto.org/blog/2019/09/version-1-6-6-released/

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../mosquitto/{mosquitto_1.6.5.bb => mosquitto_1.6.6.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.6.5.bb => mosquitto_1.6.6.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.5.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.6.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.5.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.6.bb
index 4bb0720ca..1f2e0c602 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.5.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.6.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
 "
 
-SRC_URI[md5sum] = "12a1bd274d5ec454649a06c1bf65d802"
-SRC_URI[sha256sum] = "bc71b38b5a26fc7cc772853e5607c657868db9f9a6d2b15e2b677649a0f85d20"
+SRC_URI[md5sum] = "529b6de33bac18363c2db46194d8d91c"
+SRC_URI[sha256sum] = "82676bf4201ff102be1511b56b041a9450fbbfeda40b21aa28be0fee56e8de17"
 
 inherit systemd update-rc.d useradd
 
-- 
2.20.1


