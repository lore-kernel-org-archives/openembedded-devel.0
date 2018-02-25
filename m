Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7AFB3788E0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:34:01 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id bb3so8118109plb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BmVa6oCTIPabcUc4aU4VokMrCbLtJzmxGQi7xQNF2IM=;
	b=i1cK6PA2IfCs7lvM1ZH7V7BWIjHBnRIk6JcHDM/L9mo2ml7ZioraQBODg8xb4r+hke
	Y3U5Zpdd9fvJoQ0ds4nW+m7oqzPAVl1nI6KpEM2HdeEGT5uV3Bats+pVPCbDWzmv9K6/
	RDzafMzHHmmdk67x41Jgqaf1YsS7Z6nlBTdqA0tvjSczq5jps8T+M/lrAVH8K+IUCJFt
	0HGk9ANdk/rrM+hs83AyCj+3hu2FNp1yKXceAge9+lI5PkRJkmCvhstHp+Ap5N/5X/FK
	dxS8YxAfZhwJo5oL1b7pODgCj/OYKeC+2qrWjC6ojQQtBdEHKF3UEzP8Wu1UvDzbCXiN
	bTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BmVa6oCTIPabcUc4aU4VokMrCbLtJzmxGQi7xQNF2IM=;
	b=fOf8jNndYO2QXzn4U98PNueilpY2BbBWLJXCqipIZ70JnQHG3VyxUcKZZgD7Q+x50f
	X+i5pdmTANijdtgPfqdtd4qIvSp0+qrbnGWS8p9huXpu7f8q8Zz3hLulkzlTeK6YGFc9
	hqX9iPA82zS9PH5k0SJLL1aYDx/bexbiEZMGbpOQQrxz9tgVnxm9gUR0cMy0gUSpWKsT
	RvYJGNcCFXj4Z+9cnrXGrIh2NdH1hzvxVGv5sfMjEpqZmMbtdtMeNhrpY+QyGJjgYEu7
	b7iG5Sq1umcRYzwenITyRDp77tD0Zkmd52vIjCuFOBSTWxLmVUvWaEnLBnJ7AdBT7KzB
	10Vg==
X-Gm-Message-State: APf1xPDLdNEVvrVBwPms3uF8swlc2N1iPwjVkGO1BJzaTojtbq2ytL74
	f/zt3JrCDvT6jBUk8kkeGvp35A==
X-Google-Smtp-Source: AH8x226FyW8oQEyF3BRG0D/ko8FAPX66ZuuCdvnZ9donN5s3uipLFrnzHU51zzIGRo23QIbrFVQJAA==
X-Received: by 2002:a17:902:b215:: with SMTP id
	t21-v6mr8624775plr.414.1519594442846; 
	Sun, 25 Feb 2018 13:34:02 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.34.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:34:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:24 -0800
Message-Id: <1519594406-24490-34-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 34/36] efivar: move to recipes-bsp
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
X-List-Received-Date: Sun, 25 Feb 2018 21:34:01 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch       | 0
 .../efivar/efivar/0001-efivar-fix-for-cross-compile.patch                 | 0
 .../efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch | 0
 .../efivar/efivar/0003-efivar-fix-for-cross-compile.patch                 | 0
 .../efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch            | 0
 .../efivar/efivar/allow-multi-definitions-for-native.patch                | 0
 .../efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch             | 0
 .../{recipes-extended => recipes-bsp}/efivar/efivar/musl-strndupa.patch   | 0
 meta-oe/{recipes-extended => recipes-bsp}/efivar/efivar_0.31.bb           | 0
 9 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-extended => recipes-bsp}/efivar/efivar/0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch (100%)
 rename meta-oe/{recipes-extended => recipes-bsp}/efivar/efivar/0001-efivar-fix-for-cross-compile.patch (100%)
 rename meta-oe/{recipes-extended => recipes-bsp}/efivar/efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch (100%)
 rename meta-oe/{recipes-extended => recipes-bsp}/efivar/efivar/0003-efivar-fix-for-cross-compile.patch (100%)
 rename meta-oe/{recipes-extended => recipes-bsp}/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch (100%)
 rename meta-oe/{recipes-extended => recipes-bsp}/efivar/efivar/allow-multi-definitions-for-native.patch (100%)
 rename meta-oe/{recipes-extended => recipes-bsp}/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch (100%)
 rename meta-oe/{recipes-extended => recipes-bsp}/efivar/efivar/musl-strndupa.patch (100%)
 rename meta-oe/{recipes-extended => recipes-bsp}/efivar/efivar_0.31.bb (100%)

diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch b/meta-oe/recipes-bsp/efivar/efivar/0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch
similarity index 100%
rename from meta-oe/recipes-extended/efivar/efivar/0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch
rename to meta-oe/recipes-bsp/efivar/efivar/0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch
diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch b/meta-oe/recipes-bsp/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
similarity index 100%
rename from meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
rename to meta-oe/recipes-bsp/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch b/meta-oe/recipes-bsp/efivar/efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch
similarity index 100%
rename from meta-oe/recipes-extended/efivar/efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch
rename to meta-oe/recipes-bsp/efivar/efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch
diff --git a/meta-oe/recipes-extended/efivar/efivar/0003-efivar-fix-for-cross-compile.patch b/meta-oe/recipes-bsp/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
similarity index 100%
rename from meta-oe/recipes-extended/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
rename to meta-oe/recipes-bsp/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
diff --git a/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch b/meta-oe/recipes-bsp/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
similarity index 100%
rename from meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
rename to meta-oe/recipes-bsp/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
diff --git a/meta-oe/recipes-extended/efivar/efivar/allow-multi-definitions-for-native.patch b/meta-oe/recipes-bsp/efivar/efivar/allow-multi-definitions-for-native.patch
similarity index 100%
rename from meta-oe/recipes-extended/efivar/efivar/allow-multi-definitions-for-native.patch
rename to meta-oe/recipes-bsp/efivar/efivar/allow-multi-definitions-for-native.patch
diff --git a/meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch b/meta-oe/recipes-bsp/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
similarity index 100%
rename from meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
rename to meta-oe/recipes-bsp/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
diff --git a/meta-oe/recipes-extended/efivar/efivar/musl-strndupa.patch b/meta-oe/recipes-bsp/efivar/efivar/musl-strndupa.patch
similarity index 100%
rename from meta-oe/recipes-extended/efivar/efivar/musl-strndupa.patch
rename to meta-oe/recipes-bsp/efivar/efivar/musl-strndupa.patch
diff --git a/meta-oe/recipes-extended/efivar/efivar_0.31.bb b/meta-oe/recipes-bsp/efivar/efivar_0.31.bb
similarity index 100%
rename from meta-oe/recipes-extended/efivar/efivar_0.31.bb
rename to meta-oe/recipes-bsp/efivar/efivar_0.31.bb
-- 
2.7.4


