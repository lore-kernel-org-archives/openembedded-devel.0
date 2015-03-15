Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2227F7391E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:10 +0000 (UTC)
Received: by webcq43 with SMTP id cq43so26861174web.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=dLMK3d5J0cvCONjElq42vMCk126l2HnQY91YZwAoKNo=;
	b=cPdlEl9jxTtaPg33GBnvi91QU2WzXkTKjpZiZbSlV/7SpVgZmGcRjxRZurj0gX2mlg
	FGqDRFfw4hXBWEsz3xmx6Y1jZtqPJu2PeHQbzjj+/B9ExmNFZFpktRXnw5/bmjS1DD7N
	T09UemFW6XNECxoQbchUEE/iKz8OMSRLfpxdNHzAtCMc+aAoVkP4Vrixl1q44DZhZ+WK
	KsD6xOosIXhNxmDVHr2VRSl6RPIH95rfFTbru3TSU+Mx7Eq1cGwIgOwGN9we769vkO2P
	02H9gkBNb9dK3U4PDfu4sxjz8nVamLmmFaLpWBjrPLXJDJvA/T5POjZ8GoTWJbODI0Ci
	XRrg==
X-Received: by 10.180.90.113 with SMTP id bv17mr34720983wib.3.1426462451759;
	Sun, 15 Mar 2015 16:34:11 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:22 +0100
Message-Id: <1426462419-10173-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 13/30] xfdesktop: update to 4.12.0
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfdesktop/{xfdesktop_4.10.2.bb => xfdesktop_4.12.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.10.2.bb => xfdesktop_4.12.0.bb} (73%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.2.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.0.bb
similarity index 73%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.2.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.0.bb
index 93b0854..a24528f 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.2.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.0.bb
@@ -6,8 +6,8 @@ DEPENDS = "glib-2.0 gtk+ libxfce4util libxfce4ui libwnck xfconf dbus-glib thunar
 
 inherit xfce
 
-SRC_URI[md5sum] = "54a84ce63046c279fc3ec3f436d2f1b0"
-SRC_URI[sha256sum] = "49a6e0be513e307e896f7e5929825babec9bbcd4b2e73552f9d27647a4db797d"
+SRC_URI[md5sum] = "d14545baf39678d3b1c7280f71e9d160"
+SRC_URI[sha256sum] = "6e7a8b87317762214b6407576f6e2c1efcc176c136b4c7b869d18a74c87b7fc7"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
1.9.3


