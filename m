Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0E2D97D1F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 15:50:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f8so17321480wrt.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 08:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dggqQ4izgPQwjOsCwV70Zc0Vw2cSqewTw9JCFDarCTQ=;
	b=WkSYe6xo/ZjT/OM8McFFEodXTGIlac4EeuC8tplEV9EEllikbEkvXEaBIgjS7/u3Mk
	bW98a1LGzGFQPEU1dvyIGQaH04JJX72fvYEW75EDt058gQBkJ0I3W3LDWRmRgamFtERf
	VRzDiReqIQaUlH/4aMtQoXnROqFkdL+s2FOceQs5cQldmXzG9Zo9klnll2BX/fR4Dg/3
	kRTrHsINAKV/iHzLU63bfpGhKSIGvaT4SN1iNldbbZgHazEuvoyQJrMmRJFYQPjjBra0
	3XKg3PIpF7QS3xa/gizapYLPScTAJHhAqtmZAsL4S1Icp2CyXAH3c6Gs4ZHHFWqcQMfl
	94tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dggqQ4izgPQwjOsCwV70Zc0Vw2cSqewTw9JCFDarCTQ=;
	b=npzOUmbx2ly8HpkmE97RpMNVR9X7GyWaX/zRpLCQoVBkpngxc+4lykDsL9lea5E7ve
	yBI+PsHReT/z8LtgddmtFfBW/8qx5KExCGt/rA7g7tyrEleWfXTFI/C7/GaQ2173oLzO
	mbusfLhvLizEGUUfbuOuZuo41ec/yrAYsiLRozPXooKva+dnzfobsI9Rg9Y6qiI2iJ+B
	Z3q830oFnaTWfbcghvyJNzvJx3rbX8br3IWvQ18qEPD1glrXHWWmtzod8QQWeeixLJtW
	X9FRbET2bJLE+f/8u9FFu1EkssKbyUvvy9SeBp5gbgj+FLHew0y5JMqddYvy7KRw7XCi
	eZpQ==
X-Gm-Message-State: APjAAAWLVS23QuL8YsKKh/5M331vVmQwhZSJvGewac+evTIZxUFteTl3
	xojsqimuvTc+1sQWoHnBfuglC3j/
X-Google-Smtp-Source: APXvYqxIaqiEKPLZhQEBWolvMWE3X+7b/VKVV9cOdrHSF2F0WSvYjr5WQsb7W5lbr359WDBLedx+TQ==
X-Received: by 2002:a5d:49cd:: with SMTP id t13mr2919669wrs.287.1558972225533; 
	Mon, 27 May 2019 08:50:25 -0700 (PDT)
Received: from nick-beastie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	67sm20458449wmd.38.2019.05.27.08.50.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 May 2019 08:50:24 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 May 2019 16:49:56 +0100
Message-Id: <20190527154956.7394-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-webserver][PATCH v2 1/2] nginx: update to version 1.17.0
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
X-List-Received-Date: Mon, 27 May 2019 15:50:25 -0000
Content-Transfer-Encoding: 8bit

The LIC_FILES_CHKSUM needs also to be updated due to the updated year in the
LICENSE file

  - * Copyright (C) 2002-2018 Igor Sysoev
  - * Copyright (C) 2011-2018 Nginx, Inc.
  + * Copyright (C) 2002-2019 Igor Sysoev
  + * Copyright (C) 2011-2019 Nginx, Inc.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb | 6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
deleted file mode 100644
index 5e6dc33e9..000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
-
-SRC_URI[md5sum] = "719b2e3d416f111fecc9db6625553658"
-SRC_URI[sha256sum] = "8f22ea2f6c0e0a221b6ddc02b6428a3ff708e2ad55f9361102b1c9f4142bdf93"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
new file mode 100644
index 000000000..8774a87ff
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
+
+SRC_URI[md5sum] = "56767fd62302508295b31adc48b99a59"
+SRC_URI[sha256sum] = "e21b5d06cd53e86afb94f0b3678e0abb0c0f011433471fa3d895cefa65ae0fab"
-- 
2.20.1


