Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id A65417E09C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 14:08:48 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id r76so5194562lja.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 07:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=JdqJYfni07Tju8GpDwa3EBcjrALgrqREan3uYTh7o1k=;
	b=WAYSveby6fZnMva8LckI4X9AFcLDWmPa6GdLiPJvhZbLH4pxTwQ8lmmaKG6YxIsQmC
	j1DC5Z8E0qhXvlxBPQ6pFh5pZECUtXScsgii9YrMq95n7nL2Q24T4eGbE+v/vRRwITgG
	Vu6cUXkuQCHVz6Y0TBHQpgDvrRwGlJMKyFgXJzlyNeaMhpmrOaZONHFK9NEbjITO+xkh
	/FkPMK9cLdT9w2SGerRCXMMg4SL2OGGldiNfn8I/zHWOQ7eFcEgLUmxhBtW6TVEUPNF2
	gqlqmMNFVJOcZykheZ6sw9PY7KXXk2qhhL9bs+jodHLiTKCODnIcS5hz4MQT5AWYTH98
	Dj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JdqJYfni07Tju8GpDwa3EBcjrALgrqREan3uYTh7o1k=;
	b=Lb2Q1OoPnslueV/XM6OkPP1oHf4BGglMYq9Qja8B2lS4JHAFy/TePCbo2EQNikE4zc
	jqo/O6Hda92wkzt+xZHSlAAL+CXfCwx40uOZb+v0W6XY2e4aAflBPhk1X/ds/NT1BDCG
	v0MgWVsvAETxhDY3IG+TgvDC/TUr3K9OfcM+8GNCSvSaFP/7YYgNr5KMrPJbSQcgf/6G
	3ZufDVr2dlqDT7buqSWvgvPiK34bhdwXW4io9brcgj78I/CaZU9mx66Dy7IIxluYv6Dq
	Ix4uvEn41r+np5AqfvXmZ2Td1Ss9pPawOcyMdZ4kMsTslsiGOolIsJdbUb+VR69TZq7o
	KLYA==
X-Gm-Message-State: APjAAAU9yeWag93TSHGe3WjZEanpfkwtV4aYCuQiKk8wqVrQqEjPOV6N
	DpcW1S4ezpn4w5mijnhLd4gY+AazZNY=
X-Google-Smtp-Source: APXvYqyGn9EM9hVf2O9qwCuUVAZ2KtH14dPuBKdUgZBA2NaPj8MHQFpLgGmP5WIPt+Ws/x1YoNAJKg==
X-Received: by 2002:a2e:8696:: with SMTP id l22mr6518168lji.43.1557497328720; 
	Fri, 10 May 2019 07:08:48 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id n1sm1383640ljg.84.2019.05.10.07.08.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 07:08:47 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 16:08:41 +0200
Message-Id: <20190510140842.17978-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking 1/2] libnetfilter-conntrack: update to 1.0.7
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
X-List-Received-Date: Fri, 10 May 2019 14:08:51 -0000

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


