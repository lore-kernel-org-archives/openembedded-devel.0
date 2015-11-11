Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id C73BF771A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:48:39 +0000 (UTC)
Received: by wmww144 with SMTP id w144so59044170wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eQMibJYCCRdgXQFV9pQHDLAe2a7ZEYDDrbXdUlXqyas=;
	b=gPZKZFPyl4GH3wnT0ygnFu6jcFpJXd3HlTCDwNFoAgJYTFUaYRJTt8gNgUXxCAsc7P
	b787i4eAxk1t97KEy2pO4nZ14H58DlfMq6gaprgvgmZkoF7aoWZM4k1FUWHMuAah96L/
	r1zRIsNnXx6dxFj9lV36bSkGZqXC4h9WYGAZ5r8jX1EtMEy+4NL1FD3URv9l4KWCusbx
	kjqEmeZN5BMbrt53Atl8MtAY8ghtp27AwFCAYVnJE45flaTE2c0S9RxA7bDR/hK64H9g
	oflQEeOqxpE3lnZkC2uKDA+5uW3Llli91Imu31qAtH4VgF5yuEefN4Isc+4zeZGDMzY4
	5hEA==
X-Received: by 10.194.95.202 with SMTP id dm10mr12248882wjb.56.1447271319960; 
	Wed, 11 Nov 2015 11:48:39 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm9700824wjd.32.2015.11.11.11.48.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 11:48:39 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2015 20:48:13 +0100
Message-Id: <1447271300-4153-11-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH V2 10/17] networkmanager: run dispatcher
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
X-List-Received-Date: Wed, 11 Nov 2015 19:48:40 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index 39a775a..bb94f09 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -126,7 +126,7 @@ FILES_${PN}-nmtui-doc = " \
     ${mandir}/man1/nmtui* \
 "
 
-SYSTEMD_SERVICE_${PN} = "NetworkManager.service"
+SYSTEMD_SERVICE_${PN} = "NetworkManager.service NetworkManager-dispatcher.service"
 
 do_install_append() {
     rm -rf ${D}/run ${D}${localstatedir}/run
-- 
2.4.3


