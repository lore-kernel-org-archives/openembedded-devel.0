Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.10044.1599059740987067791
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46838 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDUU6-0004pK-V6; Wed, 02 Sep 2020 18:15:39 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-networking][PATCH 2/3] mosquitto: Upgrade 1.6.11 -> 1.6.12
Date: Wed,  2 Sep 2020 18:15:20 +0300
Message-Id: <20200902151521.16097-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902151521.16097-1-leon.anavi@konsulko.com>
References: <20200902151521.16097-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 1.6.12:

Security:
- In some circumstances, Mosquitto could leak memory when handling
  PUBLISH messages. This is limited to incoming QoS 2 messages,
  and is related to the combination of the broker having
  persistence enabled, a clean session=false client, which was
  connected prior to the broker restarting, then has reconnected
  and has now sent messages at a sufficiently high rate that the
  incoming queue at the broker has filled up and hence messages
  are being dropped. This is more likely to have an effect where
  max_queued_messages is a small value. This has now been fixed.

Broker:
- Build warning fixes when building with WITH_BRIDGE=no and
  WITH_TLS=no.

Clients:
- All clients exit with an error exit code on CONNACK failure.
- Don't busy loop with `mosquitto_pub -l` on a slow connection.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../mosquitto/{mosquitto_1.6.11.bb => mosquitto_1.6.12.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.6.11.bb => mosquitto_1.6.12.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.11.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.12.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.11.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.12.bb
index 369034692..36bfe099f 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.11.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.12.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://install-protocol.patch \
 "
 
-SRC_URI[md5sum] = "35925c7ccd1bac87e4201b635ffa66a1"
-SRC_URI[sha256sum] = "b02d8f1368c40d5779ee125c37daf9003608eb47d7fbb04c5b938c76c1230a1f"
+SRC_URI[md5sum] = "beb8d76d6e45f1e66d711006082a631f"
+SRC_URI[sha256sum] = "548d73d19fb787dd0530334e398fd256ef3a581181678488a741a995c4f007fb"
 
 inherit systemd update-rc.d useradd cmake
 
-- 
2.17.1

