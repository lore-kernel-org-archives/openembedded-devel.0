Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id CADAD771B6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:35:33 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id b35so110315612qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4yqma4rbvRFLcWP0M1vmMQKIhJPxTxW+kyOgmT5UUeY=;
	b=ew+gmvgmF+tuNC4LORoQrYIJhpON85cHh/cfsQI3qUCHiEe4LepwRzz03LykmpHsE6
	Z07LXgu8Nj8keWZ7X27GYwffAL2VEGMtHNJZb8KrWQ0nxoXmLRuqDxUtE7MMYK1tSLRc
	zGgzLJdvuGnqW8Om46IArZ8Hpozx8rxcZ0+uY2sQctFl6Vtsf8RFleqG7b+ByJnTTVPq
	3qG7yO60LFAVgYo34Hc7DjYxaILkhWFyfi5BswAvNO0pkUTq76HFe3ty6qKOXWZxtJSI
	TX8w1wuyHiDFw9Y2UtWD1Yi0lX5L1PeVar0C1dK2Zry9xBXFw022QqlENMOv9c2CchN3
	qfeA==
X-Gm-Message-State: AG10YOSKfNXsMdGcpcKxnRJ/eDS7Yblkqu6toV/ZbEWdWns4ZAbRjtT33JKCD2N04CbLYA==
X-Received: by 10.140.194.205 with SMTP id p196mr4413898qha.30.1456148134397; 
	Mon, 22 Feb 2016 05:35:34 -0800 (PST)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id w1sm10232368qha.3.2016.02.22.05.35.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 05:35:33 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 08:35:01 -0500
Message-Id: <1456148105-9644-7-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456148105-9644-1-git-send-email-derek@asterius.io>
References: <1456148105-9644-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 07/11] python-pyflakes: update to 1.0.0
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
X-List-Received-Date: Mon, 22 Feb 2016 13:35:34 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pyflakes_0.7.3.bb => python-pyflakes_1.0.0.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyflakes_0.7.3.bb => python-pyflakes_1.0.0.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python-pyflakes_0.7.3.bb b/meta-python/recipes-devtools/python/python-pyflakes_1.0.0.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python-pyflakes_0.7.3.bb
rename to meta-python/recipes-devtools/python/python-pyflakes_1.0.0.bb
index d4d19cc..c319af8 100644
--- a/meta-python/recipes-devtools/python/python-pyflakes_0.7.3.bb
+++ b/meta-python/recipes-devtools/python/python-pyflakes_1.0.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "passive checker of Python programs"
 HOMEPAGE = "https://github.com/dreamhost/cliff"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=1815018ebbbfc8659a9df33681a0936e"
+LIC_FILES_CHKSUM = "file://README.rst;md5=0f2ba771f63ad51756f4fb10e827220e"
 
-SRC_URI[md5sum] = "ec94ac11cb110e6e72cca23c104b66b1"
-SRC_URI[sha256sum] = "dbd2c940a1030a4f811afc1a04017a44011c0cb54f8f384b66aa624097d9b5e3"
+SRC_URI[md5sum] = "914621d4c9546248419b435dd358eb6a"
+SRC_URI[sha256sum] = "f39e33a4c03beead8774f005bd3ecf0c3f2f264fa0201de965fce0aff1d34263"
 
 inherit pypi setuptools
 
-- 
1.9.1


