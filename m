Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id C71C677DA3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 22:09:00 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id d202so3371223qkc.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jan 2018 14:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BpTA1VKRsesrYT8bgZi//eCHzAVt2ySUzyAxAZ49r/Y=;
	b=CoibQdpO/N07aC1ha4Js/owPz8tK5vATtBiRB7y/FjrdBslE7SHlwwbmtjrvieWhdj
	4CGrxuxEeWoaWa3emWbgRIdO8qI+AXX71yWIrJSpNzjcMrdUAAPsR4iu/BDjBc3YntPn
	LA+4UZUqIDkrY7d/fzIJq88rK89sGUpPl8uDX0cUxs6vHPhdTCAAf3C9QPvg68RLM/Kd
	iM9uIFwOGho7QZy9FHqffIbdXdqPddA3Y3aIV6nMqT779Qon86ajsvYrJuUk1y/eRfyP
	esGYzCMpm99EZe+rZeoYyuhOSpytLOpSPthi5F7lHdLDmGbkudjoeASdqKwF19RRAPfx
	FZJg==
X-Gm-Message-State: AKGB3mJWHZE6QTZXY1En81wOAAMmGRiuVoiQDBUwkKbcGYUthPLQd+Y8
	7MfbPV6VSlx3E2GDlvBgNGiXNaq0
X-Google-Smtp-Source: ACJfBouo7VaeYd7885y3e62ecZpmvAy8LCuiJeJKLgm6kna2VhdPXX8YX5N3nU7chhN9ad62nL0jAA==
X-Received: by 10.55.181.132 with SMTP id e126mr3687399qkf.312.1515017341472; 
	Wed, 03 Jan 2018 14:09:01 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	v17sm1196676qtj.35.2018.01.03.14.09.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jan 2018 14:09:00 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 17:08:52 -0500
Message-Id: <1515017333-7448-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-grpcio: update to version 1.8.2
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
X-List-Received-Date: Wed, 03 Jan 2018 22:09:01 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-grpcio_1.7.0.bb => python-grpcio_1.8.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-grpcio_1.7.0.bb => python-grpcio_1.8.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb b/meta-python/recipes-devtools/python/python-grpcio_1.8.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
rename to meta-python/recipes-devtools/python/python-grpcio_1.8.2.bb
index a7df0a2..5b0724e 100644
--- a/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python-grpcio_1.8.2.bb
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "b564632793132fd35cdff984d6b309b0"
-SRC_URI[sha256sum] = "6662af1f07cf7a3d171a7f56afc2cfeff262a5f2c52d15ae5ea581d0c367aea8"
+SRC_URI[md5sum] = "4d4ce91b5a56d724227aa116f971402c"
+SRC_URI[sha256sum] = "1ea1336f0d1158c4e00e96a94df84b75f6bbff9816abb6cc68cbdc9442a9ac55"
 
 # For usage in other recipes when compiling protobuf files (e.g. by grpcio-tools)
 BBCLASSEXTEND = "native"
-- 
2.7.4


