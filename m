Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id BAF6777DCA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 11:38:08 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id p52so19902542wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 04:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CaJeV6vInJ4Z7UiFuC8/sYCRTZ2glmYbjf9QfZRvfaE=;
	b=SlSNYuVVLWP8YC0WdeCYrtItudYOn1ybP6WhBI7VNW1BzXgf5F1YSpSgJ9PZuuo4Ji
	NyytCN2eF6+dPjGylYVeHw5JTTWtKxnaVSh3LZ7svrymrr1Jobr/1qIXwO/vVX3kv5re
	uEKWtxOPb05KWfUVmkYZCYT6YODkmSNM5dnko7nNQZneP27Gelpc3KGuTD4q7+nPSsq8
	0FiQtdmo3imvrv0iJuug1b5yojXGljs0zolbTBOSWdriCNSLJ+r2jfjFXl3kFoGhcskQ
	U0HvMxwv6yfr4YHYdupyQKqyFY+aU7KSIlTytpgSKDcrbV3g/NW9fdZxP4BnD82O6E3A
	y7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CaJeV6vInJ4Z7UiFuC8/sYCRTZ2glmYbjf9QfZRvfaE=;
	b=Yz9RAqI72GTgLsqZflxTq2/beacht7+sqyyrWXV8/y678UVUEwYY5jsei69WM1ti7h
	d/u2OZZc2oXzy/40dVmcEx5FabKEgmPw8qpDM68a5MzqJpGp8h6TSSaGChnBuRjv34J2
	PZ1sGwgkn2hNvULZ4dUC3ZERaamXN32BvQ48dCK+ojUL40nVHUa7RHxGY0kpdmQ7CDYX
	KQuKwIINSFk2T7FF9GiIoCW8tlm0eZrFG7azwFOr+ZB8NKy2zfr0yTJpEOeQ4b7SD5Gh
	BCxp2Udxa8j1bNWN8q8wAEGi2sIwgOVMegVmXSR9T1Uy25J/IFGYZTYGFNUoyLsqs7+X
	hN8w==
X-Gm-Message-State: AFeK/H1iwRK5W2XepUfImCMWzSYSUf+Y7FGNicci+Bqae/qR9nwFl+QQLgPYEZF0tr05hg==
X-Received: by 10.223.160.5 with SMTP id k5mr2702915wrk.123.1490960289622;
	Fri, 31 Mar 2017 04:38:09 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k43sm6400466wrk.42.2017.03.31.04.38.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 04:38:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 13:37:58 +0200
Message-Id: <20170331113803.31535-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170331113803.31535-1-Martin.Jansa@gmail.com>
References: <20170331113803.31535-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][morty 2/7] libqb: use github.com instead of retired fedorahosted.org
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
X-List-Received-Date: Fri, 31 Mar 2017 11:38:08 -0000

* https://fedoraproject.org/wiki/Infrastructure/Fedorahosted-retirement

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/libqb/libqb_0.17.2.bb | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb b/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
index 40d06f379..2d3278ce8 100644
--- a/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
@@ -3,20 +3,19 @@ DESCRIPTION = "libqb is a library with the primary purpose of providing high per
 It provides high performance logging, tracing, ipc, and poll."
 
 HOMEPAGE = "https://github.com/clusterlabs/libqb/wiki"
-
 SECTION = "libs"
 
-inherit autotools pkgconfig
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
 
-SRC_URI = "https://fedorahosted.org/releases/q/u/quarterback/${BP}.tar.xz \
-          "
+inherit autotools pkgconfig
 
-SRC_URI[md5sum] = "de1e5d38fa449b4d127940c10d117260"
-SRC_URI[sha256sum] = "9a419c649ed51f275dc780da8a15babb8a5d33633567bd9e0cb6193b6e21f4fe"
+PV = "0.17.2+git${SRCPV}"
 
-LICENSE = "LGPL-2.1"
+SRCREV = "bd2c587f6ccacd8a5644b275d99324d200c2b378"
+SRC_URI = "git://github.com/ClusterLabs/${BPN}.git"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
+S = "${WORKDIR}/git"
 
 do_configure_prepend() {
     ( cd ${S}
-- 
2.12.2


