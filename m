Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 80B0D78283
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:00:36 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id z6so17027289pfk.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ufWA5wUVtrZZbTG2s3oQ+RH4VtTn+2b7cvbo60WEq+4=;
	b=rmfj+01JMVjlR3tEHB/F9Yu11T+DMV6YD3JP1fbnLa/excjPf/z690fyW4AocwnP1q
	/NDJI8hlfMipjGokdBTnJaYcRseK8HkV46PKSWaMA70YptQqncGdOGprDbAqDtwEU0+5
	pBTugI9Za0PvLvFPLuwDxfCLhBhGMdeoZwvYNBi63Qhj4+qd4skDSgXbH6IJcuvVzW9b
	hdTJlBIMOAGVkcabWtBsKGf1VDEmgBfEaDfJx0LYoM9q2051NHDmYwLyl4FAy2tneVbj
	zdUeVSpjke4I7RKG52fuFs/X8ZeNRFdRJj6QABXN2Rro/aI2EIiJ7aU9+Ocb/r1+wM8Q
	Lz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ufWA5wUVtrZZbTG2s3oQ+RH4VtTn+2b7cvbo60WEq+4=;
	b=bi7u/zmEL4hRrZgJ30sqrEB9FUywUkn2uVG6FGQxCnaKXHzAXD3twTooBIwUIzeKKY
	jOIgakEI/tOMDsNznsmPAAOxrLkEH11NfFSkfTIAfeyTYSm3YVcOOwKb/qK/sJ2znsZA
	VqBl4TRUVDJ26vsPpXladFWVhwL9TRjgz2RK3lgxWQWyxvwPUdMK3VOaL8yrMIGq0g+f
	/i9WBlMIxvRdOkO6DsxJg4QzmbWd1vFSLGeifgm7b6Z1lt5yykGBL0sCPvKNqUDeq1S/
	jfcIA2jSVcrYb5Kgd7BVZ3nWnpJEWxg9JivAZ1uO3n+Vd/jNy3DeWqgBtOxlAyE31ruQ
	vshQ==
X-Gm-Message-State: AKS2vOxmb1Nkq68HQgCHzXQY2U39mzlQuo+i7KszQmsrOaIuGB9yxQ9Y
	/rUGkeisGLugyzFg
X-Received: by 10.84.231.134 with SMTP id g6mr14035994plk.241.1498827637826;
	Fri, 30 Jun 2017 06:00:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm10735590pfl.41.2017.06.30.06.00.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:00:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 05:59:57 -0700
Message-Id: <20170630125957.3342-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170630125957.3342-1-raj.khem@gmail.com>
References: <20170630125957.3342-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 17/17] openhpi: Fix build on 64bit platforms e.g. aarch64
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
X-List-Received-Date: Fri, 30 Jun 2017 13:00:36 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
index db2a24a9b..16e58dc73 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
@@ -54,9 +54,10 @@ FILES_${PN}-libs = "${libdir}/${BPN}/*.so /usr/lib/${BPN}/*.so"
 INSANE_SKIP_${PN}-libs = "dev-so"
 RDEPENDS_${PN} += "${PN}-libs"
 
-PACKAGECONFIG ??= "libgcrypt"
+PACKAGECONFIG ??= "libgcrypt non32bit"
 PACKAGECONFIG[sysfs] = "--enable-sysfs,--disable-sysfs,sysfsutils,"
 PACKAGECONFIG[libgcrypt] = "--enable-encryption,--disable-encryption,libgcrypt,"
+PACKAGECONFIG[non32bit] = "--enable-non32bit-int,--disable-non32bit-int,,"
 
 do_install_append () {
     install -m 0755 -d ${D}${sysconfdir}/${BPN}
-- 
2.13.2


