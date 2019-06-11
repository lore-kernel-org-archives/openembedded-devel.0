Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id BC0377E653
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 16:55:13 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id x4so11202513wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 09:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=H/ud1R6zjbgmdtGEtXTuQLDT9XMI8qA44t30GuCVdPc=;
	b=n+AgBzItfy5iXxpi8f4uaRRlR/8OF8/JbWmdEgnk6XFALbZCKINnzqK6X8au5zDTwr
	bHqgksw5VFEELSmY2Xp86ojH+0iqbWtYDGmcRGJ87v9RmkCqL1vgF5Of2qlycZXAIED0
	ya+/pJaK6QRvVLJ0CIx0Xl1Y5fPQMiHCXuVrvP4pOT6H16jHwa5uT/rUADWaF8hNhJ+B
	dNwGqSDpu73vmpyfc05AZAORgINwNUkEuBSAmD/r7jHy/vU94a6+GKe0yz/n1ZoRDhVu
	aMAQamz9CafqX8yM9cK/UkA9dWtVLBtSWAj0ATaME03l69E06AtNjHPJTy8c6ldXNH8L
	LwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=H/ud1R6zjbgmdtGEtXTuQLDT9XMI8qA44t30GuCVdPc=;
	b=WxWZqHts9TE1+ytk/zzmOV6N7oZU8wxklxK3qvhZ9KHLq7dB9i/v5WPlB42aLiIbPR
	gQjlJd6v9Kgx0mVozIqRw6MnlMsKefKzqLuj4U8w5WIrZCxo66+LBX2uP/jIv/L2AvXR
	1HEHLs40B5h6AUTmjqbkxhZ0mpa8LNK4qflbn2dWWwHa66SBt6UXt3IguGm99mP+DneQ
	xNmSRHuYQueGft87Z/oFdVbYhIKu0isUPKUcUgTqHC6IhI2i1/iwDCIy9FC/IbsAu+5e
	jg3z8jJnEZ4OVkuhJRX/qpk6290Ws8PBB4alPI1qAyWkrl5TiHQC7Ko29fZ98exy62TW
	KIyw==
X-Gm-Message-State: APjAAAVhQDNTAo0t+kXtEequxskQelpdoqHu+0ySRE4/tpe2vwtHJBAA
	o2ABOO+YCmVS1Z8u5vT/gCOK57n6
X-Google-Smtp-Source: APXvYqzmwJzICIk80HviU7BsQRFsloBw0TPlviDyhSetgRYsagFZheF9B7vCRL/oKeh5DnUAy5+yTQ==
X-Received: by 2002:adf:8b83:: with SMTP id o3mr47628416wra.278.1560272114221; 
	Tue, 11 Jun 2019 09:55:14 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id f2sm3199555wmc.34.2019.06.11.09.55.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Jun 2019 09:55:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2019 16:55:00 +0000
Message-Id: <20190611165504.23049-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190611165504.23049-1-Martin.Jansa@gmail.com>
References: <20190611165504.23049-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][warrior][PATCH 07/11] python-cassandra-driver.inc: fix DEPENDS
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
X-List-Received-Date: Tue, 11 Jun 2019 16:55:14 -0000

* there is no such thing as DEPENDS_${PN}

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-python/recipes-devtools/python/python-cassandra-driver.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-cassandra-driver.inc b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
index 1cc1f4c494..53ebfec337 100644
--- a/meta-python/recipes-devtools/python/python-cassandra-driver.inc
+++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
@@ -28,6 +28,6 @@ RDEPENDS_${PN} += "\
     libevent \
 "
 
-DEPENDS_${PN} += "\
+DEPENDS += "\
     ${PYTHON_PN}-cython \
 "
-- 
2.17.1


