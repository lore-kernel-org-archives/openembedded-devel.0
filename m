Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7602860557
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jan 2019 01:12:46 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id l9so32133354wrt.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2019 17:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9k3xBTUpE/NwzXM7QXkBh9Ms7m9o4+xNEsm4usmZvIQ=;
	b=ndFSTwgs4qIjTQMSmvAh9xM3C2Slgw4vJ6BHMlyW8w5HLCA4fRd3erb67qWg9oHurF
	tws0qX7AWHu99A1QN3HHjN/SnIxm64V0fhC2bliWFlYch9RU04hM3pV7l5JlJtfpLhWT
	/1aAbgw4LKaxgeOLSZDsz/CTL6rdRYfMuYm5s6+aO89ICjFZsBycv7lCcz/Z7syAagvx
	Tg4e1h7kM7fYolBCxq76+Z2ULCtvnTp5xQZ3TBBBZ00ddR3w+p/+TLYEdxRTKf+vQk2j
	XD6ILMrWhf9meUh+nr5442JuXpYmcZe4VYvRwfPAHn+/suBSdvqsPoNZZya4eFP/uHwM
	utKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9k3xBTUpE/NwzXM7QXkBh9Ms7m9o4+xNEsm4usmZvIQ=;
	b=N+HWaoM3HmqaYc+lfShzkT7545K347ZbyX9BFOrfM8S8C5we4jKDb6D/rzI8LnXcL0
	2J9H2sFElRnMgy5qyMe4BpG08eL+B6/ONyzbS9pb8YJFICgtJm+Vg4bSQ7BNoDKow6VO
	khtlpLOQMw+YN01HUgNWt3xgfRTh13RIsc0yGNPJtbK6AzVxjzOxzAOR0yUgHC6MNK8J
	iicGtYnSsGArHkyf7JmAYtK65vBpBPwthJ7kXq2iKIk54Y8CnUI96dFGh9o1B6nbBWVe
	SeZFxkM7x0D5i5ysaltwMOu5fhyV+GNt5ilk6AeGF1Abc2L6h39dPEkgZ+Kmy7WIVmFW
	FtXw==
X-Gm-Message-State: AJcUukfn/wJuGciHaBrgpEmGSJIC5/zkFSOBBP9e79A6FiGv/DjlYKLs
	B7ftmzICfaUgCfDVDJv7cUbDrigN
X-Google-Smtp-Source: ALg8bN7hnFyqUmMF4A08loxl2S2QOM/8bJrgUs4EH/eo8jVFs1UurXSPQfxq1RGHkNFa0nR52r8hIg==
X-Received: by 2002:a5d:6710:: with SMTP id o16mr41104270wru.152.1546477966670;
	Wed, 02 Jan 2019 17:12:46 -0800 (PST)
Received: from localhost.localdomain
	(p200300F07BC022001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:2200:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	c12sm42400512wrs.82.2019.01.02.17.12.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 Jan 2019 17:12:46 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2019 02:12:15 +0100
Message-Id: <20190103011222.7686-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/7] garcon: upgrade 0.6.1 -> 0.6.2
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
X-List-Received-Date: Thu, 03 Jan 2019 01:12:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-xfce/garcon/{garcon_0.6.1.bb => garcon_0.6.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.6.1.bb => garcon_0.6.2.bb} (76%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.6.1.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.6.2.bb
similarity index 76%
rename from meta-xfce/recipes-xfce/garcon/garcon_0.6.1.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_0.6.2.bb
index 06e236977..27096da60 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.6.1.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_0.6.2.bb
@@ -9,8 +9,8 @@ inherit xfce gtk-doc distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"
-SRC_URI[md5sum] = "174690ad19243f7ef9529cb0c24b9080"
-SRC_URI[sha256sum] = "41c31ba0498c2cc39de4a8e0c2367510adbf4bc2104c17feee358e51e6acf603"
+SRC_URI[md5sum] = "a4b6332ff6f090575d534d6a9d2761d8"
+SRC_URI[sha256sum] = "a87f09648ff10d45c524b3bfe618f18622bdd8b205589d35fed2f12d9c79c47c"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-- 
2.20.1


