Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218D7EFCD84
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:06:43 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10845.1773050801375379572
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=cBZ8TWwL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1334352-202603091006392c02c59d90000207e2-8sr_f3@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202603091006392c02c59d90000207e2
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 09 Mar 2026 11:06:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=EmElT7DWYb5Y8z78SxD5RJPBTDtk1Tyho9IkHNwApLE=;
 b=cBZ8TWwLPoVrfYtMlbf5Ju9SxMB0KFWp2aKtHAtGLoRYwIhy2QDIKOnRDARAqFojBhqaR+
 fUYkJglx+k5BLt3R05/qRfDaV0sSYIDZOYgi5FM7hXqHvRAJ32hlCcVpnXgoQIGFyrcsdc1U
 JKwEWfqimmmv0PmCERSZfjzd29r2N7tbb7DsXEPd3fXVZ5aN0PucfXA9CXpIgGHV/3vYlqtI
 2pjqdtq7cCng/YzVsQ76apoRb7R+ZGlBxinELaVQUODhLQXMdMfGxVSQoyGITOsfrW22vGQ+
 DexgJzQ7VhRXxfgmVQboFxE4LEo/w07uRn/eRn42AfSx6qJ/sY8ftesg==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH 09/14] paho-mqtt-cpp: upgrade 1.5.3 -> 1.6.0
Date: Mon,  9 Mar 2026 11:06:25 +0100
Message-ID: <20260309100630.404637-9-andrej.kozemcak@siemens.com>
In-Reply-To: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
References: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124980

Changelog:
  https://github.com/eclipse-paho/paho.mqtt.cpp/releases/tag/v1.6.0

Changes:
- Bumped Paho C submodule to v1.3.16 and updated directory name to externals/paho.mqtt.c
- Some significant performance increases (lower latency) for connect and publish
- Fixed topic_matcher and topic_filter to properly match parent with multi-level ('#') wildcard.
- Slight optimization of topic_filter to do simple string comparison if the filter does not contain wildcards.
- Set a minimum version for Paho C in the CMake file. Report the version found.
- .deb version properly set, and add architecture name to .deb file
- remove const from connect_options_builder 'move' constructor
- fix potential deadlock in thread_queue on capacity increase.
- Incorrect default retain value in a will options constructor
- prevent undefined behaviour on empty topic matching
- Sync reconnect example crashes on first reconnect

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../{paho-mqtt-cpp_1.5.3.bb => paho-mqtt-cpp_1.6.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-cpp/{paho-mqtt-cpp_1.5.3.bb => paho-mqtt-cpp_1.6.0.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.6.0.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.6.0.bb
index 5b4aed3001..53c1d5770b 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.6.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "17ff3dc0270738adc710667be44847eebc038ae0"
+SRCREV = "c0b43a49d7b7e7b5e7009658ca22f19ac1112c83"
 
 DEPENDS = "openssl paho-mqtt-c"
 
-- 
2.47.3


