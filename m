Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 19BC66FF78
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 07:03:27 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y16so4381663wrw.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 00:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=pHFbtpaIy6KB8x/8SnktzjfeC8VpKUNRVqyS/m1Dnpw=;
	b=irdJIh5gcDMxBKJ82Ll2Py//0n7uN+38iW02AiE/P2gr0sp7jtDn4O3wktISzD6iDR
	XFwzSvyJ0E+JScIjkN994Nacf3vX32zHZMRD6VjG4XMS2THaAIzs4r1r6hYMdRWdAb8v
	SbV8Ly+mnySuQTiQB8qF7P+tHqkRO9NV3tJxiq9kk9CoNBIVAPqFrEJoyWsca+zjbuYa
	qBY/i4+45sGxbrmaOBwnFoBIfvh82tDGMRq/Mck4oGw1s5azRwpyRhE0U3Qd1eYQlDgq
	WpMSS0L2ROgrx2MBorTF7C8on07iYeEqtVfI29suZBbxJ+LSnLB5g5OdZPPYueQNKp3i
	bsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=pHFbtpaIy6KB8x/8SnktzjfeC8VpKUNRVqyS/m1Dnpw=;
	b=B2fMMkEWvfpo4kHmGS1mpVmMi7/opqjU9OtmEN/bOI+1jUcGyGrdjUfbpEbp68eeWH
	mBj+PyVZho1+JQYwMGuZYIZXu8aZYxKR/n3Dy+t5UEXrN+OySGYhPIRWVGCafSI4Jnpk
	MjfNrulBLFKpmtTPA7FyBqoQNUNLxODOsR7wBSQfJ2UYMPokAN870RtJrMpK2A82YZxK
	hUSdmIpWLYXe0YmVj6SYRbNvmpqk8cbMTo9mOrE6VhWLGHEd5VuzVvIOxpXr6YlWdOPm
	/xOJBFHlFCtSXwE/zaOGdwMrFiwt1n9BoWnoTs9Ndv5/Wy4hhn76VO56rUkjdoZvjpCK
	6sqw==
X-Gm-Message-State: ABuFfogWZD4CMWlKD6FxUWubnOcUCx3v0AxOONKZQ3/M48r1/ngqUZuZ
	K4Tq9BIdlvo8Yw880DooG9GZLiEY
X-Google-Smtp-Source: ACcGV63GoQc5hscDu6izWKjcEfFS0tIsqUXdt53Sh+gUJQQ7gGQesI7DTNokHnd+r8Lf9MhHy6XF6g==
X-Received: by 2002:a5d:5148:: with SMTP id
	u8-v6mr22342195wrt.299.1539155007778; 
	Wed, 10 Oct 2018 00:03:27 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	b139-v6sm33502296wmd.36.2018.10.10.00.03.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 00:03:27 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Oct 2018 09:03:10 +0200
Message-Id: <20181010070310.18649-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>,
	=?UTF-8?q?Sven=20H=C3=A4drich?= <svenha@external.miltenyibiotec.de>,
	Igor Kreps <igork@miltenyibiotec.de>
Subject: [meta-mono][PATCH] layer.conf: update layer compatibility sumo->thud
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
X-List-Received-Date: Wed, 10 Oct 2018 07:03:27 -0000

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 8a8d273..cf9a1f0 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -15,4 +15,4 @@ PREFERRED_VERSION_mono-native ?= "5.12.0.226"
 
 PREFERRED_VERSION_nuget ?= "3.5.0"
 
-LAYERSERIES_COMPAT_mono = "sumo"
+LAYERSERIES_COMPAT_mono = "sumo thud"
-- 
2.17.1


