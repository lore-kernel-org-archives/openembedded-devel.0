Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3505377AB5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Sep 2017 19:15:32 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id u136so338144pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Sep 2017 12:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7YL8tBQVZtQ/j8ttU+UBdigZfy1Sq8934URh8ikw4W0=;
	b=gwPbRhtG0XgaPle97G3ajjLkmI8rboqJ7Htf6e2XvC4Bgigc3aM/PlfoJpaEcgPLwF
	ERplkQoZ/ILSXwWtR//aUvk43NkLmcEXPZogeLrRFJ/Lq4zIfWDpAEntWbFbCXk6omNc
	e4nLd/SQJ0l7vZvnNUHy9hlnQFwcfvvpK1DXiwY2vnwawwYZ99bgpaPdDVh7sCCu+ylc
	Isou2WQ/9SMY8bIuVC/Ed7D+a61VLaB6RLzQ9Qi1whwwwSGBIiEe07V2/BvVQiZpm9VY
	8Zj9awpj4fTXjqM0OJQiQMJN2h2dBPcjBwZML48tZFZGAoNPgfzxJWWMrlwxWNrEHbGc
	0OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7YL8tBQVZtQ/j8ttU+UBdigZfy1Sq8934URh8ikw4W0=;
	b=aXt/QQfMCHoLxwpZczPTvi1+CF5fDsITBv8+glDFxwlYpTDAZHWcFkn1f6FLRVeRIY
	vDn+XgvC0sqK5ii1LLV94JFuyer9v/L/BeZOvZ1DntuHXHpjGrRjN/frBv4whlbawTHU
	TA9LHVIAgQpnhDb1/d3oWIq5FbWFWmNqx7cW5v5v64/OPW+8z1D70OrFiWEzQ7Pm2p2N
	3r/E4z54yD15wsCvKBQvWTyku1soduPz5fa0QOeaaD8WvGB+YsJSxajmAKUt1gMGdJFL
	Qzwx3+PgF1k2mTtJTwLKFsjiELuPUL0RasQnTL7Onuj0F9FOHFFmOYk1ekZJrtbbO4OA
	1W+A==
X-Gm-Message-State: AHPjjUgNIK2W2AQZqyXYQlAHzWmNFHaMKa5UJkjbWBXff6pqkaTrAm4/
	q8GbujsBIzEoqhVW5K0j7ThBfQ==
X-Google-Smtp-Source: AOwi7QBRO5GM3G2ihdHddfjjlapjOlmlE7+egeXV/LJySi1j7GLGpqMnK9W2DKz55XAax07aKOjZZg==
X-Received: by 10.84.178.195 with SMTP id z61mr2048453plb.374.1506539733964;
	Wed, 27 Sep 2017 12:15:33 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	h9sm22222125pfh.98.2017.09.27.12.15.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Sep 2017 12:15:32 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Sep 2017 12:15:27 -0700
Message-Id: <1506539727-32288-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][morty][PATCH] luajit: mips and mipsel are 32bit targets too
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
X-List-Received-Date: Wed, 27 Sep 2017 19:15:33 -0000

When cross compiling, the word size of the compiler set via HOST_CC
must match the word size of the target. That's achieved by appending
"-m32" to BUILD_CC_ARCH if the target word size is known to be 32bits.

Unfortunately the current list of over-rides (powerpc, x86 and arm)
does not cover all cases. Add mips and mipsel to the list too (which
is still not enough to cover all targets or corner cases such as x32,
but better than before).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
(cherry picked from commit 18771a9c9946c04dcd3ec89559018c8bbb15201c)
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
index 964dc1d..2049846 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
@@ -24,6 +24,8 @@ BBCLASSEXTEND = "native"
 BUILD_CC_ARCH_append_powerpc = ' -m32'
 BUILD_CC_ARCH_append_x86 = ' -m32'
 BUILD_CC_ARCH_append_arm = ' -m32'
+BUILD_CC_ARCH_append_mips = ' -m32'
+BUILD_CC_ARCH_append_mipsel = ' -m32'
 
 # The lua makefiles expect the TARGET_SYS to be from uname -s
 # Values: Windows, Linux, Darwin, iOS, SunOS, PS3, GNU/kFreeBSD
-- 
1.9.1


