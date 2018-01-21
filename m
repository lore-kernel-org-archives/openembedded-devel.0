Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id D458078744
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 13:37:40 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id g38so5720141wrd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 05:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+hQWGBw3LOUz/beP/I2CCcYVWKferhKOumO0F4FywZQ=;
	b=sHNhYPYPRAD4Cw9DMkwFT2PmZn8XgLBfucjK7zc0x8dX3aWPjRI84BPMVPwXqpZFqC
	O8orDIzs5H9+5oHq6z8yDAR8y9RxEVWrnWvUCy07b5fIa07AZHhN9yEbj9plFt0GBKpf
	IMbOWQMGSvygZXsYxWeXuTa5QiqYDtGb0aYfOv+vTpxdPUUPdNAgj7zP4WU4/fm4YzLm
	Xw2645O0u5yrxpMu8XsMyRg5usa57RB/CD2jVRNhNE4yESs9ifLxSv1/W+YbdZsSzYDd
	xdKdiUb87o6vcH/ZLjWSn/2QMnlAJgmjB9w6B2a+dnwEaMuriWk8LLKgp/da5h/qjGhD
	ouzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+hQWGBw3LOUz/beP/I2CCcYVWKferhKOumO0F4FywZQ=;
	b=VU01Rxrl0Z+di4v/wjouXzxwR4dxdLgyBae6srCVoptV/lB/IToGVycI/MGLoqLIfk
	tWVubBFzvwJKpheb70rh8SWy00jXJltRnL0KUJfo7i4Zrq1qOCP+cjQZnHFS/PFNk6Z3
	YjziOV/f/LEz4OrCQoI5VhQEG043ZCezoNwu1SL/8a94+lvu+o7Mx7rlWwRB+jRrFEDQ
	PFh1/+x7Ku5LJ3+oMxt+rEMW6UxxrHxvGHGrZswun6g4uy04ntukA0isX/vUU63NIzYG
	bdETCDaKG/VewG7CdFEgTLZEw6YYs6vNmuexAca7YrVmO8OF0WwjN3ic3IGcYmy+rjtt
	EBNQ==
X-Gm-Message-State: AKwxytdQTD+T5XcwzpfWePTFvAPv/KHGWb6vISOD14i/u9qOiqptVP36
	HFoKd+W220PdpRAzp2IxdAd+qQ==
X-Google-Smtp-Source: AH8x224a94ASDy+IWS6a/iOCBY+2VlpotvbH2Kyg8ueWdo59O/DRE3H67KrrTahjl3k5SXVB8BlynQ==
X-Received: by 10.223.195.201 with SMTP id d9mr3615061wrg.134.1516541861237;
	Sun, 21 Jan 2018 05:37:41 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w11sm13099767wrg.42.2018.01.21.05.37.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 21 Jan 2018 05:37:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 14:37:37 +0100
Message-Id: <20180121133739.6230-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.16.0
Subject: [meta-oe][PATCH 1/3] fluentbit: use Unix Makefiles OECMAKE generator
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
X-List-Received-Date: Sun, 21 Jan 2018 13:37:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_0.12.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.1.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.1.bb
index e2edd095a4..99f680f9ab 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.1.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.1.bb
@@ -21,6 +21,10 @@ inherit cmake systemd
 
 EXTRA_OECMAKE = "-DGNU_HOST=${HOST_SYS} -DFLB_ALL=ON -DFLB_TD=1"
 
+# With Ninja it fails with:
+# ninja: error: build.ninja:134: bad $-escape (literal $ must be written as $$)
+OECMAKE_GENERATOR = "Unix Makefiles"
+
 SYSTEMD_SERVICE_${PN} = "td-agent-bit.service"
 
 TARGET_CC_ARCH_append = " ${SELECTED_OPTIMIZATION}"
-- 
2.16.0


