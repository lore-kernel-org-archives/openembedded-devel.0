Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2340E77103
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:50:03 +0000 (UTC)
Received: by wmec201 with SMTP id c201so21819024wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=M7nR3EDrTeBO22vwHqVMYUO8R5hKEHCp3GMJnrCl/8E=;
	b=BnD4/C1aNhScGfmVDd50L7RU2T2AkVyc7jJX6x682nAc7l5RyH07KJSd2P1RgUeCvq
	Q5GHlL6QTvR2crvKhSdwXQZ0Ffks3xt3t+VE/xf5s9o8GcINimCC23wVKtQ2bgHwBmNf
	3FIrG8nRs7i4u4CRk3TpYxdkTPOfBK8kPnRqa6i7vkEhvNeMv8kShD6yIVHD3F8LXz5t
	qDNf4XHAV8x2ytf9q6ik5b6slPjQIp0WLjjuE3hdVRM744FlDynamYYNDPH/HW0VXZ7o
	sh3XbuiqEhyTHfUD3aZl//yN3lDMPpWgth8KvqLG5E7gg+guDsobl/NJPGBwho863nZm
	NK6Q==
X-Received: by 10.194.189.133 with SMTP id gi5mr6401081wjc.13.1447192203260;
	Tue, 10 Nov 2015 13:50:03 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm4763171wjd.32.2015.11.10.13.50.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:50:02 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 22:49:11 +0100
Message-Id: <1447192164-9399-5-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 04/17] modemmanager: add dbus config
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
X-List-Received-Date: Tue, 10 Nov 2015 21:50:03 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
index 1d630a9..78ac6e2 100644
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


