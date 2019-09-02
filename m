Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id E0F257E1E7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2019 14:35:35 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id g7so14296697wrx.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2019 07:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GKEy19CoBcwr2Dky6Bgnu7QRoLeTTn2VDYW36/E9KzI=;
	b=idExAdqPokVoSaTdI02KfszRmWGFxTytpNzfBxhmhkhCpY+p+Ismn3QBPvL4rEXPwc
	bkV3p2/kETXwEG3+Q3z2BGrkh5lCsiHuP0Rh9WzN4iyjHJQorEsBuNXxii60pDSYZEY+
	szzWQObUXnk2HvYK2epgmPmNiA15Nbdb3EqOjjyrdsDJy36cFepIWIchz2BIWXoMuKFI
	6QY/kvGyk6qII73nt29uDy7tcXo7yS5p2a0Q2V51/lxjwYVsmqnO2fjSsX6GBZ53imsS
	kPKfGb+IahLKaAHq3l5Ud8sxmherOpyH5JcA0W3WdxMTa5nCZPlbxMQOaVIeLPO7FgBP
	NDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GKEy19CoBcwr2Dky6Bgnu7QRoLeTTn2VDYW36/E9KzI=;
	b=CaMfJAo4VuF/B3GETDmm74fY8kMPmzmkaMWIXcBQYuBHB7enwUbu2D/dC7F05Ba+8A
	l7Hid1xOI5/mEizJjZKvgubp3m9E9S0mudOT6x1h4X7YEXqeY8mwi7d0Usb6S9G5TzKL
	dCO7T7MoogrrP5XCkFAKXtwn1mm7DrFKWfywvZNvyZk87XF3X39TcbW9RsPMYPnXA7tS
	g1IKii8AhEoxIdBf2VShhkFq6dhrD/IVZ7XCIZG2/IB7ETBARZ+n78KLFIqUeVqe4vAV
	M26NfcMcmRjzyYERBQCKLbqj/HA9Bk0j5QKnNN18rNQI6i/3HNoT5I2KvJB/mTAB+wRw
	AmWw==
X-Gm-Message-State: APjAAAVJlt6yQWCzV8BCo7ZKIXJrZAaweXe5InZE/7TFMgADbbvRgsi+
	jPmVY0d5VKT9prIUt+H9f93xXSNe
X-Google-Smtp-Source: APXvYqzZDkLCgKuv1LrD858UnhZsJJaktFnBbpqQQmI9q7oMD4gLMnTuAlVWYpyiRoIBwihIYJ528Q==
X-Received: by 2002:adf:f710:: with SMTP id r16mr32664947wrp.81.1567434936308; 
	Mon, 02 Sep 2019 07:35:36 -0700 (PDT)
Received: from localhost.localdomain ([193.164.125.20])
	by smtp.gmail.com with ESMTPSA id
	e30sm22402363wra.48.2019.09.02.07.35.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Sep 2019 07:35:35 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Sep 2019 15:35:33 +0100
Message-Id: <20190902143533.74977-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] zstd: Upgrade 1.4.2 -> 1.4.3
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
X-List-Received-Date: Mon, 02 Sep 2019 14:35:36 -0000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-oe/recipes-extended/zstd/{zstd_1.4.2.bb => zstd_1.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/zstd/{zstd_1.4.2.bb => zstd_1.4.3.bb} (95%)

diff --git a/meta-oe/recipes-extended/zstd/zstd_1.4.2.bb b/meta-oe/recipes-extended/zstd/zstd_1.4.3.bb
similarity index 95%
rename from meta-oe/recipes-extended/zstd/zstd_1.4.2.bb
rename to meta-oe/recipes-extended/zstd/zstd_1.4.3.bb
index b5d95d940b34..e97b4efb2e66 100644
--- a/meta-oe/recipes-extended/zstd/zstd_1.4.2.bb
+++ b/meta-oe/recipes-extended/zstd/zstd_1.4.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
 
 SRC_URI = "git://github.com/facebook/zstd.git;nobranch=1"
 
-SRCREV = "ff304e9e65e7cde17a637eea190a874c26c48634"
+SRCREV = "a3d655d2255481333e09ecca9855f1b37f757c52"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


