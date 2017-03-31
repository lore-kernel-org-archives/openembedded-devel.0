Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id B89E277DD6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 15:18:37 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k6so20064251wre.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 08:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=psGOxyIXDp1xXLLnW1Q8IbCTZqVV4TSs4KGFOa9Lvak=;
	b=i1ZWQlHUSR7v1v5IxvMziWnLOCZF0wdY27lrGTrVONfSMtp+MLWgazFcuonoYinYEF
	WPOJyrbRanOt1Eb8fj4hA+XpSA1BFGw9iqu1wKUuzgpTgqK59dsituCPmAFuJn0qZu4b
	GsJSaBTEJpAShilr4rSve3y4KbE6UmFzpo2S8k6D8WNdpHB5zHNfRJHdhDujLOYXpa63
	Xo79kbLdIEvl9fAoialeivzk37THZDUFULyA1jWwJ+L5n+reonqgs3WX1Ey3hU2lUxT2
	FjWIpibIfUj710wD+Oe0CvE4boTi3XxhozjOoM48PdkuVjgdSslE2xDxGMVSQvxxc/SQ
	hxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=psGOxyIXDp1xXLLnW1Q8IbCTZqVV4TSs4KGFOa9Lvak=;
	b=kCULls28DLstB2HpGEoSyldUayVBDOxdRql4qWD8/W1xDLKD2e0IhElgDkagdBoQ1D
	hk4Hp/wJVRZciVr6oIY2tB6Mz7PeI6Bcxma6HGZ/sCKtO1yb37o157BnpLXVNUlTWUaI
	ZEW+8Q7VXhL1TVWa/WRZwvEeOfmkfwimu+/kH46KoClRydzVBn45fGtsV/W/Dh8ns04Q
	MtwFMxYKXS/r5l5ZoTZy0LIitYU7BVEmd7GAQjdJiY++Ztrxkt9aqGK+TUQQKiRfs15n
	POrBhbtS/NplAbuwmKGxpGk7HheHDIeJH+Rix6fRiMJhd+8aMv3AY0vIA3+9lorMpWb/
	+qbA==
X-Gm-Message-State: AFeK/H1p0RoUGLehV1dT37qbOxJPBa+neeSzz8Klq4goo6e1+g7+RVKbJon6KZI7mROVIA==
X-Received: by 10.223.179.195 with SMTP id x3mr149930wrd.80.1490973518590;
	Fri, 31 Mar 2017 08:18:38 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	110sm7045511wra.49.2017.03.31.08.18.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 08:18:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 17:18:23 +0200
Message-Id: <20170331151828.25907-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170331151828.25907-1-Martin.Jansa@gmail.com>
References: <adec7310-ce23-cef8-0c06-ea4b5bf9036c@gmail.com>
	<20170331151828.25907-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][morty][PATCHv2 2/7] libqb: use github.com instead of retired fedorahosted.org
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
X-List-Received-Date: Fri, 31 Mar 2017 15:18:38 -0000

* https://fedoraproject.org/wiki/Infrastructure/Fedorahosted-retirement
* cherry picked from master:
  commit 18893ec9498cbb5bf9259f36c2bee03cedc4b6de
  Author: Martin Jansa <Martin.Jansa@gmail.com>
  Date:   Wed Mar 29 10:18:01 2017 +0200

    libqb: use github.com instead of retired fedorahosted.org

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


