Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id A66FE788A0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:55 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 68so5720283pfx.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hKKZ2Xm669JhdZjojG+HxZb7V/MWrVqQfSJIwwbrOJE=;
	b=GgHZXgC89KOR3Rh+IRVrzKms/9gwWUpHmKuzbkOPR36ivrjTA3wCAJK45Y56QQa2lZ
	srZCUGGvPvIA1gJHIJiKjdL/FOlpBA/+mNzBPnq8aQniF1FLqwla/Hh5+RmfyFuH6RVX
	QzbIYOqQ1xm4Q2juxBBZZIlYIR+/V152mPB6DnlT4tvg7pgM3aSX1YaVUK57CLj+ArM2
	NzApA7zTb1dpnxbBXkJ09KCryt4xLGoIsyZgohYXv8qRvxDMIjh932Z83kS5NcDP6Ucy
	KR7L5rIu9fhucXfbQ53xmWloWUa4ZHp3DcCI7ybQbxqUFH7kBYHPChEwARe976B6ObEE
	ZJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hKKZ2Xm669JhdZjojG+HxZb7V/MWrVqQfSJIwwbrOJE=;
	b=VhX1UVhg9lWLijkv7cIaCvZrWO3cVFOExHIKuIcX0B9ePMNT+8AOCj0o7M8quQGDKr
	tNi7vjs0wgC7NZFUPUcUCBKLlWb+SgGmMXHzihHBChtjHTOWr1Nsmxg/WCW91Dp0LTdg
	fhtKfPvlt6RQAMFOkrJ9foR9gF7gavYOf69KxtaHNl7eySO2uQmUkJ+m0bkiqdk4qXz3
	KQ13p1R+JpF6Xk0bPfEB6Ru4cr3JmdbQNR5RAKqq8yym6W78D4lD4kK0oz+EPZnv82jL
	W/9y0PHD/Z5OVL483O17yXqb0tSDFkElE3yp0uMneeZ40GTacVUzmTBCFTjhyRaS/l1x
	vwhg==
X-Gm-Message-State: APf1xPBUhNVUy9dfNrHEPhUm3Igqf8fxLc3xpnOm7l3ZgUV98rmWjOsP
	xae/dt4JZc4UFCgCMnqr2fia9A==
X-Google-Smtp-Source: AH8x22594OFkFHGGxR4V4ZK81bi2qTtyQFLVxKbqLpEhsNyESdhvwTpU9DRP+pnRq69q4TKcmkYJWw==
X-Received: by 10.98.65.198 with SMTP id g67mr8403717pfd.127.1519594437046;
	Sun, 25 Feb 2018 13:33:57 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:18 -0800
Message-Id: <1519594406-24490-28-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 28/36] edac-utils: move to recipes-bsp
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:55 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-support => recipes-bsp}/edac-utils/edac-utils_git.bb     | 0
 .../edac-utils/files/add-restart-to-initscript.patch                      | 0
 meta-oe/{recipes-support => recipes-bsp}/edac-utils/files/edac.service    | 0
 .../files/make-init-script-be-able-to-automatically-load-EDAC-.patch      | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-bsp}/edac-utils/edac-utils_git.bb (100%)
 rename meta-oe/{recipes-support => recipes-bsp}/edac-utils/files/add-restart-to-initscript.patch (100%)
 rename meta-oe/{recipes-support => recipes-bsp}/edac-utils/files/edac.service (100%)
 rename meta-oe/{recipes-support => recipes-bsp}/edac-utils/files/make-init-script-be-able-to-automatically-load-EDAC-.patch (100%)

diff --git a/meta-oe/recipes-support/edac-utils/edac-utils_git.bb b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
similarity index 100%
rename from meta-oe/recipes-support/edac-utils/edac-utils_git.bb
rename to meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
diff --git a/meta-oe/recipes-support/edac-utils/files/add-restart-to-initscript.patch b/meta-oe/recipes-bsp/edac-utils/files/add-restart-to-initscript.patch
similarity index 100%
rename from meta-oe/recipes-support/edac-utils/files/add-restart-to-initscript.patch
rename to meta-oe/recipes-bsp/edac-utils/files/add-restart-to-initscript.patch
diff --git a/meta-oe/recipes-support/edac-utils/files/edac.service b/meta-oe/recipes-bsp/edac-utils/files/edac.service
similarity index 100%
rename from meta-oe/recipes-support/edac-utils/files/edac.service
rename to meta-oe/recipes-bsp/edac-utils/files/edac.service
diff --git a/meta-oe/recipes-support/edac-utils/files/make-init-script-be-able-to-automatically-load-EDAC-.patch b/meta-oe/recipes-bsp/edac-utils/files/make-init-script-be-able-to-automatically-load-EDAC-.patch
similarity index 100%
rename from meta-oe/recipes-support/edac-utils/files/make-init-script-be-able-to-automatically-load-EDAC-.patch
rename to meta-oe/recipes-bsp/edac-utils/files/make-init-script-be-able-to-automatically-load-EDAC-.patch
-- 
2.7.4


