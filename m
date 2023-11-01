Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41588C4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:32:57 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.8925.1698849170151646820
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KTGJaKhi;
 spf=pass (domain: konsulko.com, ip: 209.85.218.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso1052649666b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 07:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1698849168; x=1699453968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xPtukhwX1N+QWIu3/QS/SD642QXMlk6BTDe6eqFjeU=;
        b=KTGJaKhiD/f8wsKpSgMr4yKKQeNrqxfwz6pxoL5gLCnKngVmv49KHOngduVI5neqeD
         3+T8t23EesNqwOpg8RJNLzkOi3c852wERsz1frinOb4pnJBbWRfqUErROdpwWlsHgrOh
         geqeI7goKqidzoOg7JSGesTFqPi1tZaydqD40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698849168; x=1699453968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xPtukhwX1N+QWIu3/QS/SD642QXMlk6BTDe6eqFjeU=;
        b=kcOn0qBGeCP9HQF/xJaO1g5ceKXYqmkZL22ihOfG3Y7bjqwo9wnXTjyR09WeZPIlQt
         sCrmrlTVXsetS0DZ0etvbdwC72AQDjMbPYYiu5VNefLCeDry5dRsACriWxOEFr8TLlnN
         wjCxLF4XutZ7U3Ak7y5rrFrudhmakuwWsocSreQ5pQhm0Q/LNc+Z036gMGFfbzXn0t56
         ONF34D3kEx1HvlOQnenIB+Hf0xFBx4EBY/Pig8JwCp7phs7Kti5teE3Fb3nzdznrt3lJ
         Gq2Qp3H1zWmuvrNtACrziCZqu8uhcRcpa9NPGZBl+Q5vwisrFF5fx8WBhAIIxP1UsL5U
         4eQQ==
X-Gm-Message-State: AOJu0YzqNx8Pj7av9oEB0UvMx4GvWkd6Syh74Kgu0UONFzpd19eJgu0S
	HBiNrc2VMqTu+pFgClrgRIyHBMViT/XtD+jxil4=
X-Google-Smtp-Source: AGHT+IGCQEHT5wSB/1atNHN7gYwqqkBBOI5y8nsALtelx1prp1WiHOG9DP+W+c1xSoWzbn8rKVY9vg==
X-Received: by 2002:a17:907:9809:b0:9ae:5fe1:ef01 with SMTP id ji9-20020a170907980900b009ae5fe1ef01mr2414529ejc.37.1698849168201;
        Wed, 01 Nov 2023 07:32:48 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id lx27-20020a170906af1b00b009ad7fc17b2asm2449392ejb.224.2023.11.01.07.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 07:32:47 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-inflate64: add recipe
Date: Wed,  1 Nov 2023 16:32:38 +0200
Message-Id: <20231101143240.3171827-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231101143240.3171827-1-leon.anavi@konsulko.com>
References: <20231101143240.3171827-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 14:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105820

Add python3-inflate64, a python package to provide compression and
decompression feature with Enhanced Deflate algorithm.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-inflate64_0.3.1.bb            | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-inflate64_0.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-inflate64_0.3.1.bb b/meta-python/recipes-devtools/python/python3-inflate64_0.3.1.bb
new file mode 100644
index 000000000..835856025
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-inflate64_0.3.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "deflate64 compression/decompression library"
+HOMEPAGE = "https://codeberg.org/miurahr/inflate64"
+LICENSE = "LGPL-2.1-or-later"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+inherit setuptools3 pypi
+
+SRC_URI[sha256sum] = "b52dd8fefd2ba179e5dfa18d6eca7e2fc822584616271c039d5ef1f9ca90c71c"
+
+PYPI_PACKAGE = "inflate64"
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-importlib-metadata \
+"
-- 
2.39.2


