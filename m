Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id E50E271951
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 13:24:12 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id p67so2673689qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 06:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=tJy8hyMMjw+5Hw474QLDR81HsDXM84zkRpU3CoiHBO8=;
	b=lfMTsH0U4sm3233aR1ZW8eB2gf14SaCEevn3eSaTxAMq6lBCxteCxsdbAY6cLc8d7w
	rW3PtmagXhRy4YpMYyKwYwNef9F+9j5Vzaut8zHaCsFhXqlKquXpBYFYbJCompP2jsE/
	77L2E1W7uZEeBQ4uQoZwKoXu2hg3SrS8W+Ng3T54M9TjbZ02fMcqEz14hZVi0pc8QjRD
	poQfCSleXPWQ37J0SbuBwD1+R6r/tcDBpgg1YjejieXSZOWjPqAPacFONvFnNhqxbTac
	Fwg8pFWDK5xT3wvDDopZTrS08/ewD9BLEfjZtet5uRO0+XbadkyveBVzOJ3DO9OkKMhd
	0rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=tJy8hyMMjw+5Hw474QLDR81HsDXM84zkRpU3CoiHBO8=;
	b=uP6b18DipBoatCFm7wim9vgJLMvUOveupyGF/9mI85f8dgAE0s3a/Gu4Y4s2glCAz3
	giTaHcumv+fECW2ArK0lkF58hVlS0JQZyqAJUQFxh1Ifa11inAZVKY+adnSeOoenpxpc
	/BJ2bwBtR3Y4HzakRsC9KU9wRS62954BhknQS4EF1/s2QLSmPCzCcjKrCDUND/0319l8
	oOBwzC1RS2xr6l3SIkeqyVW2MaFuHJieL8xmB6Atp1QKoK/SP/H4YRuU3a68l0+m0C6u
	Pd7C8joClTP9Bk/stROJGxjJU0hCnUz0js4SHAwaHw9GVgRLrkp+2V+EGo2OBl6xR+aD
	zkgg==
X-Gm-Message-State: AHYfb5i/RTWd1HcERVpQf1DkJqXNO819Q0kH615rEWLWDHaJaoW+e3pR
	8+qkJbtcHYz2pnUBGMQ=
X-Received: by 10.55.76.69 with SMTP id z66mr5975665qka.62.1504013053422;
	Tue, 29 Aug 2017 06:24:13 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	o35sm1914736qtj.59.2017.08.29.06.24.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 06:24:12 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Aug 2017 10:23:49 -0300
Message-Id: <20170829132349.6178-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH] python-aws-iot-device-sdk-python: Add recipe for version 1.1.2
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
X-List-Received-Date: Tue, 29 Aug 2017 13:24:14 -0000

The AWS IoT Device SDK for Python allows developers to write Python
script to use their devices to access the AWS IoT platform through
MQTT or MQTT over the WebSocket protocol.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../python/python-aws-iot-device-sdk-python.inc        | 18 ++++++++++++++++++
 .../python/python-aws-iot-device-sdk-python_1.1.2.bb   |  2 ++
 .../python/python3-aws-iot-device-sdk-python_1.1.2.bb  |  2 ++
 3 files changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
 create mode 100644 meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.1.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
new file mode 100644
index 000000000..a64c6c49a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
@@ -0,0 +1,18 @@
+DESCRIPTION = "SDK for connecting to AWS IoT using Python."
+HOMEPAGE = "https://github.com/aws/aws-iot-device-sdk-python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9ac49901b833e769c7d6f21e8dbd7b30"
+
+SRC_URI[md5sum] = "6835982c7fb36b19aa474d346f29ec3d"
+SRC_URI[sha256sum] = "ac98d39d7230e06fc9a30bdb3398c985a7c357b10898a769db022d315855102a"
+
+inherit pypi
+
+PYPI_PACKAGE = "AWSIoTPythonSDK"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-pyopenssl \
+    ${PYTHON_PN}-json \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.1.2.bb b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.1.2.bb
new file mode 100644
index 000000000..12ae978e3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.1.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-aws-iot-device-sdk-python.inc
diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.1.2.bb b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.1.2.bb
new file mode 100644
index 000000000..c43649dbf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.1.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-aws-iot-device-sdk-python.inc
-- 
2.11.0


