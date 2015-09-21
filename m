Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id C409673243
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 08:59:45 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so101163192wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 01:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Of/ICooMI4wk7rtRNCmPVe1LdJ0cYDGkYBoVDMK68Ts=;
	b=EfpqOeuQM06ox9o6oSEqgWMH0Ro2gNu2l1H6f5vOdvBFIb2gMThNCjqfog7eAOkl5U
	NLCdT006po2Q2i20a36Pii3+Ca/gwAq36PCdcReaO3Nq7eMSqFsE+nSZAPFVWhaC8nAd
	Jc3/ZTZS8TLxYux+btgpc3HC6zxOduOkuciRKrOsZB4XROOg2O5aihVh/jA5AOLRs9yk
	vGc/s6VbxYdXe9n1K14FYuoOR/nhYdVRaWZSpxqt4i1P/I5FWniNl06FSGNMH+LcvLkF
	mGendo9U4Z4hRH2ts83s4975pT1EBZGpJgNBznb7dYCdvIG945V/SvP5nE/7nlSt/3c2
	VxZQ==
X-Received: by 10.194.9.97 with SMTP id y1mr25506297wja.84.1442825985473;
	Mon, 21 Sep 2015 01:59:45 -0700 (PDT)
Received: from chl500346.neratec.local (mail.neratec.com. [46.140.151.2])
	by smtp.gmail.com with ESMTPSA id m4sm22970274wje.5.2015.09.21.01.59.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 01:59:44 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Sep 2015 10:59:33 +0200
Message-Id: <1442825975-8950-2-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1442825975-8950-1-git-send-email-adrian.freihofer@gmail.com>
References: <1442825975-8950-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [PATCH 1/3] libgudev: exclude use with systemd <=220
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
 meta-oe/recipes-gnome/libgudev/libgudev_230.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-gnome/libgudev/libgudev_230.bb b/meta-oe/recipes-gnome/libgudev/libgudev_230.bb
index 5f847ad..39fc1c4 100644
--- a/meta-oe/recipes-gnome/libgudev/libgudev_230.bb
+++ b/meta-oe/recipes-gnome/libgudev/libgudev_230.bb
@@ -5,6 +5,8 @@ SRC_URI[archive.sha256sum] = "a2e77faced0c66d7498403adefcc0707105e03db71a2b2abd6
 
 DEPENDS = "glib-2.0 udev"
 
+RCONFLICTS_${PN} = "systemd (<= 220)"
+
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-- 
2.4.3


