Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id B20547017E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:21 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id a1so2081416wgh.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BJKr885sw/bSZKrxx5aoWtddxxlKwOWbT0ZlOTRqd5c=;
	b=fieirFabNSc9H4jV1r5HM1dXpj4lBqGqM5Xe3MkpVObpw87CjKevQx15p1kLJS+ECm
	kLkkRARl5Rqu6HunuL3TklR4SOryiXcbHDvPm6oGyqU8ReLmN+ajh4FRRfzXErGdMOZl
	ZTcK8PTPkxaMxQXWsO/rpm9JP8STTKMxvX8R51Bp1OhbaG0lxcta5t+aBQWK8FQDq0So
	cqupzeSn2jjd1tyXRUeUYlT5EVakiFvYtd/1W4TmXKEzT1w7DQ9wHcSkUF4lGtKZIfJe
	4fyo6r2Jb8zJ3SXXu544F2r7jc9fXU7tfp7lva6LbsbJLMJivkX83OCX6jmb4WnWJVUo
	B34g==
X-Received: by 10.180.90.242 with SMTP id bz18mr5279904wib.12.1403172022254;
	Thu, 19 Jun 2014 03:00:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bq7sm31896430wib.7.2014.06.19.03.00.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:51 +0200
Message-Id: <1403171993-26208-23-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 23/25] xf86-input-mtev: Blacklist because of broken with B!=S
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jun 2014 10:00:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
index ac47cee..a1943be 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
 
 DEPENDS += "pixman"
 
+PNBLACKLIST[xf86-input-mtev] = "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
+
 SRC_URI = "git://gitorious.org/xorg/xf86-input-mtev.git file://fix-it.patch"
 SRCREV = "1eb469166ffc095c5801475f057f911f97a6e641"
 S = "${WORKDIR}/git"
-- 
2.0.0


