Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id BEFC67D68C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 22:22:21 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id h126so1854517lfh.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2019 15:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=JdqJYfni07Tju8GpDwa3EBcjrALgrqREan3uYTh7o1k=;
	b=OVfUfTuKouE4KMp0W3DTpGFj5iNb0C5VTAd4NJA7R8+Mn3R29rS6HcxXqF4UkQLpJt
	SS6mOUw55/o1Mol0WCPC3WaDHjcAU3CzQedFDxcSuNzBxOFRYuNqoiOBg6cXmffWB9+r
	6ptHIAM8K6R3437NrfaHxOvyhsjPUusrNnm+X5AbIYqJ+WGAjcuUuUyGckR8EXtQOa0e
	YBRWLduoxielX3k0rhuC2pUquTR67gLHJtVxv5gtvmaaQr0AsOynuf6umrI5U1PlZqM7
	uQ6TT7qhZvye/IHDmqTZd6BG3tEJhbe1r9idNTOUZjK28BIcpMNYLqJQWZikqNSh+5eB
	jN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JdqJYfni07Tju8GpDwa3EBcjrALgrqREan3uYTh7o1k=;
	b=MSymRJJQBYh73Xq8sT7B/hCJ1gM3c3HoNlzx2P7AVLWHOendPuzQS6pbrer75vh3Hy
	y1zs2+4gDSzJStldPvSAHpaIjbrfoGie/ByOdRgXyjH0KaalEOFDK6rmq3s5w+ZGOqGI
	GMgVe+MQlQfNhvoDj4p8C7zQj/l+aEHRveN36UONE6U9A207Kfpmkb5U/iaQ5Q/MDmow
	3JDdb0CBG6nB/LAvGKcGea1eV0fmj7tVysgtgSL+u/RC0OixLfKCdxUI7LnZdeyjnCz1
	byFvqWHdG7BWiDCx7pe8eilngxnOZjA89yQMplokbgr7XwRKDI0kWq+Q0MhH3jK3Glfp
	N+RA==
X-Gm-Message-State: APjAAAVpimRHOtYVFEp0C4IlX8QFVuKw9XFy304c10xcy+wJl2VReRm7
	GPiJzaDlVAM0V3X+hCY5ZqFVnulx/N4=
X-Google-Smtp-Source: APXvYqzqHcIGlcUclW2b+TGqJEjkmkwbiuHtPuG8mKaKR7sbtiMfymJe/X7Rn2fOdf1hjgtN100peQ==
X-Received: by 2002:ac2:51d9:: with SMTP id u25mr16325122lfm.91.1557267741886; 
	Tue, 07 May 2019 15:22:21 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id r5sm3746525ljh.27.2019.05.07.15.22.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 15:22:21 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2019 00:22:12 +0200
Message-Id: <20190507222212.1808-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] libnetfilter-conntrack: update to 1.0.7
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
X-List-Received-Date: Tue, 07 May 2019 22:22:22 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...-conntrack_1.0.6.bb => libnetfilter-conntrack_1.0.7.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-filter/libnetfilter/{libnetfilter-conntrack_1.0.6.bb => libnetfilter-conntrack_1.0.7.bb} (63%)

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.6.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.7.bb
similarity index 63%
rename from meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.6.bb
rename to meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.7.bb
index e4e186bdb..5c8150156 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.6.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.7.bb
@@ -6,10 +6,9 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libnfnetlink libmnl"
 
-SRC_URI = "http://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2;name=tar \
-"
-SRC_URI[tar.md5sum] = "7139c5f408dd9606ffecfd5dcda8175b"
-SRC_URI[tar.sha256sum] = "efcc08021284e75f4d96d3581c5155a11f08fd63316b1938cbcb269c87f37feb"
+SRC_URI = "https://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2"
+SRC_URI[md5sum] = "013d182c2df716fcb5eb2a1fb7febd1f"
+SRC_URI[sha256sum] = "33685351e29dff93cc21f5344b6e628e41e32b9f9e567f4bec0478eb41f989b6"
 
 S = "${WORKDIR}/libnetfilter_conntrack-${PV}"
 
-- 
2.17.1


