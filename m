Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6BEA77DBDF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2019 11:20:49 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id k11so11458402wro.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2019 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dbE3kSuQ48ngLDmSwK7+wQZwCInPHst9B8vcW7JViok=;
	b=RwJpxrs4BTcmtoRoNAu45Hdp0ctlQtnXUNuwpGhNpG+/Rja6xuHEWVu1115mxrl60C
	bZmUp1jEjqqZZXzDDlsz57kTXtiyJumnHM4L4fRsMkOekxxMGopXQMQnWRyEzsAi+AWg
	MJ6EOmUYLK/i6bRyVM5ruZ001M+cYqRCMdc80TH6LY0Z1J99mJ9CirBypQUNLORhskXr
	oJaOX4RuuDZ9T+/ogW1IdEg/Ho7Lr7crqbhtb4HsmVxrpe4iGbN3PvB1/s+sTmuNhH8S
	AfdVN9v3ca+EERL3ob1fK8MZkbaB1TJeNCNyR5EuDqw+Qv7OgbuImFmYHSmA9Ga+1fem
	1yXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dbE3kSuQ48ngLDmSwK7+wQZwCInPHst9B8vcW7JViok=;
	b=jLsOpZDDlusKtb/z9rfJhAEPmHUCsJcLwPFX9oXUYjIYDhoGiOH1x6aJZ6JOG5eL9T
	VIekC0Y2fBR9orEESf+rpJsVhkdpEVTNitUabBpdv2uCZ9QJphHS3cAwB2tPUQCqymCY
	9CGXLwvEsLdbiFcnhNQx3o4CTDTeA7c6hUL7SULloHTL94OrTeGl5Vs5FGPqtLSZnBSX
	DH3JUJfHFQ+x5Am/m68dgLYPiRisjchyk3ZWHUnQmPCTG1A8F6j9/5mqGmeyZRCwgxrA
	a6ukM8Fd/1idY+haboCLgpBPDwxlTkQOvVTstRZ4YYVIZ2QaFe8xsfXlPySUn9djX7ue
	2fTg==
X-Gm-Message-State: APjAAAUlYmU75yLJyaT+ZIibufGRlJ9kd44RzfbOBpzEEYqucG4mstwW
	eaUUS0smFa50JbUhS23nOHQxDcGG
X-Google-Smtp-Source: APXvYqz+QwtMrlO3MTuR2Bho/Pf70+TMVMhmC6rZrTvnj1uZ5wiJRIpyP/fRNUwAd++l6fxk8oRTWg==
X-Received: by 2002:a5d:4a4f:: with SMTP id v15mr25216981wrs.5.1555068050015; 
	Fri, 12 Apr 2019 04:20:50 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	13sm10347864wmf.23.2019.04.12.04.20.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Apr 2019 04:20:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Apr 2019 11:20:51 +0000
Message-Id: <20190412112051.138-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190412112051.138-1-Martin.Jansa@gmail.com>
References: <20190412112051.138-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] libforms: add x11 to required DISTRO_FEATURES because of libx11
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
X-List-Received-Date: Fri, 12 Apr 2019 11:20:49 -0000

libx11 was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'libforms', 'libx11']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb b/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
index f86d7c16bf..5d33185900 100644
--- a/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
+++ b/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "7989b39598c769820ad451ad91e5cb0de29946940c8240aac94ca8238c
 
 inherit autotools distro_features_check
 
-REQUIRED_DISTRO_FEATURES = "opengl"
+REQUIRED_DISTRO_FEATURES = "opengl x11"
 
 S = "${WORKDIR}/xforms-${PV}"
 
-- 
2.17.1


