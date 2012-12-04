Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi29-0001w5-WC
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:15:00 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377424eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4EzBGZZyE+Uktd/abobU/DI12FVOnTAY2L9U01wnn6o=;
	b=G8rNkHsElfWg1sJyQb5TEVrJpp8lF9duic7qWtuJ5gzSXB8itUkBONuqH/xjYkND6m
	345hi4J5d1g7BLj9MmB0iEZ93jcA96My/lQoMxg5ORhWwyGAnOKeB0thqA8TKPSKQYCO
	O+4e5jdJnRLm+l+IIOsNdGx45utKGP4z791MnK2I4fPVzPm5rBCiLd5CMDoouK8XnlrJ
	eQ7wNjPFXkppSV5MAAS/9uaBL3zEqJq8gmQO2GuHYaVQT3LuHhEXQdj2Ql2foyU2CLr9
	N7OTKdyLaqgmYqIDuLP5oCvo4+Voi3kYDJmluUcrbUZxfOpc7N5KvURPuCL7v8mDYuaw
	pGNA==
Received: by 10.14.214.132 with SMTP id c4mr42779275eep.18.1354586434405;
	Mon, 03 Dec 2012 18:00:34 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q44sm34797576eep.5.2012.12.03.18.00.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:00:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:40 +0100
Message-Id: <20028a31f7f7032af7d749f5a5700e2a21e1d361.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 07/58] usb-modeswitch-data: upgrade to 20121109
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
X-List-Received-Date: Tue, 04 Dec 2012 02:15:00 -0000

* older archive no longer available on SRC_URI

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...sb-modeswitch-data_20120120.bb => usb-modeswitch-data_20121109.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20120120.bb => usb-modeswitch-data_20121109.bb} (74%)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20120120.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20121109.bb
similarity index 74%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20120120.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20121109.bb
index bf3249f..8a6fc13 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20120120.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20121109.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 inherit allarch
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-data-${PV}.tar.bz2"
-SRC_URI[md5sum] = "c899cc9c71bb35f3ec600b7cd1455c65"
-SRC_URI[sha256sum] = "bce6b8cbbf293fe519584b63815fe7f665e8238e6e138151d8cf7cc85a7a7b0f"
+SRC_URI[md5sum] = "a7d23a03157871013a0d708ab2b1b6df"
+SRC_URI[sha256sum] = "a74346a471d540ba9da7d7b332ad35ea05ff7375297c0da87da5be675293d5a5"
 
 do_install() {
 	oe_runmake install DESTDIR=${D}
-- 
1.8.0



