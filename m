Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2C23E60167
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:02:26 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id l18so11677613wgh.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=EWEGxsMcahc9GrHiJGFGwcRbC9yUXbBzIEn8AmKaO4M=;
	b=igoAEvkn6qlzxFbGrKKfQ+YXT859An3HKvciWmer2guua//UNB/5NnmwnnHvCMu0n4
	1Gt1QKpriL2V/zwRNUvfGNRCLPF9zmW05JevPix//Gasvzi6KHB4iy+Ib2B/KMZBLGjR
	2NPpdCov6vRtmIPF3TcIAM5AbeNBNfACjWuK1iglofBAT4/Kaa7VlPt9hBS58QHsHaqk
	/XX1QjQ4ExOVSr1HDZD1QP/PyyLOVbygjG7rAopiY+ID7buyd8+5UXCu8ueQdQ+UTfuL
	F19lY65OY5QRMpuBOZzbhc3FnCbflNeCC7+WCJaFnWub28ZHEPto6SMCtc3h/TY1JH7U
	M3qw==
X-Received: by 10.180.210.196 with SMTP id mw4mr13074855wic.35.1423810948072; 
	Thu, 12 Feb 2015 23:02:28 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id v16sm1635972wib.5.2015.02.12.23.02.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 23:02:27 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:01:50 +0100
Message-Id: <1423810919-9857-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2][PATCH 10/19] xfce4-whiskermenu-plugin: update to 1.4.2
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
X-List-Received-Date: Fri, 13 Feb 2015 07:02:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rename recipe's folder to whiskermenu to match convetion used by all panel
plugins

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce4-whiskermenu-plugin_1.4.2.bb}                                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/{whisker/xfce4-whiskermenu-plugin_1.3.2.bb => whiskermenu/xfce4-whiskermenu-plugin_1.4.2.bb} (68%)

diff --git a/meta-xfce/recipes-panel-plugins/whisker/xfce4-whiskermenu-plugin_1.3.2.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.4.2.bb
similarity index 68%
rename from meta-xfce/recipes-panel-plugins/whisker/xfce4-whiskermenu-plugin_1.3.2.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.4.2.bb
index dd3d8fd..7764109 100644
--- a/meta-xfce/recipes-panel-plugins/whisker/xfce4-whiskermenu-plugin_1.3.2.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.4.2.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 inherit xfce-panel-plugin cmake
 
 SRC_URI = "http://gottcode.org/${BPN}/${BPN}-${PV}-src.tar.bz2"
-SRC_URI[md5sum] = "f4de7546588952f84df8a4ad3552c526"
-SRC_URI[sha256sum] = "a104b2266675a3ea3c7b98aab7b075a351d813ea29098504031a62f365e5a0fc"
+SRC_URI[md5sum] = "967bbff0e98fdf0c1b78e61b3b152c2d"
+SRC_URI[sha256sum] = "7266d7a16df4bffe6f00d3d4711b8b8fd972491bac70f13a9d7edd9f0472d311"
-- 
1.9.3


