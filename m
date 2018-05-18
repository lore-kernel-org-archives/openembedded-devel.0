Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f51.google.com (mail-pl0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id A2E88748A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 21:09:16 +0000 (UTC)
Received: by mail-pl0-f51.google.com with SMTP id ay10-v6so5269869plb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 14:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LxAYchsA80HoaMGRIzzMO1IKN4cKhnJW3sObJk2dfvk=;
	b=kYiva5QSaNEV9atJVL0aVbNOKffML0/bSgxkm2AvEclIvK9YtsiAZIDBuudsbWksBl
	CFBBeIxJOWBh+8D8+HkuWblJsUZaBbrHm0vt8vq3yT91R8WeijWyN7VgeGh8K4wAfLy7
	8DIZhxeYIYABQy7Gcyb+2u2p5vvhndNth5Yuh5JC1kfBNT8daugHsUjIHBw4IABUYeBt
	zhgrJFijhkTJIm+CeTHvzvE2S7BoD4Rp5C1PADJqR4WFM6x8/RNTR6TO1Iq7t4aiVbA8
	BUIFGEP/lKaJDjZe/cxd1zQZR0Qfv5lw/eZpjco8UDW/bpnyJnFrjz8vsRbtv8hyEPw+
	CJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LxAYchsA80HoaMGRIzzMO1IKN4cKhnJW3sObJk2dfvk=;
	b=RrCpntTWEzupE9x4qnA9b1L7G6WJa9/owZICIWJZ0MfLDHZMx3SF3fylKHgguyHlTN
	jRvTAzbNS8yfk2Nu3bdd41tFVoxqXot5TrZnTuCC58lEPu3flus4U9UojHmmU4HuDCuJ
	afFIm1ceo1CGe7+X2M62+BrzVgOI7OUHCh6sPOvNGKpfsK3tc+jPmiuWgdUrxwhneIBe
	mse4ffmQTsbF3XC4l5SwL1+2QUWQ9Pf45y3ZiM5/Fs2/EDaaCgMsh7bHJVAZ+LVA3Bb9
	ROajnc1QjR51pb0/DA2SMY2ZQJiDmbpXrOvPa4rGBnP0wnp3XUyMxwxagu5n721QoPc9
	ASiA==
X-Gm-Message-State: ALKqPwcrFtu8C8BKn6gY4Vo+ywQ46NyzZNSvwDRl2IpZoekTbT0+8WOQ
	qkNOov6F2ZZk2tP0SRyGVQ1tVw==
X-Google-Smtp-Source: AB8JxZr1Vkg7Df3OF3uplIlRaW9n4sxsXPOshllcO/dWmtekuotynU6Z9hIyfqfBhclhjWXd37AJHA==
X-Received: by 2002:a17:902:8218:: with SMTP id
	x24-v6mr11007619pln.57.1526677757303; 
	Fri, 18 May 2018 14:09:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	v16-v6sm24091121pfk.164.2018.05.18.14.09.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 May 2018 14:09:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 May 2018 14:09:15 -0700
Message-Id: <20180518210915.37448-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-oe][PATCH V2] stm32flash: Fix packaging errors
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
X-List-Received-Date: Fri, 18 May 2018 21:09:16 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2:
- Use BPN instead of PN in S

 meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb b/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
index d401981ff9..854df06cb7 100644
--- a/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
+++ b/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
@@ -1,16 +1,16 @@
 SUMMARY = "Open source flash program for STM32 using the ST serial bootloader"
 HOMEPAGE = "https://sourceforge.net/projects/stm32flash/"
 BUGTRACKER = "https://sourceforge.net/p/stm32flash/tickets/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-inherit autotools-brokensep
+S = "${WORKDIR}/${BPN}"
 
-S = "${WORKDIR}/${PN}"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
 
-SRC_URI = "https://prdownloads.sourceforge.net/stm32flash/stm32flash-${PV}.tar.gz"
+do_install() {
+	oe_runmake install DESTDIR=${D} PREFIX=${prefix}
+}
 
 SRC_URI[md5sum] = "40f673502949f3bb655d2bcc539d7b6a"
 SRC_URI[sha256sum] = "97aa9422ef02e82f7da9039329e21a437decf972cb3919ad817f70ac9a49e306"
-
-FILES_${PN} = "/usr/local/bin/stm32flash"
-- 
2.17.0


