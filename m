Return-Path: <net147@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4E8DC771BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Jun 2016 15:07:28 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id f144so14170249pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Jun 2016 08:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qcFgYJxiDDERKyvtBJ1N9UJ2FTsMP+ytJ2PNJREmZ0U=;
	b=GJqFfY51oGNdbK9uigfi6kc1DU/h7kAPwZBJSUIed5+3Lv30fd/9GL+Gy0tvzWNNLx
	CD4IaXj7X6yBOOkPi9DIO2inzt/jpdVCt1rz1dQAxKGUpW8yqkcV7mj3HzVcXbU13T2v
	5fzE5wCdWGVYXiuDEocpoFHOxJLG/U4h0/V6xpJGKwUfo7+e64Ow5vVA2ml64TRBSz1E
	TYVg/IMtJ7bxypYYykYAx+OrxQwg/wXQyzVd1BVoBgwm69tAVjTw8ZHJv4jGRzcmnFPa
	wuXJ1IuT4A3L4a+tIj3vPM79a7zy3+Ah4bnlN1c+dih2WWhwSblMHyebgmuKPpRkyzNS
	hzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qcFgYJxiDDERKyvtBJ1N9UJ2FTsMP+ytJ2PNJREmZ0U=;
	b=lD+9YePCD2Cw97ReNe7oV1QzmI2RH9NPuEVwPd3uLvxLQ6gJaJd5X7vz/h0mw2J7+Y
	se9RETadUqgvsz6/J8nQioMG2ZALz9MWWSjx6iQD7z2ssGGnruJm7MGFk6CKoSfA/6Os
	Fv8QyZbN/g6OLvzdgHiODerOLuutzQdA5jSx40CGcoLc7IXbD6WrLHuKL5ilCMPTpo+S
	kVzUXqNjj0g2tgVbtYqsrks3xVD/lwTBy4HXcQ9kfrs9R0OeGaGsB0KRcxtKW3i371Yk
	fuEUCsn/QeRHjPlwtaY/HGw95rOmvJQxa+kzl/wAz+TcufNHxme7X8v0bxH+4uqKG/Bw
	SC7w==
X-Gm-Message-State: ALyK8tJHRhUAyagpytJqnEI0drKML7/J3Pfe1oavJ0LXYHLIkcCg7Zk7YzJFS3fioWKYmw==
X-Received: by 10.98.79.73 with SMTP id d70mr13070459pfb.120.1465052849322;
	Sat, 04 Jun 2016 08:07:29 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	a17sm15994118pfa.70.2016.06.04.08.07.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Jun 2016 08:07:28 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Jun 2016 01:06:57 +1000
Message-Id: <20160604150657.5175-1-net147@gmail.com>
X-Mailer: git-send-email 2.8.3
Subject: [meta-oe][PATCH] libftdi: update to 1.3
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
X-List-Received-Date: Sat, 04 Jun 2016 15:07:29 -0000

COPYING.LIB license checksum has changed to fix the FSF address.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-support/libftdi/{libftdi_1.2.bb => libftdi_1.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libftdi/{libftdi_1.2.bb => libftdi_1.3.bb} (79%)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.2.bb b/meta-oe/recipes-support/libftdi/libftdi_1.3.bb
similarity index 79%
rename from meta-oe/recipes-support/libftdi/libftdi_1.2.bb
rename to meta-oe/recipes-support/libftdi/libftdi_1.3.bb
index 9b290fb..5eee0db 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.2.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.3.bb
@@ -7,15 +7,15 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM= "\
     file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe \
-    file://COPYING.LIB;md5=db979804f025cf55aabec7129cb671ed \
+    file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
 "
 
 DEPENDS = "libusb1"
 
 SRC_URI = "http://www.intra2net.com/en/developer/${BPN}/download/${BPN}1-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "89dff802d89c4c0d55d8b4665fd52d0b"
-SRC_URI[sha256sum] = "a6ea795c829219015eb372b03008351cee3fb39f684bff3bf8a4620b558488d6"
+SRC_URI[md5sum] = "156cdf40cece9f8a3ce1582db59a502a"
+SRC_URI[sha256sum] = "9a8c95c94bfbcf36584a0a58a6e2003d9b133213d9202b76aec76302ffaa81f4"
 
 S = "${WORKDIR}/${BPN}1-${PV}"
 
-- 
2.8.3


