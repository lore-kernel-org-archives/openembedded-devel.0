Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1F0267FC83
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:10 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id q6so24955002wro.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9SFkOQXIliWKu7V4B15U/dFkCytHmrXRhBavCNQN8+0=;
	b=oZBn2CFkFIvkTg7AQ3NkztqGej0orChbOAjb3TdAk7ON2y3LvIZV/k9Ql+XjLNVKRw
	l/F2EzZ1yEYP3AvzQ6agkwW+qmszLIAG0v7TvordHzJJ8lWFYNt5uJJ3ZpUCR9LVTkJB
	5NRFkLZwvd3qdkG004ywpRrEtP/LNC3Pm+MxCdZDi+NBx6SSDheqwgmhpUxrUQ+kTpDE
	a0Vi1woWhucYXI4LhXHjgTOVxd0j2bdQlTiihD32VZh+w2NN9JiWwL37WldGteKxBDT5
	YfPIfvpZkGPhTPQDLwsSSZiB0zSW+BdH8xiQe/VZTvOIOiUmkeQ51HG7EWiZhAK47kWD
	coqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9SFkOQXIliWKu7V4B15U/dFkCytHmrXRhBavCNQN8+0=;
	b=OY2bqICTHH1wk1rY4UhR0hFQJn/xpC1ey6EOeyh/RK8732mRTtn+YJSeLU2jv1uwlQ
	+GAC6dlf3FLCEOo8xBFS/rvDtWaKQ+fC2xlFQUIbOMSL7ehjp1XxREKafxQlPxQz+bz9
	Z1lqAvf3djM+xyhq87we84AUF6iK/nGW8stFEisv0uTUw87GpqYDtvUD0cDsuZOH4BdB
	8JJNXzxu7tSZU8ZV3suQu7QXZ1VvzfeUsJuDEmgfAnu63pmwU4szugfoiP32Kqt8oN/W
	151hCxJITvgejpM7yzjjhVNlrQ7PP+fqvbwNmexEzHrqLF2EWlROjCsVMuCrqHkM5jVu
	/EKQ==
X-Gm-Message-State: APjAAAUimJO40EXAqF62DUHpA5M7MRfYW7iuh7m5Uy88sv0snEiYyFVY
	GsRtu+hjbdPRVkNUNFm3lBgRDghw8/k=
X-Google-Smtp-Source: APXvYqzSWvU1qTxlkEkhIhWQpUogMfZiqeC/mh0q11PTi52K87KrdlmWmNayU0H5NLd10DSQDzW26A==
X-Received: by 2002:adf:e641:: with SMTP id b1mr8063115wrn.34.1579346890672;
	Sat, 18 Jan 2020 03:28:10 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:10 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:39 +0100
Message-Id: <20200118112757.5287-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/23] geany: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-devtools/geany/geany_1.36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/geany/geany_1.36.bb b/meta-oe/recipes-devtools/geany/geany_1.36.bb
index 17e16bf56..8282091b3 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.36.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.36.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bd7b2c994af21d318bd2cd3b3f80c2d5"
 
 DEPENDS = "gtk+3 libxml-parser-perl-native python3-docutils-native intltool-native"
 
-inherit features_check autotools pkgconfig perlnative gettext
+inherit features_check autotools pkgconfig perlnative gettext mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.0


