Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8C07C78964
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 16:59:26 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id o184so6154134qkd.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 09:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=J76fjE+p1TAg10f3ySVEFwBcsfyJ9HIi8eF+zChKm9M=;
	b=lUZO8cDymIX7X93iyfIUp6+d+MUQ2HqBZZY+i3L+hyxEtYBlHAbYqzry8bQ+pj4Uwa
	94S3psjooEDhe/pnVqOWErgIbwXy5BWYc72SYid4+v4Vr8HvJEgXq8B9JHCb+l/RGGSZ
	D83R78GyYRjTwgJ6aECwSeLhTY0QkiJ3DUdocJdk2Vtxo5qoRBIf7oW5vNtK6Wpo6Fr8
	OeLJwPxcPK6bzesHaylUDhN1A3pd7klpwsTtZaqsoH0uJJ+erqnpphV0X+PUZxTZm5U8
	Hv8I/MJSG8PgbC/owIr3T/xeKWyHbVNHMBQxptQCH0G+QgtIdFKqSJNAHJMcQg+tOQTW
	oPDQ==
X-Gm-Message-State: AElRT7FainNRjIRZnyyY/TLXnVNyhOKeDM2E8EXE2h3yKjJWsYfq5NJ1
	NNNTKyDV9b5AOPe83mXQvBwbPTFB
X-Google-Smtp-Source: AG47ELvzhMcV7pHx0gW4asI2+QJD59NUKXQWryeYAmfcWO2kJsLFvQklN+6E5u8n4DGDRJ058En1vg==
X-Received: by 10.55.144.71 with SMTP id s68mr30062262qkd.285.1521651567742;
	Wed, 21 Mar 2018 09:59:27 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	d11sm3065587qth.97.2018.03.21.09.59.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Mar 2018 09:59:26 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2018 16:59:22 +0000
Message-Id: <20180321165923.31902-2-git@andred.net>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180321165923.31902-1-git@andred.net>
References: <20180321165923.31902-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/3] python-aws-iot-device-sdk-python: fix LICENSE
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
X-List-Received-Date: Wed, 21 Mar 2018 16:59:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The SDK ships with an embedded, modified copy of python-paho,
which is licensed under the EPL-1.0 license:

 vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
 # Copyright (c) 2012-2014 Roger Light <roger@atchoo.org>
 #
 # All rights reserved. This program and the accompanying materials
 # are made available under the terms of the Eclipse Public License v1.0
 # and Eclipse Distribution License v1.0 which accompany this distribution.
 #
 # The Eclipse Public License is available at
 #    http://www.eclipse.org/legal/epl-v10.html
 # and the Eclipse Distribution License is available at
 #   http://www.eclipse.org/org/documents/edl-v10.php.
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=10 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .../recipes-devtools/python/python-aws-iot-device-sdk-python.inc   | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
index 1fc98bdbd..d31c01411 100644
--- a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
+++ b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
@@ -1,7 +1,10 @@
 DESCRIPTION = "SDK for connecting to AWS IoT using Python."
 HOMEPAGE = "https://github.com/aws/aws-iot-device-sdk-python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9ac49901b833e769c7d6f21e8dbd7b30"
+LICENSE = "Apache-2.0 & EPL-1.0"
+LIC_FILES_CHKSUM = "\
+    file://LICENSE.txt;md5=9ac49901b833e769c7d6f21e8dbd7b30 \
+    file://AWSIoTPythonSDK/core/protocol/paho/client.py;endline=10;md5=9381d38fd42b5ce6e76107252d75224a \
+"
 
 SRC_URI[md5sum] = "97e8cf0d40ef3765d979c19b534a716d"
 SRC_URI[sha256sum] = "d68cbff396143e837b4c23b6621d3b7ae374281afc75eed8e51a28625d9125ba"
-- 
2.16.2


