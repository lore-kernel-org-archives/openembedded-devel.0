Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id A3DC970675
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 15:13:00 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so6089406wiv.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 08:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oFOgd4HEzxtFFUUAPEVtENXsdtVVEevtgkhX5vORR/o=;
	b=Z68FVXzzlfaaUDZXhdBkMwQZONAvG+V4l2VOYEB4Bh4gawo9BK4i8jCsa6yjrG7sUj
	ux6ncbE0qZayZUuS5h5KTON5LR3cWYTAqA+znZEG6v5TcBat3GtTJM9GvcIbXYVbDejD
	zs4b4bccKaua3auvldDgZBPgJwJQusPlfK8R10DpwTkyUZQ3nkeJyx8zhuuA85/iqiaC
	8shKUyNapBwt0K1CsEKEc6XSg7fj/Yg6Us8DogTQmHRTtbsr8JJh8pnS0W00rEShbbFs
	P2/D7GHmzvqDmhr06QZozc9AwA0I1vspItHJHaFBhHIs5DyoZj4bkB9zawr02ehNaMYj
	Zxrg==
X-Received: by 10.180.182.167 with SMTP id ef7mr15928431wic.44.1406041980103; 
	Tue, 22 Jul 2014 08:13:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pl1sm3636655wic.17.2014.07.22.08.12.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 08:12:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jul 2014 17:13:11 +0200
Message-Id: <1406041991-8849-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [meta-oe][PATCH] snort: add missing pkgconfig inherit
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
X-List-Received-Date: Tue, 22 Jul 2014 15:13:04 -0000

* otherwise m4 eats all memory and is killed by OOMK
  [1051138.019784] Out of memory: Kill process 26264 (m4) score 860 or sacrifice child
  [1051138.019788] Killed process 26264 (m4) total-vm:23062712kB, anon-rss:15066516kB, file-rss:100kB

* very strange, but m4 and snort sometimes have strange side-effects,
  from first google result:
  http://www.hipforums.com/newforums/showthread.php?t=466568

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
index 1933f29..16c9bbb 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
@@ -16,7 +16,7 @@ SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
 SRC_URI[tarball.md5sum] = "18111f6de3989ca89add36077a7c2659"
 SRC_URI[tarball.sha256sum] = "3cc6c8a9b52f4c863a5736a73b4012aff340b50b5e002771b04d4877f47cd19e"
 
-inherit autotools  gettext  update-rc.d
+inherit autotools gettext update-rc.d pkgconfig
 
 INITSCRIPT_NAME = "snort"
 INITSCRIPT_PARAMS = "defaults"
-- 
2.0.2


