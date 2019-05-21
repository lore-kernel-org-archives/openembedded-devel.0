Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id A70207E167
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:59 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id z26so8307709pfg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vT7oZcSkpeZxerGs5G1DohgnYyqwTP/C/rx7VQ4IpSw=;
	b=GQQmXNY+qVH7Bhp49rDvaJ2p3kBFRr6T5Qq3c3N5/6ZLP25geYVDZGlm+brYEb1WLV
	nqRRTScYGIO/ow76bRDhGkd2l9XsydnMO0Hzpi2mOYrKBkLHi0zS4Grte/c3ClQamD3O
	A/IFAjzB0vmMrBxUSv6rULPRBUtSIMManvrIe/7e7ESq4H2XXzX/LdK3eXuGyhPLC+1P
	w85qH8M0bmMb54Gf8OG/tIrWlepVowwa3Mk7ENjuYJC7PLVzajMhfPtP0SQPkXMt/aHO
	ikeWfYqr7bRHDQQwZEwjIwTa57hyY1pTuWvq01IKXcnWUbj1xGzwthmtA5AsgrbIQhwp
	QZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vT7oZcSkpeZxerGs5G1DohgnYyqwTP/C/rx7VQ4IpSw=;
	b=ewQw3BwtHDYI9ANTTNztKlKb45cC6PqOtHojTUyk8GUHLntJUoip2tHcrdrPWyV7eF
	Fig/4lzKlY7ZAlwlOHIfT/MkuoMFKRKPHcZOv3Ew7bSHvT92zeU0QlBQVjttSzKE2RA0
	6cyGODl4ulc/SRolLNF9lnGUFC0CxW3/z25l67hj/SN3DERP1nkDU9DbR23ogvBjIQBX
	7Ts737zr2Pf61Q5WPxN1N3ki7kyJnM6tZCKoooDQ0Hd+IbWjATLRchi6dYf0e0K241Rg
	D/lB4ZMzqvPny53SVdZRy0FY0Q+vAMUUPEG3dVMQ1sSfaM84sjYU5xP1h1xYI1hzcacs
	OHSg==
X-Gm-Message-State: APjAAAWjU/hpK9FUl9NSLBP6B9uiG7N/erkZHlY4iLreFg+TYEZp4Jry
	DHfbEEAzDua/kESZelPb2kfxLTQg
X-Google-Smtp-Source: APXvYqwtfKZkhP2tPyl0SVCCfoiw2k79ywNEyVUqFA6aQ43RA4nCHguD5ynhr5Ce32B32d/YbQ+AoQ==
X-Received: by 2002:a62:386:: with SMTP id 128mr59087873pfd.10.1558411020866; 
	Mon, 20 May 2019 20:57:00 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.57.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:57:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:28 -0700
Message-Id: <097ac158423008204f3f6539b2e98f957bbb4c50.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 28/34] gd: set CVE_PRODUCT
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
X-List-Received-Date: Tue, 21 May 2019 03:56:59 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/gd/gd_2.2.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/gd/gd_2.2.5.bb b/meta-oe/recipes-support/gd/gd_2.2.5.bb
index 426af25..c846bda 100644
--- a/meta-oe/recipes-support/gd/gd_2.2.5.bb
+++ b/meta-oe/recipes-support/gd/gd_2.2.5.bb
@@ -50,3 +50,5 @@ FILES_${PN}-tools = "${bindir}/*"
 PROVIDES += "${PN}-tools"
 RPROVIDES_${PN}-tools = "${PN}-tools"
 RDEPENDS_${PN}-tools = "perl perl-module-strict"
+
+CVE_PRODUCT = "libgd"
-- 
2.7.4


