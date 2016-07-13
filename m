Return-Path: <philip.balister@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id ED5AF6067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 18:43:04 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id y188so3679504ywf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 11:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=wUHIXIjlbwABGqyEjZCqND+qIQuwvoFtv5zZ93IxfF8=;
	b=ePYfvzICHTv8Te7zN5lgtWFri17DJN7KqeGvqAxO7Qic80mnbaYG3Hx2Qz3Y18dKMO
	NTn1JcYHnslSnCIeu+gicqetyeHbtdMLbLfn2WN1vj5GFHYJZ8xD3XrMauSF2vKxR6Td
	39EQpiFQ/Z4htsjbxpGFwmZ1uX8PNIRTD0X4guHNWsEKshJi6ofo17/S/EsaXj6rtJmt
	ZmE3MA0pMc0DINXzfKetnMgkYkSsSaOYHkOjfo5ZekQcG/GvCZhgmYhZuI2aipc0W6VN
	Jm9xbPfydUigavTmOHppkyqh2/wMrEEa63iqD+vBkNZ/lXg20urX5DDvsrM/CJRTSg7w
	vYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=wUHIXIjlbwABGqyEjZCqND+qIQuwvoFtv5zZ93IxfF8=;
	b=dBbvdq2wrqal4AS2MHnVT2K+O5nNPZi9G2Wqi6DNJJu2shgxFv4uO9njVdHaf9lbRQ
	xCp4w2/W1rLHniSCR6vfJ4atNhFdCeFEaVaumyXdb8XQXTj5ktjaYACWXs87YcafJlrg
	sHdkxp9ISAuvo05JEYMNrEKdzKNvVg9aiosoNX618GzooPJy9wBKl3sLSM9QMCMUsc3B
	D0lkUBLqLo+B8i2et9thMXlKaACy80E/Zu9KDEOD4g71wsLw0Y7N/Jdncv43DDej7s4p
	vQ1E7TYktsCCctHP/cdXfVG+S2JfWRqxNd8S4MKqPmdZt5e/WUD3tz5hd7nRGwMtKbPw
	OcXA==
X-Gm-Message-State: ALyK8tL2/m+kbSbVIE5Ji8tJsaA7c5X/EP0oGNv0F7K6qhv+7WlsgylgMJHpPLuv/0a3AA==
X-Received: by 10.37.204.74 with SMTP id l71mr6455852ybf.181.1468435384924;
	Wed, 13 Jul 2016 11:43:04 -0700 (PDT)
Received: from thuvia.localdomain (pool-71-171-10-138.ronkva.east.verizon.net.
	[71.171.10.138]) by smtp.gmail.com with ESMTPSA id
	b20sm1741379ywh.10.2016.07.13.11.43.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jul 2016 11:43:03 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jul 2016 14:42:54 -0400
Message-Id: <1468435374-24039-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.5.5
Subject: [meta-oe][PATCHv2] libsodium: Update to 1.0.10.
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
X-List-Received-Date: Wed, 13 Jul 2016 18:43:05 -0000

The LICENSE file checksum changed due to copyright year update. See:
https://github.com/jedisct1/libsodium/commit/78d07701229d94ce48c74048f47e378937582ba5#diff-9879d6db96fd29134fc802214163b95a

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb | 10 ++++++++++
 meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb  | 11 -----------
 2 files changed, 10 insertions(+), 11 deletions(-)
 create mode 100644 meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb
 delete mode 100644 meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb

diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb b/meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb
new file mode 100644
index 0000000..370f553
--- /dev/null
+++ b/meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb
@@ -0,0 +1,10 @@
+SUMMARY = "The Sodium crypto library"
+HOMEPAGE = "http://libsodium.org/"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2278eb2755b451372dde7ffeae8cde98"
+
+SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "ea89dcbbda0b2b6ff6a1c476231870dd"
+SRC_URI[sha256sum] = "71b786a96dd03693672b0ca3eb77f4fb08430df307051c0d45df5353d22bc4be"
+
+inherit autotools
diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb b/meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb
deleted file mode 100644
index a2eef4b..0000000
--- a/meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "The Sodium crypto library"
-HOMEPAGE = "http://libsodium.org/"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=092a09b78c3be486fac807435bf17b7a"
-
-SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "0a66b86fd3aab3fe4c858edcd2772760"
-SRC_URI[sha256sum] = "c0f191d2527852641e0a996b7b106d2e04cbc76ea50731b2d0babd3409301926"
-
-inherit autotools
-- 
2.5.5


