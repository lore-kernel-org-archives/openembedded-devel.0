Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id D679A7E2A4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 21:13:51 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id q16so96617ljj.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 14:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=DLywm6bY/vjS+N0qJrKeQcTSwaGhaYn9opiabnBJjUQ=;
	b=EVWpxROTBQvxIH3EOLsnzK6eIE1p44r+TZqbYhJIEns6y+xNUUTKnNkEjAXrr4r3FW
	I1b6/1UMDNEjnvMJEnvi13IzAV3KS/8p+sUl/a+Ym0bhU+lFM31v5Ztp/ZQ9uCWnNsQH
	dOfGsRsuzG9hDhDx4HTmdj00LTvyj87wk6y5ZR9oA5dRnUVWXTjbecIxww695lFtWKzP
	CZkZP/8YlqFdlwkZ4Xb+SxKbQns1Qq3TSrySJOCKvxbuiKf+luQkmM7oSmrsclrHEtOc
	1uCD4TQcrFlMaf36wNhrx2/mCV1q3xV5OVYIEHJc5JYUG/tyQJMsdrT2pV1CXZ8zRrqx
	qiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DLywm6bY/vjS+N0qJrKeQcTSwaGhaYn9opiabnBJjUQ=;
	b=hy0jhsl7SC/xeytl96np2Fy8SBW9yFQVO1S+Dhv3+nu+OLkOW1eMMoLPqMUwej3UIv
	F1Otoga8gkp/d0P81GnU/cJnuPFcickI2zYcKP36N6oa31OCzNEtVyShKiuFfMuaJ7zC
	GbP4u9S3nuehADcB6hgSI3LlbU2LwcCJYIN/cn9RvKhbrdUDiAMPMjIGnuo3IIB4ZhGr
	dYyFqsBQKCpXCd7s0JrH5oM9RmGZTOVgowbEfUJ2MV2ZV24KD+bM+bNezbgZdViGaYQJ
	ytLUYgj0tFRzC/KGcTlFNzieJXnvdkal5hG+nlKrZv1pEullDSmBPyvSwm/KQhEWl0sX
	TQyg==
X-Gm-Message-State: APjAAAV8FcLRcG+RwLDblqDQj/5BQVwWg9hNLCudEp3cgPrWLg+0Tu9K
	etGEz0zE0Od/4ZtsL+meJ03Hu03lEwI=
X-Google-Smtp-Source: APXvYqzQukA+jAalxjtBwNEakQUHD0QNa4bmsKt1q8T8ka8DLFuzygpY8sYnCTfXkd5V7zohfnKISA==
X-Received: by 2002:a2e:9cd1:: with SMTP id g17mr2724865ljj.191.1558473232352; 
	Tue, 21 May 2019 14:13:52 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	x23sm4878500lfc.25.2019.05.21.14.13.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 14:13:51 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 May 2019 23:13:50 +0200
Message-Id: <20190521211350.28651-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] nbd: update to 3.19
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
X-List-Received-Date: Tue, 21 May 2019 21:13:52 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/nbd/{nbd_3.17.bb => nbd_3.19.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/nbd/{nbd_3.17.bb => nbd_3.19.bb} (78%)

diff --git a/meta-networking/recipes-support/nbd/nbd_3.17.bb b/meta-networking/recipes-support/nbd/nbd_3.19.bb
similarity index 78%
rename from meta-networking/recipes-support/nbd/nbd_3.17.bb
rename to meta-networking/recipes-support/nbd/nbd_3.19.bb
index 356023681..a6da18ea7 100644
--- a/meta-networking/recipes-support/nbd/nbd_3.17.bb
+++ b/meta-networking/recipes-support/nbd/nbd_3.19.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "glib-2.0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "98b74c655ed94a66686c5ba19480d98e"
-SRC_URI[sha256sum] = "d95c6bb1a3ab33b953af99b73fb4833e123bd25433513b32d57dbeb1a0a0d189"
+SRC_URI[md5sum] = "162da84302abb5b9be06143c7943a642"
+SRC_URI[sha256sum] = "b4466412f13e057659f25d35e1e8e181afd62c7179bff22a6add81445ecb8690"
 
 inherit autotools pkgconfig
 
-- 
2.17.1


