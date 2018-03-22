Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6B6F4788E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 09:11:56 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id w6so8410639qkb.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 02:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dudF+brbhJokqoGMmxx2L5IYt7/Ics03L4PPpcB5igc=;
	b=gQMDhrBMJaiFB+IyS79cN4SY15al7QXo0kqPS1C9yF40ZTB8V9Z9wvzdRgQegXWRgO
	aZEaVo2T2MKKVVvQGTnEcGNO8GYYMxasAIKT9NeG1uD4O44CTtBtKmTdvHw3Rq1F4uls
	BhubOpR2UeIuWJqlooDiDjPtOra/6fUDQBQtkeEViu4KJgPhExdEh+FbvidMKefoX2Oc
	vwQV8XNDu+aMdadlTW5dDZKbU7ShdSHl3tZKYxH1nf3a+gpCabK7jPsUMjOhtElFt6nX
	1H06IHd5FN6F738sZXY0A4zmLtFeWpUcQsIICAmBRNteXvSXpg8xE+d59WIDVy1R8m95
	JwUg==
X-Gm-Message-State: AElRT7HcZRBa1qKCKmNm5VI0NM5smwKZhad+voJ4pMTo5rANTBCKVB1k
	m9UtG8AND120LeC5fRA+My4MeTNP
X-Google-Smtp-Source: AG47ELtz8aDH9Jt6sL7XrgkP285vq3YJKYw4ApolTlnMGkT70pN3A4CIm9VYxGZ92qfmrv6AvbNQEw==
X-Received: by 10.55.43.94 with SMTP id r91mr33190148qkh.214.1521709917433;
	Thu, 22 Mar 2018 02:11:57 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id n68sm823747qke.25.2018.03.22.02.11.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Mar 2018 02:11:56 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2018 09:11:51 +0000
Message-Id: <20180322091152.3145-2-git@andred.net>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180322091152.3145-1-git@andred.net>
References: <20180322091152.3145-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-python][PATCH v2 2/3] python-aws-iot-device-sdk-python: fix LICENSE
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
X-List-Received-Date: Thu, 22 Mar 2018 09:11:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The SDK ships with an embedded, modified copy of python-paho,
which is either EPL-1.0 or EDL-1.0 licensed:

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
 #
 # Contributors:
 #    Roger Light - initial API and implementation

 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=14 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v2:
* also add EDL-1.0
* add more lines to client.py license checksum, so as to spot changes
  more reliably
---
 .../recipes-devtools/python/python-aws-iot-device-sdk-python.inc   | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
index 1fc98bdbd..7b6066083 100644
--- a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
+++ b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
@@ -1,7 +1,10 @@
 DESCRIPTION = "SDK for connecting to AWS IoT using Python."
 HOMEPAGE = "https://github.com/aws/aws-iot-device-sdk-python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9ac49901b833e769c7d6f21e8dbd7b30"
+LICENSE = "Apache-2.0 & (EPL-1.0 | EDL-1.0)"
+LIC_FILES_CHKSUM = "\
+    file://LICENSE.txt;md5=9ac49901b833e769c7d6f21e8dbd7b30 \
+    file://AWSIoTPythonSDK/core/protocol/paho/client.py;endline=14;md5=5a3c8a1a4bb71bd934f450ecff972ad9 \
+"
 
 SRC_URI[md5sum] = "97e8cf0d40ef3765d979c19b534a716d"
 SRC_URI[sha256sum] = "d68cbff396143e837b4c23b6621d3b7ae374281afc75eed8e51a28625d9125ba"
-- 
2.16.2


