Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id B6EE47719C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:48:35 +0000 (UTC)
Received: by wmec201 with SMTP id c201so61717267wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U63T77Td0gVQgATn+i83kCuQeNmCE8+utiSfbY9oeI8=;
	b=NNOztQVe2b4wfZB0am9XWVdUg2ZLx3kCO4bJoV4y1Nu3OLqxIqjFALQRPOtftYKU8E
	2cdSGfBD8tPcCfnpOk2DHu5D3ZJ1lPUTR9wlAM6h1iKi19HYP1HjNT3m5e4qg/Sza6LL
	kgt6D9Drg2/dAKkeLyfToU4FL1XPGEsaIrXRBs4w5iBCCWIVGJEDp/VzCRlBP4axP4DS
	qfODSkA6Z3QGqnqr6S/2X4NZGPwa85z5OYJAHh9xeer4w3i3fAJW7aJlQhstSM9pr3tF
	4IbEjzwgPbvddkyDpzYXSRnZU7EGfkqH4zH+ydieGDxugIfBWswErJrPCP7z2EkKMEjI
	bSMg==
X-Received: by 10.194.8.227 with SMTP id u3mr12129844wja.38.1447271315321;
	Wed, 11 Nov 2015 11:48:35 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm9700824wjd.32.2015.11.11.11.48.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 11:48:34 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2015 20:48:08 +0100
Message-Id: <1447271300-4153-6-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH V2 05/17] modemmanager: Start always
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
X-List-Received-Date: Wed, 11 Nov 2015 19:48:36 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
index 203390c..608e7f6 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
@@ -51,5 +51,3 @@ FILES_${PN}-staticdev += " \
 FILES_${PN}-dbg += "${libdir}/ModemManager/.debug"
 
 SYSTEMD_SERVICE_${PN} = "ModemManager.service"
-# no need to start on boot - dbus will start on demand
-SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.4.3


