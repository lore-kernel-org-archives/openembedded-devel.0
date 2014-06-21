Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id F10F57019E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 09:24:32 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id bs8so1884849wib.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 02:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hvhrtHUc8E+NW68uTOt9vvGZ0tVpdzWA6W8m2sMX0mc=;
	b=ll+EyyKVPbq7I+YXV3ypnt2456yimt6aptqFXSsQr1EcUFDr57ODCsK0+PpkCxv+xp
	o3mDIeqmUwBda1Qgc51Wg42t3KipjWs2esik/jUFMFLiYSjWaZi3oJig9AzdhQSytmUN
	C4+dw103oP1IpsemdQXvHIBZW3iLFYxNAcmfF0b7TB3pRRcJCvfF4JeOaHg3g5Ybsih9
	XvY00RLqIhWl2CJOAuSX8jQM6NZlwOFtjfURcLG26zam9dvN10pa/dQnAjQg1mAWwujI
	8Jt1fY7QPowG8UaDN8IetUjIZEsBI+8iW+V3O9wyZbEtgCTBaYTPZysnLRI4QKklYgt4
	dCXQ==
X-Received: by 10.194.120.72 with SMTP id la8mr2515119wjb.24.1403342673245;
	Sat, 21 Jun 2014 02:24:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lo18sm12504673wic.1.2014.06.21.02.24.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 02:24:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jun 2014 11:24:26 +0200
Message-Id: <1403342666-15430-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403342666-15430-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403342666-15430-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] ktap: Set MACHINE_ARCH because of ktap-module runtime dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Jun 2014 09:24:34 -0000

* it's possible to exclude ktap-module dependency from siggen, but
  then we would need to exclude virtual/kernel and that doesn't work
  we would need to list all posisble providers as
  ktap->linux-yocto
  ktap->linux-foo
  ....

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-kernel/ktap/ktap_0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/ktap/ktap_0.4.bb b/meta-oe/recipes-kernel/ktap/ktap_0.4.bb
index 20f94d5..cbdabf8 100644
--- a/meta-oe/recipes-kernel/ktap/ktap_0.4.bb
+++ b/meta-oe/recipes-kernel/ktap/ktap_0.4.bb
@@ -22,5 +22,5 @@ do_install() {
     install -m 0755 ${S}/ktap ${D}${bindir}/
 }
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 RDEPENDS_${PN} = "kernel-module-ktapvm"
-
-- 
2.0.0


