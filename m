Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.41569.1597664669416125171
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 04:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34842 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k7dYw-0002Gz-36; Mon, 17 Aug 2020 14:44:27 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-networking][PATCH] mosquitto: Upgrade 1.6.10 -> 1.6.11
Date: Mon, 17 Aug 2020 14:44:18 +0300
Message-Id: <20200817114418.11498-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 1.6.11:

Broker:
- Fix usage message only mentioning v3.1.1.
- Fix broker refusing to start if only websockets listeners were
  defined.
- Change systemd unit files to create /var/log/mosquitto before
  starting.
- Don't quit with an error if opening the log file isn't possible.
- Fix bridge topic remapping when using "" as the topic.
- Fix messages being queued for disconnected bridges when clean
  start was set to true.
- Fix `autosave_interval` not being triggered by messages being
  delivered.
- Fix websockets clients sometimes not being disconnected promptly.
- Fix "slow" file based logging by switching to line based
  buffering.
- Log protocol error message where appropriate from a bad
  UNSUBSCRIBE, rather than the generic "socket error".
- Don't try to start DLT logging if DLT unavailable, to avoid a
  long delay when shutting down the broker.
- Fix potential memory leaks.
- Fix clients not receiving messages after a previous client with
  the same client ID and positive will delay interval quit.
- Fix overly broad HAVE_PTHREAD_CANCEL compile guard.

Client library:
- Improved documentation around connect callback return codes.
- Fix `mosquitto_publish*()` no longer returning
  `MOSQ_ERR_NO_CONN` when not connected.
- `mosquitto_loop_start()` now sets a thread name on Linux,
  FreeBSD, NetBSD, and OpenBSD.
- Fix `mosquitto_loop_stop()` not stopping on Windows.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../mosquitto/{mosquitto_1.6.10.bb => mosquitto_1.6.11.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.6.10.bb => mosquitto_1.6.11.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.10.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.11.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.10.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.11.bb
index 9f6080336..369034692 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.10.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.11.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://install-protocol.patch \
 "
 
-SRC_URI[md5sum] = "960f963b81b7f93982d7511cd28082e5"
-SRC_URI[sha256sum] = "92d1807717f0f6d57d1ac1207ffdb952e8377e916c7b0bb4718f745239774232"
+SRC_URI[md5sum] = "35925c7ccd1bac87e4201b635ffa66a1"
+SRC_URI[sha256sum] = "b02d8f1368c40d5779ee125c37daf9003608eb47d7fbb04c5b938c76c1230a1f"
 
 inherit systemd update-rc.d useradd cmake
 
-- 
2.17.1

