Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5C6AF744AF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Apr 2018 12:34:14 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id d1so1604023wrj.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Apr 2018 05:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kCYwD8uO8go8/4JcRY3c8v4nPochnUGn284g4JgiHaw=;
	b=RqAL9O7B3HHg9PetoAz1+FDQ6nmxc0xz52ArRHF7LU8y54B15jviHd9MhRytTQeJ8g
	mRFeFhnktv3jT+6l0+Uxs2dAg3K816YlBUqR+ThJjwl0YUv3S0BiYjWacI6hpPobzYBY
	9vmEt8ETJioLqzr87RVvOp93ItMsbvZ4QgKkT/CANsBKqtU+g1JT/U8ANv9NAdMKtbE1
	pZF89ug4AAa6NvF8B+YNZ2mrUokFB/Gk6w4ux7Fn7NM/6bGgEW81F0ro8lrD+spWDsFc
	ZR0XhiFLanOyS93qk+JTf4xY55ljCsZi51SEAGx02tVzTAVUqEHBeLbBBNykWvVxl4ZY
	BI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kCYwD8uO8go8/4JcRY3c8v4nPochnUGn284g4JgiHaw=;
	b=TsrZNyjoOERGoobanH6gX3Ac1xUA67NTjopeB6rKgvSz3Is+oulCHbCS/6rhkcmozX
	eN66/mNEa9Hy3Ff2XL5DNl1HJCzK+nZNax/IQ3PJSg2GIq2+VkCQUQFBevzlVpJUcp8i
	CU5fUJLID7Uip11V7KS1GbCzhW+gCanoEQhOByIyhMUurvFcH5orrYYdP+C1gnJPYCHr
	h0sgLjQaL7YsVS5MjbUEc15eL88bahkjEVnFZLDbhWn5BlmArYvx3/cGelxaXv0Obvhu
	rc+M3liBuAjDnTCW6I8d49K8RFk+eDpNuonytiBkFR0SwZWDe9AMN6VwwDSo8g1Qd836
	vhQg==
X-Gm-Message-State: AElRT7Ek2kVYVdPUy2WHEL8MimSmtwU+kvQvPpx7XNJwC2s9RP2VOS0U
	pL7Otz0In8vFVyKyx/mBC1lZww==
X-Google-Smtp-Source: AIpwx4/u6usadrsVBmSH5f0Cj0c7drNG/KxK4Pe+4g4ilpwTKLetQffUvkbmSJdzMw3oaejmFUue2g==
X-Received: by 10.223.177.213 with SMTP id r21mr20401352wra.89.1523018054659; 
	Fri, 06 Apr 2018 05:34:14 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x22sm8766518wrd.69.2018.04.06.05.34.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 06 Apr 2018 05:34:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Apr 2018 12:34:16 +0000
Message-Id: <20180406123416.17928-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-browser][PATCH] layer.conf: add LAYERSERIES_COMPAT
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
X-List-Received-Date: Fri, 06 Apr 2018 12:34:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 5275778..37c4160 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -9,3 +9,5 @@ BBFILE_PATTERN_browser-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_browser-layer = "7"
 
 LAYERVERSION_browser-layer = "1"
+
+LAYERSERIES_COMPAT_browser-layer = "sumo"
-- 
2.15.1


