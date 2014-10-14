Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 86920716D9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 22:14:44 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id h11so350741wiw.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 15:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=2O0Pn58UIl0jNZhWVGkL0bl9rLCntBx4rP1jqusPJ0o=;
	b=Tx8oyGn+A5AIZk6WhsEpBeOFySj0YrsWr+bwtRO4nBpuhh5bzrf6MAegZ8mWxEvvlj
	Cq0QmqXSiPM7N3R5nbRvyHaa0oVkqaDE49ZsVYpWSAgWoUIruxS2Ey89QtQMuziChElS
	O5meG4Ww/Lx06KP0kyc0B+e7Lr6lj6vHOpJ0vGB09gwjCIYS6IMG4PXPUedjPDR6xT6k
	vIrQLy0fAurAYqFkNySECn/Bk62oFZPRJpkd9hUHGI3/z+0ptU+P6YUEb1HTMa5Y27Oy
	6bRHpbUVGNLTXv7XrT5z7P2+dbHvn5g8qsfcvcZBJZiwsrBWHfbPEr968H38MG11YuJV
	1oqw==
X-Received: by 10.194.58.205 with SMTP id t13mr7726657wjq.55.1413324885749;
	Tue, 14 Oct 2014 15:14:45 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	eg8sm17132892wib.15.2014.10.14.15.14.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 15:14:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2014 00:14:19 +0200
Message-Id: <1413324868-11856-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
References: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 06/15] glade3: update to 3.8.5
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
X-List-Received-Date: Tue, 14 Oct 2014 22:14:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

check and rework licenses a bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-devtools/glade/{glade3_3.8.2.bb => glade3_3.8.5.bb}  | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/glade/{glade3_3.8.2.bb => glade3_3.8.5.bb} (73%)

diff --git a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb b/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
similarity index 73%
rename from meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
rename to meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
index 69d9eae..4e7ef9b 100644
--- a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
@@ -2,17 +2,16 @@ SUMMARY = "Glade - A User Interface Designer"
 HOMEPAGE = "http://www.gnu.org/software/gnash"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
-                    file://COPYING.LGPL;md5=3bf50002aefd002f49e7bb854063f7e7"
+                    file://COPYING.GPL;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
+                    file://COPYING.LGPL;md5=252890d9eee26aab7b432e8b8a616475"
 DEPENDS = "gtk+ gnome-doc-utils-native gnome-common libxml2"
 
-PR = "r1"
-
 inherit autotools pkgconfig pythonnative
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/glade3-${PV}.tar.xz \
            file://0001-gnome-doc-utils.make-sysrooted-pkg-config.patch"
-SRC_URI[md5sum] = "b5da0ce717b2dc710e93a10b97c0f9ce"
-SRC_URI[sha256sum] = "f180a5018eee6e3fe574854cb025af897dd9962b01d17d5752e626876d388b19"
+SRC_URI[md5sum] = "4e4b4f5ee34a03e017e4cef97d796c1f"
+SRC_URI[sha256sum] = "58a5f6e4df4028230ddecc74c564808b7ec4471b1925058e29304f778b6b2735"
 
 EXTRA_OECONF += "--disable-scrollkeeper"
 
-- 
1.8.3.1


