Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id EC87C79490
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Oct 2018 19:25:18 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id y140-v6so7848719wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2018 12:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wenI4F34MfrV9FtKlcCiuGp1vtbSDhVj5FaIjz5itkA=;
	b=gUY2d1GC3HFNtYAxhC0cVAz5u0s6hIXW3g5wFcDyNBH5KdXWZM1BJ9OJPL6W56PIU9
	Yw08U0K8l+MQpt1s85odwYx+sChqzOmNrAaxLQmbncyE4+4P9HPgk3ZgpJnCOmuiqZDu
	GuUf3r16p7reIC5veAGoYr/P9pBNDn27R0ynM7/fUfzAb6tUeDLFWSZLz8mSLqh5SUVp
	cDGNqikOJB9f+e6PIw50PqZvwZnoqz0uMfDniXwkEGFRZbfAeRd75e8eINlOMH2h3aIm
	JPD8hYkSAJz94+k5iryHF/Ice9TZ6rSWJpq1tVaHUvkKgn/SQHT9fHmg6UgoeOd7s+Pt
	nDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wenI4F34MfrV9FtKlcCiuGp1vtbSDhVj5FaIjz5itkA=;
	b=pluQygaMqzLIsbL5Qm5Cn5D3x6QKk/6yPV2BiOOGLekcP994x5rdPRriTzkXx/MP9z
	xAwBZz+XmkYhU2vKH7OYnMMUORpOBz2o7UTIUaDKpsJwuNPQivwxcNz0Wfr2/kN1aCp9
	a1oGWHJTi8qrLkI+SKMXrrCpy2F934o0klx9kNaWJOZwnpZZUIysB1KNU7wHoTYpOMmj
	VEguRQHqmrklqQDwVmCdCsNWk8iFhZO1N4NBo7qcNizfyHjndjvSPA0uXW7uiNZOwjuU
	E5EC+2d9cs5F5L8CXSbwLf8KeqpwXTIKVEVs69fLuw4WMAPbiW5piRB0jaX0RJX/UriQ
	biig==
X-Gm-Message-State: ABuFfojKwCw/6PCKLMVkeR9L990jNPIE0CdIc1Ro39rATxwUo0CCvdeX
	ZM/BHt1Awa31p67HnuSbdVt1tB6z
X-Google-Smtp-Source: ACcGV61Z4x1QqsG84gfAPerAbOdg51fXYWMPvPMGwGsmy+iWPx8qfYrhimf6RH+AWRESHu+q5rRxbA==
X-Received: by 2002:a1c:2dc5:: with SMTP id
	t188-v6mr2318826wmt.94.1538594719386; 
	Wed, 03 Oct 2018 12:25:19 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC1EA401E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:ea40:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	143-v6sm3533019wmv.6.2018.10.03.12.25.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Oct 2018 12:25:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2018 21:24:52 +0200
Message-Id: <20181003192455.24921-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20181003192455.24921-1-schnitzeltony@gmail.com>
References: <20181003192455.24921-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] xfce4-battery-plugin: upgrade 1.1.0 -> 1.1.1
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
X-List-Received-Date: Wed, 03 Oct 2018 19:25:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-battery-plugin_1.1.0.bb => xfce4-battery-plugin_1.1.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/battery/{xfce4-battery-plugin_1.1.0.bb => xfce4-battery-plugin_1.1.1.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.0.bb b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.1.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.0.bb
rename to meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.1.bb
index 9d2d954f0..af7c65aa0 100644
--- a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.0.bb
+++ b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.1.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "f78d8d0cc13d40753a207a836869b953"
-SRC_URI[sha256sum] = "8c9deec8d95da4cc39d6d9091433e5822b6bbe07d80117045dd4dd3480427ece"
+SRC_URI[md5sum] = "26941c579ebf4143b7e49aa08ee9b30a"
+SRC_URI[sha256sum] = "1e94969b93e0c1d6da87364b64c0cdfb40bae5e4a055039be8b67b9e5b3dd44b"
-- 
2.14.4


