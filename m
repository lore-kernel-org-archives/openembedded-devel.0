Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 081317468B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:29 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id d1so8047145wrj.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=84yPRhBnceHUZEz2xuFKz6cziWI0cn40vHEjNKNSgtU=;
	b=U2uvkpwhkP0VpXgHawek1aTbCrtCyzkSW9YwREzTcWNxIjnoMLxMDS/23WZMXjbyaw
	yR2RyWvlyAy5vfirPFgOvb8Exv0gWgOt62XfJlz+V1upgYCmHKrMVkSLRT+LZnMG+inp
	xUSo0LvT5vxj3fscdwFYfzXSMNGVgirFbOZ7SzxbNCDO3Ib5lhDoZcV4ZMX8Ed+lAJdr
	JXHqavcSk0iN52PAjbLDAUDbSTNQPh7pifVzMQSbfDEDiEmfhE+Df4ub7QQSpoaiC+d9
	BPLWC0k4rbkZQGnpkAYumGW9WqzklUjzgnnDEHUTD4A+LEA27S2oIVSNLoqMlDPw3s7L
	s8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=84yPRhBnceHUZEz2xuFKz6cziWI0cn40vHEjNKNSgtU=;
	b=McLF/Tifz3c8TKBynpwEjJof/ilCf6jVY1M21InEGeN9DwKkDPgwc6lIG//Hq6JiSS
	fbm3A/luCZHvpHWY5eZ5UFuuW3AelbPUw8Rht7FkmXaw3Em/y8kvyq6elujjQqH92dJL
	GFbTHcYhN5tTKML02sYoeKbaML/Q/lU8+B8NxPviY8aStBinVUruGJ3avN98smMPI+E/
	C+DbBcImmll6lYm1z9BCnSQsc/nbQCoWDNXit1afQEj2yT+7ymKT9Rzm9k3SZBhYhNx5
	fbsEkVcXJrJObU4JOwVUsFk+4tyJU7lE+o8gSyWMIDqc2EmCEJgzEuRomFOZ7GuJrvb2
	knng==
X-Gm-Message-State: AElRT7FWoqRzhgOEAYwE20g3uzanpzkzWI5iPQbeaAqRmTWKq+2EN3P9
	ET+I7dkOyCXA/sxtBNE27EDCGg==
X-Google-Smtp-Source: AIpwx4/hkcvya/ID28MMRkQ+Bah253nrQlNGfLWbZKDfNnRLrg+hNXMAluZJ6xjbVVkC+psUjrBxQQ==
X-Received: by 10.223.166.179 with SMTP id t48mr9617852wrc.161.1522416749705; 
	Fri, 30 Mar 2018 06:32:29 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:37 +0200
Message-Id: <20180330133151.25882-26-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 25/39] upower: update 0.99.5 -> 0.99.7
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../upower/{upower_0.99.5.bb => upower_0.99.7.bb}                | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/upower/{upower_0.99.5.bb => upower_0.99.7.bb} (86%)

diff --git a/meta-oe/recipes-support/upower/upower_0.99.5.bb b/meta-oe/recipes-support/upower/upower_0.99.7.bb
similarity index 86%
rename from meta-oe/recipes-support/upower/upower_0.99.5.bb
rename to meta-oe/recipes-support/upower/upower_0.99.7.bb
index 9314534d7..973fbe771 100644
--- a/meta-oe/recipes-support/upower/upower_0.99.5.bb
+++ b/meta-oe/recipes-support/upower/upower_0.99.7.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0de8fbf1d97a140d1d93b9f14dcfbf08"
 DEPENDS = "intltool-native libusb1 libgudev glib-2.0 dbus-glib polkit"
 
 SRC_URI = "http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "ec57b4b7bf0af568f9a7a5603c921d97"
-SRC_URI[sha256sum] = "78605664d027c788f6ab63c50950be6e86c6ba5d030c4cf35a6664337d87f3b2"
+SRC_URI[md5sum] = "236bb439d9ff1151450b3d8582399532"
+SRC_URI[sha256sum] = "24bcc2f6ab25a2533bac70b587bcb019e591293076920f5b5e04bdedc140a401"
 
 inherit autotools pkgconfig gettext gobject-introspection systemd
 
@@ -32,8 +32,3 @@ FILES_${PN} += "${datadir}/dbus-1/ \
                 ${datadir}/polkit-1/ \
                 ${base_libdir}/udev/* \
 "
-
-FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
-
-
-
-- 
2.14.3


