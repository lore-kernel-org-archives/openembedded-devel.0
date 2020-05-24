Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.13135.1590325591972391864
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 May 2020 06:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=GnmGGHxR;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 77EF76010A;
	Sun, 24 May 2020 15:06:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1590325586;
	bh=6kwt1hyWKfX5MmHW1ETTto0kfs5wa2z2V52AU0C3YQA=;
	h=From:To:Cc:Subject:Date:From;
	b=GnmGGHxR6s4AxTxxYOZyo000C3N1OHMLatFDvx7EHi5vS3zJWhECR6asTcaj68QJM
	 oNqNnkpEACutQtmXmTjM8nmcdwaJJUBMF0B37Pl94WyBJo/+MOnKg1aY05RlI09rn4
	 j3xHyruIAdZ09vrlJZTnT4ELUbeVTL3FgTJPFOiwc/1Xigojns1N3RNO9fNN0cMo78
	 UFovNxb5QlpKfDfqzEcQHTLHUFAlsCk7BbZKMkE8JSPvdXTtDuOXzIryz3ATQySYEB
	 eKVJ9TDqF+yybS4FKtPVUC5E6mysJ/CvSm5c2pxhQfPbJ1lT3eEZdm9Iw2cOGBTn3f
	 LMFGiXb/oZg0Q==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 1/2] ser2net: fix upstream check URL
Date: Sun, 24 May 2020 15:06:20 +0200
Message-Id: <1590325581-32242-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Fixes:

$: devtool check-upgrade-status ser2net
<...>

INFO: ser2net                   4.1.5           UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb
index 0df134e..05d1ffe 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb
@@ -12,6 +12,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 SRC_URI[md5sum] = "52c5e56d2d54ced0cdeb764a7e8fec92"
 SRC_URI[sha256sum] = "df904d271eb161c265c956f0cb938dd0a375dda4a919a344f73b08bc50b9f308"
 
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
+
 inherit autotools pkgconfig
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

