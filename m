Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A78BE78199
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 10:38:15 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 188so10610802wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 02:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1nTNvOtn9kKzNCVsIR2nrPGu1hemwn/iUQQtcEmzW1E=;
	b=dqOe37lKXgJLT2tfl9PLK5mRZBGTqLYQXFNWRqtkocRS9rowqO0fIaHS2oK6T5MKtL
	DwTKWMI6FhNV8HBqQqQJJJQkSbDIyXpOf/Jgy9dZXdcY48YjWyVfpDah2oa9d869tdBd
	lj/zjo5uZglopXkl3Uc8nBY5jyXGfaHH+/IqaCuFL54cvnA+IkeoaO3MtwQn4DWphDW/
	36B3dlqWEPrqKx4s5oy+y75d2tpyQx/tC7b5mCP9qYTUll4+L9qeITJVQ2wrXQSGE1lP
	+mv+g4xrYJJeerr9FWUl4OnGRXBhA92dp1nr2yzL7JMKe7Sa0VSm9B+Ln5NIPOPOAxjL
	gG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1nTNvOtn9kKzNCVsIR2nrPGu1hemwn/iUQQtcEmzW1E=;
	b=Qixsa3ShfJDjz6YY9NoDhbzbpham7P9dXtkd+Hp6CaZSsn9Z/GZzWyFAjwO/eVSV8L
	6dqA+zDYHSIN0liHnxLevjfepX2e0pch978qd+uE0dRBlZeuLATN+Lmo7n9kvynKOkX6
	+DqxtxcNKH/8e2KfDnyxFWfVGuzHzrIejUTkQd2xAwjL3KNRetga809lmgXJVHIu6kU0
	0ajLwAzWeJLSVptHwb75Ry082MM/Xc9YjRx51ofBUMmqd6RBTqUAf7UQ6CgfZTnSS0z7
	7tvbLM0FjquhZRkxEvNyFiZaaEIJtCvb1RxlX3GY18oFORkUYyfmpvlWrpmUs4Ix93ix
	LHCQ==
X-Gm-Message-State: AElRT7EBvHNvkIvwTe49z17MKDQ/JU79u75XU2i/Ob15v9g4/esnJwY5
	DYOefw0+2M/3kOZMgTVcJrrozQ==
X-Google-Smtp-Source: AG47ELvMM8cF8Ws/JNQ5aObi7C2cukVN7BP1Z65eYGN5bsNK+M1lV+GvZVanu1QmeXVUbaU1cQ4zIQ==
X-Received: by 10.28.54.150 with SMTP id y22mr1246676wmh.74.1519900696028;
	Thu, 01 Mar 2018 02:38:16 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p76sm4481949wmb.19.2018.03.01.02.38.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 02:38:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Mar 2018 10:38:13 +0000
Message-Id: <20180301103813.8027-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-oe][PATCH] xrdp, xorgxrdp: require pam in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 01 Mar 2018 10:38:16 -0000

* libpam dependency was added to xrdp in
  http://git.openembedded.org/meta-openembedded/commit/?id=cc32ca8030c02a2b1b22f6b43e1894dc5f00e14e

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb | 2 +-
 meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
index 9355379840..558a1982f5 100644
--- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
+++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
@@ -8,7 +8,7 @@ inherit autotools pkgconfig
 DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
 
 inherit distro_features_check
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 pam"
 
 SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git"
 
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
index 88e309a59f..671a251962 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
@@ -8,7 +8,7 @@ inherit distro_features_check autotools pkgconfig useradd systemd
 
 DEPENDS = "openssl virtual/libx11 libxfixes libxrandr libpam nasm-native fuse"
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 pam"
 
 SRC_URI = "git://github.com/neutrinolabs/xrdp.git \
            file://xrdp.sysconfig \
-- 
2.15.1


