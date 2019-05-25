Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8CE467D743
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 May 2019 19:56:13 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id x64so12434815wmb.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 May 2019 12:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Vm4Y7dNlBw8beACHvm4pCXCsFRbBc2jS5folTYg4PdM=;
	b=dfyI+Tna10NheqhgY/WF/pZvVZbkmwEnrhHZ0BkKw86Bh6NTicl3+owzX6cbmA4+px
	uQN3ETDz7YAM1iduHI1coBdd+yi+9IY6Dod6i6atTMCJVmjTvfjd4bilW9ddHm4cOy5d
	hW2TWaKcECnn/8OQBch37g5AUXyUmwwn0lR2mAzRRbifogHZaFBOPFVYhHE4MkfIphoR
	R8qEr3SuB9OvsWANhWhBZx2Mgx+bBgbRMlGNvFmT+wScxYoy9jotCo1NirX6Je+k+2og
	DLGVBZePB+xo0M7Klu3+n61Wa/VvJJmT9TqHJj49kaKhDUgUxzmmJRpBD8OXIWkFVxB7
	javQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Vm4Y7dNlBw8beACHvm4pCXCsFRbBc2jS5folTYg4PdM=;
	b=RB/0FI9us1rTJzRRaNTEbES9JXkZcTj62SUZXSARAzjbjOBPLn9dSMnXfgHwl4DEvV
	mkZWh4tzh46LDsBah1Hiz5e6rBgvWvAIOWphsij6eWsaQUx6WMsKRjBNgf1WvVJB15TL
	2UuT+tGlZj0X881BC9ZFCh53GQZfN42+fJ64/Ao4p9lUcFovZqPkspsJTHBvzj6pXUm8
	88CnvxlqH5Len8hD344oQlX+i8C5uCOjTilUCXAW5vwocA8FEpgGVqBR53AmX6TLQh5O
	F4nFndle7kSztkf1aVqWGHVEAX6N2c4YKiBUuwZflMJ0259hKLHBw5fgS24ho8f84bDh
	oHoA==
X-Gm-Message-State: APjAAAWmmxDSP1TZfW1uNRqEmvlMrVDcJSF5VLcvVW5pJbFgEpWYyo1B
	lhfyrfHs/YAsx7KamcsdnFQgOjsD
X-Google-Smtp-Source: APXvYqwspy2piIFKEqserZ32KZNup478UMnZFLW9g3GWksIEwFxDiDY02MiEHYlgbdbyHtopS3RXWA==
X-Received: by 2002:a1c:ef0c:: with SMTP id n12mr20727894wmh.3.1558814173993; 
	Sat, 25 May 2019 12:56:13 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	34sm14538681wre.32.2019.05.25.12.56.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 12:56:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 May 2019 19:55:33 +0000
Message-Id: <20190525195533.26321-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] leptonica: fix SRC_URI
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
X-List-Received-Date: Sat, 25 May 2019 19:56:13 -0000

* leptonica.com now only redirects to www.leptonica.org, so it only downloads
  the HTML home page instead of the source tarball

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/leptonica/leptonica_1.74.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.74.4.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.74.4.bb
index 91fa00cc96..249e96f168 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.74.4.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.74.4.bb
@@ -3,7 +3,7 @@ DEPENDS = "jpeg tiff libpng zlib"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://leptonica-license.txt;md5=34aa579294e8284b7b848c8d5d361e8f"
 
-SRC_URI = "http://leptonica.com/source/leptonica-${PV}.tar.gz"
+SRC_URI = "http://www.leptonica.org/source/leptonica-${PV}.tar.gz"
 SRC_URI[md5sum] = "4f32be9bd2e2c142ba018037ab5d746f"
 SRC_URI[sha256sum] = "29c35426a416bf454413c6fec24c24a0b633e26144a17e98351b6dffaa4a833b"
 
-- 
2.17.1


