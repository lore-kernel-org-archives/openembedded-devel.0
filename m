Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 70D8C744E4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 10:28:54 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id y2-v6so14235479wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 03:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YPGS8pmPWqPiRr6eCMjgXfrcX8nfyTImRcuGJEKAeXU=;
	b=SuN174WBg2wAwROIu95RuMKtGV2qbAp1soCffjaPBiZf0qVTbljWvdMV4QsXgoVOWd
	5jcTWdxfLnlI8Z2ad7xm3PZ53qdLKA/il8xamWU8GqdBcbiq4dnLICcaecNpznuBjQHM
	TcdstGCBkZejHeUrQ0gIiph1CWGWdxHe6KhAeCPfnSqKqQkjAy8yiaOFO/nl1bZH5Mad
	/hsg2rpa8yLBM2Y7rW/3ng0FB/rm1sO87b7/nXikkRb15/K3IdwzY9+lC7iM9HvmUvZW
	Ny/iO4cmDvN7ZRXgR2cniKC1YoL3hyEPSwQD+2Nf9vrtyz2//FWe81NDneh32MsueFd0
	47Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YPGS8pmPWqPiRr6eCMjgXfrcX8nfyTImRcuGJEKAeXU=;
	b=Mrtc7KEyAAltF4iofOLR0azDA0ZoE+Ow/fNvkaK55U1wmIx+3hAm+FT8fLtnSbrdG/
	9SH1e5F51xwtG5vCbwuNDxkvDA3dJIMK/YntMJ7fEfCJeLDBSzQYwd823gg9WNj8Enw9
	Wib/8uP3H6qCxIWhg82Zx7pv/bLvhRAOFGRJHVEesqg/ftHrI+pzha1JaiA4gJyZJJOe
	r3tu83yXb3VUN45iON3D3TVsMNKF6m7+rmYSH1i7dtwgt1po9sfVx/nZMoR6laNMmcUt
	Eop+0eGbFPrYuC9ogZN5b/JLn8qDEIS+nM6dVRjx5DaNDC0hK3wWdt8cxFKvFN7z8xbs
	e7Pw==
X-Gm-Message-State: APzg51CBw1G+hMXKQQRcvBU6C4zgATzprrJeG4quwUL88K0DIkPgGeYb
	eLFWs55rNV8uTW/2Aa4U2CV5sb/8
X-Google-Smtp-Source: ANB0VdZgamsmd696RJNZ733IhdyMOoux1v7Uiga93TXwOhdtsRXBF4qqLBxK04/hgDVYE0IQr3ZmTQ==
X-Received: by 2002:a1c:d702:: with SMTP id
	o2-v6mr4866556wmg.115.1536316134652; 
	Fri, 07 Sep 2018 03:28:54 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	y5-v6sm7089067wrd.5.2018.09.07.03.28.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 07 Sep 2018 03:28:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2018 12:28:42 +0200
Message-Id: <20180907102842.24197-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH] blueman: rdepend on packagegroup-tools-bluetooth instead of bluez5-obex
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
X-List-Received-Date: Fri, 07 Sep 2018 10:28:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Have a better out-of-the-box experience

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-connectivity/blueman/blueman_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/blueman/blueman_git.bb b/meta-oe/recipes-connectivity/blueman/blueman_git.bb
index f479386c1..947db7836 100644
--- a/meta-oe/recipes-connectivity/blueman/blueman_git.bb
+++ b/meta-oe/recipes-connectivity/blueman/blueman_git.bb
@@ -25,7 +25,7 @@ SYSTEMD_AUTO_ENABLE_${PN} = "disable"
 RRECOMENDS_${PN} += "adwaita-icon-theme"
 RDEPENDS_${PN} += " \
     python3-dbus \
-    bluez5-obex \
+    packagegroup-tools-bluetooth \
 "
 
 PACKAGECONFIG[thunar] = "--enable-thunar-sendto,--disable-thunar-sendto,,thunar"
-- 
2.14.4


