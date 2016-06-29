Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9067260043
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 13:02:06 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a66so14169158wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 06:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gmdwwRhSqn/tuHsYE//wllZbgWIRM19Rg3sVMES3WA8=;
	b=Fkq9yw94e5qA2AdRRdJts0fXotcIw0n6IxJPkeUDFv/o/jVSVOVrzwjeElCxoYl3a3
	AevKMTQpxhUSgAkfIsSO7ezZSKXwPXBEGQX5CBTe9TXD6NGGrvtvr8x6nw8bfBxsi5QU
	aJwLkdw+etM3HFFT+o3R3ihQtqaoT8YhqfxxG4d6mbtGdCTFNS0Cf9t5gG6Z+i5wTORl
	q0/YpXKXuWgQ4dY0AiEC7McBT7eCCVpay/K9iz7S2iiHE7K3YHsjvVmrC3qUKSL57Z3y
	A1Ds/uGbHa3wcpEO7UKVl6ar6c6Q9gIXLuTywvbyfN7R07aELlVMkje9RcdT3hSvthSc
	E8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gmdwwRhSqn/tuHsYE//wllZbgWIRM19Rg3sVMES3WA8=;
	b=gdPQ3X//QF++1D2fj53orM4UCk7qGrzfP7wTiHXX0MOPlDgYcsI6J3Rstl7+zF1NdA
	gbm7UCtJzlqZ8ZNCmPaPgXXqfmEjX4Kq6Nv4YpjAH3ARwKsj60tUBgKgUBi7VAEkIVk8
	9UgECuZWMXxoP/nDfINPUUzyIjK0aiErG/kkfhiQKutOuyDczOTgUl+pseUMPG2c8leD
	/z6b/SOiPTAFuPGjcQ/nFoJX2j7Ip2ySZTOcyX0MAqxk3k366TQp0TmQqjKIZeR0H4vK
	2MCaU79sscdx7m/OjqoNkf3mx6oShLlQ3Dj8K6hz7RpECCiXNhH/+siabTf24i1F8dcI
	eZhw==
X-Gm-Message-State: ALyK8tJ7I/gwfbqOawgLEV/2QqdquE+G16yrA59CLie+/E0JSXY9bu2mcIxk7yBjHX0XgQ==
X-Received: by 10.28.7.20 with SMTP id 20mr9478187wmh.52.1467205326325;
	Wed, 29 Jun 2016 06:02:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	v70sm3707664wmf.18.2016.06.29.06.02.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jun 2016 06:02:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Jun 2016 15:03:10 +0200
Message-Id: <20160629130310.16295-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [meta-networking][PATCH] netmap: blacklist
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
X-List-Received-Date: Wed, 29 Jun 2016 13:02:06 -0000

* it's broken for very long time

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-kernel/netmap/netmap_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb b/meta-networking/recipes-kernel/netmap/netmap_git.bb
index a028585..667e7cc 100644
--- a/meta-networking/recipes-kernel/netmap/netmap_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
@@ -32,3 +32,6 @@ do_install () {
 FILES_${PN} += "${bindir}"
 RDEPENDS_${PN} = "kernel-module-netmap"
 RRECOMMENDS_${PN} = "kernel-module-netmap"
+
+# http://errors.yoctoproject.org/Errors/Details/69733/
+PNBLACKLIST[netmap] ?= "BROKEN: Tries to build kernel module and fails, either it should be disabled or there should be dependency on kernel like in netmap-modules"
-- 
2.9.0


