Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id DEB1E6CFE4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 22:36:41 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so2983320eaj.39
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 15:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=In2ol+5O/TJycjffpRVfy2zwOcFbcFuBTJ5VBAzGcBs=;
	b=SktWrWF4DzWaLs8LK/tO7GdJxomj5lwlfSsup5WlYfDk9oTE/MPqbwRQVxqOSXNrF+
	8idhkdPjxLaW0LoJV4jGj2HxNwT2hjWhVzIs/BM9wRYrhnEp/+Se2dHyR/uX9Qer/2Bx
	o8ag6brf5htrSNuj/EGhMOnZ3FIzthP5jKpwozkpQV1uzsio5kphJmj84hRQ2lRZA5OZ
	G/gF4pTcTyzRXLDj1niDu0oAliD9XxOxLByurQY45GWiZgf46+HH9V8+WsogAQcIFJ2F
	dy60fXYjvIpxdegAjW9+dh/0XMVNEkQwBMo8ycqfblHp+yzKl4GoF68HhjkuUY0xhNU3
	0aPA==
X-Received: by 10.14.219.198 with SMTP id m46mr50343817eep.41.1381703802258;
	Sun, 13 Oct 2013 15:36:42 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id a1sm145535666eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 15:36:41 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 00:36:32 +0200
Message-Id: <1381703793-5661-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1381703793-5661-1-git-send-email-andrea.adami@gmail.com>
References: <1381703793-5661-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/4] meta-handheld: add qvga to MACHINE_FEATURES for Motorola
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
X-List-Received-Date: Sun, 13 Oct 2013 22:36:42 -0000

For rokre2, rokre6 and ezx devices

Used in oe-core in:
recipes-sato/gtk-engines/gtk-sato-engine_git.bb:
recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb:

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/motorola-ezx-base.inc | 2 +-
 conf/machine/rokre2.conf                   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/motorola-ezx-base.inc b/conf/machine/include/motorola-ezx-base.inc
index 3931389..04ad337 100644
--- a/conf/machine/include/motorola-ezx-base.inc
+++ b/conf/machine/include/motorola-ezx-base.inc
@@ -25,7 +25,7 @@ MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
 MACHINE_DISPLAY_ORIENTATION = "0"
 MACHINE_DISPLAY_PPI = "180"
-MACHINE_FEATURES = "alsa apm bluetooth keyboard phone screen touchscreen usbgadget usbhost vfat"
+MACHINE_FEATURES = "alsa apm bluetooth keyboard phone screen touchscreen usbgadget usbhost vfat qvga"
 MACHINE_FEATURES += " iwmmxt"
 
 #
diff --git a/conf/machine/rokre2.conf b/conf/machine/rokre2.conf
index 468924c..534a37b 100644
--- a/conf/machine/rokre2.conf
+++ b/conf/machine/rokre2.conf
@@ -5,6 +5,6 @@
 require conf/machine/include/motorola-ezx-base.inc
 
 # there is no touchscreen
-MACHINE_FEATURES = "apm alsa bluetooth usbgadget usbhost keyboard screen"
+MACHINE_FEATURES = "apm alsa bluetooth usbgadget usbhost keyboard screen qvga"
 MACHINE_FEATURES += "iwmmxt"
 
-- 
1.8.1.5


