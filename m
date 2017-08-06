Return-Path: <net147@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8E5B2602D9
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Aug 2017 07:12:29 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id c28so21827779pfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Aug 2017 00:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=610zUSWb7Ey/JOyacrXNxTYN3e8ce8qgq0Mu9XMMA68=;
	b=F/2j9+m4Phh/cN4wBzKBzh/gPLo+Ce+hKEkivDDMfohPQwvzXV8j+8KAj7z1iOY9z5
	TqC1Gm51MgPmPKRKywfJitTQdWcOWLSM0ffKQwMWbuMUNoKyo//LMv9rp66dn6crzghB
	7gTRV2Vf1zOGsg5F7xKGW5jpeR8TibxP0NKoayKOq9RDuKzSjAl3vVv0728KpmMUMcml
	El4YiwFyIqCGyTse9qc7jxcKp+LjAcnnATamldiIxxygzwRYjzgSuQn0/LuqBY+79sbe
	PSSAwDHGMzIgOWQ/5Epdoa3VfttIODbbiYSYIJf+8tL7vXvW+G734up/pVMB27G7HjCY
	GkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=610zUSWb7Ey/JOyacrXNxTYN3e8ce8qgq0Mu9XMMA68=;
	b=CY9VVaqKpj9WEPmTjlrvjLQN2mrVHsPCjgk1ifr0dG7ASLyF7EIGfHHMVzmz529e/7
	EXEvDbBKzda97Zxy8/EQcNlA49u+NEIvtQLf5r7gt9cCG6yxWPOlLcfJD0w2IJT2kyJb
	gDg6/dOx+OEcm0wh7x1OKLT/a2tsvbtiMXt/YlemwHk9RR3ossKRLWmAGp8rcRpn+MR6
	Q/PjlYA7NTP4OYyoU552pqLvikEjXatuvNTRpC+jBqWKyLaetFKbi9ZDki6A3q2iEuJg
	nRIqOn60bIBewWNsUcUJhbBdbzsZnBgji3mafrnS9aIiKylTjBRwT07pY1NoHXhriS+v
	J1Gw==
X-Gm-Message-State: AIVw11118xrw7nY1dwTr9n0Gc44k6J2TK7PVef1Mb9Im9xLOzoYHLqnd
	P4P62bJZw+G34Q==
X-Received: by 10.99.116.74 with SMTP id e10mr7412155pgn.179.1502003551057;
	Sun, 06 Aug 2017 00:12:31 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	k85sm10664325pfj.5.2017.08.06.00.12.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 06 Aug 2017 00:12:30 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Aug 2017 17:13:32 +1000
Message-Id: <20170806071332.17253-1-net147@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-oe][PATCH] libcyusbserial: new recipe
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
X-List-Received-Date: Sun, 06 Aug 2017 07:12:30 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../libcyusbserial/libcyusbserial_git.bb               | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb

diff --git a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
new file mode 100644
index 000000000..74b5e21e2
--- /dev/null
+++ b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Enable userspace control of Cypress USB-Serial bridge devices"
+HOMEPAGE = "https://github.com/cyrozap/libcyusbserial"
+BUGTRACKER = "https://github.com/cyrozap/libcyusbserial/issues"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER.txt;md5=4fbd65380cdd255951079008b364516c"
+DEPENDS = "libusb udev"
+
+PV = "1.0.0+git${SRCPV}"
+
+SRCREV = "655e2d544183d094f0e2d119c7e0c6206a0ddb3f"
+SRC_URI = "git://github.com/cyrozap/${BPN}.git"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+PACKAGES =+ "${PN}-utils"
+FILES_${PN}-utils = "${bindir}/*"
-- 
2.13.2


