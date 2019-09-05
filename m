Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id E74677F2EA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 15:19:31 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id y4so2353363lfe.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2019 08:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=EqcLyNUt1nFaB9ls3ZfTQrZiQP/rjhjXfi6pGHeuARo=;
	b=EcFDTDyoOQA1JiNLv3Zn5U0J+40vd4tHqka6Sv4qdt0EEXjF/5Wpg2mIK3NklyyJsJ
	XKRhvxvNj6I+N8UMcXevJkJP4r38XBdADa7eJi/agNcKabIl6l7HG48OBy5/ps3JcFkH
	uagvCoUyb4yMDZ7NBcomi6/tj3IYSEJVoEiSBljudSTlp5cqtAVkzvilYCZ4yGSLAp+x
	ZaOD5VEiEHftTf+7osknyGeK21nnfWivHr+6829ckQTE0n4ISRVBKx6OjlYiZoAecuHm
	zbrwmAq4CTfnexoOA0BPrLRzkVUvyhqdjcZPgzox/BNGLug1htjOrzHGdy4sFXFhBSnt
	sslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EqcLyNUt1nFaB9ls3ZfTQrZiQP/rjhjXfi6pGHeuARo=;
	b=jUgGNB48GRwjhvfPinIXRSErM+UI0CdQXIh4REtqP6aWLmKdJctWLy2feBSChMcYFZ
	hnhDI60FMfKfmU/URUPBRAIlWvvI9MbP2SFbc0RoZO3v1kCRRJH0kNNhR5MvxJxt1pwo
	AfxH4HMBnmVwFMXThOcEUVXDYJD8G42p8pW9oXATlURgIhbNGIlP2YnrduO/uRnkecb5
	WUUn1PQs2bTDKureuFqfvzABZUBXR93aaorgd+PPG0FqBbgLVyXCYtHdvh5ATNiHE/b8
	6AXgozKyT374GyKMjFW0gmTJAj2EelihGH3zvSdSaKdw+aX2cAU5Mqnohu+fFB4UevoY
	mR4A==
X-Gm-Message-State: APjAAAUNXuiNl094ZPNfBO4AXU7ClUL5lzoG17kuvNC2M9Gs/NjcAzVa
	EnujgZxo2CXlYJ5kuaP2JKdr0ldxuVk=
X-Google-Smtp-Source: APXvYqxmqxg8IPhVlTugwJ/t0vL8333CibMo6S+2qDei9415dWl8w1mEMITZGh8SJvTkRuoG/8Bnzg==
X-Received: by 2002:ac2:4352:: with SMTP id o18mr2832769lfl.164.1567696771979; 
	Thu, 05 Sep 2019 08:19:31 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id x13sm494986lfc.80.2019.09.05.08.19.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 08:19:31 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Sep 2019 17:19:23 +0200
Message-Id: <20190905151923.25384-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [PATCH][meta-oe] nano: update to 4.4
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
X-List-Received-Date: Thu, 05 Sep 2019 15:19:32 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta-oe/recipes-support/nano/{nano_4.3.bb => nano_4.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/nano/{nano_4.3.bb => nano_4.4.bb} (79%)

diff --git a/meta-oe/recipes-support/nano/nano_4.3.bb b/meta-oe/recipes-support/nano/nano_4.4.bb
similarity index 79%
rename from meta-oe/recipes-support/nano/nano_4.3.bb
rename to meta-oe/recipes-support/nano/nano_4.4.bb
index aa773bf75..18121be06 100644
--- a/meta-oe/recipes-support/nano/nano_4.3.bb
+++ b/meta-oe/recipes-support/nano/nano_4.4.bb
@@ -12,8 +12,8 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[md5sum] = "23f4f7b5c0d1f04ad555960dc294f2b8"
-SRC_URI[sha256sum] = "00d3ad1a287a85b4bf83e5f06cedd0a9f880413682bebd52b4b1e2af8cfc0d81"
+SRC_URI[md5sum] = "9650dd3eb0adbab6aaa748a6f1398ccb"
+SRC_URI[sha256sum] = "2af222e0354848ffaa3af31b5cd0a77917e9cb7742cd073d762f3c32f0f582c7"
 
 inherit autotools gettext pkgconfig
 
-- 
2.17.1


