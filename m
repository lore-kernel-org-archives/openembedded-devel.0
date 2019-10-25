Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id A224F7FA4F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:21:26 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id c2so1022527wrr.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 00:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=7ulgOKLNjHIZ5ZJpdPy3nZgUeR6z4+1m7hWaCCxpCA8=;
	b=J204vKbcakCHvRZ6vGZLa40LDY2x5FJ6ojZfvQ9jkUWVonElMKCqFfd5Cb5MJx9e/j
	tTrAwIfI8hEywJ8+uyCW/O8ZeGBtbGnkmUPayN+V4kSgAj/R36RHmWsefnwvmQ8N4frV
	Uqyb2lsbrygBwplm447CfPGWJqZEor5VwQDnYKVysycIprkxzabLwH3IaxJgDu/OA4uA
	pqQXArP9mTbOPdURrwY3mRJkvrD78bS+5AdjUX6cquBnzsb+3xD5W0VZvCxonYKo2Fog
	H4jH4CEstpnur3hg0wKTtGH6S0vDEphnypC8c/634Shbff1sWZR1UVXZk3tyaeD/RsHL
	hT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7ulgOKLNjHIZ5ZJpdPy3nZgUeR6z4+1m7hWaCCxpCA8=;
	b=K/V50LQpB+LotcEtJz/+PNkYYfhWcBV8niJAecxifCLXcjF2pCxB852AmLFtFUUe91
	IM3uPPFkuVSruHkwm8Qqfd/Q6VPLv1Tc/mz1CNhNbhkX4Ixcdpf+aJ8ML1RC9DIOm/xK
	X7YNryJ6iA6dxDVrLkv7YuzoxeX96dvJJschRSYFPg+H/WaKoBT6T+27YSn7t12NogIb
	RctXBEzVHQvXyBwrvuQXFsDyxWLrZ3G2dHx/HVAIq8X9QrOkxz32Y3R2b+ks4yw6g9Qm
	PmssdFzC8/+vwg87+0lv9MPwFbEyu4IWKobV1EVvpS+JyBP1r2+oebwxczlSZ9rwWIxc
	HUrw==
X-Gm-Message-State: APjAAAWmZfrxwR/BjfigaylulCtJ/Zr4mOoE39WX1OvujX7VJr4+Vk+8
	06YVYScnVQ3A+QI+/RapA2DLaJck
X-Google-Smtp-Source: APXvYqzPxtsMEUBWvl2cpnSOoZ/Nnj3oqv+EBba9rO1Kxtq3VB9N4ALaCTKEq4eFr06TwZ7z8HMAHA==
X-Received: by 2002:a5d:63c1:: with SMTP id c1mr1385064wrw.332.1571988087033; 
	Fri, 25 Oct 2019 00:21:27 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F12337293F05085D4C59AB5.dip0.t-ipconnect.de.
	[2003:f0:7f12:3372:93f0:5085:d4c5:9ab5])
	by smtp.gmail.com with ESMTPSA id y5sm1207095wmi.10.2019.10.25.00.21.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 00:21:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 09:21:00 +0200
Message-Id: <20191025072113.11172-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025072113.11172-1-schnitzeltony@gmail.com>
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/15] geany: upgrade 1.34.1 -> 1.36
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
X-List-Received-Date: Fri, 25 Oct 2019 07:21:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../geany/{geany_1.34.1.bb => geany_1.36.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/geany/{geany_1.34.1.bb => geany_1.36.bb} (69%)

diff --git a/meta-oe/recipes-devtools/geany/geany_1.34.1.bb b/meta-oe/recipes-devtools/geany/geany_1.36.bb
similarity index 69%
rename from meta-oe/recipes-devtools/geany/geany_1.34.1.bb
rename to meta-oe/recipes-devtools/geany/geany_1.36.bb
index aab535d85..193c198a1 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.34.1.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.36.bb
@@ -9,9 +9,9 @@ inherit distro_features_check autotools pkgconfig perlnative pythonnative gettex
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://download.geany.org/${BP}.tar.bz2"
-SRC_URI[md5sum] = "87220f4a0e03623ab9d86820f6be7b5d"
-SRC_URI[sha256sum] = "e765efd89e759defe3fd797d8a2052afbb4b23522efbcc72e3a72b7f1093ec11"
+SRC_URI = "https://download.geany.org/${BP}.tar.bz2"
+SRC_URI[md5sum] = "53216a43345e2b6dbefa02ac24885753"
+SRC_URI[sha256sum] = "9184dd3dd40b7b84fca70083284bb9dbf2ee8022bf2be066bdc36592d909d53e"
 
 FILES_${PN} += "${datadir}/icons"
 
-- 
2.21.0


