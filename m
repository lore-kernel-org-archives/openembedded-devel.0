Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id C93CF7E5B0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 16:55:11 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id c6so3720185wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 09:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u3SEAqFMIwAZaPuajhI8XTlmOQxvWkcmpVh9BbYsRYQ=;
	b=A3qLOmhawBTAMOuzEt1OiGUCXgSXpEh8CgC6bykzIeIbUSnomLCJx38FxSgd/yCbp0
	3Ve1HLkRNMTrPMm8EajBXLdIvsJODAs81Ae+mXeT5AXY4n7Mz+UV0tQoHlnkjdWgkIou
	E8uk/dCvkBB7R/qiiajcPo44fjIUVOpdIG0mVAxdvAsRlSRkDaCA9hLgTD1H1JL0KUSM
	swzevMIkF3MIbdk1ldQfoB/n6Sq9na+gC+647IW1SF4syIUmK2n7knzSO7+cg9T8xiE6
	mKH2Wo9g2IRgixaE24f+0C/PHNHDXtkPNhLGiNmVL625x/8Qsqa4c0EeEWMCYCzjSri2
	h4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=u3SEAqFMIwAZaPuajhI8XTlmOQxvWkcmpVh9BbYsRYQ=;
	b=q8hAueS9H5lK996PiH9nDYPva6mpRjfQjjgnwIapRwbvAb5kW51mhhAQPtlo4yscAB
	/xd3vs0iqTGRboGxqkS8CV1B5fAW2XB23aD9f+20RwR/Sys/8veGyp0COtI197PpoD/t
	T12gtmamzINFfByStbq/pJymUfLL69zTLoLN4CSXjbA3UvwR4wPcgye/dkbB2/UT2tMy
	t0Qj9cwsKIm9a7dChDSDgpCu+PrI3jLAoyecHayg1JdwszwF75ta7giFAl0Ixpha0dZZ
	rtJm8d6jOg7AbX4+XQ9FNZD9Zsmy6vedKUVfdHZgPiXZ7PAEad11NX8hF5k+mqqmuwad
	105g==
X-Gm-Message-State: APjAAAW70MTTxxmWqjUDN7V7VzcmS8svbtKFKQFotRBjRfjYTrT1Xv5G
	RS0NBYClx9WmaXR7RLLwqPw+jpum
X-Google-Smtp-Source: APXvYqwk55x5IdS/rq8oTVNOO3PnZ0iXC7NUYzQFHBZGF28Zs0LNyuOwzJH9ZO6QtTa4uw0WKjMtMA==
X-Received: by 2002:a1c:ab42:: with SMTP id u63mr18975925wme.130.1560272112149;
	Tue, 11 Jun 2019 09:55:12 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id x16sm3658854wmj.4.2019.06.11.09.55.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Jun 2019 09:55:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2019 16:54:58 +0000
Message-Id: <20190611165504.23049-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190611165504.23049-1-Martin.Jansa@gmail.com>
References: <20190611165504.23049-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][warrior][PATCH 05/11] mscgen: fix SRC_URI for multilib
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
X-List-Received-Date: Tue, 11 Jun 2019 16:55:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mscgen/mscgen_0.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mscgen/mscgen_0.20.bb b/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
index 6ead015f85..276ad201fd 100644
--- a/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
+++ b/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.mcternan.me.uk/mscgen/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b1e6a340187c1cf716513439d07c1d79"
 
-SRC_URI = "http://www.mcternan.me.uk/mscgen/software/${PN}-src-${PV}.tar.gz"
+SRC_URI = "http://www.mcternan.me.uk/mscgen/software/${BPN}-src-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "65c90fb5150d7176b65b793f0faa7377"
 SRC_URI[sha256sum] = "3c3481ae0599e1c2d30b7ed54ab45249127533ab2f20e768a0ae58d8551ddc23"
-- 
2.17.1


