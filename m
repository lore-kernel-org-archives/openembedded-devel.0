Return-Path: <leon.anavi@konsulko.com>
Received: from anavi.org (anavi.technology [91.215.217.29])
	by mail.openembedded.org (Postfix) with ESMTP id 287D06C108
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 21:32:41 +0000 (UTC)
Received: from [78.130.245.67] (port=57536 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-SHA256:128) (Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1igbVI-0006cg-Cl; Sun, 15 Dec 2019 23:32:41 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Dec 2019 23:32:28 +0200
Message-Id: <1576445548-5596-1-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
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
Subject: [meta-networking][PATCH] mosquitto: update to 1.6.8
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
X-List-Received-Date: Sun, 15 Dec 2019 21:32:42 -0000

Bugfix release. For details, see:

  https://mosquitto.org/blog/2019/11/version-1-6-8-released/

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../mosquitto/{mosquitto_1.6.7.bb => mosquitto_1.6.8.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.6.7.bb => mosquitto_1.6.8.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.7.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.8.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.7.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.8.bb
index 340f643..ea533d8 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.7.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.8.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
 "
 
-SRC_URI[md5sum] = "ec9074c4f337f64eaa9a4320c6dab020"
-SRC_URI[sha256sum] = "bcd31a8fbbd053fee328986fadd8666d3058357ded56b9782f7d4f19931d178e"
+SRC_URI[md5sum] = "24a0e567c845b3e41b75e237d200edf8"
+SRC_URI[sha256sum] = "7df23c81ca37f0e070574fe74414403cf25183016433d07add6134366fb45df6"
 
 inherit systemd update-rc.d useradd
 
-- 
2.7.4


