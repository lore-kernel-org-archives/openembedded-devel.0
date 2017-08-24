Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 19EB6783A9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 15:51:54 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u17so1896611wrf.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 08:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A2LVN/wvS6b2DiE9T//xcwVZsp932sS3dYjq43H+S2Y=;
	b=gem9CSaH8sIVkqMPyeuP88oHjgi8Ocmu47TQN5GHPm0juYBZouq4hiwVWtihA00CMK
	ELQiPbhdmquHcxxEhB6bUxuskVg9gZoGaY+/LPA9Uc+YRRSBMD7WcWwRgjxoubDNSToD
	z+tNjwvpEx6lrwuCoSV0zGsItU42JMdrg5ae/zzu+fAzAlM0qWclio/50bkW3THO3kMl
	D9Os2W1D7m/URiiLnAKYqoaAsG87YKsqVN94oS0HVVzjKUUI5j3TFvuMVNeUm9LXV1Di
	SvggN85zPLtleabeATSJ9mbz0JrO+WWvNctdPuiMw3dAXOFkdJkoxA4RIvkAMzlTM3/B
	6jnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A2LVN/wvS6b2DiE9T//xcwVZsp932sS3dYjq43H+S2Y=;
	b=tX53OPT4Il3AT6lQ4E4SbhYG7dU5ntRHCx68sEDvMuFgye/VAXYe8pS+x4sr84Tqhh
	3v/+g9Q5LwIsCD1wV6Q61HaQCgLcW+bMAENHaC/o8TIpE3SvN1bp0HW3Qja1U3S77XXt
	C1nfZwezGj/fuHeToiPs6jEqD+SdkJkqf3W5MwbS665MvfNFkS8//YJabYeJQtvxtdH0
	WZ3+NjJ/unqGhcA6gUvABoLMOr0hj1rd5j6bvbnOaWyQCpVMazguEphQKxGylSmfFBgb
	rpL8QV3s+LNmaOZUe85aGUzbalY8PMjqw8NBcJhyTI18Wd1xOZZ5lggXvbWUVeUIqA2T
	rsxQ==
X-Gm-Message-State: AHYfb5gPBnaaeET5PyOBFVbh7WpqtYAsqRHpfHF/g4vsyOZsfBD+dDTo
	vn6vc5dElu7zHIVX
X-Received: by 10.223.166.15 with SMTP id k15mr3750170wrc.321.1503589915576;
	Thu, 24 Aug 2017 08:51:55 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id u7sm3850901wmf.33.2017.08.24.08.51.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Aug 2017 08:51:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Aug 2017 17:53:32 +0200
Message-Id: <20170824155332.18313-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170824155332.18313-1-Martin.Jansa@gmail.com>
References: <20170824155332.18313-1-Martin.Jansa@gmail.com>
Subject: [PATCHv2 5/5] meta-gpe: remove this now pretty empty layer
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
X-List-Received-Date: Thu, 24 Aug 2017 15:51:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gpe/README          | 17 -----------------
 meta-gpe/conf/layer.conf | 15 ---------------
 2 files changed, 32 deletions(-)
 delete mode 100644 meta-gpe/README
 delete mode 100644 meta-gpe/conf/layer.conf

diff --git a/meta-gpe/README b/meta-gpe/README
deleted file mode 100644
index 7d019f63a..000000000
--- a/meta-gpe/README
+++ /dev/null
@@ -1,17 +0,0 @@
-This layer depends on:
-
-URI: git://github.com/openembedded/oe-core.git
-branch: master
-revision: HEAD
-
-URI: git://github.com/openembedded/meta-oe.git
-branch: master
-revision: HEAD
-
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gpe]' in the subject'
-
-When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gpe][PATCH'
-
-Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
-                           Martin Jansa <martin.jansa@gmail.com>
diff --git a/meta-gpe/conf/layer.conf b/meta-gpe/conf/layer.conf
deleted file mode 100644
index 00f3929f8..000000000
--- a/meta-gpe/conf/layer.conf
+++ /dev/null
@@ -1,15 +0,0 @@
-# We have a conf and classes directory, append to BBPATH
-BBPATH .= ":${LAYERDIR}"
-
-# We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
-
-BBFILE_COLLECTIONS += "gpe-layer"
-BBFILE_PATTERN_gpe-layer := "^${LAYERDIR}/"
-BBFILE_PRIORITY_gpe-layer = "7"
-
-# This should only be incremented on significant changes that will
-# cause compatibility issues with other layers
-LAYERVERSION_gpe-layer = "1"
-
-LAYERDEPENDS_gpe-layer = "core openembedded-layer"
-- 
2.14.1


