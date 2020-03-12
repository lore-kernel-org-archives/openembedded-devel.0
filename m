Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id A6C1361BE9
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Mar 2020 02:57:39 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id dw20so204390pjb.0
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Mar 2020 19:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ACNpX0LWpZFLyah10r8cby1qD+J8/6nRw5S7vDD3WVI=;
	b=pW/spa7F6grFx5cqRzpFxbrWdlfSoL/lf50FXgzm15TyvGN/ETHHTusAM8f6R5LQXZ
	brn5OMVa29hJIMfx9k9KmPdAusbuPwhx6GR1wCQQFE2BttgTX8TPbrUMgrwaIP4Qcz6F
	iMs+dU9C4Lrkk4aNz1noRxO+qIvX8lBOVUV/pKby+b7nDpKVhBXycBCq9L/uMoM1sn1I
	G51akCaTqtyplccQQsYSAx5SDNYnGJ2ocfEWcrkhVctMxeGuYlpBLyCRELNo0UQuCfU5
	GraPHRAEKVii6e0+k8y/i1jDmBPNmL1U/W1jEXD0GcFsSd6Q46U6m6FDwLEpCQz+wDFW
	s+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ACNpX0LWpZFLyah10r8cby1qD+J8/6nRw5S7vDD3WVI=;
	b=GAmZZCNUEsFMgAwNsabM7GTuvUc/JMDAlmoqLOtrKgmJFYdDu2IEQcfseMdd50f/kQ
	vwp8pIljJaesp8bqZEBkMS/49n4jPJ3nLo0nMOS+get5Nd4p246ShKAlvf6jT7cGKVWB
	2VFTBrLb7x51nS99w1/uKWsBAA2XOxM0m4HZo+L2JYy5R2eOXMGePycql8GzQKqYRjFH
	n1oIuThOVis9vNsOEQY9J5u8L9PztBw8lpo7IQ1t77Cs2RT0YpU8/nxAqw9VMgjdURjF
	yM544iZmLEnkzycBGwlikzlNE77ewZ+ll1/1Yojwwy/7N0ab7MFNl9AbfFiEsyWP1BVK
	39kQ==
X-Gm-Message-State: ANhLgQ0GUrjP8bGkvS8P+0o4pOLjmO1I8+WcfK+thbakAS1xFn11M82i
	j8VxOjUgTilThiGkjtw7FNlG2DYJ
X-Google-Smtp-Source: ADFU+vu3ayb6bYKEzljWEzIV2HO6NBbp7Dc8efYo682TP7arzeIYjWshgd4pa+0n5UpoUUJr/NeoCQ==
X-Received: by 2002:a17:90a:5d88:: with SMTP id
	t8mr1902378pji.120.1583981860432; 
	Wed, 11 Mar 2020 19:57:40 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:60a5:8a88:a7f9:d809])
	by smtp.gmail.com with ESMTPSA id
	e2sm18328236pgv.81.2020.03.11.19.57.39
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 19:57:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Wed, 11 Mar 2020 19:57:21 -0700
Message-Id: <8d55a4ea3ccf886dbecdc1ce15c37e4c01ac8788.1583981708.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583981708.git.akuster808@gmail.com>
References: <cover.1583981708.git.akuster808@gmail.com>
Subject: [zeus 02/13] wireshark: Upgrade 3.0.6 -> 3.0.8
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
X-List-Received-Date: Thu, 12 Mar 2020 02:57:39 -0000

From: Adrian Bunk <bunk@stusta.de>

Upgrade on the 3.0 stable branch,
including fixes for CVE-2019-19553 and CVE-2020-7045.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_3.0.6.bb => wireshark_3.0.8.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.0.6.bb => wireshark_3.0.8.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.8.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.0.8.bb
index ccaa0c94a3..226e16e4ed 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.8.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "c6f8d12a3efe21cc7885f7cb0c4bd938"
-SRC_URI[sha256sum] = "a87f4022a0c15ddbf1730bf1acafce9e75a4e657ce9fa494ceda0324c0c3e33e"
+SRC_URI[md5sum] = "034f09e639fb4efebbc08af7b2a85333"
+SRC_URI[sha256sum] = "b4bd8189934d82330a053c5b10398f2b625b1e1c8818831ab61739b2d7aa7561"
 
 PE = "1"
 
-- 
2.17.1


