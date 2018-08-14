Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 41ED079014
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 10:53:40 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id h9-v6so16830930wro.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 03:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YcNMyABCo43/MN1LYyOuKImBUSSNHboSUJ5awobBzLA=;
	b=A3U58IA9+INEwe9g8U5Wf2qx5psS2mihEJNvgyh8Z1Y301/uAyQWaT6cLeciHfJtLb
	l5r/B5qYHkAS6iZohvwHEsCzPceWl+FHOEQOZ4nugZDz3zWbgMphlRoWuqSBu9USSuIE
	m5XtLayli9rK8Ko2GhHyQKvk2oDtOnGrvMFM8uDPkw+3rXBSVmtKidWPSodSefUGi0I+
	SPUJAU8TqD9NI5+xmU56DjPjiJGaw59R5nI8UfMJclbW1d1IAHyE+cWC3sN5ZWa4mkD/
	+sTvn9TF9CgJYJze6JKpexI7GATYlSBb157igZQ5D5qnZiVLfQrIuvdTEoDNfMXRF9a0
	Bqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YcNMyABCo43/MN1LYyOuKImBUSSNHboSUJ5awobBzLA=;
	b=MMJCK6LlSuo4/WtJ9kck9Ohd3qf/n/jy4ynFTI2rZ4kNnDWLuZuPzhcWrJe3uId3bh
	KQd7Bnh15sYAZKdP0XJRp5Ol6hyS7fqKsh2ycvW09ZJBV44GsEERUszKlRAIKAc4BL24
	gJWKqyqrEyCXNb/UDRQ/xid/xVYLa91fj27MUxGuxfNRlbWHtdQa8CanAZlKq3uhighq
	M9PGhB2CkTXCegO2NJQTDnY+pzUxBMu2UJvdsDDNfaMfPAAc9UvqxZCHMtJcqN4fNfil
	b0NTNz1T1E+n4ZmY9WCw9QNfJ8b1BPakrcV6/kZzPO/au/+3EfJM2iHb+cT9y1ZIg3JW
	NI6w==
X-Gm-Message-State: AOUpUlGbRvXAL9IJ13RJFFqMtIM8wGsYJxWYUMCpU2yu7UpM5Vnpxm97
	YkoRSZotb8HVWtvlWZnUUHsD3dD0
X-Google-Smtp-Source: AA+uWPxSpOM+zO2oiU3hbdqgr3rGVQO9gSRnIWyrW7EXLq46o/WOIy7Qvwwa5ZRnwcVHYJt+nRtFng==
X-Received: by 2002:adf:c4e5:: with SMTP id
	o34-v6mr560658wrf.173.1534244020890; 
	Tue, 14 Aug 2018 03:53:40 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g17-v6sm8523637wmh.19.2018.08.14.03.53.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Aug 2018 03:53:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Aug 2018 10:53:45 +0000
Message-Id: <20180814105345.6634-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] glmark2: add dependency on virtual/libgbm for drm-gl, drm-gles2 PACKAGECONFIG
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
X-List-Received-Date: Tue, 14 Aug 2018 10:53:40 -0000

* it's checked by wscript for all flavors with drm in it:
  ('gbm','gbm', None, list_contains(ctx.options.flavors, 'drm')),

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index b72ced06ad..99050e7047 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -36,8 +36,8 @@ CXXFLAGS += "-std=c++11"
 
 PACKAGECONFIG[x11-gl] = ",,virtual/libgl virtual/libx11"
 PACKAGECONFIG[x11-gles2] = ",,virtual/libgles2 virtual/libx11"
-PACKAGECONFIG[drm-gl] = ",,virtual/libgl libdrm"
-PACKAGECONFIG[drm-gles2] = ",,virtual/libgles2 libdrm"
+PACKAGECONFIG[drm-gl] = ",,virtual/libgl libdrm virtual/libgbm"
+PACKAGECONFIG[drm-gles2] = ",,virtual/libgles2 libdrm virtual/libgbm"
 PACKAGECONFIG[wayland-gl] = ",,virtual/libgl wayland"
 PACKAGECONFIG[wayland-gles2] = ",,virtual/libgles2 wayland"
 
-- 
2.17.1


