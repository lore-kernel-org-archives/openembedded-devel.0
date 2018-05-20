Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id E625A6010B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 22:35:22 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id e21-v6so601567pgv.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 15:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IQZFQWnmVcDLcOIR//F8G86CjPuhCMf5EA94N4+zBFM=;
	b=oj7Gsf0hbFjzUZo+a8k+MvmaF6V5AkgNY30Iupg9sHef7IYRNEnUBV3s47kFAtVK46
	gB8K7Odl80hLZ/4mLrAZ6S6+F8TXSxscCDjP+QQFQDiJ4/Q48Jd28f8x2qWg6QYjHcOG
	AV2YldiTArC9FyFvaK94+FfJksJqW7iAAvFqM1shAJ1v8HKxA+zjqGlskAQ+UF1AzKjY
	9CXMkgYXGhkoYI56uFJ8uAVbSJPT5epbPwvurHBl+/spO88EIGHc8TEfZbpWzK07ABy2
	rn1Wk5CxDxfyVEI9300bfEoQEDfyPDIzw0IKWby0NgUyl5M64OaOUQp8SnxkjhhXleLh
	OOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IQZFQWnmVcDLcOIR//F8G86CjPuhCMf5EA94N4+zBFM=;
	b=fd4kuVHrMeJ2QG4XNLriN2vVlByeVIyOywbt/Kr4oK4qFx9O+JR0rVp22SAEgp9yHy
	bBbkNbOwxW3xj6GMOpePVrfs/ZThZ0WsnV7x5DsdhUxyec7LhJKfNUpjH4x5xiPsDD4L
	/+32Zq3kkWtOFFnbrDGQBlYzfGSUvAYQrW5p+7PXPEvsC7AAk0lxKvI5r9+gEpODM6/K
	4ZBCmraKvYDdvyB4uuH9BHPir/FQt06fm60GQj1UafXDCXcgzlEdJtptedkRLjkpoQC0
	qbcw+6xxbl3UBp/aLcZsXOiceWIfTlaP2dvUkpOxqDxEcaHAKSCQRq1dBTEIzY+RFDl4
	lt3w==
X-Gm-Message-State: ALKqPwd17HlTwW728rJidzGJfo3voDXvfcVs4ZyeIPPLHZtlaC/CTdxg
	C4fSNVXZXPTkPBe3X37JpVbVig==
X-Google-Smtp-Source: AB8JxZpSvfJicW+KAGkZRJClLJxrz1ihDWUdx4rhNEnpU8DEvDf3ClGlMjUfQo9Vfn8dlK3tj4bzRQ==
X-Received: by 2002:a62:4a50:: with SMTP id
	x77-v6mr17734803pfa.142.1526855723469; 
	Sun, 20 May 2018 15:35:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	203-v6sm21887763pfz.131.2018.05.20.15.35.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 May 2018 15:35:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 May 2018 15:35:16 -0700
Message-Id: <20180520223517.9869-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180520223517.9869-1-raj.khem@gmail.com>
References: <20180520223517.9869-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/6] nano: Upgrade 2.9.3 -> 2.9.7
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
X-List-Received-Date: Sun, 20 May 2018 22:35:23 -0000

Fix build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/nano/nano_2.9.3.bb | 4 ----
 meta-oe/recipes-support/nano/nano_2.9.7.bb | 8 ++++++++
 2 files changed, 8 insertions(+), 4 deletions(-)
 delete mode 100644 meta-oe/recipes-support/nano/nano_2.9.3.bb
 create mode 100644 meta-oe/recipes-support/nano/nano_2.9.7.bb

diff --git a/meta-oe/recipes-support/nano/nano_2.9.3.bb b/meta-oe/recipes-support/nano/nano_2.9.3.bb
deleted file mode 100644
index afb0cf2e73..0000000000
--- a/meta-oe/recipes-support/nano/nano_2.9.3.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-include nano.inc
-
-SRC_URI[md5sum] = "6dd37f010d6a985bf0e5f8ed091ff919"
-SRC_URI[sha256sum] = "7783bcfd4b2d5dc0bf64d4bd07b1a19e7ba3c91da881a4249772a36b972d4012"
diff --git a/meta-oe/recipes-support/nano/nano_2.9.7.bb b/meta-oe/recipes-support/nano/nano_2.9.7.bb
new file mode 100644
index 0000000000..419e5406ba
--- /dev/null
+++ b/meta-oe/recipes-support/nano/nano_2.9.7.bb
@@ -0,0 +1,8 @@
+include nano.inc
+
+do_install_append_libc-musl () {
+	rm -rf ${D}${libdir}/charset.alias
+	rmdir ${D}${libdir}
+}
+SRC_URI[md5sum] = "e0c6d76c93932f6c41c40842952495f7"
+SRC_URI[sha256sum] = "b64ab017305b1777e97b5b9b07b31db8aeebfc3e8719f61e8da1cf3866d344bd"
-- 
2.17.0


