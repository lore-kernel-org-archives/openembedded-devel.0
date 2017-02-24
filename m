Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 53B187752A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 22:12:45 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id x71so4614024qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 14:12:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UnzylnQWJHsdNAG0PrEt5lyyr1lnlaHem6rpOz6N6hQ=;
	b=YAIYv2SXMH35uVnqCMW4oo8GBXFQJxEqOVUBzi/rE5O8fGTW539TpU/pqta/8TfX8B
	zwkQR99Sg1RbhI28Q1G85zLkApUvSiw2yiR3fY0XIlTjxONlkDIf00pzPVbpsGNwVqCn
	UxCshGuM26bDlbysWqqLIBA7jua1qMl+ig8AT56OTsNqr6gVIc04iEPoG3vGz+E7FdeQ
	MbmWNVI+6tGJFvJAdD+FHzm3DTuklJn4C/jARnY+TMWmNkclnlaz+/9NS5+qvuY/PAC2
	nTc7EG+jvsmFBFariIwfhpQ0+pr1ebLgTq3i+J2wFRpHAIeqgpfrHywnxkwauG9sJluS
	/6nQ==
X-Gm-Message-State: AMke39k0Ctk7Xuoql7v4hpbPnFdNarYW1uboH0kYuvq9yRah6YSYYDRIU6c0QDGxiRLcoA==
X-Received: by 10.55.140.134 with SMTP id o128mr5019053qkd.206.1487974367332; 
	Fri, 24 Feb 2017 14:12:47 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id j4sm5625916qkc.40.2017.02.24.14.12.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 14:12:46 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2017 17:12:38 -0500
Message-Id: <1487974358-14173-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] ipmiutil: fix depends to work correctly with RSS
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
X-List-Received-Date: Fri, 24 Feb 2017 22:12:47 -0000

Resolves build issue exposed by RSS
See http://errors.yoctoproject.org/Errors/Details/130641/

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb b/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
index 925a8f7..aa3700d 100644
--- a/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
+++ b/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
@@ -15,7 +15,7 @@ HOMEPAGE = "http://ipmiutil.sourceforge.net"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f9372493401f309e6149dd2ce0a044b"
 
-DEPENDS = "openssl"
+DEPENDS += "openssl"
 
 PARALLEL_MAKE = ""
 
@@ -60,5 +60,3 @@ do_install () {
 }
 
 COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
-
-PNBLACKLIST[ipmiutil] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130641/"
-- 
2.7.4


