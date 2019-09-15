Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by mail.openembedded.org (Postfix) with ESMTP id 375057EC5D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:41:20 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id d5so32001627lja.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=2dzW4CG9oOO3GjvuKUo0OXPEEInyH6mWATroN4Ds4Dw=;
	b=zan50+bKaHh+KOWiYutYzXo8xRkbLzqdZS1pntQCkkQHF7XMI52jvAN2n0Yu1LRlCc
	kt88obqjnz3W4MUYMHJWjzE1LNmCyGaTg35na/MeAbeg+Ro5GyJe5ADq01IkEaSQFpiz
	mtCrZAF573mCfON13nuDPzIRxLUH8dfWlV/EtGn8WFqp+tCnF7pWJ9nU4Y1I/MFRNW6Z
	grsgPqV9V+9qgEibcxv4DTMjg/SF/TBwIYYpkwkgIWarf4BRlhFyMq5BbO3M/5JEf34R
	ROm1VaUWurgBVi+RclogmKnyAHC19rzxRKxc8V4oiWH5ST2K0QLWzanNbPqqOsU//Uwr
	aB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2dzW4CG9oOO3GjvuKUo0OXPEEInyH6mWATroN4Ds4Dw=;
	b=lpIfrVnfagQRJCpbwW7/oW6mxZJthUBk6nKDRvXloIqgfFrbcELfDR/hlA6j4F5K5S
	LdkiEZwyrQnEERlDUGcmnRNW9i///NKNfxDJsoDJDCEu5GwYDYSH1yQ6118D18iYEQIK
	a2FlxqjFbVUz0y+lAAEyX22dgklR9AZyKLtuAZJFpxv1pevxrViHZEswOJYgNiY5hmrL
	ILPe9tRxoX4N/vfBJDrDCNyxh1Q00nZOwqzoOZqSefErFhpd2IYIya5So0YGmqgOOkto
	xhEV55KfqEr4WG7yLSOi2xQWJs4bK4cp9IEFJCyUz++h1RDNaWhS1D430IQDE+U2ZHXF
	P9Gg==
X-Gm-Message-State: APjAAAUYsvUP2BFuqRnIFeeDrzzvenJZNZCqc1+3y4AbRvNdn58soLDa
	IEY/QHgGQcUSFTaaWSFOGhHObPPzAaI=
X-Google-Smtp-Source: APXvYqzIPFUtwlWyldF86eVsKNvKP0OY6CMd0Qw2F2K+C0gCYgArJcGeKSIYtmyGwwi88UFsQG3BJw==
X-Received: by 2002:a2e:a303:: with SMTP id l3mr34528787lje.124.1568590880469; 
	Sun, 15 Sep 2019 16:41:20 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id h1sm9096628lja.18.2019.09.15.16.41.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:41:20 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:41:16 +0200
Message-Id: <20190915234116.11903-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] wipe: update to 0.24
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
X-List-Received-Date: Sun, 15 Sep 2019 23:41:20 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-extended/wipe/{wipe_git.bb => wipe_0.24.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-extended/wipe/{wipe_git.bb => wipe_0.24.bb} (91%)

diff --git a/meta-oe/recipes-extended/wipe/wipe_git.bb b/meta-oe/recipes-extended/wipe/wipe_0.24.bb
similarity index 91%
rename from meta-oe/recipes-extended/wipe/wipe_git.bb
rename to meta-oe/recipes-extended/wipe/wipe_0.24.bb
index 9a8101621..831d514a4 100644
--- a/meta-oe/recipes-extended/wipe/wipe_git.bb
+++ b/meta-oe/recipes-extended/wipe/wipe_0.24.bb
@@ -13,8 +13,7 @@ SRC_URI = "git://github.com/berke/wipe.git;branch=master \
     file://support-cross-compile-for-linux.patch \
     file://makefile-add-ldflags.patch \
 "
-SRCREV = "d9c100c9cd0b1cbbe4359e4d6c9a035d11e7597c"
-PV = "0.23+git${SRCPV}"
+SRCREV = "796b62293e007546e051619bd03f5ba338ef28e5"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


