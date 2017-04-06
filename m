Return-Path: <oliver.graute@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id B619177A87
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 14:41:09 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id w11so60307209wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Apr 2017 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:mail-followup-to:mime-version
	:content-disposition:user-agent;
	bh=+qpa2MzeDftiNIAHoNCer0zeDVNqJC7ZOENGiNPJtKA=;
	b=tgCzg3jBQGvizjtfHa9gSKKaCJ8zLA7PC/wN8/0827Wm1/RFVNYv16Jlu+YNa3Xuud
	VhgpIbqQ6H/SZxQT+QAR2yzBaRwmdfS3DwQiNXnnO9yXKdCS8DND/Yb2a/LPp3h+npCu
	GBSBPU00ypbUDd51YHRVYc51DLWA31dE7piw3rpcQvbNr7PptpfSbVIB0cmAaNlSkvMX
	h3dEYMG75zn2UC1gQQy1K4tun/015xbN/AwbyYB8HHLKsFH4C1cl7YImdh5ZylJ7yKPP
	+IliPk4KOCbvu6hLLE/vmcG4Eq2SLE4+/4+4nrB7A5x0WWUNeyoB7V2vqWyhDlTDQBsu
	GtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id
	:mail-followup-to:mime-version:content-disposition:user-agent;
	bh=+qpa2MzeDftiNIAHoNCer0zeDVNqJC7ZOENGiNPJtKA=;
	b=R8JQKy7bOeDEwnuTHs70yv+w+cq5H0e/C7wVi7Tsf3Nft4uUGJ/4KM+F724LRJHgZ4
	ovlbR7BTH4bgOHvtSldPUxn32t7FlwrR61TWpcl1byWQtO9zHmv4KSQ9heXJupC2A6FY
	4KvA71ize2Lazx/0ITyG6wBExvIMeFaozDP4lSAsQ/U4X/U7ZY/sfBBiXOuoFZR0nGsG
	3oCujNHRtH3OvCrRpvUV14QzYIhk6ZkPHDPHB5jJrXQjBklFyFdUX+0UPj7piS48UzQ3
	pN6LtwYFNmIz/MNp3+SNYSd1H6BqR24UHvIC/6A9na0+rb8Ff0Juq4aCAnIceZSg4L6M
	fI0A==
X-Gm-Message-State: AFeK/H2AfxK0Q8d+O9lDqJLQxFJDWzG6ietzj6qJjJP5nrn8P72czsYHKhTBhenPJays2g==
X-Received: by 10.223.151.193 with SMTP id t1mr32341421wrb.149.1491489669073; 
	Thu, 06 Apr 2017 07:41:09 -0700 (PDT)
Received: from localhost (x55b0f93f.dyn.telefonica.de. [85.176.249.63])
	by smtp.gmail.com with ESMTPSA id p7sm2392946wrc.19.2017.04.06.07.41.08
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 06 Apr 2017 07:41:08 -0700 (PDT)
From: Oliver Graute <oliver.graute@gmail.com>
X-Google-Original-From: Oliver Graute <oliver.graute@neuhaus.de>
Date: Thu, 6 Apr 2017 16:18:36 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170406141836.GA22533@graute-opti>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] nfacct: fixed SRC_URI and dropped workdir statement
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
X-List-Received-Date: Thu, 06 Apr 2017 14:41:10 -0000
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


