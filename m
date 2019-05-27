Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 513257E137
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 15:50:39 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l2so17300228wrb.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 08:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Jg2nZ/tu8/DlVaDrB0FybESlb5LgTgjxw2KyGpvRA9c=;
	b=Vv+rvJCKwScAIXCB46HJeYgsNXcL2Uxz5Y0XF0v2nIv9NTasig3mx/246YDSBbsPlB
	YfUJ4J78FuxgK3+obvjjCjSzR5qEJ6judurydWoZyuBryKfQCEngKDWceMMHMC5Xo1bD
	0dDQoTIdo7Nw33JWwkxeZ7O07LZG3bJvCqaCLqN8nvx/NX/S3yiyWMdpRTHUqCnTO6kP
	Kh0xD0gZ5m7kVA6qyW800GssHj4OqbDRDtZVzFUwrPaWDpVhT9LtOJLwYD3RHf4jVF+N
	H5fwqtg4aGPnzd4ExIQXDfQX3AXK+dNohQKQQ1RDTwNpvjBqqg0exz5cS/NS73xZegpR
	K7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Jg2nZ/tu8/DlVaDrB0FybESlb5LgTgjxw2KyGpvRA9c=;
	b=rMgyzsSBmqHteDtBqkRLj2Fszb7uakhjLcoOezIxHFzZGV03NBA0FH7WIlBT++5HhZ
	3b7pGad9cuWW4HcdzPKYevp0vXCJiVLWl3tFacNsgWKM8nu4QjXfEveY1XIelNkOrsTl
	1uStZzH1ws6Il1LBhlw3zLXkC8YxJNQJX/JXRHkdsV7V4TI+qXwd5FQcht9cKFzmxQal
	i6d9f0JBvrBZwTcxOtVWjH9WhZZmRn164J1BabTOe0v5mf5YdBzavRqFA/0ynVCQmNnc
	lz2og9sXLFw0k/Z0fElYd8CI8ILAKeCch4aKF2yduaiA8SZwUK8BH7hMISmv5VSL9pzO
	QhiA==
X-Gm-Message-State: APjAAAXboLbcXP83D/c+Ekk5HiFJENQjXtdDo15ymWlk5ibkGd3boRJ0
	8w2hQkZd9nGYHYmSWNGsfBpHMf7W
X-Google-Smtp-Source: APXvYqyy97VstfmXX6p6m7bFu3qqnkuicJGLsazeumtjomtebuGX6Laemf8OSjIc5e8dEOwoFXU4Iw==
X-Received: by 2002:a5d:4f0d:: with SMTP id c13mr7609480wru.117.1558972239814; 
	Mon, 27 May 2019 08:50:39 -0700 (PDT)
Received: from nick-beastie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	67sm20458449wmd.38.2019.05.27.08.50.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 May 2019 08:50:39 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 May 2019 16:49:58 +0100
Message-Id: <20190527154956.7394-2-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190527154956.7394-1-nick83ola@gmail.com>
References: <20190527154956.7394-1-nick83ola@gmail.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH v2 2/2] nginx: update stable version to 1.16.0
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
X-List-Received-Date: Mon, 27 May 2019 15:50:39 -0000
Content-Transfer-Encoding: 8bit

The LIC_FILES_CHKSUM needs also to be updated due to the updated year in the
LICENSE file

  - * Copyright (C) 2002-2018 Igor Sysoev
  - * Copyright (C) 2011-2018 Nginx, Inc.
  + * Copyright (C) 2002-2019 Igor Sysoev
  + * Copyright (C) 2011-2019 Nginx, Inc.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.14.2.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.14.2.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.14.2.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.14.2.bb
deleted file mode 100644
index d0613ffeb..000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.14.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.14.x branch is the current stable branch, the recommended default
-# 1.15.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
-
-SRC_URI[md5sum] = "239b829a13cea1d244c1044e830bd9c2"
-SRC_URI[sha256sum] = "002d9f6154e331886a2dd4e6065863c9c1cf8291ae97a1255308572c02be9797"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb
new file mode 100644
index 000000000..cad0db6fc
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.16.0.bb
@@ -0,0 +1,10 @@
+require nginx.inc
+
+# 1.16.x branch is the current stable branch, the recommended default
+# 1.17.x is the current mainline branches containing all new features
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
+
+SRC_URI[md5sum] = "97207283f30cd90cdba638c3ea30323a"
+SRC_URI[sha256sum] = "4fd376bad78797e7f18094a00f0f1088259326436b537eb5af69b01be2ca1345"
-- 
2.20.1


