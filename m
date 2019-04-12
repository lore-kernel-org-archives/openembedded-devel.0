Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4A1DC7D589
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2019 11:20:47 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t17so11397436wrw.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2019 04:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HOd/r28x4ogvc1ymfj2w3R5ZdrXMSeY4HR7IxkfuZiY=;
	b=CBZKbG2NyhKLhTtiHRQ5B+7iro+2qlEf1Gkk4Tt/SjV2d64nZ2dsOts/32fXoV1euL
	myRuTiBaC3fgeBgTV+0Tlb1v//22nin69A0iBbjm9UpKuzm3l2wumhQLXsRwTwouNORD
	TlFHMK8NHN20jQa7+8C97CQRWlEns7xURii1qkKdJK/Iow1U4KZxCZSd+HguJZjH1jTa
	9eUgrhJ1tsjv/TZoqI4StomlHpxZmIOvVywg3BswsTSiclcOKf6uD/i2U/q3QDJBf+Jb
	coyD4YNTSLlx7S8Ok/HVbYakC8eTnpmM+9EOX0eVeXs9KpjvWSVVE4Z5zLnywJ6HIzQJ
	Fh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HOd/r28x4ogvc1ymfj2w3R5ZdrXMSeY4HR7IxkfuZiY=;
	b=h4bUI2WnBbuHbBRM6rh+y2TEzXUpgBzzwzXyGSzqMpjq2D84Y4Tv9YJ2kItqb60HgT
	9yoP8KYq4I28v1Lzv3+iEOY2zL+O4hjpskR/Z7YxL+J7HkcjSnaGGHS1947XRjRVf+hp
	StT4aiVrvBTr7/hRO2xP99/17osZH0a6CgstH68FzLZ7GnOZft5lLKs714kAkynkVR2W
	/bLaIfVeTVx+xDqTTRlMH9XR63ITDS/BC2lXuetY2TR6PEK3lcpg3EUjfAWFZ1gyk2rr
	7W+PTsgvLVVmkoZbA7Svn5of6jVaL1qdtkJ+gBIQQMu3Sew7guIycFe9AHHYn36Rv0qH
	iAcQ==
X-Gm-Message-State: APjAAAWTx3q5b7RNvxp433pBnCvJCARMklj8tW1UHwWRr005wssBRyG5
	AyqbiOo2emK//DSnPE08UvcuI5Bq
X-Google-Smtp-Source: APXvYqyxmSW0K+lPEKhzMvZiSQn+EJAh0yiidq/UMgipvUL8OXFVLGZdcbmsLh+4vqOxDbG+j6McEA==
X-Received: by 2002:adf:ef91:: with SMTP id d17mr34319383wro.78.1555068047806; 
	Fri, 12 Apr 2019 04:20:47 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	v1sm55866052wrd.47.2019.04.12.04.20.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Apr 2019 04:20:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Apr 2019 11:20:50 +0000
Message-Id: <20190412112051.138-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 1/2] ftgl: add x11 to required DISTRO_FEATURES like freeglut
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
X-List-Received-Date: Fri, 12 Apr 2019 11:20:47 -0000

freeglut was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'ftgl', 'freeglut']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb b/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
index c5eaf425ce..343c983c3d 100644
--- a/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
+++ b/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=527a83e92c7bf363025380eec05df6e4"
 
 inherit autotools pkgconfig distro_features_check
 
-REQUIRED_DISTRO_FEATURES = "opengl"
+REQUIRED_DISTRO_FEATURES = "opengl x11"
 
 DEPENDS += " \
     freetype \
-- 
2.17.1


