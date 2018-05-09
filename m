Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id DA21474FA2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 19:00:34 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id a39-v6so4844744pla.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 12:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c8R3FUHsXDsYyPFUgisSr1bfLUkSW59V7HRFX9pO8VU=;
	b=Us6SvaI70snwow1n/Me6Wc8BhDPasDpYbd/iqieGgsXZB2okUfbIhrWLlqZQAKUcY+
	gTB8LLW18HJBQOkKSChYdEHdPMvc+4R3bsgBRQ9RP+BOWDrEzvb81PEHNiWhZLM/swku
	j/jUCpGawNAXLCAYxd5CUdoWJYVULzt32jdkfxyAbvAzDg+cOxwDShSG3uvuzmlJwJ3O
	ZDs2NPqMpKMmcMQW0ptWr35rhgIdaAFkaVoV8pVoBZDikL/uQDtXyLG/5NjRnPy+GF7F
	dNrh5bsvE9+ToLvFitIIGIeLnN9vCOAN1NpuijXet3kmTRmYhnV5ghFISoG9lDojiGe4
	AjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=c8R3FUHsXDsYyPFUgisSr1bfLUkSW59V7HRFX9pO8VU=;
	b=e4NGLmIfRJSbR8VD0hRm3STNc5aaW8MC2Ok+UUbGT5mnBM7QKrScisit+jxPhSb2DI
	oKWiLUwhQgdwOC4oGI0yODZMoJksP1CPJzgzfVa591amaYElR7Q2XN9/EyfLN0DrWKKm
	5pzIIUQUlEciZbgN3TVsMf86/16ViaZ77lgk6DEvXYcFIHl5/rYV6XltVsZaQaSefNOG
	Ns9JHaxiyNQxHq7Dx2BfKsVD4sppNJ+aUQpWlFKkLR5PbURW/4oO3eiAxOYqtI358I/5
	NtnV952eOQbMTR718wXjYfXAUVyvhOle7aIgCj4lAuwwQvYC1qnDgBhBLqvUp8Ejjeae
	269A==
X-Gm-Message-State: ALQs6tB7jWZxag7QjRc3JKwB+T9n6nXmjz0rutPsdsU7LEcIMtoix8qW
	I8avkkBLQOc/FfjcowEObPTVTw==
X-Google-Smtp-Source: AB8JxZqQi5pflMFXmkH4LgbrcPwCi2KoPJ70OVXyV+x4JVQbjpxJaxTQzb+TPTGQdgO623W1ZFfKhw==
X-Received: by 2002:a17:902:4545:: with SMTP id
	m63-v6mr47331328pld.268.1525892435537; 
	Wed, 09 May 2018 12:00:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	131sm27732437pfa.128.2018.05.09.12.00.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 12:00:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 12:00:10 -0700
Message-Id: <20180509190011.30006-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509190011.30006-1-raj.khem@gmail.com>
References: <20180509190011.30006-1-raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 15/16] physfs: Update to 3.0.1
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
X-List-Received-Date: Wed, 09 May 2018 19:00:35 -0000

License-Update: copyright years updated along with a note removal about LZMA SDK and LGPL
see
https://hg.icculus.org/icculus/physfs/rev/5b31ba402270
https://hg.icculus.org/icculus/physfs/rev/8f14bdf15b2a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../physfs/{physfs_2.0.3.bb => physfs_3.0.1.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-filesystems/recipes-support/physfs/{physfs_2.0.3.bb => physfs_3.0.1.bb} (53%)

diff --git a/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb b/meta-filesystems/recipes-support/physfs/physfs_3.0.1.bb
similarity index 53%
rename from meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
rename to meta-filesystems/recipes-support/physfs/physfs_3.0.1.bb
index dc2c106497..cc97dead56 100644
--- a/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
+++ b/meta-filesystems/recipes-support/physfs/physfs_3.0.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "PhysicsFS is a library to provide abstract access to various archives"
 HOMEAPAGE = "http://icculus.org/physfs"
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5d94e3eaaa10b00ca803ba35a3e87cde"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2668e2fb051c3e564198e146a9a2d9f0"
 DEPENDS = "readline zlib"
 
 inherit cmake
@@ -9,5 +9,5 @@ inherit cmake
 PE = "1"
 
 SRC_URI = "http://icculus.org/${BPN}/downloads/${BP}.tar.bz2"
-SRC_URI[md5sum] = "c2c727a8a8deb623b521b52d0080f613"
-SRC_URI[sha256sum] = "ca862097c0fb451f2cacd286194d071289342c107b6fe69079c079883ff66b69"
+SRC_URI[md5sum] = "359f102bcbd62accf84ef32f4863255d"
+SRC_URI[sha256sum] = "b77b9f853168d9636a44f75fca372b363106f52d789d18a2f776397bf117f2f1"
-- 
2.17.0


