Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5101C76932
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:58:25 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so49994108wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=8rdHnHZN6XTEg4Ym8/+iVhWHgYkDUpKJ9sJUDuUuGyw=;
	b=cTGkHeU+YgiuwKfvpM5tdlerf56v7IAoh5ClYQClVFsQeK5HNeESQ+TOP7Bz/nHPf4
	wYOjLVPTGaSAn3cNevoJnzAI037R3M8nnFWgVbjXkUJWe4Ky6wYHZgWiLZxraJfXPubu
	hKfU/Cxou44sgyQJGtRA87FOUB9uZV51Jme/DTE+xfkw/Ngpg/O6F7J299BALK5Jt+7v
	T1xBq2ld7HH1uSfQCZZ8xeHO3N8DrKE/E/cwzko1uxD0kNrbAkQYoGnVM6NVNRc4yk3W
	KLkCCNgR1MWIefeskAIA3xTulYPW3wRXN/vGxk2vturTthckY9GAkkZYFqXHPG7W78n6
	1ZGA==
X-Received: by 10.180.206.211 with SMTP id lq19mr35115212wic.81.1439279905894; 
	Tue, 11 Aug 2015 00:58:25 -0700 (PDT)
Received: from localhost.localdomain
	(ip-109-91-251-29.hsi12.unitymediagroup.de. [109.91.251.29])
	by smtp.googlemail.com with ESMTPSA id
	fs8sm2124773wib.0.2015.08.11.00.58.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 00:58:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:57:38 +0200
Message-Id: <1439279859-1815-17-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 16/17] pavucontrol: update to 3.0
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
X-List-Received-Date: Tue, 11 Aug 2015 07:58:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../pulseaudio/{pavucontrol_1.0.bb => pavucontrol_3.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/pulseaudio/{pavucontrol_1.0.bb => pavucontrol_3.0.bb} (75%)

diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_1.0.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb
similarity index 75%
rename from meta-oe/recipes-multimedia/pulseaudio/pavucontrol_1.0.bb
rename to meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb
index b648351..84227b4 100644
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_1.0.bb
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb
@@ -7,7 +7,7 @@ DEPENDS = "intltool gtkmm libcanberra pulseaudio"
 inherit gnome
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "0ab6b13542af9b4417438527d2524316"
-SRC_URI[sha256sum] = "3dbe2865b6e3a195a8951967d9234f62cd254c30b08bdea1ecf8997b58f68cde"
+SRC_URI[md5sum] = "176308d2c03f8f3a7b2bd4f4d284fe71"
+SRC_URI[sha256sum] = "b3d2ea5a25fc88dcee80c396014f72df1b4742f8cfbbc5349c39d64a0d338890"
 
 EXTRA_OECONF = " --disable-gtk3 --disable-lynx "
-- 
2.1.0


