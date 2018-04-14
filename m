Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6ABC97455D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2018 23:50:19 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id i194so2215958pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2018 16:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=yfXHglYmD7yYT/g03Lct39ekfWMxh0zNhxc+FB0pnm4=;
	b=vXhyqMVB41qbZLqZhYhWOLZO3fMCM9nASzK8YShaqHdkqOeuGMzfZC1BdY6VhaUWY+
	lz3PZnQ2FOQTAdXM635s67q/GMFOQm4RvBangvYVoLF+ZhL4R3BUeNb4jJrbYr+SpfsH
	CiIH5ch/7sGglJo2MIRbnE08XQJFxUaEYN/A4fGGFfERUar+Yrqd2WA96DHOyk7s3Zga
	433hk71sHLw2cZfJgLGFTFVJKWmuSQI5b1vZAAG2NSowYhBPrNHQYUQZ1vmL7lAVrB0Q
	xMuRrtUL/D969FZF2WlPnhtUrJ8F0rI2n5YA6kAJTudUqyG+/A0rM17AvQFtNpjUeS/R
	Ob4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yfXHglYmD7yYT/g03Lct39ekfWMxh0zNhxc+FB0pnm4=;
	b=Cpe9iZsGcLqwB8/uuwaHKJ2eOnoO6dItbtwSfl/uZOj/4GP4JxJxpua+KjOf/J9YTi
	WEIvqN6l9SVJv+0hE9exgSF2nDIGevW0G9EALOz5KP31q4SLoJKebLdTHT1Sa+9LpYum
	xkd1SVVsxJsCiahT1m831htiOK3ABVf/mQQk5/6zPM3OSHP8l2fQKjx82bL0s9vVChBN
	jfTHcekWFw8NIOJN5s0yEknre+/U3xCyVv6oBgvo+TR98r2lClFwvP4npMLGubWHOlBN
	mdZEXic9pUwRbCmmZG+mmkutophpzPelKQoETZJ/FTY7lQTxp0ZDd2o3mJdXqwM28y7O
	nYXQ==
X-Gm-Message-State: ALQs6tCd7F8COA+hiVerLSvEphhLBycaWnb5LADYlOdZe41/0WCKtCPd
	xyHMCzM1LR4y/FoCF8K7fL8=
X-Google-Smtp-Source: AIpwx4+YBLMikVzzTBpBFgc1Ys9GXQGJE6NnakBATNK6EIq950Rzl++qhB2hmKTc8q8zKI+yL2RZpg==
X-Received: by 10.98.70.199 with SMTP id o68mr16496265pfi.169.1523749820795;
	Sat, 14 Apr 2018 16:50:20 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:19e4:d7e5:ee20:78ac])
	by smtp.gmail.com with ESMTPSA id
	f126sm19551000pfg.25.2018.04.14.16.50.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 14 Apr 2018 16:50:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 14 Apr 2018 16:50:18 -0700
Message-Id: <1523749819-31207-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/2] drbd: BLACKLIST recipe
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
X-List-Received-Date: Sat, 14 Apr 2018 23:50:19 -0000

fails do to new kernel headers.

| ../drbd/9.0.8-1-r0/drbd-9.0.8-1/drbd/drbd_receiver.c:1479:7: error: 'struct bio' has no member named 'bi_bdev'; did you mean 'bi_iter'?
|   bio->bi_bdev = device->ldev->backing_bdev;
|        ^~~~~~~
|        bi_iter
| .../drbd/9.0.8-1-r0/drbd-9.0.8-1/drbd/drbd_receiver.c:1484:17: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
|   bio->bi_end_io = drbd_peer_request_endio;

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb
index e943f24..7a607b0 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb
@@ -20,3 +20,5 @@ EXTRA_OEMAKE += "KDIR='${STAGING_KERNEL_DIR}'"
 do_install () {
     oe_runmake install DESTDIR="${D}"
 }
+
+PNBLACKLIST[drdb] = "implicit declaration of function 'setup_timer'; 4.15 head file issue?" 
-- 
2.7.4


