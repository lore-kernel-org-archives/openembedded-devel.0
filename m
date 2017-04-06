Return-Path: <oliver.graute@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0153571A8E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 14:46:02 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id t20so65897321wra.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Apr 2017 07:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:mail-followup-to:mime-version
	:content-disposition:user-agent;
	bh=+qpa2MzeDftiNIAHoNCer0zeDVNqJC7ZOENGiNPJtKA=;
	b=HivGqoiZqg0Tb4d5UDPkAIC0DgI5LQZA1IPc+OcXQQVfVYjM9z6ltWInhxH65EFWcC
	ZHMxl+tO4V+zj0bFchyb4oClhgRXJuYnIuXs5qzqx0ceHvexkUW1gV9ePfFsWsavQ1DH
	6diHFoC0h1CJ2u3vz3M3pr4c7ADS73a5bLZjHENfIyaKSe9QXwCTq2iIo5GbSXo5UX2F
	NvrkAKitcOquvhchLXwjstegCpCyQylosQfkGo2ZGvsBdSPbJHv40MQFIyRJyZFdmQSK
	32M6LiTzy4+qIEfvkUEukx2pn/jRUslqGR4g/9U4bdaxCyI2Day9+xa/AkmvcAHGEbYv
	9Vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id
	:mail-followup-to:mime-version:content-disposition:user-agent;
	bh=+qpa2MzeDftiNIAHoNCer0zeDVNqJC7ZOENGiNPJtKA=;
	b=KH0VG/eb10fROuKwg8pzEg/fAk5C4mdXoRCTOxOVEZ5JJnax0SJQu6IaZ8z0dwxAEQ
	9GXz/BPWW/GPCzEs4puoTs8HlBwrcofSYoQZ9sefhq/Zsub0UdMXrssULmFlCZkni56b
	NkIVs8KD0j1E9cnksQ7fRSaFF3XiqGSvF5xDWGML/e9wEsOflPe76JQSdDdAydVr+biZ
	gE+HIdT2JtBo7k1uiitSLgwu1V6ho6qF2rBXP4at7ss61OAyD6C5lJTZaPSuAz6HGBYz
	HpmN7O0boeM5Kyk66az4D3YLCy37B+iMjMnFQlWxthaGMnJvzQo9xxkVz402oLkVP1v/
	4KDQ==
X-Gm-Message-State: AFeK/H3EkO+3y3q0TQ6v5tOAFBF1e1vJPVAGhDL4RgGf3QSvyTyL6tc9/yNmzMTiqWCkqQ==
X-Received: by 10.223.183.29 with SMTP id l29mr32631782wre.42.1491489963284;
	Thu, 06 Apr 2017 07:46:03 -0700 (PDT)
Received: from localhost (x55b0f93f.dyn.telefonica.de. [85.176.249.63])
	by smtp.gmail.com with ESMTPSA id h20sm94470wmd.29.2017.04.06.07.46.02
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 06 Apr 2017 07:46:02 -0700 (PDT)
From: Oliver Graute <oliver.graute@gmail.com>
X-Google-Original-From: Oliver Graute <oliver.graute@neuhaus.de>
Date: Thu, 6 Apr 2017 16:44:51 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170406144451.GA6861@graute-opti>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-networking] [PATCH v2] nfacct: fixed SRC_URI and dropped workdir statement
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
X-List-Received-Date: Thu, 06 Apr 2017 14:46:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: Oliver Graute <oliver.graute@neuhaus.de>
---
 meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb b/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
index d92f7c0..8177ebc 100644
--- a/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
+++ b/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://netfilter.org/projects/nfacct/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-SRC_URI = "ftp://ftp.netfilter.org/pub/nfacct/nfacct-1.0.2.tar.bz2"
+SRC_URI = "ftp://ftp.netfilter.org/pub/${BPN}/${BP}.tar.bz2"
 
 SRC_URI[md5sum] = "94faafdaaed85ca9220c5692be8a408e"
 SRC_URI[sha256sum] = "ecff2218754be318bce3c3a5d1775bab93bf4168b2c4aac465785de5655fbd69"
@@ -11,7 +11,5 @@ DEPENDS = "libnfnetlink libmnl libnetfilter-acct"
 
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
 
-S = "${WORKDIR}/nfacct-${PV}"
-
 inherit autotools pkgconfig
 
-- 
1.9.1


