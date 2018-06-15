Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 023DC745AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 18:26:14 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id e16-v6so4916660wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 11:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZfqqUBLChesyam9KM1Eas56BGujY2WVgNRLQdpZ3Z90=;
	b=Z+8oCVveWr6ldjPm/ImztCPfSD4Kt8x1+Y1McJubocvLE6aSWK81BCNgQGjHn59m6S
	2S/ym4fFN4BDmnJ1EVUzKO4qPcBt02LcALbRXAsvGdA43KH0ySjYvqdGocHcviwclabK
	75kKNrnKYevpRsOSQwJwujPwOlnZMVvbn5JE+RjiPG/B7qMZyS0bX2hlXxWRfDHk4kwD
	8+FUY/dm9++T8+ME6ORmkNmDOQk5wQ3VIPqhKw4CNd7kk7cwUuAJlRPXsIWkTg4EFDNc
	uzhmG8jHTwXjOv9Dr3ANgSVeW6aUKOsPnECJ8nzqkkPdGNidcoowXy65oAmIUxDuJ0mI
	Dhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZfqqUBLChesyam9KM1Eas56BGujY2WVgNRLQdpZ3Z90=;
	b=sNeRSxlmxrS4UePyNlDdKwrfnLxUJuS/w+xrXlxLGVp9Tbr6rHYaGAmemjCkUL9OCW
	ACngsO771m49wb+bkztUnW/O99tEZttIyHoPSsiqpflcUC6Q91Tte5R6yb7vd9mmPD15
	1X4Ozjpk77LWjEGUg17IV4KrBBveBW2EYNnvRxrMy527kK2atEYTvHGs2LNEklIVDr+o
	fc+XSO9CHKprq8TZrDt3zQR1Zj0G7NOrGlVM/XY2UP53TFHgvq9Vx/MUPCorHWcOtnMc
	1/xPy10qwzIHw945vsJKpdtCrxZgLO34bJId0Nk3VVKIuZ9gkrEpaXrJWtiY6AR6JJQl
	zk1g==
X-Gm-Message-State: APt69E31VfRiF5Vso3qh8BiUeDYQDzWev3HhzdAxk+eY2/wzXTWRkVke
	Ge8o1RbdIxlKZHeu0sfqN4sB7g==
X-Google-Smtp-Source: ADUXVKIhb1yczed+67CXOrBiJ1rYzOxrSfBqFdqMPp33e9rrdAczb81ag/kDHSnudB/Z46sxEDHcQg==
X-Received: by 2002:a1c:3ac6:: with SMTP id
	h189-v6mr2225125wma.64.1529087175658; 
	Fri, 15 Jun 2018 11:26:15 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l84-v6sm2934902wmi.3.2018.06.15.11.26.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 15 Jun 2018 11:26:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jun 2018 18:26:14 +0000
Message-Id: <20180615182614.27419-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH][meta-oe] collectd: fix libvirt PACKAGECONFIG
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
X-List-Received-Date: Fri, 15 Jun 2018 18:26:15 -0000

* fixes:
  ERROR: collectd-5.8.0-r0 do_configure: QA Issue: collectd: configure was passed unrecognised options: --disable-libvirt [unknown-configure-option]
* the PACKAGECONFIG in meta-oe was introduced long time ago:

commit 5fbe2ac4e8ff67707b907c736966ee3d3357fd0d
Author: Wenzong Fan <wenzong.fan@windriver.com>
Date:Tue Dec 23 16:55:50 2014 +0800

 collectd: add PACKAGECONFIG for libvirt, libesmtp

 Add PACKAGECONFIG for libvirt, libesmtp to fix below warnings:

and at that time in 5.4.1 there was libvirt (renamed from libvirtstats) option, since this commit:
https://github.com/collectd/collectd/commit/553376a3a6c63875c84b406962e56b908dc4e675

but then in 5.5.0 it was renamed again to just virt:
https://github.com/collectd/collectd/commit/62f948605f54e1f5575699360376d75a2f849faf

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.8.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.8.0.bb
index 92b619e227..df9fa233cd 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.8.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.8.0.bb
@@ -43,7 +43,7 @@ PACKAGECONFIG[amqp] = "--enable-amqp --with-librabbitmq=yes, \
         --disable-amqp --with-librabbitmq=no,rabbitmq-c"
 # protobuf-c, libvirt that are currently only available in meta-virtualization layer
 PACKAGECONFIG[pinba] = "--enable-pinba,--disable-pinba,protobuf-c-native protobuf-c"
-PACKAGECONFIG[libvirt] = "--enable-libvirt,--disable-libvirt,libvirt"
+PACKAGECONFIG[libvirt] = "--enable-virt,--disable-virt,libvirt"
 PACKAGECONFIG[libesmtp] = "--with-libesmtp,--without-libesmtp,libesmtp"
 PACKAGECONFIG[libmnl] = "--with-libmnl,--without-libmnl,libmnl"
 PACKAGECONFIG[libatasmart] = "--with-libatasmart,--without-libatasmart,libatasmart"
-- 
2.17.1


