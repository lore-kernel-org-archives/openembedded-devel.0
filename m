Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA3CC4332F
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 11:48:42 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.11016.1635248921186723826
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 04:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47990 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mfKwP-0005vc-FO; Tue, 26 Oct 2021 14:48:29 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-paho-mqtt: Upgrade 1.5.1 -> 1.6.1
Date: Tue, 26 Oct 2021 14:48:22 +0300
Message-Id: <20211026114822.15393-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211026114822.15393-1-leon.anavi@konsulko.com>
References: <20211026114822.15393-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 11:48:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93595

Upgrade to release 1.6.1:

- Fix Python 2.7 compatilibity.
- Changed default TLS version to 1.2 instead of 1.0.
- Fix incoming MQTT v5 messages with overall property length > 127
  bytes being incorrectly decoded. Closes #541.
- MQTTMessageInfo.wait_for_publish() and MQTTMessageInfo.is_published()
  will now raise exceptions if called when the publish call
  produced an error.
- Remove periodic retry checks for outgoing messages with QoS>0.
  This means that outgoing messages will only be retried on the
  client reconnecting to the server. They will *not* be retried
  when the client is still connected.
- The `rc` parameter in the `on_disconnect` callback now has
  meaningful values in the case of an error.
- Callbacks can now be applied to client instances using decorators.
- PUBACK messages are now sent to the broker only after the
  on_message callback has returned.
- Raise exceptions when attempting to set MQTT v5 properties to
  forbidden values.
- Callbacks can now be updated from within a callback.
- Remove _out_packet_mutex and _current_out_packet_mutex and
  convert the _out_packet queue use to thread safe.
- Add basic MQTT v5 support to the subscribe and publish helper
  functions.
- Fix on_disconnect() sometimes calling the MQTT v3.x callback
  when it should call the MQTT v5 callback.
- Big performance improvement when receiving large payloads,
  particularly for SSL.
- Fix connecting with MQTT v5 to a broker that doesn't support
  MQTT v5.
- Removed ancient Mosquitto compatibility class.
- Fix exception on calling Client(client_id="", clean_session=False).
- Experimental support for Websockets continuation frames.
- `Properties.json()` now converts Correlation Data bytes()
  objects to hex.
- Only use the internal sockpair wakeup when running with
  loop_start() or loop(). This removes problems when running with
  an external event loop.
- Drain all of sockpairR bytes to avoid unnecessary wakeups and
  possible timeouts.
- Add timeout to MQTTMessageInfo:wait_for_publish().

License-Update: Update to EPL-2.0

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-paho-mqtt_1.5.1.bb => python3-paho-mqtt_1.6.1.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-paho-mqtt_1.5.1.bb => python3-paho-mqtt_1.6.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.1.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.6.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-paho-mqtt_1.6.1.bb
index 2d4e55abc..81a6d0a9c 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.6.1.bb
@@ -1,15 +1,13 @@
 SUMMARY = "MQTT version 3.1/3.1.1 client library"
 LICENSE = "EPL-1.0 | EDL-1.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eb48c6ee2cb9f5b8b9fe75e6f817bdfc \
-                    file://epl-v10;md5=8d383c379e91d20ba18a52c3e7d3a979 \
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8e5f264c6988aec56808a3a11e77b913 \
                     file://edl-v10;md5=c09f121939f063aeb5235972be8c722c \
 "
 SRCNAME = "paho-mqtt"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "32f93c0ed92c7439f7a715ed258fd35d"
-SRC_URI[sha256sum] = "9feb068e822be7b3a116324e01fb6028eb1d66412bf98595ae72698965cb1cae"
+SRC_URI[sha256sum] = "2a8291c81623aec00372b5a85558a372c747cbca8e9934dfe218638b8eefc26f"
 
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 
@@ -20,7 +18,7 @@ do_install:append() {
 
 PACKAGES =+ "${PN}-examples"
 
-RDEPENDS:${PN}-examples += "${PN}"
+RDEPENDS:${PN}-examples += "${PN} ${PYTHON_PN}-core"
 
 FILES:${PN}-examples = "${datadir}/${BPN}/examples"
 
-- 
2.17.1


