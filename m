Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 091947F953
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 03:47:07 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id n59so5234541pjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 19:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Z/toozD/pWuHzm/2a0FscN4ARl2fND6lXd3iTuz/n1k=;
	b=MwIYlVB7zFKN/YOC9rdPYbkBnIvGTYlQjXRBuN2GNs1I54G6jyq6IYgUIy7fhakjcs
	WVMq/hJz2BbPRbaRoGu5yEuY1PosbTWXn2omZzkW7pwZSM6u1ikkRgcIn1wMwDjkuEIv
	ZWRvPnVuMtdVyqTIJrFsGFchWWoM5Wm3yNijIWT/1RFFAWYXAeaLdQc646niejSpKcAK
	Xh+DtnYqa9EexLj3hdCKWNfm9m0eiyTeQGpy7JBJTSpZwg/sSzgPK+DSPpyyF9dy4/HK
	Kq9HyEHzsHLmdh9CQb1ku9SvE2LnN3mAoDUSUfbo8pRW1hWfBiNn6CyEMeNiaHsPmk9s
	Wylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Z/toozD/pWuHzm/2a0FscN4ARl2fND6lXd3iTuz/n1k=;
	b=FrREhbqBoy8UIBEKOLmrC80dJZiF1RULJPmDh9GYXCvXWHCYYhlydJbbUiX51yAK2R
	091PQ5iiB45ufuF5NDykgdCRKjeXz3e+TNU30CSORt28cUxPtKX/JjIf8ZHcGHxqdUMb
	zDCMonEMovUAZfFiK4fD9T+cBvx6gkJRarEXz2ytQZdr+517qWJnMyHyGpMJ1idl077k
	oACm22yd6eNPn/PwtL2od01SX6baeRTwrods6IDH1bHwguUOqJNXOci8IvbBDigtTyF+
	/LTDpwp32ovooorrbajScjtmminHDYac/WUa5gzKplPvRvpVL9aQNrS1cdDn7wX2SZ29
	p6KA==
X-Gm-Message-State: APjAAAW/jwdPmbX2+rXyZtGWfqo1/HMhtjAsznrVTB32yZ91N8DXt5IP
	0MqK8rHy0thMFfbNGYc0s/YBJn2sCNU=
X-Google-Smtp-Source: APXvYqxGTLz4VHrbQAzGiZBwE8p1g+1E3rfgRgNTs53cHPkbyOP8tl0xMbQd5zJrG/Qg5PXjV0RzSA==
X-Received: by 2002:a17:902:6804:: with SMTP id
	h4mr17145808plk.11.1578973628800; 
	Mon, 13 Jan 2020 19:47:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id j7sm16577239pgn.0.2020.01.13.19.47.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 19:47:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jan 2020 19:47:07 -0800
Message-Id: <20200114034707.3423104-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114034707.3423104-1-raj.khem@gmail.com>
References: <20200114034707.3423104-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: [meta-multimedia][PATCH 2/2] gst-shark: Upgrade to 0.6.1
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
X-List-Received-Date: Tue, 14 Jan 2020 03:47:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fetch gst common from gitlab src_uri

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{gst-shark_0.2.1.bb => gst-shark_git.bb}              | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/gstreamer-1.0/{gst-shark_0.2.1.bb => gst-shark_git.bb} (78%)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
similarity index 78%
rename from meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb
rename to meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
index 5409f32045..d047caef5f 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
@@ -10,12 +10,14 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad "
 
 SRCBRANCH ?= "master"
 
-SRCREV_base = "a60b3996fe3376d42334fc89014e9d6f6af62899"
-SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
+PV = "0.6.1"
+
+SRCREV_base = "c41a05cc9e2310c2f73eda4b4f0b4477bf4479c5"
+SRCREV_common = "88e512ca7197a45c4114f7fa993108f23245bf50"
 
 SRC_URI = " \
     git://github.com/RidgeRun/gst-shark.git;protocol=https;branch=${SRCBRANCH};name=base \
-    git://anongit.freedesktop.org/git/gstreamer/common.git;protocol=https;destsuffix=git/common;name=common; \
+    git://gitlab.freedesktop.org/gstreamer/common.git;protocol=https;destsuffix=git/common;name=common; \
     "
 
 S = "${WORKDIR}/git"
-- 
2.24.1


