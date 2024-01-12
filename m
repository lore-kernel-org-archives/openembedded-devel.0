Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6CDC4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 19:10:45 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.750.1705086638340015594
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 11:10:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7baa8da5692so300194639f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 11:10:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705086637; x=1705691437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iv/tG/EjHmr+PSPj8POr2OmIYiUbizhDe/xCjXD/56o=;
        b=OOulLnIIQVuNm/Xvkow/znqHR53aPJi3koUdP/s+t8r5z15zoAw2cQf1NgEucqDtk6
         1N4XDhrrwPtiK1JbDnpitc4MNB6HlNaoXiKeDhHCPsjAGEVFHzM64Dnyz98rkrM3OhRn
         or2dHe0LOB3TNmJxlAPo+1b9XiDtgP9+oJuUtX7wWxPQv527AsD9aRuKUdwPjvHqPAye
         JTbXI8R4XBRx5M1tbgNo7HAXuX5HUDyjTs+w78BScb4D3zqe6SmBJuR+lsPsAkUshSBU
         RVCf4SOc8DvosO60Gv6A0F85wOHC7ZQk03gnulbdfRQUmw2XAUFrWsxo3bmPJ2ydviFE
         mPQA==
X-Gm-Message-State: AOJu0YwnmJ0+5Fba/Lrk5XZYvcQ3GsxTs0zMfDqLflF/wcpmUgSYPTH5
	OeMb6I3HWkEpbLuKCTxG4D2WWpiBiSryTQ==
X-Google-Smtp-Source: AGHT+IG1+mr5YqkULR158nTVO0WotLspvyeLi3IJ/qD7tyQ0TyZE/TSXiYDO3BQwcwPnG/plefYukA==
X-Received: by 2002:a6b:680f:0:b0:7bc:25d7:eb8a with SMTP id d15-20020a6b680f000000b007bc25d7eb8amr2280236ioc.29.1705086637166;
        Fri, 12 Jan 2024 11:10:37 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id h27-20020a02c73b000000b0046e5c5511a3sm700861jao.93.2024.01.12.11.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 11:10:36 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-eth-keys: update version to 0.5.0
Date: Fri, 12 Jan 2024 19:10:04 +0000
Message-Id: <20240112191004.3024700-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 19:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108250

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-eth-keys_0.4.0.bb => python3-eth-keys_0.5.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eth-keys_0.4.0.bb => python3-eth-keys_0.5.0.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-keys_0.4.0.bb b/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-eth-keys_0.4.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
index b0b1aad76..aabfff1b1 100644
--- a/meta-python/recipes-devtools/python/python3-eth-keys_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "A common API for Ethereum key operations with pluggable backends."
 HOMEPAGE = "https://github.com/ethereum/eth-keys"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2beaef1b1764f4d6b46084c885b4bcad"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
 
-SRC_URI[sha256sum] = "7d18887483bc9b8a3fdd8e32ddcb30044b9f08fcb24a380d93b6eee3a5bb3216"
+SRC_URI[sha256sum] = "a0abccb83f3d84322591a2c047a1e3aa52ea86b185fa3e82ce311d120ca2791e"
 
 inherit pypi setuptools3
 
-- 
2.34.1


