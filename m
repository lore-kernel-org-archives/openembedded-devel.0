Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9145760034
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:19 +0000 (UTC)
Received: by wifj2 with SMTP id j2so29396479wif.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=KCw07KHCrs8IkvcNH7ByNUQikWFx8szsvDgSCLd9hso=;
	b=wdpEEdm67MyINJ3bm8ecRiHBQlQXv+gQqDeg4H5v9SmKgSXP7sGpZJ7SGzbSB3NUs1
	ru4bfXnicMSXAVYrpiPK9ZxTt0rb10P62rKn2t//me9WSI4oTw0ZGq4nljeFhUwkrSKg
	kJfQiOvFNOM4IjeWZ8uNPJkJ12766dG0zrup3WG17rc7Kqz2Td2Sv1Shte1XxUy6cpBA
	BFsCJBN/pYq36tEx7G9UFIbdRJrkqCeCmXsWa/eMpCviRPNQZoqYyA1SBxa9T43pZdDZ
	hSbUcA0J6lgWRJYyZxfHCvlrHhgbyJ4+oyetuelkcrngmhkVlZdIyzPaXuH1l0huBCOZ
	f9kQ==
X-Received: by 10.180.208.46 with SMTP id mb14mr11878339wic.31.1426462460246; 
	Sun, 15 Mar 2015 16:34:20 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:28 +0100
Message-Id: <1426462419-10173-20-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 19/30] xfce4-diskperf-plugin: update to 2.5.5
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...{xfce4-diskperf-plugin_2.5.4.bb => xfce4-diskperf-plugin_2.5.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.5.4.bb => xfce4-diskperf-plugin_2.5.5.bb} (65%)

diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.4.bb b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.5.bb
similarity index 65%
rename from meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.4.bb
rename to meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.5.bb
index 2df9b9f..801699c 100644
--- a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.4.bb
+++ b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.5.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d3e627798d6a60bece47aa8b3532e1f1"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "2db453fc3ea2e4fe073ec313a25b0961"
-SRC_URI[sha256sum] = "aab6b9c4e2f78620920efac6874c4edf426f05b63b94cfda0da8c99a91110a0b"
+SRC_URI[md5sum] = "199e4365cb3a1fcd5f6164044aedba17"
+SRC_URI[sha256sum] = "cbeb0c00f97362eef3f135afb77947aef73e938bae0386250a122ac6644b521b"
-- 
1.9.3


