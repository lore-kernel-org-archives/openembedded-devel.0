Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3AFEC768A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:58:20 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so49991286wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=y4mAgtS9sG8PFbh/wpmwDiE5BEw1X4HDga4ZSCH1L0E=;
	b=eiLAq7LoWU1vjz6Rl7N0xPY2gNe6YPmeRl87V172CHGXDfFEbS80q1omxsFCM0myhc
	eoro+E4H4/BtTEZO2ECLrN1Kyov1rZnNStNuVj5Ccgm2M+h6qmxVBxJ3UFHonYwS/OQ8
	PEsDUj/qMI9NeXGN/3MXal0fw2S/XAXpLXSzAmOdTFvrkl+ACKG2hU4wyId6iDl3O9P0
	63Byg+OY3k9ec8hB/J1smbtzeBlcLXUr3+Smadh8ZYuikGgq5rUFFmYdgNOwhTUvQvWe
	3mqk/FCXc4sCyuV3i8ZD7PLJEheJjQ3BXffmqmooKhiBmTOdzP7V/HuJ7P+ZQF6YvvtF
	5SZw==
X-Received: by 10.180.21.169 with SMTP id w9mr34041862wie.73.1439279900144;
	Tue, 11 Aug 2015 00:58:20 -0700 (PDT)
Received: from localhost.localdomain
	(ip-109-91-251-29.hsi12.unitymediagroup.de. [109.91.251.29])
	by smtp.googlemail.com with ESMTPSA id
	fs8sm2124773wib.0.2015.08.11.00.58.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 00:58:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:57:32 +0200
Message-Id: <1439279859-1815-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 10/17] cairomm: update to 1.11.2
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
X-List-Received-Date: Tue, 11 Aug 2015 07:58:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-graphics/cairo/{cairomm_1.10.0.bb => cairomm_1.11.2.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-graphics/cairo/{cairomm_1.10.0.bb => cairomm_1.11.2.bb} (68%)

diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb b/meta-oe/recipes-graphics/cairo/cairomm_1.11.2.bb
similarity index 68%
rename from meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
rename to meta-oe/recipes-graphics/cairo/cairomm_1.11.2.bb
index a5e383a..a330458 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm_1.11.2.bb
@@ -3,15 +3,13 @@ SUMMARY = "C++ bindings for Cairo graphics library"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9"
 
-PR = "r1"
-
 inherit autotools pkgconfig
 
 DEPENDS = "cairo libsigc++-2.0"
 
 SRC_URI = "http://cairographics.org/releases/cairomm-${PV}.tar.gz;name=archive"
-SRC_URI[archive.md5sum] = "9c63fb1c04c8ecd3c5e6473075b8c39f"
-SRC_URI[archive.sha256sum] = "068d96c43eae7b0a3d98648cbfc6fbd16acc385858e9ba6d37b5a47e4dba398f"
+SRC_URI[archive.md5sum] = "732a3ff5b57401eb5dfeef795a2a0c52"
+SRC_URI[archive.sha256sum] = "ccf677098c1e08e189add0bd146f78498109f202575491a82f1815b6bc28008d"
 
 FILES_${PN}-doc += "${datadir}/devhelp"
 FILES_${PN}-dev += "${libdir}/cairomm-*/"
-- 
2.1.0


