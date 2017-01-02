Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5886D605FF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jan 2017 08:28:36 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id y21so266762686lfa.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jan 2017 00:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=bveDL8X2KWgxcshfpZHWPyYZM3Kc2mf9KPsHefs/ImQ=;
	b=RmKScYl7rc82e/RPmOTwBqNUFKkHhPHEOT3HCo81hjPoYVSHYhWKiE5Hs4GQINnzWv
	oj19omxuI8s4xFWa2shD2eX1GuDSE4eCghqeSHFuoE6EFHNyUyQ2rVardkBNyzBktYZM
	Xp5GWLC+7/TVfK0mK1JO5Jl5M4esN0ixPv3ERTZP1CsZwUYiyk1NHgTbnqXggCSVSMqH
	FOeYJcehsjihQcypZoCfwVPzoaFNcnhavyz3t41rl3UcsPyFK+hn29Q8bcDz4imeVXkd
	XyWFF3i+Oi+iabcMYzh9Ln9/Laj5+4FkArsjbKRBF7lqHYgz/pRgIUS3bEg/NC5XlADM
	lLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bveDL8X2KWgxcshfpZHWPyYZM3Kc2mf9KPsHefs/ImQ=;
	b=RzAjkNnM9/dcR/JOok3obeXPO+JzGagSg0SSuRNUx6ijdK98i/Okl5DzyB7RtOH4Do
	rulQGShd/eURPltA7FRoO/Va+JFiObuaMxXzjZLVtqkh19obh0FclWKx1kaWHvFLRNOj
	RUecL4Wp+8FubfZZtVM/+SMwhvgkRoodJ7mOwOXwivLQ9b06ZBQJNcLj0YW0iiJjwnf7
	zWdtgtWxzub4+DlDisCbhX0RTKI0Zv+4esoPK1wTstoFokgv68kmU4qa+MYneIjsjL+P
	avyD9Yr7x1JOdQJ5Mr89RqXMF6GveoNz85apchevnFKnjyxgvfYYooD1fkevYJ5VAtGa
	TocQ==
X-Gm-Message-State: AIkVDXLlt8Hm2si+brsraSoyLCu0MsU12X49edXyB8WlTWlxcb7U07fF3mnpTBRu9JtVZ+2E
X-Received: by 10.25.27.145 with SMTP id b139mr16948478lfb.114.1483345716414; 
	Mon, 02 Jan 2017 00:28:36 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	x10sm15737456lja.15.2017.01.02.00.28.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Jan 2017 00:28:35 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Jan 2017 09:28:18 +0100
Message-Id: <1483345698-2761-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] tcpdump: upgrade to 4.8.1
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
X-List-Received-Date: Mon, 02 Jan 2017 08:28:37 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../recipes-support/tcpdump/{tcpdump_4.7.4.bb => tcpdump_4.8.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.7.4.bb => tcpdump_4.8.1.bb} (91%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
similarity index 91%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
index e18228f..18efb9b 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
@@ -12,8 +12,8 @@ SRC_URI = " \
     file://add-ptest.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "58af728de36f499341918fc4b8e827c3"
-SRC_URI[sha256sum] = "6be520269a89036f99c0b2126713a60965953eab921002b07608ccfc0c47d9af"
+SRC_URI[md5sum] = "32f57943649f276e09236ba66622bb0c"
+SRC_URI[sha256sum] = "20e4341ec48fcf72abcae312ea913e6ba6b958617b2f3fb496d51f0ae88d831c"
 export LIBS=" -lpcap"
 
 inherit autotools-brokensep ptest
-- 
2.7.4


