Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 969FE7D656
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 08:30:08 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id f7so5771054wrq.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2019 01:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=d0vElPMByCza/M3EbzzYTzlovV5vd10Uy9f0+QwCTWA=;
	b=RK9k52xQ/oYdCXkYutdsQuy2v1NdsLM/Nh1bPrvVZOGtOWwhh2rrXzrCKleGXATkQA
	1NNxhcYHOPlrBFcO+X4kc9Kc5M/Yg4IySSLZDVCHZbhMRbo6UA9vrIUNhHePDbUyvTUF
	5Sm9GGRPqg1d8k7oY3is/dpRqurjSy5HzYX44NUgFoSOU8RkMWSHDYm1Gv8H9sIWLaAJ
	BSEy4CTBhwrAKqDM4esEZpjP5Ea+CbLjsMNYgx4O5YkynYTLnxS2IVa62B9t7d54Z33R
	68UrJdBR8TlhYJEpqpUic1QFKWGmCSxDR8oEJgUlx56hwZe4K+O9BZl/w/nfDsxgYanD
	itFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=d0vElPMByCza/M3EbzzYTzlovV5vd10Uy9f0+QwCTWA=;
	b=BRRfbSDtE///XJ3HVgJ8CyaZdzIrsoWvJbgKTKjJFjl4lWihYioKus3Nq7Wi9QSApK
	EqTjKmiRH1R7NrmsVHxj+47SVX3ceiTIypsqBT7B/M4vVw5xUysbnYFQkS+4Sy7GN2BR
	18C8cTflOMfwCQdTV5PN8yN6Xryi/t4vNUozJu2jA/5QQ4galMuErk1vRe3GhVeYLC//
	2o2CaDdk9sxke60Aosm6frbmNpqnmPnWDqdlP59JXb+eZXS82SZt4ie40qBEfRv+vOaR
	rE0TniGaP9H6/vMJ2szvVRvQeNLhtyr8zxSecet/txyLos+6bDVD7KoUmsbvevUYTXYO
	LD5A==
X-Gm-Message-State: APjAAAVAe34Tl6jikkhqGso8iIKX4fE52Zlk68ACw3WfPQnNYVn73Fkn
	92jIYVaj0WOwb7mrknwooIti8Mnr
X-Google-Smtp-Source: APXvYqyDc58AJpSHCU3p3pdCQ/Zqhc/19Kw5p1U7OuBO8y840bvhYhgypo7bNGNeyilHVd1TBn0MYg==
X-Received: by 2002:adf:e5cb:: with SMTP id a11mr4913389wrn.128.1557131409210; 
	Mon, 06 May 2019 01:30:09 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	a22sm7526235wmb.47.2019.05.06.01.30.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 May 2019 01:30:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2019 10:29:47 +0200
Message-Id: <20190506082948.22276-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506082948.22276-1-schnitzeltony@gmail.com>
References: <20190506082948.22276-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] xfce4-datetime-plugin: upgrade 0.7.0 -> 0.7.1
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
X-List-Received-Date: Mon, 06 May 2019 08:30:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prettyficatons, translations and minor bugfixes [1]

[1] https://mail.xfce.org/pipermail/xfce/2019-April/036390.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...atetime-plugin_0.7.0.bb => xfce4-datetime-plugin_0.7.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/datetime/{xfce4-datetime-plugin_0.7.0.bb => xfce4-datetime-plugin_0.7.1.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.7.0.bb b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.7.1.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.7.0.bb
rename to meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.7.1.bb
index af38ba543..97aa184b0 100644
--- a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.7.0.bb
+++ b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.7.1.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "30caaa94c6c267827a31ad69fa472e51"
-SRC_URI[sha256sum] = "297f3077f7aee52a237449fbd8595e232267bc600b5b9e7ddc5baab306ed67b9"
+SRC_URI[md5sum] = "c42149ec71836fe83085511429e638dc"
+SRC_URI[sha256sum] = "e0c7321346ded2539c4688c593f650696ed0ddca0a5f9d4e404d0e7fc42ae256"
-- 
2.20.1


