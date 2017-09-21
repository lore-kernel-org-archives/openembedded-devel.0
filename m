Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id A5F4C60602
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 09:57:32 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g50so2848250wra.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 02:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AEBv1K0NGvknajIqwDA7oRI2O7JnIljbtoXZYdsLRc4=;
	b=ve5SLKIwoSEVojp4Oi6/mTZFT3TRSfrWO8lSjEecqKoCaKPszkI+rnkUJaopNBz46O
	EF3WgjWVVfkDHwNC+INWAR6poJE/rJ5oHodAkm7KJqzsdxY4hOlP+UgBO5Yxt02UdxWp
	5rPFACs7LCbJVcgLmXbAAihx2Vi7tMvXTQqv/BHtvcwOPKA2HmCV5X8YFkCUw1rKc5KV
	icWFyNsr796qxYjBjm8qL5s+CFYNu2MHp3D3MEGye5eSUQ8k8ZcrZb076XTSaP39+oNl
	xdb60fJTLLNqjKvIhg1HwcYKyAzpUQJ2Y17rIMf79QkW0AaoDsLFmBaMErnh5gL8272x
	20EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AEBv1K0NGvknajIqwDA7oRI2O7JnIljbtoXZYdsLRc4=;
	b=H8e/VjjcEhAM0fmvBGe46JtfxQbnyjeiBRZIQAwS2bThWOP0a1MDmBM7p9J2zUdLgT
	Z3BnpNj+macsgqy6PYnUawMa8fJJ73c+NAzMmqRYxMmOxV3B1j+VVjDoGOeqREMNmTqT
	7fcf0tF/qiaEC6F6yilWN3DZvyDt6Kpyc4wYdZKrxva+vXUGSi2/dN86SHeWC1jGHMQd
	OtBH8gNJrT05YnbjxxksZcx3a9KheiMjJ7b0UUU/h6r/89BRrMGBCG1nI5TGCwpeNOD3
	oztCWuU7f0cEGcUXABTTH7ysDiVu0f1YW3p2lW4i9LzwhF1DRk8rkuYhg+73Cp+uRc4+
	POmw==
X-Gm-Message-State: AHPjjUjLXgvrd6fKjNtsud0JduDnmci5cA9FakNiMmsn3xEtG58fXeMU
	ctJZPw4sPxb/WpH93uZKJJaNXQ==
X-Google-Smtp-Source: AOwi7QBSk+eYmuFjswgrz1vfUGwiXI9hP+j19lyu4/C5iaJuTTsituGxkdt1vDFTA6bRHES5ABBdSw==
X-Received: by 10.223.180.82 with SMTP id v18mr1534204wrd.61.1505987853014;
	Thu, 21 Sep 2017 02:57:33 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 12sm1519610wmn.38.2017.09.21.02.57.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Sep 2017 02:57:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Sep 2017 12:00:00 +0200
Message-Id: <20170921100000.19981-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170921100000.19981-1-Martin.Jansa@gmail.com>
References: <20170921100000.19981-1-Martin.Jansa@gmail.com>
Subject: [morty][PATCH 2/2] opensaf: fix QA Issue
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
X-List-Received-Date: Thu, 21 Sep 2017 09:57:33 -0000

From: "dengke.du@windriver.com" <dengke.du@windriver.com>

Move the do_sysvinit_install contents to do_install_append.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
index da9c10520..6ceb225e9 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
@@ -53,6 +53,11 @@ do_install_append() {
     install -m 0644 ${B}/osaf/services/infrastructure/nid/config/opensafd.service \
         ${D}${systemd_unitdir}/system
     install -m 0644 ${B}/contrib/plmc/config/*.service ${D}/${systemd_unitdir}/system
+
+    if [ ! -d "${D}${sysconfdir}/init.d" ]; then
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${B}/osaf/services/infrastructure/nid/scripts/opensafd ${D}${sysconfdir}/init.d/
+    fi
 }
 
 FILES_${PN} += "${localstatedir}/run ${systemd_unitdir}/system/*.service"
@@ -62,12 +67,3 @@ INSANE_SKIP_${PN} = "dev-so"
 
 RDEPENDS_${PN} += "bash python"
 
-do_sysvinit_install() {
-    if [ ! -d "${D}${sysconfdir}/init.d" ]; then
-       install -d ${D}${sysconfdir}/init.d
-       install -m 0755 ${B}/osaf/services/infrastructure/nid/scripts/opensafd ${D}${sysconfdir}/init.d/
-    fi
-}
-
-addtask sysvinit_install after do_install before do_package
-
-- 
2.14.1


