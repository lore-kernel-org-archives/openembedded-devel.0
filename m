Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E2278783DE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2018 07:12:16 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z6-v6so4593906wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jul 2018 00:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8rMNEjktulWvO/lv9WCkiU4SFy+Uz2tIcamvb536fgI=;
	b=lwIeM3J1gm49sehr0PDVEWfZl34+l6ZZMeVMPfTDFwHriozXjdBpQ0W0zDWnJKgwYT
	8lwZnEeHhUN3XSrLh0vpDhSwxEWCSaJkHY3oiTLs0TV36hso3Nc4aS1ExPTTNqpdAnxc
	tJI6UmeiN5489cuhGh2WoIp2rB4T3YJg2xUL8FnBtZLfJBvRhXKUX+jWRGyTCUiy3bHu
	WfetezhFeuX780NvEMBeh/OZUv5+1X1b//xGtH+X3Z6wsQJ5TkT6d57IO8qPSyovOaew
	c0bB3T241+mb2pN9PR8+5n8QY+aJtQQ2wp5+ypJyv4KU7251ApC5NkBhoxkdasidED7w
	OMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8rMNEjktulWvO/lv9WCkiU4SFy+Uz2tIcamvb536fgI=;
	b=UgQOy9AwYDkWz8KymGZe3sbTOLOqrdi+Jgs73yjjvh8hbUz6lJhwcXEsaSIbuzUucv
	r5jHwW+EtxGTvWKy2/SU61m9NpeI8X865m6O2RKN8hHOdemoiv5A7CkeDzHkHk4uYWNh
	zA9aOUmZPsx0iB4DsyMulNluY5AJ9w7614iI9aOLqVKgy0DUl+v5qEBt7Yw+EL7wVIjm
	Cx6CYqhJnVs68lwZRUmEKAVkE1/lycTk3Ec7MGI+pK9nB+ovj1AuXMpA6G3y/qAT1/I9
	0lPX7YLIbN9OV7WmEVeB0JY/5k0IQMsiAfFxG0KyUsAg4JuQ4aTuXKdtnIcfCEt8Ykvl
	jvpw==
X-Gm-Message-State: APt69E0HSn1XZvaVEffcEdhIUpl301jA7BnDLw8/f7hYtjixIPJFvuM6
	gy2gIWbznvVLcTxsVjIRT/o/xA==
X-Google-Smtp-Source: AAOMgpdFzkxcz5UY8RSthI2sbXWlaOXGLSdnO6vLxD9GFD5IQoUiKtM8HiErHrHMyjKLMhlRbQRJOg==
X-Received: by 2002:a1c:4983:: with SMTP id
	w125-v6mr2533075wma.68.1530861137364; 
	Fri, 06 Jul 2018 00:12:17 -0700 (PDT)
Received: from nb-lx-hgc-001.peiker-cee.de ([82.119.189.133])
	by smtp.gmail.com with ESMTPSA id
	o13-v6sm6034947wmc.33.2018.07.06.00.12.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 00:12:16 -0700 (PDT)
From: andreas.kling@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jul 2018 09:11:36 +0200
Message-Id: <20180706071136.21496-1-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.18.0
Cc: andreas.kling@gmail.com
Subject: [meta-oe][PATCH] wireless-regdb: update 2016.06.10.bb -> 2018.05.31.bb
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
X-List-Received-Date: Fri, 06 Jul 2018 07:12:17 -0000

From: Andy Kling <andreas.kling@peiker-cee.de>

regulatory db can now be loaded by kernel as firmware file.

Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
---
 ...ss-regdb_2016.06.10.bb => wireless-regdb_2018.05.31.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/wireless-regdb/{wireless-regdb_2016.06.10.bb => wireless-regdb_2018.05.31.bb} (64%)

diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
similarity index 64%
rename from meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
rename to meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
index 64e9401e7..c51439f3a 100644
--- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
+++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
@@ -5,16 +5,19 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "d282cce92b6e692e8673e2bd97adf33b"
-SRC_URI[sha256sum] = "cfedf1c3521b3c8f32602f25ed796e96e687c3441a00e7c050fedf7fd4f1b8b7"
+SRC_URI[md5sum] = "0cbbdc21186c76cf58aba01b03f3dc5b"
+SRC_URI[sha256sum] = "e1dfbc3b97771373077f430c3c05082fae883145b37db5b2cfd12c56676fbe7b"
 
 inherit bin_package
 
 do_install() {
     install -d -m0755 ${D}${libdir}/crda
     install -d -m0755 ${D}${sysconfdir}/wireless-regdb/pubkeys
+    install -d -m0755 ${D}${base_libdir}/firmware
     install -m 0644 regulatory.bin ${D}${libdir}/crda/regulatory.bin
     install -m 0644 sforshee.key.pub.pem ${D}${sysconfdir}/wireless-regdb/pubkeys/sforshee.key.pub.pem
+    install -m 0644 regulatory.db ${D}${base_libdir}/firmware/regulatory.db
+    install -m 0644 regulatory.db.p7s ${D}${base_libdir}/firmware/regulatory.db.p7s
 }
 
 RSUGGESTS_${PN} = "crda"
-- 
2.18.0


