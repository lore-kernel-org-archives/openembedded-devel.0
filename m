Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 657036CD1B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 14:45:48 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so2860572eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bwKp/7ZMKK5K9Mu6LKY0vEvIHddNdOFd/xmAGJrY72k=;
	b=eUGBG8C4T40zdg8YVlaMRR1Royg00+pC17hwQC6vRJNJ1jNmH3rsqaUA7WueY7bS37
	UWx3ETAqUnxFZ42vW4OkloIlTOw0qZroyZmgGlZ1wTPqGoHq7u0D5ARxUia4TgJTaQv3
	FYo+0J3HGEeGNwN6/7ma5uOONEANubz2I2vVB+TuVu7YQdeL3cw5K2e1IrYYsXEZj9uE
	62EjrKxyL4jJsmCRcsIFOgQjXQZP+pmJH1czV0BysY3s3fzd7alZnfm8ADWiik7ni+lj
	R4+gHY3A0Zji11uy9JcDyW5+nrtO24p4BymAbYpswPMpAC4EQo5cKJg088YXJZq+ozQ/
	M9pg==
X-Received: by 10.15.94.201 with SMTP id bb49mr48324116eeb.23.1381675549721;
	Sun, 13 Oct 2013 07:45:49 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	z12sm141171327eev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 07:45:49 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 16:45:42 +0200
Message-Id: <1381675543-3306-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] formfactor: add simpad configuration
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
X-List-Received-Date: Sun, 13 Oct 2013 14:45:49 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/formfactor/files/simpad/machconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100755 recipes-bsp/formfactor/files/simpad/machconfig

diff --git a/recipes-bsp/formfactor/files/simpad/machconfig b/recipes-bsp/formfactor/files/simpad/machconfig
new file mode 100755
index 0000000..0e94cda
--- /dev/null
+++ b/recipes-bsp/formfactor/files/simpad/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=0
+HAVE_KEYBOARD_LANDSCAPE=1
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=800
+DISPLAY_WIDTH_MM=171
+DISPLAY_HEIGHT_PIXELS=600
+DISPLAY_HEIGHT_MM=128
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=119
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
-- 
1.8.1.5


