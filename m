Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2D9E7766B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:50:04 +0000 (UTC)
Received: by wmww144 with SMTP id w144so19787683wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0otnV2GrYD48Lx3CSUKh9R9T+XCjspH7jPDs1J4X1PM=;
	b=IcQXgItCswN87WSoef5jzWjk1o9ZF64+SFoR1BuLW0/GdJvozebcES3mie/eAWm3QP
	9ofKt/0TAhFRmg9LBlLOUS26nKnYj1i8e7Oot0T/WM1EJ6Hlgw969SRNZ2o/zbIOLQSH
	jp4u+78TLIQc4IjM6OHem5NDX2AiEStYTLo00Dz/K429s61vuWZsNKqyNlhlB+L9ay9d
	Ys8arAWRAB6bLnfBuvFm0C6OzVJQ1O77MShgCrUVCcw4047BbGco+EXB6g6mC4cwSspw
	Hlbohyrk4yXt7jf5TboHih5vyFBcuuv0hPiHURB82x5DYZgyslmc2nWKgjc+DLH1ijtq
	msBA==
X-Received: by 10.28.94.208 with SMTP id s199mr7393383wmb.10.1447192204092;
	Tue, 10 Nov 2015 13:50:04 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm4763171wjd.32.2015.11.10.13.50.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:50:03 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 22:49:12 +0100
Message-Id: <1447192164-9399-6-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 05/17] modemmanager: Start always
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
X-List-Received-Date: Tue, 10 Nov 2015 21:50:04 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
index 78ac6e2..948b800 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
@@ -51,5 +51,3 @@ FILES_${PN}-staticdev += " \
 FILES_${PN}-dbg += "${libdir}/ModemManager/.debug"
 
 SYSTEMD_SERVICE_${PN} = "ModemManager.service"
-# no need to start on boot - dbus will start on demand
-SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.4.3


