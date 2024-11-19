Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6B7D60075
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 08:03:58 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.15968.1732003437701794686
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Nov 2024 00:03:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g9/z3x4H;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-382325b0508so2121069f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 00:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732003436; x=1732608236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q75BsmOCdwVoLfcjo08aIv1b7UsvekS713eyTuLon0w=;
        b=g9/z3x4HbLCZPk0g1VKXs92jxYcKqOfsye+Kc8Yc2+ui4e4k7QB61fByroUuQrk+VX
         gz188+r40mrxuKlgiOkCkgxOJHOCbj4yaCKUw+pE9U3qERdi2N7+9nOHadU4fPnG87R8
         xLeZ0ipTleQwQBewGoMFAtMDp/853QacaBwPH6os0Fl3ryOaXulBCipTMa2LZWV1ra8K
         vTs2LyFzLHES/9ZyDuMSQ0VYnwFimBfL9gd0T7dmAlnS9ME0bPiumghBZnShWM6bOI5i
         S5i6MuGwXngc7diIF9+OisW2Hm8+TaqH+yAkl0BMYhbq2WGh1xA8CuxeZ07rjrFE8e5G
         z2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732003436; x=1732608236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q75BsmOCdwVoLfcjo08aIv1b7UsvekS713eyTuLon0w=;
        b=IpCjkfNP04HVh5rGmW7Qc7fu8V4FrEN5nxW7GWYus+/+iK+kudLtnYb7gz406j8I4Z
         EuYcnQUSITbcWm1HI9DIycWRxJ733r4TTBY42xAAlrbM6jc0xeux8gxWoIvrhIop0Y80
         PCTWLphxq9Xfgmpyfn5rM6tFjlIWLxNx2GC+tcTs/ycL6vnXqVPCtv3KnY0TXXsiXOuX
         dJuxGizhUvTK1+f3R+kAtlEW0o+/MivCn7RVlk/PA4QBuqab7jzuEoo0wWxGxL9crYuf
         08BMPQvU6nXEEVdfVmMZZ7YEZqKGSunASXEvY8+7DWSK0HFZ+F3Hm1TfLprH8U6tvZEV
         RD1g==
X-Gm-Message-State: AOJu0YzMLdrudc2UF8M6h2XL93LSXzU2s9EgF8LSOxVOPNXvXB6JYG/s
	WDcKuWg4SC4f1TOzutmTs2+TwEbxjbszCx/PD3EQ6YpWo0z0bv5jleASCQ==
X-Google-Smtp-Source: AGHT+IG/9mTHnAJ8dHfRLd1K5QtC5ibaFzctzr0NLORwtbbOkjkzPVuIVvAzbGyD6z+xQwgRr9Ggdg==
X-Received: by 2002:a5d:6c69:0:b0:37c:d12c:17e5 with SMTP id ffacd0b85a97d-38225a05af2mr9464069f8f.23.1732003435844;
        Tue, 19 Nov 2024 00:03:55 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3823e986e58sm7845650f8f.92.2024.11.19.00.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 00:03:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] python3-geomet: fix branch parameter
Date: Tue, 19 Nov 2024 09:03:50 +0100
Message-ID: <20241119080350.1342704-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 08:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113908

* drop unused SRC_URI[sha256sum] as this recipe uses git fetcher

* release-0.3.0 branch doesn't exist, but the SRCREV is in master branch:
  geomet $ git branch -a --contains 73ec5ec96cca32f2e2461d3964fc3d4ab80248f9
  * master
    remotes/origin/HEAD -> origin/master
    remotes/origin/master
    remotes/origin/release-1.0
    remotes/origin/release-1.1.0

* release-0.3.0 branch doesn't exist even the tarball on MIRROR:
  https://sources.yoctoproject.org/mirror/sources/git2_github.com.geomet.geomet.git.tar.gz
  not sure when it was removed from upstream git repo, but it was removed:

Pruning origin
URL: https://github.com/geomet/geomet.git
 * [pruned] refs/heads/issue_esri_srid
 * [pruned] refs/pull/74/merge
 * [pruned] refs/pull/76/merge
 * [pruned] refs/pull/77/merge
 * [pruned] refs/heads/release-0.3.0

* master branch is used since mickledore upgrade to 1.0.0 in:
  https://git.openembedded.org/meta-openembedded/commit/?h=mickledore&id=382f7d51e3b92b8b7a23cd98f9bfc63c51a33dfd

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb b/meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb
index 8e907462ae..f2da100859 100644
--- a/meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb
@@ -6,11 +6,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 SRCNAME = "geomet"
 
-SRC_URI[sha256sum] = "cb52411978ee01ff104ab48f108d7333b14423ae7a15a65fee25b7d29bda2e1b"
-
 S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/geomet/geomet.git;protocol=https;branch=release-${PV} \
-           "
+SRC_URI = "git://github.com/geomet/geomet.git;protocol=https;branch=master"
 SRCREV = "73ec5ec96cca32f2e2461d3964fc3d4ab80248f9"
 
 inherit setuptools3
-- 
2.47.0


