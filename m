Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF1160620
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 13:06:32 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f21-v6so103586wmc.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Aug 2018 06:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=28U1TGi2Z/qIEj34x6a62fk4W8qrocHoJJgOUVqbDdM=;
	b=rNUtlURuYhYPys0cYQNzd16/ob6C6wMgFmEyJYEh+ke6CAKRi294fCVgWyLzXkAd48
	xoGox3hdtnpNa8gDagRBCRhJkuTzg7Y6Ffm++rZRtWoaMLwtLYESCo0wsr4OeCE0flMb
	rBs1QP/WA4N1V+GkMXf3/+ybCh6cQ8cdH/w4ukH+T/I3lP+XNNIk34IFmnRfv8juyK+G
	rJBWWa1ktDf1B9ZWDD75Dk7MQTZcWdi1nk5JLk5u4GTRDsI6Xib/7ciMapvFfR0V+CXU
	xLaNQCG0+/PnyCVOIQ4o2puvCsT4BP0Xf8gUb8JhypwQiQ6GJWjACtE2Rn1++Da8T1Z5
	8v+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=28U1TGi2Z/qIEj34x6a62fk4W8qrocHoJJgOUVqbDdM=;
	b=pH9H/8/KBeKPFWo+pDG+5iv78gSq9ArQHNgr4ckONeTtGhiaNEAlWXl6P9t2kiBeXD
	A4Tpy7fzIgmkcu116vlcBb7BqF6WrMeduZWNjaweSodws7vpgPp6ZPtCq4uHrATJGuNV
	hfMIVYY315xW71vH0BdiJxCa+vQx+70tBi9ZSb2Ixy5kQpQZX8ceDh/HotGbhdpgzyng
	jKjFW+Ci0LlRUyJl3IR5tWnZ/OgGd0PjMb5Rsd0D4hyqHgs5AnRXzwBbcDCq0dTuL60Y
	1kKZIXsxILdnBGUaQ+BfjqlcE6P9UDeIgdpY+gGa5JkxCtrKm0+rMgoZzOxDn+A8iMvU
	+uCw==
X-Gm-Message-State: AOUpUlGSbsxc4URP+c8r2NXxswHwH61xlZOnklxEoD5c+K1DIAJetYkC
	H8sUsGnxlyaJ4f+Ny5rYCwiXqVr0
X-Google-Smtp-Source: AA+uWPx7YbWDnIVvfAnzKVumYMfXkgKXld7PSN5fIlHew18pgSYZZrOezYQrnzDWuQ/viFDMk7pYkg==
X-Received: by 2002:a1c:ca0f:: with SMTP id
	a15-v6mr1538973wmg.102.1533819992717; 
	Thu, 09 Aug 2018 06:06:32 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r140-v6sm18486892wmd.7.2018.08.09.06.06.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Aug 2018 06:06:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Aug 2018 13:06:31 +0000
Message-Id: <20180809130631.3422-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] ifenslave: inherit manpages instead of adding man to RDEPENDS_${PN}
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
X-List-Received-Date: Thu, 09 Aug 2018 13:06:32 -0000

* set MAN_PKG because this recipe explicitly packages mandir in PN instead of PN-doc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/ifenslave/ifenslave_2.9.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.9.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.9.bb
index 2a6a6097cc..125b59e760 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_2.9.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.9.bb
@@ -5,6 +5,8 @@ SECTION = "net"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=acc89812938cf9ad6b1debc37cea0253"
 
+inherit manpages
+MAN_PKG = "${PN}"
 
 SRCREV = "42bfbb9beb924672ca86b86e9679ac3d6b87d992"
 SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https"
@@ -23,5 +25,3 @@ do_install() {
 
 FILES_${PN}-doc_remove = "${mandir}"
 FILES_${PN} += "${mandir}/man8/ifenslave.8"
-
-RDEPENDS_${PN} = "man"
-- 
2.17.1


