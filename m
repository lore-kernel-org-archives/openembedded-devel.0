Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id B697A78477
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Feb 2018 13:58:43 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id w128so5683483qkb.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Feb 2018 05:58:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hnfhA49EuKIWxUUP7aUXnZYZ+WzE7EGcrvSmtFUb5jU=;
	b=IGI6tnjpsQyIu1rvpEVRbHtaPPDSskwZ6ENM/MqwMcP6FdKbFAWSLmgSzOnojNI6pF
	6bTw4237keJmnX6lYrLh7Cq/VkIjTKYI7uj8LldrRkcJkbJSEQGPyanuTGQkHfV01u/L
	qtpdU9VB+X6Qe8XHhy5ZDlmfiHPUdYccfFO9tgWkOLRW75gTIX8mowfiqtNcvKuikwVI
	yeg/mKfsgn18RvXgoPdUYGJbIVt4yfO2grzzRGujZuqfQr8dnzETqhlWT+oIjh/m9/7x
	aPPvgDFwLd1XWgpqW3jnOWDMYkhyMAUeOGqFOlOcdfsb2C2XmsByNbRv0wcK2HY434KY
	hFmQ==
X-Gm-Message-State: APf1xPBnLprEZYv6bWY562LQrSOLqDMJNJOd2ko2PSOj7PQwGoc0Oi7o
	3oFaP7z5jLRN9QDPHLdH+TB9bf+z
X-Google-Smtp-Source: AH8x225ioQJ+Np7QUXz8AzXG63STHSq2RL71E6nn/6u5BOvYU0/FqZC+1rD2PvKTEX/WKZXaKskUqQ==
X-Received: by 10.55.21.142 with SMTP id 14mr1075420qkv.19.1518098324244;
	Thu, 08 Feb 2018 05:58:44 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id v20sm13275qtg.79.2018.02.08.05.58.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Feb 2018 05:58:43 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Feb 2018 08:58:02 -0500
Message-Id: <1518098282-23564-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-smbus: remove sed to replace i2c path
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
X-List-Received-Date: Thu, 08 Feb 2018 13:58:43 -0000

The i2c-dev file is now installed in the standard location, so
the sed to change the path can be removed

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-smbus.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-smbus.inc b/meta-python/recipes-devtools/python/python-smbus.inc
index 0bca58f..57ca8ae 100644
--- a/meta-python/recipes-devtools/python/python-smbus.inc
+++ b/meta-python/recipes-devtools/python/python-smbus.inc
@@ -9,9 +9,3 @@ SRC_URI[sha256sum] = "5b60daf6f011de0acb61de57dba62f2054bb39f19961d67e0c91610f07
 DEPENDS += "i2c-tools"
 
 S = "${WORKDIR}/i2c-tools-${PV}/py-smbus/"
-
-do_configure_prepend() {
-    # Adjust for OE header rename
-    sed -i s:linux/i2c-dev.h:linux/i2c-dev-user.h: Module.mk
-    sed -i s:linux/i2c-dev.h:linux/i2c-dev-user.h: smbusmodule.c
-}
-- 
2.7.4


