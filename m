Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 28B07786B5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:45 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id e194so10692325wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=d48NNfJ6UiIatOA7gVPwL3N8BCYIX7JV5LzhYRNkCiA=;
	b=HuOARw/bjeY5KNPpSTQwckA7PdwtzXt/yqhz6ukN4e+o4WAQWI7z/c97usg5NMWNgh
	+O5o0zoq5E+E5yItdrPixwk6gX0GYiU3+XRcpOsJ+1pdd1COU48wIvZiBadrzNh7YriJ
	16Sco3DF/ScVWJI+J1LoVQArnaWDW4yUHeDlpG03WEA9PcSjPkjxg0ESjGhLC7j8Pqek
	dbGf0Bc4TtIf1qsbShBKMnomhj7Pns659fr3tHPyFLCt9S1JwHPLBRrbrLNXSQf5pG1/
	T7Dy9Ag2Xruy7WPdjd9OGLqC/Rw4ME4LKWGaCY+c6xWgGmFeMa6Op2lgT6KIssj2h2C8
	r6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=d48NNfJ6UiIatOA7gVPwL3N8BCYIX7JV5LzhYRNkCiA=;
	b=U6T7EZZzZYV6VmqvoLrioRn8exTLUzYLEhSXGq+m7nEYkq/R/EUJDsN60iepfI5L/z
	2dSvly7xxwnENUKYAMJN7sdWIG9C15Ck/vuchyfsPEAscGqnR9LqUUzptpzbyDizRRT6
	7/UKHpRoRXYp+kJfWdo/SxSmZlX0i7KOGn0Cw7AmpD0qdyeYVEyZNOqYDKNwHMujJM5+
	Pm/HAX0f1lOklutayUw53b0UFyzTAGQSpZzqoSxl0IMXOHvrvJJwnotdKxBaZMmUanHz
	hHw6zXa76MSp38XkHbQTsfuunoLXnVS5zpz6bmReaqW0xbdZPiQdYHXehYUJYIT83H0W
	Lp7g==
X-Gm-Message-State: AElRT7HaO8c3RU6Ehf4WDpIDSSCnHTK+//+rR/SOBKHsNXPSS65Pm+4t
	Ebqrb0NZgjITOOnmLNK7f6B5BQ==
X-Google-Smtp-Source: AG47ELuqJacCpDHAA/cn9lSpWCkfKpX3cor28hz2Y7mluIIuVEwWnbPLt0t+AOsVGBQmi5epj6pfig==
X-Received: by 10.28.27.194 with SMTP id b185mr13965228wmb.57.1521981345999;
	Sun, 25 Mar 2018 05:35:45 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:15 +0200
Message-Id: <20180325123520.16452-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 15/20] libgphoto2: 2.5.14 -> 2.5.16
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gphoto2/{libgphoto2_2.5.14.bb => libgphoto2_2.5.16.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.14.bb => libgphoto2_2.5.16.bb} (92%)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.14.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.16.bb
similarity index 92%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.14.bb
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.16.bb
index d7290fa6f..7a691c611 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.14.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.16.bb
@@ -16,8 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
 "
 
-SRC_URI[libgphoto2.md5sum] = "65acb6cbd2b4f3f46829599f5dabd89c"
-SRC_URI[libgphoto2.sha256sum] = "d3ce70686fb87d6791b9adcbb6e5693bfbe1cfef9661c23c75eb8a699ec4e274"
+SRC_URI[libgphoto2.md5sum] = "084d220d078d28c0c7a3ba13f4476128"
+SRC_URI[libgphoto2.sha256sum] = "e757416d1623e01a9d0d294b2e790162e434c0964f50d3b7ff1a3424b62a2906"
 
 inherit autotools pkgconfig gettext lib_package
 
-- 
2.14.3


