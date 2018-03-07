Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id E3E9578694
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:49 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id w12-v6so632735plp.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LA7vNR+sTSEwXF3VVu1qyscSyzbjAT4xM+81LOdtijs=;
	b=vckWFHo5DTExF/F4PyFuSWtHVBezldJQvf4wTIenB4Ap8e1ps6Qg71nf8mxyjHJ8qp
	atMTN5I60uZ3WxqG439YHHj7ntn2ufENZEIWb0zDH42TnB8WLlOFJAnIAvNj5WiLN54f
	sUM3PbolxYC4Yo4/eihGCaIV3OUrMAO/E14MwSdbAdTRklzN+ZoVLlOzR/OLr6hyFoYO
	+IPcIPKjYxvBBH7PIfrdNx9omLLv++YQ/88Vbaj2iKbwL548zqXeGk6r5d+0SqEeislR
	POWU4VW9ZDt9iQ58XEU7rxu5YHGRBpvcfFO/b1okFVxGEEOI5hGd6d3Unjmz54pohks0
	5viQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LA7vNR+sTSEwXF3VVu1qyscSyzbjAT4xM+81LOdtijs=;
	b=Sw1gMY37FdhyaGWLpdz3zb4+iEtHxoZSceoNRU+WZugGYL1QaQjseFDdkF1oyT8vBP
	J4Oofe5oGj13nisb79HU093BnvCiGRz8swZqRPK92SO05WhqMusL19HXFcAhdL5qg2p3
	6uwnrg7oFwiO07Av9CNjHo+P+IERG+kbNTYh7vtc9UOfIgRGjhleiqcdSuJVpWTiaSXG
	yA5q2msekaU/wB13KVKHYd7rzim1PafbfyaMKj3mx6xHDslhodEmCuBciq29WLopoFVL
	mivuJ7x90Lkov6jjgv9GdIWox96OPQ5iEQ+1TC2mZ+QllMkKSiISUlpeF/pT9j3FBJIL
	/yfA==
X-Gm-Message-State: APf1xPAJiebrEOHS705X68pD6P5bsUW4O2gYc7EzwRgqSWuobUqC5E64
	JPzpWMTIAsG4vcpp9llwoF8=
X-Google-Smtp-Source: AG47ELusYRWbWuvKaDiz1c+6c2fzqELpT5GAc7h/CzgRfmSMhcYCUM5/5u1OgST/sHN8k4YikVGLQg==
X-Received: by 2002:a17:902:8f97:: with SMTP id
	z23-v6mr19028644plo.162.1520395431312; 
	Tue, 06 Mar 2018 20:03:51 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:26 -0800
Message-Id: <1520395408-19266-23-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 23/25] geany-plugins: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:50 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb
index 27fe860..3b5b7ce 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.31.bb
@@ -22,7 +22,9 @@ DEPENDS = " \
     libgit2 \
 "
 
-inherit autotools pkgconfig gtk-icon-cache
+inherit distro_features_check autotools pkgconfig gtk-icon-cache
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://plugins.geany.org/${PN}/${PN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "808f9048b77fd9704569ed2ba12a56e9"
-- 
2.7.4


