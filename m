Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 349787FC4E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 17:27:00 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p9so4177186wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 09:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=t1s4QhTs8H5IAwiH/SsUzw4f2MIMhNOaPgdX2YQXXt0=;
	b=H+gtjCNBX78EkItRrotfc1LolzYsaA5mmSlJTyoZtgtt/m65JsVDPkcO1crTRPYwxm
	4tWaw7qFRwHr8rEY4mXkvfJn3wh6UQu78Efj7KwIgX9tUppY1VX7OT9jI/onoYUMJCqP
	FVOKKNvryvDnZ52ysc7/AZ0g6efb2Gc4xHloGHT9yzE9k5UOaAu0YAOHylboAXXaol4e
	DIao3iGqQ3d2ICDN4yzLN+0PNZwSRLyHoIQ90JKEBYwYOs1ar3IjCQRtHvXzdu5H4STp
	yOMN9kQpuEbP7ZMY/vpDwE2V0OnKuJB5sl8c2uJJgZg2V9HNJnCjuEGfLOxZB5Otf9ig
	jOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=t1s4QhTs8H5IAwiH/SsUzw4f2MIMhNOaPgdX2YQXXt0=;
	b=n60p2oBlCGTe2rzQQHxeAjbQew/cOyDM86uXExYtBKKhAD2ntkvbmd5MrfZDp58HrC
	MbSaw+gR+mq67yIezqkLKEReolnYQ/lOhJXEgolIPNMOV9rI/tjIF9OhyPa367Fc1b0S
	zjReZjjwjNLgmqVTeVZTy+WX5ct+o7huQVOaDNLD+KCDBk8ifaQrdyXjj0jLQolqT1+U
	n5RHGvfSkD80EFS5kpDkCWpqZXCRyfeL1lQbWBSu2k8k+s3mwBB+hbu0gEVQSfy9GZ04
	810rwpEKXQtkiFMcp5psoWt6HswrhpUU6NfAnAxYho1UuZnReO6ptYmjzPHgKr1XduUv
	EsEA==
X-Gm-Message-State: APjAAAUKd5siwdIlMyuhP5OWBlUgAhYKEqwcDgA0rzgGPL/vHntr2bym
	Nsxm1hQrurFWn/UxmFrak9iZTw==
X-Google-Smtp-Source: APXvYqxjbHcn1vMyUASp7snOGkIBTtJvWMr1QZTfSNdtf3DCrgxe4AXGA+vPQMNHkldSIV93HtWUpg==
X-Received: by 2002:a7b:cc13:: with SMTP id f19mr6624280wmh.81.1575998820843; 
	Tue, 10 Dec 2019 09:27:00 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id
	d16sm4250401wrg.27.2019.12.10.09.26.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 09:27:00 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue, 10 Dec 2019 18:26:56 +0100
Message-Id: <20191210172656.14831-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH v2] librsync: new package
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
X-List-Received-Date: Tue, 10 Dec 2019 17:27:00 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

rdiff is a popular tool for calculating binary delta patches. It's
provided by the librsync package (unrelated to rsync already available
in poky).

This recipe adds new packages for librsync and rdiff.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v1 -> v2:
- use ${bindir} where applicable

 .../recipes-support/librsync/librsync_2.2.1.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/librsync/librsync_2.2.1.bb

diff --git a/meta-oe/recipes-support/librsync/librsync_2.2.1.bb b/meta-oe/recipes-support/librsync/librsync_2.2.1.bb
new file mode 100644
index 000000000..c2f28fed2
--- /dev/null
+++ b/meta-oe/recipes-support/librsync/librsync_2.2.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Remote delta-compression library."
+AUTHOR = "Martin Pool, Andrew Tridgell, Donovan Baarda, Adam Schubert"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
+
+SRC_URI = "git://github.com/librsync/librsync.git"
+SRCREV = "5917692418657dc78c9cbde3a8db4c85f25b9c8d"
+S = "${WORKDIR}/git"
+
+DEPENDS = "popt"
+
+inherit cmake
+
+PACKAGES =+ "rdiff"
+FILES_rdiff = "${bindir}/rdiff"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.23.0


