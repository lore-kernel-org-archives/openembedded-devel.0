Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TeKLc-0006Fk-GE
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 07:45:26 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so93159lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2012 22:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Gi7GqwCz5qO/RLiW31NN58w7T1f7553FzRmbE6AOVB4=;
	b=NrKiXLL0PdHfp1eVC1+5qIEBoZSkt4D3tnhHPmn7cV1s+CRUoyHM/+gSXNgpWTcPyM
	yYfQwKYbcEMvANuvwB0s6euOn4AFPrDXBU/nDn7EVkdpBvR8RX2kWeE93Hl/8wqDpAJ7
	9E2U+Ee8fuQ/JoZ4DSTYmXbqRx2cEyiGCiKd9nWZlYa1P9a7cvKKaj7FjP0D/sVdcnti
	rl9/auCbdfIMAm9IZlt8i6VweIy1+FTK8woc3NNU75AOagonX/0/nlzZLNbc44f49MtN
	EIbEhmC1KY37gGOCyRKDQIrdUrdBhJzEMCiSEbHALnkXmoQ7/wygDpi/LI+1+/aRAp8K
	fjqg==
Received: by 10.152.104.50 with SMTP id gb18mr293381lab.9.1354257059701;
	Thu, 29 Nov 2012 22:30:59 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id sx3sm1558156lab.9.2012.11.29.22.30.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Nov 2012 22:30:58 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TeK7l-0002da-K8; Fri, 30 Nov 2012 08:30:57 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Nov 2012 08:30:56 +0200
Message-Id: <1354257056-10108-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] gtk+3: add libxi dependency
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
X-List-Received-Date: Fri, 30 Nov 2012 06:45:26 -0000

Without even compile fails:
| In file included from gdkdevice-xi.c:24:0:
| gdkdeviceprivate-xi.h:28:35: fatal error: X11/extensions/XInput.h: No such file or directory

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
index 854ba41..55397cc 100644
--- a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
+++ b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 
 DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor \
            gtk-doc-native docbook-utils-native libxrandr libgcrypt \
-           libxdamage libxrender libxcomposite cairo gdk-pixbuf gtk+-native"
+           libxdamage libxrender libxcomposite libxi cairo gdk-pixbuf gtk+-native"
 
 LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 
-- 
1.7.10.4



