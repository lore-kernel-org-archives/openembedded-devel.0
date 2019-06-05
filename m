Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 738C37CE21
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jun 2019 07:54:03 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id z23so1195367wma.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jun 2019 00:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=o3emqFftH4CpecQNisGezQd7STFl8QpG52rhB+tFRZw=;
	b=EQwYLA6hfMHfeIo+E1RJYRB5WhSYPeB2lqUuK20QJKglt5waF7HcJhJpyhWspjjhyC
	QYJhEnXVI7p+IqFpRVctD8Z+C6t54L39JYgsv2C1hAdE99h5KzFOJ/qBOT+O+HTL+pNW
	Oyh3dxHQiIBVg+XKwZLjJ3uQmoiuhRqOjSF49LVEOu7rh5v37YxCy0gNnUZHQdF7j4eY
	/wZz3jl4uKD4gKKHycjj/gbptV9z18Jgw60UtKAzaY0qUbOktctrulTPzfiv2jQxG2Dz
	W/bimt25XamShmeUVlkflU56spaZZlsy2kVnjvfmtEHsSHkAKfCLATG/30agtTAhtxk0
	Ou2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o3emqFftH4CpecQNisGezQd7STFl8QpG52rhB+tFRZw=;
	b=FEY4DNPw3+QiG+85nZ0SGgP5ZWq2h2aTSMGZuHeZ00nqT89oW2oNlt0bEW/NnfXoW6
	A1v4NsfT2d71yr07yql+9mTRvKQ8GOwsQFarqbC3Zi56YQSaDWg9ChMFVgWmG5/wwgSE
	KUOxpM6QaJjaPHAFxJw+lCGE+EE8cdeI/Rp3+nIxudxPQGcXEh96e5u59Ae46dZJTt/y
	Od7ul9KIJh6ejKC+AEJZJNKfQePS/ykg1GVIx5JgqTjr40XqsTXKVvHTodpDKGeGmKHC
	S0iRSIVdg1go3bkk0agUYvR98+KD7gIqHhnKS6xu04ZTOeUUb72rzx9x/vrNjL7leoG9
	01Kw==
X-Gm-Message-State: APjAAAUMIeFWvziPW5btQ3ezX9WX8RXTMX4iWvCfpJiumxA41s5l+eht
	2RCNIDOv3wRB4XnYsXDkZThyb8+8
X-Google-Smtp-Source: APXvYqwNQghied9eEuCOZ7pOmsmL8m5uI4kw76Xq8xv6AXblVXPj83J5Ve5Hno0KfyTVi2Jia1/JHg==
X-Received: by 2002:a1c:4b1a:: with SMTP id y26mr11310435wma.105.1559721243930;
	Wed, 05 Jun 2019 00:54:03 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id y2sm5294556wrl.4.2019.06.05.00.54.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Jun 2019 00:54:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Jun 2019 07:54:15 +0000
Message-Id: <20190605075415.546-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] cpprest: temporary ignore deprecated-copy and redundant-move errors detected by gcc9
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
X-List-Received-Date: Wed, 05 Jun 2019 07:54:03 -0000

* until it's properly fixed in upstream:
  https://github.com/Microsoft/cpprestsdk/issues/1099

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/cpprest/cpprest_2.10.13.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.13.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.13.bb
index 1b1265fe35..0704512110 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.13.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.13.bb
@@ -17,3 +17,7 @@ SRCREV= "9d8f544001cb74544de6dc8c565592f7e2626d6e"
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
+
+# Temporary until https://github.com/Microsoft/cpprestsdk/issues/1099
+# is fixed properly
+CXXFLAGS += "-Wno-error=deprecated-copy -Wno-error=redundant-move"
-- 
2.17.1


