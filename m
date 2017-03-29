Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6A15177BD5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:16:48 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u18so1221403wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CaJeV6vInJ4Z7UiFuC8/sYCRTZ2glmYbjf9QfZRvfaE=;
	b=M7y5b7G87SK+YywPXPJEigdrizFerrVH2d6aT6QLh3E3PPsSQ3eiRanSAn5bOIMfVL
	ouRwtYJq8RyWZI4DOSU7+a4+vv0OUlBiCPOX6+prlktTLA+9iIYWKhYbmPwJyoP0Wq+c
	u1ZJVkProBCRT2fSxnNmxqZPPhCHulrhRqcpcLkuIHKmBq/4F3PDRCRnsIgCNySqaUar
	LiN7bWkFxkflyW1cocyW/g4Nt+4CQA9k4Iv0sBBRSZA6PAttPgO1rlRYsCECsUsLdi/N
	JQfux0z0mVamXpiwj45LShr0nU/JckwkUHbOqIIGKRAKAb3yNqcZq3w0bOS+EUu+Gaye
	XI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CaJeV6vInJ4Z7UiFuC8/sYCRTZ2glmYbjf9QfZRvfaE=;
	b=JcbaTpan0A54Xgv8gMPtYNWTBaCM6aePklcUVzCFsd5v0KbdTHeQry0LdTZE7Vp0Ij
	sFmKhGPMLWDXj5eZFh0LpHiGPXsxUGIbOwy4+EZBW4QkYqFiV/36FfJDnNr7J6tGpgZC
	GOXZqJ5tPKPTfy9PJXCN+0/hisUfHxqRyhOH+FSkUJZGLl63qXy0msYylRSwNb3s81R8
	Y2oSB2eyHWErDk2dpCQUyKCreWaN6C5/RKRueSmVtyY3X95FxjjDENI8eHjQPbZtBVR5
	QCIIbapKdnGhvcIN6/Tu27cnM+f2AuFOqPXTHzx67jTaAe28JwbSEXlmPzrpOQaS6yiL
	/dJw==
X-Gm-Message-State: AFeK/H1DbRZ3hkT4sgYfYM2F/dQdw77ih854ExDF3pYHx2TkeUN/VALK3XJ/WvJy82iOVA==
X-Received: by 10.223.164.91 with SMTP id e27mr1964976wra.115.1490779009080;
	Wed, 29 Mar 2017 02:16:49 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e21sm7310911wmd.12.2017.03.29.02.16.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Mar 2017 02:16:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Mar 2017 11:16:37 +0200
Message-Id: <20170329091643.32180-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170329091643.32180-1-Martin.Jansa@gmail.com>
References: <20170329091643.32180-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 3/9] libqb: use github.com instead of retired fedorahosted.org
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
X-List-Received-Date: Wed, 29 Mar 2017 09:16:48 -0000

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


