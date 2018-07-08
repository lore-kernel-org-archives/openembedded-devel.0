Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 229CE60123
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Jul 2018 08:06:50 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id f4-v6so477239plb.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Jul 2018 01:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GK4zqLfqU4sZf+NAnYe+sLZRj56+Yb51/v35PmysK7w=;
	b=CaY9AGcBwrKpNye0v+V+G20nJX2Z1IlTORT1KL11QBL/r7u1vTfJJ4Nmp13lvfmXB8
	5M/p/GHUWAxAenlCG9iHxqeO1KnAY+9coPqoGJMTFVW/t9XDLgll6Jzr8YkneU2p+6D9
	nVmTAdPTOoU9twoNw83bVhS3nw33tm90BBoIEyYBCNvzA8vBR3syVgWOZlomEtPozDMF
	GbLyLxEcmu2ZWk1mhl9JWZ1Sb9shcA0kg+54bJ8B3oA/fnwSKUV0d5V5CkrgUVp4heMO
	WKpYzVfUVk8AyQjG9TxjdDaM8lC+9n82sFq/hZp3mGXRygoiXgZ/2rqPbzkEY+n3Uwmr
	6a6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GK4zqLfqU4sZf+NAnYe+sLZRj56+Yb51/v35PmysK7w=;
	b=LID0YKwDnmXUX3xdBJ8qfdwBTjGjY8JxrXBk18dc09CpPdYjiVpr8bZw1kqbB3VAcg
	14Q62vrzC/nBEHhezt0YsM+JH3PgRROHlNGIEb/6LPAPF8kii7sAPScZ3MIKX/D4zaUU
	8uZF3BDi69Ie1kOVpUXQ83HgxxN19tHNjZ/WutWiln5tGpeuoIHZbfZm/a9iC95LqEni
	r7oKbZZzYZ1UoOt5QhP0CWT3IsHHL3y435OiobIIlxCi2Y7DW2pNziH3b8qxPwOyaPJB
	LhbG2kZ6xdHVfVLVtXCWdp+Ey37+jsCvWfsl4zBEh/NJiGRunDL5jTuX24/s4OlWoB9I
	AwHQ==
X-Gm-Message-State: APt69E1Uw+Jj5qsW0aGZsE1K+7CwqT06+jOZu58AEf2X1dlE+flA2S1E
	1ymZsPXR4qWHrnArozN7yuvmgA==
X-Google-Smtp-Source: AAOMgpf1pTtXamZ0VQQc48JKd0GLMKYxIJr47Jo1BO24dXFcDM/vOxl83fVpplwBQuf+UUfTUpPdVw==
X-Received: by 2002:a17:902:b604:: with SMTP id
	b4-v6mr16186346pls.18.1531037211615; 
	Sun, 08 Jul 2018 01:06:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2af])
	by smtp.gmail.com with ESMTPSA id
	r25-v6sm12166097pge.81.2018.07.08.01.06.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Jul 2018 01:06:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Jul 2018 01:06:39 -0700
Message-Id: <20180708080640.39121-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-oe][PATCH 1/2] kpatch: Mark it incompatible with musl
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
X-List-Received-Date: Sun, 08 Jul 2018 08:06:51 -0000

it needs binaries from glibc-utils, obviously we dont
have this with musl, however in future if we can limit
which binaries are needed from glibc-utils then we might
be able to provide an alternative dependency when using
musl, until then disable it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/kpatch/kpatch.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/kpatch/kpatch.inc b/meta-oe/recipes-kernel/kpatch/kpatch.inc
index e2e9511464..cd819f31f8 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch.inc
+++ b/meta-oe/recipes-kernel/kpatch/kpatch.inc
@@ -30,6 +30,7 @@ PACKAGES =+ "kpatch-build"
 PROVIDES += "kpatch-build"
 
 COMPATIBLE_HOST = "(x86_64).*-linux"
+COMPATIBLE_HOST_libc-musl = "null"
 
 RDEPENDS_${PN} = "bash binutils"
 RDEPENDS_kpatch-build = "bash glibc-utils"
-- 
2.18.0


