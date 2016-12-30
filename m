Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6A4926059F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 06:28:36 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id c85so130723846wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2016 22:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=KauKpitxO54nPS376lfKqOSfiO8S4Oi97xHrxhmEK8c=;
	b=lRujCF7qXyhXjpnhHx/aO0AdmFVwIpASmFTrEprhgNKSeAypOJKvWT5STHnCX9cuPa
	/lpZYRlqm8TFelTIr80ecY/nbBZ0WhAL87BKmL9DbZdiX9KQliVVd0laFbZ+TUP62jcS
	RrgzDmJm+S1k1lIJCIdqZEnn6VZyRfXSHvU4seF9WKlhBFtcWZuiaMgmep34BEc4XQNc
	vVcvf417uM9TyVqhbFi6sdjhRe+gLcvUZMDV51pqWMt5WFzgGGNc7QigKl/Dik+cVy83
	2nPslQBR+9Z5c/jOrBqzPk3rd5LswxKCLCEa3P3IqCKm6tHLI+frvFYQaHBLiyOHJopc
	3HpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KauKpitxO54nPS376lfKqOSfiO8S4Oi97xHrxhmEK8c=;
	b=CSQ2sPCv0iqzVEI7GXXG6yMZzU0TmYRLU9TCCSThkETDYcKglqIP589cHSteZ90/64
	FuiH08EU0qHn5OFzLp58sVqTyt4IztGEdyDAgVQaWWi1pwmh/0A1kqJE7hgBoqu9hGow
	XTN16BsIGU+0DnCB5j4zgJg2Qx8BoDV9c2oo+gaxrTh7TgoYAprWGJdLy2qCUKqie62l
	tL6o/aC0uteYNw2/oviNg+4CCn9p5bqzkOyoAn2VbAmoU5ZW3LA10QOzZNuFrqITx2YR
	chgWHSv5fHJaQDk0JSXKeto102eHtOQeruFg0ub6f2ojB8LTVStomDsSUtkYgSCnNl9j
	IKKQ==
X-Gm-Message-State: AIkVDXILp0zDuss6UYV5fGvmT8j6VK93y7Fd18UAolw74h2ScjZwAF8AXPh5hVQs/Hn45uzv
X-Received: by 10.28.166.20 with SMTP id p20mr41570218wme.87.1483079318035;
	Thu, 29 Dec 2016 22:28:38 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	w79sm68526724wmw.0.2016.12.29.22.28.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Dec 2016 22:28:37 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Dec 2016 07:28:04 +0100
Message-Id: <1483079284-8141-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] wireshark: update to 2.2.3
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
X-List-Received-Date: Fri, 30 Dec 2016 06:28:37 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../wireshark/{wireshark_2.2.1.bb => wireshark_2.2.3.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.1.bb => wireshark_2.2.3.bb} (93%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.3.bb
similarity index 93%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.3.bb
index a8f61fe..1bf98b0 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.3.bb
@@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
 
 DEPENDS = "pcre expat glib-2.0"
 
-SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
+SRC_URI = "https://2.na.dl.wireshark.org/src/${BP}.tar.bz2"
 
 PE = "1"
-SRC_URI[md5sum] = "49a1023a69ac108ca089d750eee50e37"
-SRC_URI[sha256sum] = "900e22af04c8b35e0d02a25a360ab1fb7cfe5ac18fc48a9afd75a7103e569149"
+SRC_URI[md5sum] = "68e201e06873c67cb7544d27991e79bf"
+SRC_URI[sha256sum] = "97bac89e88892054a5848a9f7e0c36aa399a2008900829b078e29cab0ddd593b"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


