Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id E480C6AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 06:23:18 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id c85so130668834wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2016 22:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=z8KvxfisZ7RP8rq7+QKP3EzeoYiVw6ktDpWyroEs7XE=;
	b=1OVweM9G//snHE5ZB0id+2m9bcTsRhFPiGQR2dFA0uqiLDWESVq1jzfvZB/wdIrjzA
	2UnAJXVCsVivhK+Qq6amQu2tQovrkSHzPqHRyGKeyf8WWyENOfOtdu/B8SF0HMm4vqD+
	ywaleGR1V1NHzxKBbfUHeoZ2r7DimTV+eUQLVoLv641Ef+N4OcqN57FLRyS7qDxfdG+n
	CS+TQPObI6gfxzQ1qT1k6O4DgzgqtKX253RxaW8tXQXYE+Xm9KVvE3H9dqpL1Nq7XHU/
	1GUQDH8BF5eFKUp46QmiAJMuZFVfkVSRrX4HT0pb2f0gwfCnWQFuPdX0WHwjIGFXBYJB
	jphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=z8KvxfisZ7RP8rq7+QKP3EzeoYiVw6ktDpWyroEs7XE=;
	b=n6vuaph669rNNCmIxXhW9h3AdcnodvdDjimKbKSpCCq/Jhx7hIgs1WtQD/3qvSnC5p
	TOwo08alNn4KDqvSw81MMSeKRyU1hf2LY8i6cpCyTYI62yDG2t2ykfuS9MgMpqNg4H7U
	8Op5Nl01HTaWvLqe7vphy/nCmmVumjJu47XZNY52Y6v+rRcSA6X8ETjE/14GU21N6n6Y
	AlUsyoLaFAUiHYmnoHr4pkBHg1+F6jObb5rw1KsY6XVybFWp5pPmEOzoBHA45kVwHZtA
	DrkSW/JLHMyytx8N82284hTn6PeS8YQoexS/8wWhad8xUFkUh4+oREAwBlGU1luh/CIh
	yVjQ==
X-Gm-Message-State: AIkVDXLG3zVvF3y5p2715ykaZazptlAn4MiwBx53hB2pGj6fxNP1eNKCx/bpsaFdsB5rzrvu
X-Received: by 10.28.167.199 with SMTP id q190mr44897875wme.15.1483078999635; 
	Thu, 29 Dec 2016 22:23:19 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	c187sm68461911wmd.13.2016.12.29.22.23.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Dec 2016 22:23:18 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Dec 2016 07:22:53 +0100
Message-Id: <1483078973-7492-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH v2] tcpreplay: upgrade to 4.1.2
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
X-List-Received-Date: Fri, 30 Dec 2016 06:23:19 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../tcpreplay/{tcpreplay_4.1.1.bb => tcpreplay_4.1.2.bb}          | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.1.1.bb => tcpreplay_4.1.2.bb} (69%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.1.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.2.bb
similarity index 69%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.1.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.2.bb
index 389d61b..6ee9d73 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.1.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.2.bb
@@ -6,10 +6,10 @@ SECTION = "net"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=890b830b22fd632e9ffd996df20338f8"
 
-SRC_URI = "http://prdownloads.sourceforge.net/tcpreplay/${PV}/tcpreplay-${PV}.tar.gz \
-           "
-SRC_URI[md5sum] = "80394c33fe697b53b69eac9bb0968ae9"
-SRC_URI[sha256sum] = "61b916ef91049cad2a9ddc8de6f5e3e3cc5d9998dbb644dc91cf3a798497ffe4"
+SRC_URI = "http://prdownloads.sourceforge.net/tcpreplay/${PV}/tcpreplay-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "3105b10b07dbc0b07ce2da07a2368359"
+SRC_URI[sha256sum] = "da483347e83a9b5df0e0dbb0f822a2d37236e79dda35f4bc4e6684fa827f25ea"
 
 DEPENDS = "libpcap"
 
-- 
2.7.4


