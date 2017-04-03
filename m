Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1B357607F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Apr 2017 18:37:39 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k6so34576366wre.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Apr 2017 11:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t4GNc/ppz4xq/4jMlhowp3nrmalma3FeJOLkTRRtDZA=;
	b=fO8kN6rYVksBh0b/5usX2+Qtrjsfs2e9c/+TMVmNaO2zrb1tUkKRrrefJnnZLF3UXJ
	LjBQW3A1++25IrwGtmXBsrtitHucMxNG/Regl1RXHGK+Y0fEstHK3XA8EsdUdTkLyfRu
	6pEBSZMI5NuCz7PuYgWe/23BqRu2XAZnetDeKVHiO+Bngrwa5iOFixeFujCeeqBaHHvV
	fumJ/2XYBm7YAfzU/QDAl5F+pI5q9PWUkwBODqiQSFLXmNN0rM7MUYf5gd/cM0/ZuftE
	aN7/Zhh4myBXtXGlmYZO1JLrKjwpHTprqT4vLXcE5GhK6FJlxbTUBIMk2UMod7LpIYZU
	HFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t4GNc/ppz4xq/4jMlhowp3nrmalma3FeJOLkTRRtDZA=;
	b=qL9idSny+P35mKW6gO3UczmAXsxFcJcUaC4vh4JvPQ1hY6DlNXZtdkeAw1k71AYUE2
	6B1NhmqamuE9xCBJo+D4PKB7iaLBRr2md5gfeQ+Cs8dPKotlxBVshNpgryXwo8a4pMX8
	Bo1SWW9ZvBI0seYrwwbVcttg60s2GK9vqKmRFVK6Y3Bb61hQXWD8264ri1zr81zZWzaw
	+FH9mzjiC7Sq0leD/48SZV7Ey5+pSPz9AnxV2+JLxN8G0+gBtPB5GdwCcengnoYih8e8
	7JZ4aIBU0sBwQtULeMR+Rg1kHiM+ATI5TxxNaKQMoc9ARsLW3QbM6nBaPpgE4V7FODyO
	XGpg==
X-Gm-Message-State: AFeK/H1QH8cU79s1UqapaZ14ITeoaC62JVw44VgrzTwFzBpsdce2m/HGLvzsMSEKXTcAuQ==
X-Received: by 10.28.140.19 with SMTP id o19mr11289458wmd.123.1491244660331;
	Mon, 03 Apr 2017 11:37:40 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w85sm15295022wmw.1.2017.04.03.11.37.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Apr 2017 11:37:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Apr 2017 20:37:37 +0200
Message-Id: <20170403183737.14791-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170403183737.14791-1-Martin.Jansa@gmail.com>
References: <20170403183737.14791-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/5] xdotool: prevent compile-host-path QA issues
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
X-List-Received-Date: Mon, 03 Apr 2017 18:37:39 -0000

* as shown in the log.do_compile:
  cc1: warning: include location "/usr/local/include" is unsafe for cross-compilation [-Wpoison-system-directories]

* it's caused by Makefile doing:

  DEFAULT_LIBS=-L/usr/X11R6/lib -L/usr/local/lib -lX11 -lXtst
  DEFAULT_INC=-I/usr/X11R6/include -I/usr/local/include

  LIBS=$(shell pkg-config --libs x11 xtst 2> /dev/null || echo "$(DEFAULT_LIBS)")
  INC=$(shell pkg-config --cflags x11 xtst 2> /dev/null || echo "$(DEFAULT_INC)")

  which always uses the DEFAULT_* since RSS, because there was no
  pkg-config in the recipe sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb b/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
index 474d2986f..b68e994ab 100644
--- a/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
+++ b/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
@@ -7,7 +7,7 @@ DEPENDS = "virtual/libx11 libxtst"
 
 PR = "r1"
 
-inherit distro_features_check
+inherit distro_features_check pkgconfig
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.12.2


