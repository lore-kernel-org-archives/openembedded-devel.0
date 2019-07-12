Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 347777F14F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 20:24:29 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id r15so2386742lfm.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 13:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=7+fHxC0VnDbrnPwTjfVRr6PeKrUk1lxOWn9LnFgP+GQ=;
	b=EvM0dzL015jMAQfoXF5zdqjj99P6s7x76dI0dMRbZyFyO2YkbO64Kp34C1h04w3E3D
	7Molka/WL8eqDun3p0CucEJgD2iX+LClSOmDrYIOrF6Dg7iiQTJ7isgE1i0tbT/3RSxk
	2LXx6ftv2VWZ5LyAEs7XQ+TubMDKGbrMnoTBApi9xq3Y3tUzQ3Rubf+A0EvYnw7bX9sI
	3YcZzhBsKocDNP7c5jsAkfaX+zt3dFqE9OEIvsGKn4H+TCHWx1+DHLdP9o0fPnqAIUDo
	aFIOFQfn9GU9g9CBeaKzNGkEU3G70wnIZ12x3RBJ7sPRGgIao1MN3UHMQN4Y8zpvk7re
	n3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7+fHxC0VnDbrnPwTjfVRr6PeKrUk1lxOWn9LnFgP+GQ=;
	b=hg2EsYfDgdeoerGWbyh3E9cflbJmCGbMp030OuAJ14dYv41esdhxCS37XP1Uf9fKA2
	HsumblEhYcAdK7cozXhgrg8BZCzGvQAvHDgUsFOC2iqae+KHlsvgY+TvmnRKw4/1gSsd
	g2FxmFtqVJdAS+izTrcXQNL8xOOEmz+R5yNJTXPj6Re+ntP/X2S/xTgQo/JabPWV6VM1
	0scwcfzIyW6m01ZxZSdp1jBmZdsyoNNehmduG/2rpb9jjBoii+l1UzYpFbEYCODbkYyg
	OoHUrMiXqZxjIGLZEzxB/ZqRfpPiy2iZK/pQGhCXXI+uYPgnahru524quEY1WA6WLRuH
	IoGA==
X-Gm-Message-State: APjAAAVl1yHKrZq4KmkDWv+E0axso4Bhd5trR9AYe82Lj3UeTYrD7Atw
	8hkhltOiVCCUG0rUZsmaBlaIeD4u
X-Google-Smtp-Source: APXvYqzxZfAvN37Lh4PWeFzZ8h75aNi1BYdWfyDvwpmX4rWad/vXnw3oHSeqz/L6O578UIZj7zNGgg==
X-Received: by 2002:a19:e008:: with SMTP id x8mr5626257lfg.103.1562963070528; 
	Fri, 12 Jul 2019 13:24:30 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	s26sm1599168ljs.77.2019.07.12.13.24.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 13:24:30 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Jul 2019 22:24:28 +0200
Message-Id: <20190712202428.13462-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-networking] uftp: update to 4.9.11
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
X-List-Received-Date: Fri, 12 Jul 2019 20:24:30 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/uftp/{uftp_4.9.9.bb => uftp_4.9.11.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/uftp/{uftp_4.9.9.bb => uftp_4.9.11.bb} (77%)

diff --git a/meta-networking/recipes-support/uftp/uftp_4.9.9.bb b/meta-networking/recipes-support/uftp/uftp_4.9.11.bb
similarity index 77%
rename from meta-networking/recipes-support/uftp/uftp_4.9.9.bb
rename to meta-networking/recipes-support/uftp/uftp_4.9.11.bb
index a64d081cf..8b47bd16f 100644
--- a/meta-networking/recipes-support/uftp/uftp_4.9.9.bb
+++ b/meta-networking/recipes-support/uftp/uftp_4.9.11.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/uftp-multicast/files/source-tar/"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.tar.gz"
-SRC_URI[md5sum] = "154e2c82a33fd4999040f8836e2dca2c"
-SRC_URI[sha256sum] = "c04bc75a88fc3d57504269f260be4d0b1bc440508b5a5ca587df6c16b771aa48"
+SRC_URI[md5sum] = "c0bc86b3067825a3866de9ef80c7451a"
+SRC_URI[sha256sum] = "2ddc835a35f669d55df27ab6883ba19bb00bc8e4b66897ceaedb160b02246b1a"
 
 DEPENDS = "openssl"
 
-- 
2.17.1


