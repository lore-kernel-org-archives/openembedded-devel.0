Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0597FD4E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 23:08:12 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id b9so306322pgk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 15:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=a0vkAJ7U64th4QBrAOQNFsL4qYYuPzK/PdgQpp6qNck=;
	b=Hr2VHFJAmij/T35ZOtX83xPB/kGR/hcS9aXOaHfIIprtWgBUw6ASKV2koSThr2w1ed
	iBITEmFkPNou7A45aMZZoP69sFXr3TqcZl+HiXBO+gOI/dnuPTs3PjZW3E7obcX0ar/7
	IUSRrjt2ZvnzuxjgiSXyhvn4nh7Huj6ZZY+V+/zlS9NY8TsWpuuSpqJDObtOfLNJQqHG
	KZTK1m3Xp0dqvAMIrW7cKx7pP98PB2UE5LAalyr+MPVuk5v2UG4EUUFeuWB7HNjNBqBh
	QPuqbtrqYSq1AtQb2RfU+ZyMXEr7ct7Rvq3HWq6R0EAg0NE73iOUOR1NCnUWhHcyV0ZU
	RBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=a0vkAJ7U64th4QBrAOQNFsL4qYYuPzK/PdgQpp6qNck=;
	b=lUUecKgG/Lg7iYVmAi9N6gcTL7N6Ks3/OOZOOeptcLmpJq4LRuSCEfPcsFWJHkIOMW
	54YtYJS+WI+gFWUpuqueKoP04opjdl2s8srUUyuJjr5/NShlIA33RcY6prAzAbvfJtlE
	Ndf9NjaycLMdlT4FKBnFlFPYDyQkOCGBp47qOA2X5j+xWxGGpDSExwsJyAM3c+rvfeDr
	zJTcndBiw5BrbZ9Ry5MN+r/m9aUOeAKQBoajG2l3wnBhK0mOQiaNfxfVO0noy/Wr+uJK
	JWKyln+deu/nvECVKvXvBGzCMGlWRBA0EinapmFlRP6zAvI7dsj3bf/ExHwsYjiDQeo0
	jexg==
X-Gm-Message-State: APjAAAV2EUMgwXxBAoUUW25W0a14TVa9BcnFep77OixAPGbXy14M0f82
	yI30DlyYZpRXA0/m4DugPv9gFWp562A=
X-Google-Smtp-Source: APXvYqyX5ToYUS8GycnBQizjqS2XnDnnCK3p7X4xTH8nZ40N5Lu9SXDabR9668Z437gVfmz7dD/ODw==
X-Received: by 2002:a63:cc4f:: with SMTP id q15mr691389pgi.159.1579734493154; 
	Wed, 22 Jan 2020 15:08:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id z130sm136892pgz.6.2020.01.22.15.08.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 15:08:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 15:08:11 -0800
Message-Id: <20200122230812.2223255-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122230812.2223255-1-raj.khem@gmail.com>
References: <20200122230812.2223255-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] rrdtool: Use py3 as rdep and use py3 setuptools
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
X-List-Received-Date: Wed, 22 Jan 2020 23:08:12 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
index d96fe8131f..5662e63474 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://oss.oetiker.ch/rrdtool/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=39df84cfd8a5e18bf988f277f7946676"
 
-DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2 groff-native python-setuptools-native"
+DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2 groff-native python3-setuptools-native"
 
 SRCREV = "56a83f4f52e6745cd4352f9ee008be3183a6dedf"
 PV = "1.7.2"
@@ -123,7 +123,7 @@ RDEPENDS_${PN}-perl = "perl perl-module-lib perl-module-getopt-long perl-module-
 DESCRIPTION_${PN}-python = \
 "The ${PN}-python package includes RRDtool bindings for python."
 FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
-RDEPENDS_${PN}-python = "python"
+RDEPENDS_${PN}-python = "python3"
 
 FILES_${PN}-dbg += "${libdir}/perl/vendor_perl/*/auto/RRDs/.debug \
     ${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug"
-- 
2.25.0


