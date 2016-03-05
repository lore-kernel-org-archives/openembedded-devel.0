Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD7A65CBB
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Mar 2016 13:44:10 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id w104so64988772qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Mar 2016 05:44:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=x+/YYe5vHZDxgKtScq5VsiEVu5Rg6YM7sz7V9lI1Kog=;
	b=O5WAqViafSFqYI9Kkpj3ahj8KhzGkQ864+HVyxxfRZ1IVrL4pgUPCbauWYTnhX9+QI
	9BbugsFLgfbGKeC/VNe0tFU++59lwvcl/yptvwRCb2K6bdMChJDObO+Kbv+HVMzp8G36
	SAQk1kH83ZrkIhGBZBvM418CeuXLb76KZ/KRUj1ouBwcGNlHHAOy2qqzUmAOql240j4e
	VoHKo4ZzzdMp/dJhtdgE/RBQosL6tYLJ+TJr/7EIeSa8l+tdzuu3J7sfyDRsn6dBlT60
	ukMbJC8yjsAr7+R3IOJ6v93GeydTKUOC6ofbGKG14g7HlOuMdv5alushMi6KTc8q5EZX
	DdBw==
X-Gm-Message-State: AD7BkJIwTiVakCFA3EasZJ1UMN7IJfCAwbq/7TP8uzJGWFu5WFqcdKmvcVxmcxsi64cJEg==
X-Received: by 10.140.230.207 with SMTP id a198mr17913763qhc.94.1457185451764; 
	Sat, 05 Mar 2016 05:44:11 -0800 (PST)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	v70sm3889496qge.25.2016.03.05.05.44.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Mar 2016 05:44:11 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Mar 2016 08:44:00 -0500
Message-Id: <1457185440-16523-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-multimedia][PATCH] libao: update to 1.2.0
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
X-List-Received-Date: Sat, 05 Mar 2016 13:44:12 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-multimedia/libao/{libao_1.1.0.bb => libao_1.2.0.bb}     | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libao/{libao_1.1.0.bb => libao_1.2.0.bb} (86%)

diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
similarity index 86%
rename from meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
rename to meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
index 04e8461..3991f02 100644
--- a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
@@ -8,11 +8,12 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI="http://downloads.xiph.org/releases/ao/${BP}.tar.gz"
-SRC_URI[md5sum] = "2b2508c29bc97e4dc218fa162cf883c8"
-SRC_URI[sha256sum] = "29de5bb9b1726ba890455ef7e562d877df87811febb0d99ee69164b88c171bd4"
+SRC_URI[md5sum] = "9f5dd20d7e95fd0dd72df5353829f097"
+SRC_URI[sha256sum] = "03ad231ad1f9d64b52474392d63c31197b0bc7bd416e58b1c10a329a5ed89caf"
 
 inherit autotools
 
+PACKAGES += "${BPN}-ckport"
 PACKAGES_DYNAMIC += "^${BPN}-plugin-.*"
 
 do_install_append () {
@@ -30,3 +31,4 @@ PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio'
 PACKAGECONFIG[esound] = "--enable-esd,--disable-esd,esound"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
+FILES_${BPN}-ckport = "${libdir}/ckport"
-- 
1.9.1


