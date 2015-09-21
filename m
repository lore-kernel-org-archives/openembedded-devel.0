Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4905773243
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 08:59:46 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so101163642wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 01:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=s0bCvHRmAgHUiiyTWp9rEmJ7XK/nUiTbCSWfg3hFObo=;
	b=nIPADLnQ7FITB0gQQEVkOJN+2W9fBE2yXuf7QIghjuCC1u2WNSLBmrhBaoYAObMm4a
	p4II26U0vOEkSPWMGXtyzLmdibERJ7ngXLlyKjPeVeehLPbdUKQ0K20iRB2rImaRJ6Ld
	TIRpc81L08mdfoP8BSK5i0KLXmmGCvsWuvYZL+qpurfKvUBP//tM59CQXK5BbiB0RfOC
	vitoplbNB2k4G7Vqt1CBbreFreh4BX48oBGeve6nCXcrA2nT9295sXV7yEN7W11qk13v
	9QNz+uRTf40bWEcYVIOjOVXHWQkFWuxIzRgQoH818Pe3jaSXcJdT38OjWY4bkBsb/fyJ
	ATAg==
X-Received: by 10.180.219.101 with SMTP id pn5mr11429555wic.89.1442825986278; 
	Mon, 21 Sep 2015 01:59:46 -0700 (PDT)
Received: from chl500346.neratec.local (mail.neratec.com. [46.140.151.2])
	by smtp.gmail.com with ESMTPSA id m4sm22970274wje.5.2015.09.21.01.59.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 01:59:45 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Sep 2015 10:59:34 +0200
Message-Id: <1442825975-8950-3-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1442825975-8950-1-git-send-email-adrian.freihofer@gmail.com>
References: <1442825975-8950-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [PATCH 2/3] networkmanager: depend on libgudev not on udev
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
X-List-Received-Date: Mon, 21 Sep 2015 08:59:46 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
index 62debe9..98f9b4e 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
@@ -4,7 +4,7 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
 
-DEPENDS = "libnl dbus dbus-glib udev wireless-tools nss util-linux libndp"
+DEPENDS = "libnl dbus dbus-glib libgudev wireless-tools nss util-linux libndp"
 
 inherit gnome gettext systemd
 
-- 
2.4.3


