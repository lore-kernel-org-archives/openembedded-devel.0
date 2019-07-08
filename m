Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43])
	by mail.openembedded.org (Postfix) with ESMTP id 647D56D4B6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 00:16:26 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id v85so6702758lfa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jul 2019 17:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=lzeneFzcc6ARf5FAhCCHtogEHgvd3kFHcAeYTJ/J2mw=;
	b=he7s2NAeWFl44aPrnYPeIF0UguOmg79btiKw5dbnuvm9l3f2vgn1Q9V14GSeEX1VS0
	hSYIJdQNnv3c3qT8F0syTDOpt2WaHromyzetsoCqvaFkxOCx046M1fR7xDIitfmK7UvL
	sHMIHYXdrvCp2MnpmDGvzeMc3v+WC+LaBsL9KgG17LvwgrzQhj7X/VEjv2dRuppa/V+Z
	zKgkef3KpC9RotFNiRvz6RWZliVLEGRtvmiZSVE2rcCvuj+Q1wQapasQUxx7ENe2kzf+
	SM1WNhC2D1k/W/pFvdS7oVpHU8Frs7xqhzMP8M4FCdoobWrfOaB5pvTolYsbtY1K2CZe
	hbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lzeneFzcc6ARf5FAhCCHtogEHgvd3kFHcAeYTJ/J2mw=;
	b=OlljMgd/wdaMWoODXb1Ek7TJtEgqqNMnjXCaTVDIYxnPiJihPjjlhVx8zF5z1+jTtY
	ge5cyXsnxqAJ1lJmTeLf66nCfX5SovA1oWGzJZDtkt9a6TQAKpG+yaMk6YB3pp/st/gN
	+g8h7tKJnY9pOTLmWLxPqsNzpd5B4NstYwljT/NNsyI9VJfJsSgMEW/q/tmLfvljsXtf
	MkKZS5UeYc71LLZMJ9NlMMKYp+uAN5JTeZq7bpjS5l3l36l/XaLqG7YNxvbgd8Bs8vIT
	DulfNzNdxqcPlBslKp6X4CQ6UB1BLy6zcqU/ocTr3x9TGWNTPn3z/l2jKsze36ElBVtB
	bUDA==
X-Gm-Message-State: APjAAAW408JgVCdQmVL7UNel+3rpqItohm0X+hxElHSVOLS6m5w9wAlq
	cscVDG3wYq1bkf98phbVYNWP8s6fucw=
X-Google-Smtp-Source: APXvYqyYI3vqeWjfW9vly5eA1+dM3lc+lUdU3IDub+9kUgy9ed9KHJAnGaDTI6KLuynOLi1hMfOLmw==
X-Received: by 2002:a19:5217:: with SMTP id m23mr4609677lfb.124.1562544986479; 
	Sun, 07 Jul 2019 17:16:26 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z12sm2472210lfg.67.2019.07.07.17.16.25
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 07 Jul 2019 17:16:25 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jul 2019 02:16:23 +0200
Message-Id: <20190708001623.1715-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] miniupnpd: update to 2.1.20190210
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
X-List-Received-Date: Mon, 08 Jul 2019 00:16:26 -0000

License checksum changed due to modified copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...{miniupnpd_2.1.20190210.bb => miniupnpd_2.1.20190630.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/miniupnpd/{miniupnpd_2.1.20190210.bb => miniupnpd_2.1.20190630.bb} (88%)

diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190210.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190630.bb
similarity index 88%
rename from meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190210.bb
rename to meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190630.bb
index d4093e511..6b8fdca4c 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190210.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190630.bb
@@ -5,7 +5,7 @@ the network."
 
 SECTION = "networking"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=91ac00c6b9f5c106e89291e196fe0234"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a1ed15843ce66639bcf9f109cf247870"
 
 inherit autotools gettext pkgconfig systemd
 
@@ -15,8 +15,8 @@ SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${BP}.tar.gz;do
            file://miniupnpd.service \
            file://0001-Add-OpenEmbedded-cross-compile-case.patch \
            "
-SRC_URI[md5sum] = "03b00c27106835e728a3b858ecf83390"
-SRC_URI[sha256sum] = "1aaecd25cf152d99557dfe80c7508af9cb06e97ecad4786ce5dafb4c958d196b"
+SRC_URI[md5sum] = "394e676f555d8047be69730d9c4d23a5"
+SRC_URI[sha256sum] = "29f49fe6868597d041ee29f511fa7b65781b9e4e85ef2569a2381c2079e1743e"
 
 IPV6 = "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '--ipv6', '', d)}"
 
-- 
2.17.1


