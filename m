Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
	[209.85.210.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7D3C961145
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 23:06:48 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id j16so10761319otl.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 15:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0tUEBOJ34onZ4TKy0H5SMaDcpkNeA7aOhzqemIFSUi0=;
	b=PPpJ/UvwkDB93LF1ABRrdRkljZmhu0ZiGBEgusLliIGzUoKZt/YD6DchWNhkn3+TUC
	01SogJWfxhdBGHeLYt8r++EAWHqoE4UCtYR1f1xICNLKal8RawGQB+DDDenZIOg6ulxj
	90y/1FgWQ4Mm2xDVNBHbEzJbNKmuQDrkySD/VYgZpltmDls0jQZ1VRmnCboVT4wcfG5n
	gEMoE61E7F0fMbPhJUA3I/bGCjDYsHmAncRZp8RAbYm/Th7glm0q/niWdgQ5gyv0m2p9
	bsEHsm66+FCKtLxA9w7GNaJtlwbtwj7QG/lJW+2ZSOW9ATrVs+eHFv7U8Zp2jhiRp0zA
	FKvw==
X-Gm-Message-State: APjAAAVn5fdi5OEaDnE0y0BiI/F2hn+86iBFBKTaDIovHcsQsw3oX5ZS
	YcYC0HGAaHnqG1QY3e9aGkTGeLUXui8=
X-Google-Smtp-Source: APXvYqwlCzAGGa0/4hrXFIUmHfy0kruYeU61W/sohk1McEg+hPcWGnKdGF7qw7Wvv9DTfc9t1oW0gg==
X-Received: by 2002:a9d:63d6:: with SMTP id e22mr4193570otl.185.1581721609068; 
	Fri, 14 Feb 2020 15:06:49 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	e206sm2247317oia.24.2020.02.14.15.06.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 15:06:48 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 18:06:41 -0500
Message-Id: <20200214230641.22376-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-bitarray: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Fri, 14 Feb 2020 23:06:48 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-bitarray.inc     | 11 -----------
 .../python/python3-bitarray_1.2.1.bb                | 13 +++++++++++--
 2 files changed, 11 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-bitarray.inc

diff --git a/meta-python/recipes-devtools/python/python-bitarray.inc b/meta-python/recipes-devtools/python/python-bitarray.inc
deleted file mode 100644
index 32da348c41..0000000000
--- a/meta-python/recipes-devtools/python/python-bitarray.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
-HOMEPAGE = "https://github.com/ilanschnell/bitarray"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=dc301a25ebe210dcc53b0a2d5a038eae"
-
-SRC_URI[md5sum] = "a46bf869f6adf34f5b0dc82b469793b7"
-SRC_URI[sha256sum] = "2ed675f460bb0d3d66fd8042a6f1f0d36cf213e52e72a745283ddb245da7b9cf"
-
-inherit pypi
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb
index 7ee444dc9e..7970da43f2 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb
@@ -1,2 +1,11 @@
-inherit setuptools3
-require python-bitarray.inc
+SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
+HOMEPAGE = "https://github.com/ilanschnell/bitarray"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=dc301a25ebe210dcc53b0a2d5a038eae"
+
+SRC_URI[md5sum] = "a46bf869f6adf34f5b0dc82b469793b7"
+SRC_URI[sha256sum] = "2ed675f460bb0d3d66fd8042a6f1f0d36cf213e52e72a745283ddb245da7b9cf"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


