Return-Path: <texier.pj2@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9E47F731DB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 14:47:20 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q128so5915930wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cT6ORNthBPS3DJT14yb3LzsgxVnIZYdZSAxqj+W+2+Y=;
	b=Pt4iTQTGztEyuQ8OEeHMzKmUkzTsbeKBIUFBBf5LVmN1YgUFMFEZ46KosuSJl4au8t
	R3kar+WxXdoKtxn879S6qciGw7UKDA+Lm1apiIoNvxfQGEOyTw7gAxXP0YjyxGqX9gXX
	dTY75D6tCPC/ULeL1PevUsFSzPcuDqpqK+q+1aJ/5zLDwn22RTRVCa6UTFieSn3tWX3l
	gOTFLvuflo1sxzDf3EXnXmb511QEOlS30Q1fwXqmT251X5cRT75C8t+ANt2vDX4LcKIW
	HI+QSdfkAlpqPAAG8G30F3wpzVowAUjsTucouUN4RL9iyoTSqjtilfLid0fYs8YYTwdO
	Bk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cT6ORNthBPS3DJT14yb3LzsgxVnIZYdZSAxqj+W+2+Y=;
	b=Lj1wLVVdxhNFuMJfe77s/4nUOu6UsG1JBFr1raahj0DClGGy9Adog1u3RC/7xUIh2l
	e0Oqk2QrZ0/ejZ51AGllep9FBHlJSgli7O4ZzF8elJxhKwtt5Gllxym+QIUcz8jc2/qE
	Ew4NLvz/L11VUJd4oPSKHhnCeTinKAi1b2G7uSWBwJxjSwFqNjV2sdz7KuTB8r1rg4Ti
	19ddvKCPMgYJbau60LQstC2Ryxvtv5/dMSkRW4ocrWEQk/obNgXVNJyFNdY5GtHqbyZ2
	U6azVdhNYD6G1AgXwu7XiJuuIUZPT5c1ymn7nLW329dKUvnlODt2Vk+JzIlnOIOVglv5
	ngoQ==
X-Gm-Message-State: AEkoousl/QzlkNYHGk5yS219327hzhlV6+qZgnJKj7erqnJfNFHsjVAUvYPeTD0UX+VN4A==
X-Received: by 10.28.197.143 with SMTP id v137mr30962307wmf.26.1471531641144; 
	Thu, 18 Aug 2016 07:47:21 -0700 (PDT)
Received: from amplitude.amplitude.local ([46.20.167.230])
	by smtp.googlemail.com with ESMTPSA id
	q137sm31993217wmd.19.2016.08.18.07.47.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Aug 2016 07:47:20 -0700 (PDT)
From: Pierre-Jean TEXIER <texier.pj2@gmail.com>
X-Google-Original-From: Pierre-Jean TEXIER <pjtexier@amplitude-systemes.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Aug 2016 16:47:15 +0200
Message-Id: <1471531635-27346-1-git-send-email-pjtexier@amplitude-systemes.com>
X-Mailer: git-send-email 1.9.1
Cc: Pierre-Jean TEXIER <pjtexier@amplitude-systemes.com>
Subject: [meta-oe][PATCH] spitools: bump git revision (SRCREV)
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
X-List-Received-Date: Thu, 18 Aug 2016 14:47:22 -0000

The new revision fix the build of spitools with the musl C library.

Signed-off-by: Pierre-Jean TEXIER <texier.pj2@gmail.com>
---
 meta-oe/recipes-support/spitools/spitools_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
index adb67cd..a308e42 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -8,7 +8,7 @@ S = "${WORKDIR}/git"
 
 SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=git"
 
-SRCREV = "cc6a41fdcec60610703ba6db488c621c64952898"
-
+SRCREV = "03405ab45884e4264dfa0371c032b2baaeeaaa98"
+          
 inherit autotools
 
-- 
1.9.1


