Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id E9BAF6010B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 10:21:42 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id f3so1580739wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 03:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=k3GFlTPrnJRTj4kqZoF403BCTa2YqpkK85rTz+p5mXY=;
	b=Jtch6/FFW/z99h8yJLoKSdRm/TyXD4RCMzJkmXLN276J1d6U4GIkv9zFqA2L/PXKHK
	Rt0bG1Vdaqevym4xEFgcrEtklfamSxXw24WX/WbvJbzPSD5AJo9S3oSIeSNgWugZOshI
	funTZS/ZLQcA8np7w3oSVN5L4lKp/UJ7CqXuwp0tQIYItyZaIZNyKt0w82l0RFsULooV
	bwSm/Zg8XhJj3OvtsIij90yvP7pvAhLSQT63YExfo+hfaFdZDFDukvxYLnM8zms4eaun
	2VXCEOuyHkvbwCIb9jjyhe0lRdTagp5ZZrayFTcHFUr000X05I/i82J/eUmeYQdDlczJ
	r/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=k3GFlTPrnJRTj4kqZoF403BCTa2YqpkK85rTz+p5mXY=;
	b=adnQQ/+j7EnU9YpL7sLhfjkItujETxIAhZvHqULDOXu0xuzvAZVjrxwoSM4A0nfTrv
	eIg/KE4/2ivM/GNGm0Ynw87gUHhsM1gVA278/0a6vaWWf61uuRYPhh0gT1lNODMHqdIz
	oGHabgGZGAA0jVs8IWiBOc7ttsiGDmvkOWcrLhE47gnDqFpex/G9PJTH6k2/+6kozgpz
	O8zzLjmhWDFoz74vQLn5bVeYEfyh9s50cIL13W2aEF8GqnYW9cxaWo5uogWL2n+Fucjc
	uUj2Npn6U//Aj3kGG/ojEVFrCv2J0aRnvXTErTY0h3nga5NX3MNBSB6XDq0ptxy83HCC
	3zMg==
X-Gm-Message-State: APjAAAWo8D29ic/OS6h061NQr2GIbSoRM+HpDncATlkFHDFOZCg+Qd8+
	iE0xwwBuM5I401lchdbpqCiDg/0K
X-Google-Smtp-Source: APXvYqzYlEF3HsZ3d0jMinAtcG5EyuNaCqYFKFdW5PvqSu9iMd8eDzoao2tqRU+XY9/Cc0GHR+0hLg==
X-Received: by 2002:a1c:4641:: with SMTP id t62mr2621718wma.53.1553250103443; 
	Fri, 22 Mar 2019 03:21:43 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	t69sm12255677wmt.16.2019.03.22.03.21.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Mar 2019 03:21:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Mar 2019 11:21:20 +0100
Message-Id: <20190322102129.5067-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190322102129.5067-1-schnitzeltony@gmail.com>
References: <20190322102129.5067-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/11] glibmm: upgrade 2.58.0 -> 2.58.1
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
X-List-Received-Date: Fri, 22 Mar 2019 10:21:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../glib-2.0/{glibmm_2.58.0.bb => glibmm_2.58.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.58.0.bb => glibmm_2.58.1.bb} (89%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.58.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.58.1.bb
similarity index 89%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.58.0.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.58.1.bb
index 77774585d..87ab0cbc5 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.58.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.58.1.bb
@@ -14,8 +14,8 @@ SRC_URI = " \
     ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.xz \
     file://remove-examples.patch \
 "
-SRC_URI[md5sum] = "4a0402ac65a7c47424b4e21b81b079c0"
-SRC_URI[sha256sum] = "d34189237b99e88228e6f557f7d6e62f767fe356f395a244f5ad0e486254b645"
+SRC_URI[md5sum] = "77f1016cbb27e15d4e04a2b7bfdb4cae"
+SRC_URI[sha256sum] = "6e5fe03bdf1e220eeffd543e017fd2fb15bcec9235f0ffd50674aff9362a85f0"
 
 do_install_append() {
     install -d ${D}${datadir}/glibmm-2.4
-- 
2.20.1


