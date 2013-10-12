Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 642066D098
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 20:57:32 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so2529570eek.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 13:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FL6MckvtyOcvHkGvBWuBOjHIqd+2x9vBHEGpxma88nc=;
	b=O04edDMGM6VioPU+EJnTTEQNwcnBh0DFQULz8OvndTgMgaYS+sXEcUxYEiz/2ULvfU
	+LaQDD0O3tYaJTf8gljkQpSHIE2vG0btARSxO+wuKXgPtRsDEu3/Ue+FWqDeCDe7vGoz
	yCDIjWQKiO2bW6wAtFoY69kqOevagSm4HSXVmLI6Ecsq8+tHwgzbW9fL3Enn6VK0iLSM
	8VzMLYFXKycJUeSrfKArRRcufSWUE6+eqUw/ztqd3HgKEG8Ent6a1uuNgG1g8pbMLT+Q
	VeuDd8LrRXaWA7D81GTblWbAgoB2RzTSkNMxCo/MWhHR0+X94e3Vm06g7lj9SnDne4Vh
	0gqg==
X-Received: by 10.14.122.132 with SMTP id t4mr41582622eeh.20.1381611453954;
	Sat, 12 Oct 2013 13:57:33 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	r48sm131989092eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 12 Oct 2013 13:57:33 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Oct 2013 22:57:22 +0200
Message-Id: <1381611443-16395-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1381611443-16395-1-git-send-email-andrea.adami@gmail.com>
References: <1381611443-16395-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/4] formfactor: add configuration for IPAQ with 4" screen
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
X-List-Received-Date: Sat, 12 Oct 2013 20:57:32 -0000

iPAQ
hx4700
hx4705
210
211
214

4" diagonal
2.36"x3.15" (60x80 mm)
Area: 4800 mm2
pixels: 480x640

Real display DPI: 200

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/formfactor/files/hx4700/machconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100755 recipes-bsp/formfactor/files/hx4700/machconfig

diff --git a/recipes-bsp/formfactor/files/hx4700/machconfig b/recipes-bsp/formfactor/files/hx4700/machconfig
new file mode 100755
index 0000000..fe47600
--- /dev/null
+++ b/recipes-bsp/formfactor/files/hx4700/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=480
+DISPLAY_WIDTH_MM=60
+DISPLAY_HEIGHT_PIXELS=640
+DISPLAY_HEIGHT_MM=80
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=200
+DISPLAY_DPI=200
+DISPLAY_SUBPIXEL_ORDER=rgb
-- 
1.8.1.5


