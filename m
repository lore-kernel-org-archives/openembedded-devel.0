Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id D3F24771AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:48:34 +0000 (UTC)
Received: by wmww144 with SMTP id w144so59040688wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZMAfjp0phZO4z8eMuvjQnrEIcWhFAYpbtoq9PGXLOP4=;
	b=l445DNuRGSrWVwYn2PDDm6CDAcahk2GjoVZ+tV+Jaq7cwCkht8UFXFx7XbTgr24PII
	wY64QOgRRsfVsLyeYdj6dlwvNpyWNwZjI0qN+UKvE0OCLaXVLiAWdPx3CmrVW5KvQZxF
	rdXgyzd3J1N28pOOLUgp0ay7bcy0FRawFiWf8LxLiN7L1vWOuGn9KJTVHxWD0URymr/3
	15Jk0Md5SbtxiGsB1qtbzRBA7qYMWccG7RI42pUdZr1P2N2QR3kLDQLGOJaVkzgPseMj
	6PRrT4taDGJ5nF+vYh+Sw19DEorcG0NjoG1gvYSJq20oerGCVAGoB8F2DefhEShYA8yV
	X2Bg==
X-Received: by 10.194.176.70 with SMTP id cg6mr13776854wjc.155.1447271314451; 
	Wed, 11 Nov 2015 11:48:34 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm9700824wjd.32.2015.11.11.11.48.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 11:48:33 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2015 20:48:07 +0100
Message-Id: <1447271300-4153-5-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH V2 04/17] modemmanager: add dbus config
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
X-List-Received-Date: Wed, 11 Nov 2015 19:48:35 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
index b1768ca..203390c 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
@@ -35,12 +35,12 @@ PACKAGECONFIG[qmi] = "--with-qmi,--without-qmi,libqmi (>=1.12.4),libqmi (>=1.12.
 FILES_${PN} += " \
     ${datadir}/icons \
     ${datadir}/polkit-1 \
+    ${datadir}/dbus-1 \
     ${libdir}/ModemManager \
     ${systemd_unitdir}/system \
 "
 
 FILES_${PN}-dev += " \
-    ${datadir}/dbus-1 \
     ${libdir}/ModemManager/*.la \
 "
 
-- 
2.4.3


