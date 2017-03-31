Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id D99FF77DCA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 11:38:09 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u18so19870957wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 04:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=T0BSFxcDFo/A5kwpxyIR9Y4RjrInlBJ384stbAIyHys=;
	b=HEDUs6l9nlw5XWudXFullbrvv/vohB1ROnWbVMfHO145216I+N/IxU+tpULtTZ/2cC
	J/bKUfhpBgrmXhbS3FvLKhK+jqU+a6xECZQIKOO3jOwAnQr43MmZ4Lixqh3XIAUtfXRI
	tEfsJsmakqBZmA6D38BzEYDsAmVaG//Cmo9Gf+iFk+l0hscdMiuayubSj0NN+g8hH4pv
	ugyrtGdCfypceo05QfS4uE70zNVMjyjx98UvCpHDoePhmHOsMyfR+D8cgAKY2n3njZtz
	CXlRAF89G5mA2Oi2V5P0J9mzzzxwkRMA5QQ9QouD/JkdfZA8pdtbs5F4H3iqhif/gTQe
	u75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=T0BSFxcDFo/A5kwpxyIR9Y4RjrInlBJ384stbAIyHys=;
	b=ArlSp5+ku1UnsMh/gEycb4Gdag/P1N6CjXtPecZcAKtNNeBevarYbH/C1vSl5u/LZp
	9mN6FVIPy64zLDumZ7oDE1/niJJHNHa4AOTZgn3wnFwZ0JEnfRa+NTbTTfCGvQlkUjbG
	JdTLr++VxKEcF6UiOnIYb5DFODPUeGIgWDocUPYSQeMH97+jttYJz6wMBrnRACMnkkDh
	v3WRh39Hx0K5h6tfb88CG25okc7kNLBww+ZxMxZJswNG3T7mTm2w/yPTl9IGvseuWicV
	ynxP4d1u9NLiM1fQ4mzK2T9NH/rYRONMkiZ/31AXBSlxLj3enX1Q+4Ds+4s4RgqD1Mgy
	4h9Q==
X-Gm-Message-State: AFeK/H1hYAWiqR/Ksix7EbuSIRjg6dGkxO3+c1TizKwzXKWR0NWiUX9e+86LVSAyGMk3qQ==
X-Received: by 10.28.212.79 with SMTP id l76mr2912133wmg.6.1490960290959;
	Fri, 31 Mar 2017 04:38:10 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	198sm2554474wmn.30.2017.03.31.04.38.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 04:38:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 13:37:59 +0200
Message-Id: <20170331113803.31535-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170331113803.31535-1-Martin.Jansa@gmail.com>
References: <20170331113803.31535-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][morty 3/7] libqb: inherit autotools-brokensep
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
X-List-Received-Date: Fri, 31 Mar 2017 11:38:10 -0000

* otherwise build fails with:
  http://errors.yoctoproject.org/Errors/Details/138387/
  make[2]: *** No rule to make target 'auto_check_header_qbconfig.c', needed by 'auto_check_header_qbconfig.o'.  Stop.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/libqb/libqb_0.17.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb b/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
index 2d3278ce8..94030b2ea 100644
--- a/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
@@ -8,7 +8,7 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 PV = "0.17.2+git${SRCPV}"
 
-- 
2.12.2


