Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id AC66C768A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:58:22 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so57403904wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=K6nIJQzZdyzpZlflwn60lXQxOgx0WnCBc1/31iWEoKo=;
	b=XBx0MM/UyzBs7Uyb9N5FBc3tThcJcJOnyaDasuUTXY+KpSiUsLDRCaSdzLslkMhJB4
	mIX8Kxq4+/YUB1wj653jkpcAXi/B6adA52oBoEmRdoBakxUm2o72BEQ4/NAplTwRHpQq
	KYv5StBCRaCDulC4HCFhHlDDlJdViAsSXYdiVd7Ssj4xF9OmozrLy+STOFP9Zen/QmHM
	X1i0XWqYhnXHT0pC7V5O1DN+jfdRs6SOQrhyHL4+BSlDye2k/8CxMA1MIW35mQEtIRp3
	HMBv4BJrHzdI6Qnt9EesV//GEZC3by2wdC4GmeX6xRuKA6USiTZ52eV8joAiBWvkN4QK
	BDnQ==
X-Received: by 10.181.13.13 with SMTP id eu13mr34785402wid.70.1439279901319;
	Tue, 11 Aug 2015 00:58:21 -0700 (PDT)
Received: from localhost.localdomain
	(ip-109-91-251-29.hsi12.unitymediagroup.de. [109.91.251.29])
	by smtp.googlemail.com with ESMTPSA id
	fs8sm2124773wib.0.2015.08.11.00.58.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 00:58:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:57:33 +0200
Message-Id: <1439279859-1815-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 11/17] pangomm: update to 2.36.0
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
X-List-Received-Date: Tue, 11 Aug 2015 07:58:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-graphics/pango/{pangomm_2.34.0.bb => pangomm_2.36.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/pango/{pangomm_2.34.0.bb => pangomm_2.36.0.bb} (81%)

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb b/meta-oe/recipes-graphics/pango/pangomm_2.36.0.bb
similarity index 81%
rename from meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb
rename to meta-oe/recipes-graphics/pango/pangomm_2.36.0.bb
index 00f9e36..f738153 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.36.0.bb
@@ -9,8 +9,8 @@ DEPENDS = "mm-common cairomm glibmm pango"
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/pangomm/${SHRT_VER}/pangomm-${PV}.tar.xz"
-SRC_URI[md5sum] = "2c702caede167323c9ed9eed2b933098"
-SRC_URI[sha256sum] = "0e82bbff62f626692a00f3772d8b17169a1842b8cc54d5f2ddb1fec2cede9e41"
+SRC_URI[md5sum] = "62910723211d86ab825b666b479871c9"
+SRC_URI[sha256sum] = "a8d96952c708d7726bed260d693cece554f8f00e48b97cccfbf4f5690b6821f0"
 
 inherit autotools pkgconfig
 
-- 
2.1.0


