Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id B368B7F2A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 18:34:46 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id q8so9567732pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 10:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yKx7uqp1robVGgTQDDUVDIExtvYTfuvLwMl444LW/YU=;
	b=tdH7LR6KUM/2SNlzeR7QUVzFNEXiA+6NoNzHQg/8iSPCuVdWPYqdc9On++nzhg1NEv
	DDW1r0OK6CCzgwh5KOsK4ytbr4MkQFs0Y50qFXwbMW7Xp9rfNNMFoKQm8yu1o8Mt1dy3
	cn9CN/UP7w5uRWg29kUttJHCXz+RDOSm/cJBbuqkkF+z2lGY6ebuRKRFgUrqeosPsPUm
	lEj6TJq3J1Ady2GoKoJaZvrseTHXGXRKEKu01aDDma+6OtkacKuJNeeiU0s3xEW/Ezug
	n8BJDWWszPY4btt2Nb/6rzIqaF36fwGoYvMHRUPvjgvr2TGrQlc1cD8xuVJI0c5tr9Yh
	Ub/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yKx7uqp1robVGgTQDDUVDIExtvYTfuvLwMl444LW/YU=;
	b=o3m6rrLemkNdxadMYQ8ZZJGTxpmXB8IJM3xjrDUicKjT1TzSq1ISKFInFi0hMdVDKf
	3/X0QDiwBYduGKuqXbB9ve2x5QB2p4NO4u1jvrH+uvBO+/fU+hg7PZzsswJV7EWpcVoJ
	TmQ0xnHI0BgZLz4FTS4SsPQxKMVIX54r3WB3tG3PO8xBt5A5w7Zjlcm5MqrFP+P1MS6G
	jCa/7zq+qQd/5YR+PYYLaL2GbCAdZTn1LD/6sh5/ZCYWXv2c8E6ks5PDNSM2pKfT3/FI
	5DAJnMJtedFMqH8y++G0vKRLgHeN2wEFf9CbDvJB5Z7fcom0DtDHH1E+2M0eVP500Q9D
	2Krw==
X-Gm-Message-State: APjAAAXsGfwQSr+0dBjfKWCI8a3kDN5fEr4FzY/S0l74Lr1zSCaGKNW0
	QpNza+nf90MXSAALrWevOdxzoZlCtMA=
X-Google-Smtp-Source: APXvYqx8RYVx7KhJ1nwy3S4IMzyVo0eFi6lzYYj+7xNJLsJbTkFpH/Iajv094ACsqTDKYmZ+/oGcsQ==
X-Received: by 2002:aa7:946a:: with SMTP id t10mr33887181pfq.165.1577126087743;
	Mon, 23 Dec 2019 10:34:47 -0800 (PST)
Received: from localhost.localdomain (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	r1sm22970782pgp.15.2019.12.23.10.34.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Dec 2019 10:34:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Dec 2019 18:34:44 +0000
Message-Id: <20191223183444.420-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223183444.420-1-akuster808@gmail.com>
References: <20191223183444.420-1-akuster808@gmail.com>
Subject: [meta-oe][PATCH 3/3] surf: Add opengl requirement
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
X-List-Received-Date: Mon, 23 Dec 2019 18:34:46 -0000

webkitgtk depends on opengel so this package wont build
unless opengl is set.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/surf/surf_2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/surf/surf_2.0.bb b/meta-oe/recipes-graphics/surf/surf_2.0.bb
index 9932d0a1c4..989730186a 100644
--- a/meta-oe/recipes-graphics/surf/surf_2.0.bb
+++ b/meta-oe/recipes-graphics/surf/surf_2.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b57e7f7720307a02d5a6598b00fe3afa"
 
 DEPENDS = "webkitgtk gtk+3 glib-2.0"
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "git://git.suckless.org/surf;branch=surf-webkit2 \
            file://0001-config.mk-Fix-compiler-and-linker.patch \
-- 
2.17.1


