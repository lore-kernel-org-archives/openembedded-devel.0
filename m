Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1F30A786AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 11:08:27 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t8so2822146wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 03:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZSE0iud9bsCR6wAvrmpWNbSm/0ehAvAoYJC3v05iGNA=;
	b=t/LHCKyFRw26b1wuVsvHr0nauuP4CqAol80BS4eV/UDwi5Z5t42a+3Kh68S4FMkoD8
	cpiSRgDjS8AYQ+Y73sX3VmFmwZ0LaXKauwntCNtzp8PRcRbs1qfv/fupH2Dtdr33LIMw
	GzOT4XS26eeqpZ8kvveq5TqFZbuy5THfcoZW3AVeMSkv/3Ia7QpqOxK7hyeq9PIQlRGH
	n57Lg7r2ofszRZv42OAjQHv2surt5eVcehCYit8Bvy/LsKX+aShkL8I64BZ194G28oyH
	5u3xqK6gU4rOpD0RBBU9LezYBa9WC6Kknk8fMyErf5B01+jOtuDocpnFYcIMYxedifmV
	B4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZSE0iud9bsCR6wAvrmpWNbSm/0ehAvAoYJC3v05iGNA=;
	b=E84hIic7dJQrJrv7N45CrM3u1lz2x5/m+EwI7V8cobhrt5p4u3fQ6uMLbweoPofDb6
	OqIO3vspyQBAiUJ3rfSY2Y6na5bxDI1gHZd/GV7eTl7M/35y2JWBDFQjBJReVsWk4cWp
	/TI1Y6q3+z8cGRnNCMKsckO10DyIhvkD0LnCwNzYg7NYyptMiU5rlWDvYTyrwOkuBNou
	6Ea/xFNNbc96HWKejA8pR5GkKWn+lm0JfMOfJU9aZtPK3LeQhyc3na7StI/WMWG3uuGp
	jCuPpTLZiJEZm/mjGmH1mVGHbNLWTKFS77I6jMSnNFiKdJb5RyU7IuUDyDrWVxkADRuQ
	ks8w==
X-Gm-Message-State: AJaThX5LFGgInG5i/SSKDQ88ctykfvhznHDud7hn1limErc61+vYpqQM
	efWY5t/o0UZpU2UGqQgEQkZ6Kg==
X-Google-Smtp-Source: AGs4zMYHvlEXT2lIn+PKz3aLXu2lYXVF9+/c4J5eAGJQgzEeHerZaVjqH5iPQlugPmybHSdPJY/Spg==
X-Received: by 10.28.59.69 with SMTP id i66mr933047wma.130.1512126508655;
	Fri, 01 Dec 2017 03:08:28 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.gmail.com with ESMTPSA id
	a126sm791054wma.11.2017.12.01.03.08.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Dec 2017 03:08:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 12:08:09 +0100
Message-Id: <20171201110816.13519-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171201110816.13519-1-schnitzeltony@gmail.com>
References: <20171201110816.13519-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/10] xfce4-whiskermenu-plugin: update 2.1.3 -> 2.1.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Dec 2017 11:08:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-whiskermenu-plugin_2.1.3.bb => xfce4-whiskermenu-plugin_2.1.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.3.bb => xfce4-whiskermenu-plugin_2.1.4.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.3.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.4.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.3.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.4.bb
index 3c67a2f..4a331c5 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.3.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "032a2bb0a0d4a2e3c8c136910c8b551d"
-SRC_URI[sha256sum] = "e8918c1255f7ab86b950ebd13555fe87046c01a1a4cb0b5d460024b6efc01769"
+SRC_URI[md5sum] = "5aeff066c38fda9aea2a2a3d8ab6dc9e"
+SRC_URI[sha256sum] = "ffdf2d5d4e0eeffc96d4642fdce8c55f26d3444cbd6c7b3d6f6cd7168ad4a6d5"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.9.5


