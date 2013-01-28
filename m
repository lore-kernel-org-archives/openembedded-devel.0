Received: from mail-gh0-f174.google.com ([209.85.160.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tzmqm-00075v-QS
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 12:26:09 +0100
Received: by mail-gh0-f174.google.com with SMTP id g15so363316ghb.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 03:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=i1y1x5y6YT96GDWchZ9GocRi+BwAiZeMH2WukX2SpH0=;
	b=KIfFEsNWOCLXc1QmqczNzHDy6GstmcCQ/zhoLkPdh7ToUgcRghohAy1ORzQRbBrnfu
	07qp1NhN3fzk1G153MqV5DSrHUXLeC9sw9tOroweiKtIK+CKa2b+gNR9QEf+vnMdKzYD
	+X98jhRA2M+jOuzYA15DmorU2Lo+1DW0oy7i8jrOAMwDMusOwVb5ejCUYz/qVWszHu85
	nZB4gR6GV0LRipJWJza1YWCRiGwFHt8fncyniJdSc8vDYyeGyamaXZSoxfE4GDZf0dy1
	syWMP6UKrRR2wURlgUrEsI8UfkMxn8PPYRaQfWT/oP9nSkCaDQgLvs0+5vX3jUS1BGWm
	dH8g==
X-Received: by 10.236.123.109 with SMTP id u73mr12875287yhh.108.1359371430083; 
	Mon, 28 Jan 2013 03:10:30 -0800 (PST)
Received: from localhost.localdomain ([177.35.66.48])
	by mx.google.com with ESMTPS id j13sm8430403ani.19.2013.01.28.03.10.24
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 03:10:25 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jan 2013 09:10:13 -0200
Message-Id: <1359371413-12437-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] xf86-video-geode: Update to 2.11.14
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 11:26:09 -0000

Change-Id: Ia42af02f16e22f6d1ecd9e437dc875c8e267a84a
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xorg-driver/xf86-video-geode_2.11.12.bb        |   12 ------------
 .../xorg-driver/xf86-video-geode_2.11.14.bb        |   12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.14.bb

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
deleted file mode 100644
index aa1dc29..0000000
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require recipes-graphics/xorg-driver/xorg-driver-video.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=f8ad89d9d9a024f19d7dcc5acb044a42"
-
-DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "a99c521db731c2f1df309057a8465e4c"
-SRC_URI[sha256sum] = "28d845d727d99bfa4d4b93c5486ec01b72eb222e0910a766089db1103b1c2d92"
-
-COMPATIBLE_HOST = "i.86.*-linux"
-
-RDEPENDS_${PN} += "xserver-xorg-module-exa"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.14.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.14.bb
new file mode 100644
index 0000000..fdc49b2
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.14.bb
@@ -0,0 +1,12 @@
+require recipes-graphics/xorg-driver/xorg-driver-video.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=e7f3e39474aeea5af381a8e103dafc36"
+
+DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "c9a4e1c5438240e5bdce332f92df9163"
+SRC_URI[sha256sum] = "4c750b46c932934faa008919922f5ac8a572afcfe265ac8d7c203b8167a0cfcc"
+
+COMPATIBLE_HOST = "i.86.*-linux"
+
+RDEPENDS_${PN} += "xserver-xorg-module-exa"
-- 
1.7.2.5



