Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id ED0AA6CD1B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 14:45:49 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so2790814eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 07:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aSavPGr1bNWc08yojtMHpkPwzcjzvYmaQD60I7zzcAQ=;
	b=FwQaw2vyinsJFWNMXv5jHIJSI0UmhvFdsJXZ1LADDNuSboWgGz78i1RmZ/10vjJVaE
	SamtCKDexa5nL/FM5deA3WV3+x/GE7Dm7xIA/z2lZ2cu3x8bj9ZqFD36gGv/a/024M0Z
	QlTKXWSdcwHwZXE5oYRyuUBxp5VKqe0HT1b0nPRInW2gwDGV3fFoEvMxcWbLHgEir1oQ
	nZCAD6hUUXzKRQmitATZZ3bqNSufVb8YowkRcTitZLEeJhfdJPf9m5xOkict0jRDqnua
	JN/7j7Hj0wLy+5D8pM6ynuNipAunZGq7dtGDyO/SW9kyrWT/7i6NNxHYHd/6qyF/p4l8
	xGLg==
X-Received: by 10.14.208.194 with SMTP id q42mr47836491eeo.31.1381675551516;
	Sun, 13 Oct 2013 07:45:51 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	z12sm141171327eev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 07:45:51 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 16:45:43 +0200
Message-Id: <1381675543-3306-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1381675543-3306-1-git-send-email-andrea.adami@gmail.com>
References: <1381675543-3306-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH] formfactor: add config for IPAQ rx1950 and rx3000
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
X-List-Received-Date: Sun, 13 Oct 2013 14:45:50 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/formfactor/files/rx1950/machconfig | 15 +++++++++++++++
 recipes-bsp/formfactor/files/rx3000/machconfig | 15 +++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100755 recipes-bsp/formfactor/files/rx1950/machconfig
 create mode 100755 recipes-bsp/formfactor/files/rx3000/machconfig

diff --git a/recipes-bsp/formfactor/files/rx1950/machconfig b/recipes-bsp/formfactor/files/rx1950/machconfig
new file mode 100755
index 0000000..dab76db
--- /dev/null
+++ b/recipes-bsp/formfactor/files/rx1950/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=240
+DISPLAY_WIDTH_MM=57
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=76
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=105
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/rx3000/machconfig b/recipes-bsp/formfactor/files/rx3000/machconfig
new file mode 100755
index 0000000..dab76db
--- /dev/null
+++ b/recipes-bsp/formfactor/files/rx3000/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=240
+DISPLAY_WIDTH_MM=57
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=76
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=105
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
-- 
1.8.1.5


