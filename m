Return-Path: <net147@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 014BD763F0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2016 10:43:45 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id x1so1828548pav.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2016 03:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fV7j7vFzKW/hzRoFUsVtQ4+WB8PptgFJ/Up6ITDIvXI=;
	b=qjTvZIDnx3sY2uWCjMTl0A/RGCJwwrQ0xz/4HUaaK6RUO2zwLj99YzZp+pzCQUMgOY
	eNwtZtRSbyaeYEumgiLHtHZnf8l0UFIrY6UQJyEVJKDgeCrOQ9bDFVOLwLHx1hNrwE/+
	1MUKzP6D4iU5JVP/rFOafSbOiU/JO32khOdBiWUynpawOBQRLg4e5BueTJqWTf73aIaQ
	uP5STtdxTBCvXy5UaeT5mwvn6IFaexPw64Pg+25B8NHOKGfZ0Phe7AYs03/+pN49gQg9
	g+w+vyVj/n7/aJyx1rxEl3mMi/fP+0maVFyz1aHBSytz76iqjeWnvffOEaV2agwAt21A
	5m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fV7j7vFzKW/hzRoFUsVtQ4+WB8PptgFJ/Up6ITDIvXI=;
	b=huag9UIhJT3jUL3PxyIk/cEYgZJmWOcSnMyXban0jtZqmAR/rKT+bRfgCCCL9wpCeF
	3vweYvKsBR/q9DhHFgW1zmqSczurFFYqjh34JnFrmIV0gkIcrMWgnLeXL3rPqHIJKItS
	PYR4QYh+gKaGs01s0fLnm/ZdEj7gnmIig062Ha6Em5SxwHU0ID8B8XSV6xilnfBd/g0t
	p7P8BduuX5JxT/00dlx6rcgQMuhJTuxeAVByvtPe7jod3t9dd432NJiCyJGcaLVOmWXS
	ujWDOg/N2Byv3akgTP7iBec6+ljYUEKw+rx7i3xoRnfRK2g4xO0Wn3N5Bm1rTsWmQfFR
	6I1Q==
X-Gm-Message-State: ALyK8tKHcDqxUYwIEb5CD4u4wLxY3pnI252OsPtSRJ85jgiZGw03tESa5HEVTKdFSMhUfw==
X-Received: by 10.66.122.73 with SMTP id lq9mr37302122pab.124.1464518625982;
	Sun, 29 May 2016 03:43:45 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	r86sm25442065pfb.21.2016.05.29.03.43.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 May 2016 03:43:45 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2016 20:44:28 +1000
Message-Id: <1464518668-7669-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.8.0
Subject: [meta-networking][PATCH] libldb: add missing libaio dependency
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
X-List-Received-Date: Sun, 29 May 2016 10:43:45 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-networking/recipes-support/libldb/libldb_1.1.26.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.1.26.bb b/meta-networking/recipes-support/libldb/libldb_1.1.26.bb
index 5458d47..e657e52 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.1.26.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.1.26.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://ldb.samba.org"
 SECTION = "libs"
 LICENSE = "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
 
-DEPENDS += "libbsd libtdb libtalloc libtevent popt"
+DEPENDS += "libaio libbsd libtdb libtalloc libtevent popt"
 RDEPENDS_pyldb += "python"
 
 SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
-- 
2.8.0


