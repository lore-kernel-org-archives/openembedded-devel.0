Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 01D4D6CCC9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 22:15:23 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so3074562eek.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 15:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ccBWGXG9g3M0pDv97vnBv44XD4GYGVa/ARe1DiO1vOQ=;
	b=g2gy2vSwqHy0bMop/sn595xbrqidMckWhM2F2Ht1Gw9EQRTKmtdXl/RElfSpbPDWMl
	DhRJtQh8L1++rMrkvCF9SZvAHnXvYyaYlkH+/3DxLPHym4d0/cac+HDx+29JYPXVHrtx
	0GWULlgZacoMXjy9JGXe63o1uExt46ySTJpRlWpQRistbwkQQWjY8eo25sMKP53p9eJL
	0TtNdPyhvjxvEIkdYuiKeqRa+Ls7hPTdpe9yXSydrSSQz11tTRpbgiLIwAXibFtGqeaA
	Yp7d8q+YXlq1d/OCArfZEe0cR84hXgmVs+dH4gMlLQge1lxvu8m/zANZS21Shyb1m7ce
	VjUw==
X-Received: by 10.14.241.74 with SMTP id f50mr51257491eer.29.1381702525057;
	Sun, 13 Oct 2013 15:15:25 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	a6sm145394248eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 15:15:24 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 00:15:19 +0200
Message-Id: <1381702519-5069-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] zaurus.inc: append 'qvga' to MACHINE_FEATURES for collie and poodle
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
X-List-Received-Date: Sun, 13 Oct 2013 22:15:24 -0000

Used in oe-core in:
recipes-sato/gtk-engines/gtk-sato-engine_git.bb:
recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb:

EXTRA_OECONF adds '--with-mode=qvga'

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index a4fec21..a191fb8 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -97,8 +97,10 @@ CMDLINE_tosa = "console=ttyS0,115200n8 console=tty1"
 
 MACHINE_FEATURES = "apm alsa pcmcia irda usbgadget keyboard touchscreen screen vfat ext2"
 MACHINE_FEATURES_append_akita = " usbhost"
+MACHINE_FEATURES_append_collie  = " qvga"
+MACHINE_FEATURES_append_poodle  = " qvga"
 MACHINE_FEATURES_append_spitz = " usbhost"
-MACHINE_FEATURES_append_tosa  = " usbhost wifi "
+MACHINE_FEATURES_append_tosa  = " usbhost wifi"
 
 MACHINE_EXTRA_RDEPENDS = "zaurusd mtd-utils mtd-utils-jffs2 mtd-utils-ubifs nandlogical"
 MACHINE_EXTRA_RDEPENDS_collie = "zaurusd mtd-utils mtd-utils-jffs2 mtd-utils-ubifs"
-- 
1.8.1.5


