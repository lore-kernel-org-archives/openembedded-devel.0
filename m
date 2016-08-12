Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id D9C797680A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 01:27:25 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id c52so494112qte.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 18:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xFGmx93l0yiJUA2Mech8ri96bTTMkyxa1G+a5EDySkg=;
	b=Y6cHvwFniIa8XE8ptKQc/h8Gyyy8Z3U5BidR5f4Z2DMGS9Hdp6TTGhMvvYUP3o4E2t
	ZDqgAx6Pdpvx0Rknd0o5ofaHYL1LpBqF7QDYWGD7dkN0Warng0U9LA9ZTp5w7Pcxs+fb
	Jeib76iWc477L10CXLlCdlrKTDKKwJNx4R58dP3FyLjWgas5L+KqHryyz27S6Bb/T7Fh
	e2jUu1dFhmvwPE43PGUDivriP7/E1wo9Myp2ZuxwCUGjeF865kjfjJXpwRVD2jwnOoZn
	HzoPo71V85bSfYr4Nq3qtDlQDtx2aZbCrkBXJfSP3S7NXAz/amA3+oZyRILpg2xaeOie
	Hlxw==
X-Gm-Message-State: AEkoouvAevb3tilELSFpGsMbr6Cbd6fqXgDT+X/NRWf1qQ8GoMk4DeZX/H4BtP3dwypmCA==
X-Received: by 10.200.48.146 with SMTP id v18mr14670076qta.107.1470965245612; 
	Thu, 11 Aug 2016 18:27:25 -0700 (PDT)
Received: from lnx-dereks-laptop.minotaur.lab
	(c-73-172-178-168.hsd1.md.comcast.net. [73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 73sm3091353qtc.16.2016.08.11.18.27.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Aug 2016 18:27:25 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Aug 2016 21:27:17 -0400
Message-Id: <1470965237-22663-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] gateone: remote custom prefix for /var
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
X-List-Received-Date: Fri, 12 Aug 2016 01:27:26 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-connectivity/gateone/gateone_git.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-python/recipes-connectivity/gateone/gateone_git.bb b/meta-python/recipes-connectivity/gateone/gateone_git.bb
index 44df604..6a93f83 100644
--- a/meta-python/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-python/recipes-connectivity/gateone/gateone_git.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://github.com/liftoff/GateOne.git;branch=master \
 S = "${WORKDIR}/git"
 
 inherit distutils python-dir systemd update-rc.d
-export prefix = "${localstatedir}"
 
 DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
@@ -87,6 +86,3 @@ RDEPENDS_${PN} = "mime-support \
 
 SYSTEMD_SERVICE_${PN} = "gateone.service"
 INITSCRIPT_NAME = "gateone"
-
-# http://errors.yoctoproject.org/Errors/Details/74489/
-PNBLACKLIST[gateone] ?= "BROKEN: Fails to detect python's Makefile"
-- 
1.9.1


