Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.7739.1586003791367361503
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 05:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=YKXL+4Yt;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 0BA9D600BB;
	Sat,  4 Apr 2020 14:36:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586003789;
	bh=4rVEeinZvMqSYKZKj+kCzhkHhnc/zPaRImmaKUZ3K8s=;
	h=From:To:Cc:Subject:Date:From;
	b=YKXL+4Yt6LN3XoBuUQXmCFrdF7A2yuCDhK2xGRtsOshQfpVpVLTZHlkecnw0RH/zr
	 UDuwbVqsc6g016JKHDUPNtEOrsSYHdkqCpAA0sftHwb7YpvqvH/Yn/ug+BY+T5gi/f
	 posDUSGCShGMc+k/GUlA0KLJFT0Z1z8R/Y4BSnm6yauw4S4wcDnbR3fU8fGQISoP35
	 QA0taULUgmrLVOJi856J1Abzyt4Xpy00Z4GdAUKQZNS8RTmdBLxiKxEUzTsYwOXrPB
	 NiL+SxheeUXD0sIuPWgPCACEXCykF+9D76qnqarmtVhbfp4dC8M9/VDIoAWZHBhb0P
	 OYDVDtudN5g5Q==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-networking][PATCH 1/5] opensaf: fix upstream check URL
Date: Sat,  4 Apr 2020 14:35:57 +0200
Message-Id: <1586003761-12873-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Fixes:

$: devtool check-upgrade-status opensaf
<...>

INFO: opensaf                   5.19.10         UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb
index 8ce8fce..3ab4757 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb
@@ -31,6 +31,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "9b61df01d1a092101c4a626692edae19"
 SRC_URI[sha256sum] = "6da9af96e8ee58d11031d305bf4804a00deb6108e12e422722882a2091bd34bd"
 
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/opensaf/files/releases"
+
 inherit autotools useradd systemd pkgconfig
 
 USERADD_PACKAGES = "${PN}"
-- 
2.7.4

