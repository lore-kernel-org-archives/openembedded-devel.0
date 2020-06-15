Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.14561.1592217040290986330
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2020 03:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45690 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jkmNy-0002ty-B7; Mon, 15 Jun 2020 13:30:39 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-can: Upgrade 3.3.2 -> 3.3.3
Date: Mon, 15 Jun 2020 13:30:17 +0300
Message-Id: <20200615103017.2714-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615103017.2714-1-leon.anavi@konsulko.com>
References: <20200615103017.2714-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.3.3. It contains backported fixes from 4.x
development branch which targets Python 3:

- Backport caching msg.data value in neovi interface.
- Fix Vector CANlib treatment of empty app name.
- Handle empty CSV file.
- ASCII reader can now handle FD frames.
- Exclude test packages from distribution.
- RTR crash fix in canutils log reader parsing RTR frames.
- Skip J1939 messages in ASC Reader.
- Exposes a configuration option to allow the CAN message player
  to send error frames (and sets the default to not send
  error frames).
- Fixes the semantics provided by periodic tasks in SocketCAN interface.
- Avoid padding CAN_FD_MESSAGE_64 objects to 4 bytes.
- Fixes the broken CANalyst-II interface.
- Socketcan BCM status fix.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-can_3.3.2.bb => python3-can_3.3.3.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-can_3.3.2.bb => python3-can_3.3.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-can_3.3.2.bb b/meta-python/recipes-devtools/python/python3-can_3.3.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-can_3.3.2.bb
rename to meta-python/recipes-devtools/python/python3-can_3.3.3.bb
index 698eaf5b3..4da233959 100644
--- a/meta-python/recipes-devtools/python/python3-can_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-can_3.3.3.bb
@@ -3,8 +3,8 @@ SECTION = "devel/python"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[md5sum] = "b724553a330478270267380b4888a18e"
-SRC_URI[sha256sum] = "5fefb5c1e7e7f07faefc02c6eac79f9b58376f007048a04d8e7f325d48ec6b2e"
+SRC_URI[md5sum] = "1310da316799e4b12944a6c1dcb017a9"
+SRC_URI[sha256sum] = "ecd69cf6b2f0235345ebe607a15325cf1384c85b24ffbe1d68c3754357f87488"
 
 PYPI_PACKAGE="python-can"
 
-- 
2.17.1

