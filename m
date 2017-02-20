Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 89C1C77247
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:50 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r18so15745713wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=oIHE5IT98PzO7Zf6YEd9BzETGrhUcmWu/lwy2vM6XMU=;
	b=gl/VyAKT77BqF5VaUoADrNL1bpQVPudraWPXK+TN/8YHPWh4q5PnVAH/Kuz9MXWAR4
	4zPD53GrnHYc1elmifX4Lba5BTLO0hVbBtDf2emeIBvypaE1SqxYNsfuhnRrhtNzmP0D
	0Dk2SfcRWFT80ijiw4Gb9sdmJs3Hj+2/LNrEB0cAjFXkQ8SR+maprTUahfAqOrzLlcTj
	5yoso9F8YczRgKTVDgcuMvgCIEzRMYUni6e0RR8ilor/saqQD9W8URy6Yfzx11sEgbo8
	osfzI/G/EBSXLOHXpgrB9VRMQEWPh6UngR9NJyuKd3KxNGzjNE2hgBdsaGFGn0wJVgon
	aPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oIHE5IT98PzO7Zf6YEd9BzETGrhUcmWu/lwy2vM6XMU=;
	b=DVnVVWAs5tZFZHTRP5qQ0UDyQYcoqC2PDvZ2Eavxu9+O3Ajo8HT9l2lo2rmqfnAH5j
	32UdP2iPt1BwxL2DhFSOx59AvKuelK3bh2GpV5fhAGhd6J0XyO4Yoh/BSrvPWvL1Yopn
	mvfRutJm1G+kcR/suR83Pch7WSGsHzOy1Nuc8vVRxUYd055KAbYMYzN76SIHUTWA00OY
	pTaGpsV2Hd/61pq3MERqFsFOwYRI4b5pUaY8fg9a5HShK7C8YoX6HxdiGZvEUx7NWdVM
	xTylFLh1BSFA46fON7SBmTns6bCb/sUsQXsmqWH2NBLrHfupIi+RbL7Ly5XA5z27m7n+
	x8lA==
X-Gm-Message-State: AMke39nxY84GpkVbLXys2A+vKvUFym650lSroDU0pATscyNqn2MjPnnzizW1OouvW4F5gw==
X-Received: by 10.28.184.198 with SMTP id i189mr19000004wmf.26.1487614070711; 
	Mon, 20 Feb 2017 10:07:50 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:50 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:52 +0100
Message-Id: <20170220180700.29836-37-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 36/44] gst-plugins-base: unblacklist gstreamer is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb       | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
index 02252bf..eefd993 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
@@ -42,5 +42,3 @@ CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmm
 
 # /usr/bin/gst-visualise-0.10 is a perl script.
 RDEPENDS_${PN}-apps += "perl"
-
-PNBLACKLIST[gst-plugins-base] ?= "Depends on blacklisted gstreamer"
-- 
2.9.3


