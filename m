Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id C0397772F5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2017 12:39:39 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id o16so125291577wra.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2017 04:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ntawQLqaEMIMZysGC7f3K3gAXxWej3sjM9sLzHhbe3M=;
	b=okCfFVTDeQBM+wzlqo1S5Uai/RFWdRZxRETFnMYKLtblqFA4/lktLjy6E6nIpo0ioH
	zoIlTSbIzJhVGTh+faua1o9JZ8oKiA2UinK6iVp3nLHnhd1sSiCQqn3YKGzTUX1qiv5g
	AeYlfTLvGYSuw6vEx3wKrhgZv68OyyACHf+G9ZV/lfCrF9SZuEmDKiSnhf7EQ9ompNuv
	c7grslOv79sdGS2x2ThAaCryKOq3qJMBDIGq18oFKVU7ZnnK4i6mlYFcLrMnwDJ9mbY7
	5hqZESDSg0qU5WcL4leEZLUsIFgoSraaI+YCJh657ZkoflEo4HV/FAUGWbKA9IG5Pg5I
	Mdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ntawQLqaEMIMZysGC7f3K3gAXxWej3sjM9sLzHhbe3M=;
	b=RjiEGVIjfcEp9YpptlFItBQM+VaOszsowccFoMoKdZ9NPggf6c3NC2GH2l4Cm/9nPs
	sLLe5rBO+tlRFd1ma894FDEEpK0MFNKVoOmHkAjATB/io8ECAhYSHLhqNY+BnMVsSlKN
	7KjQiOfTb6zfXvopNwoL+cHny9F0fMmMorwvzxqFTWQcHiQlxkya2w5tXj6seuCEI4Zr
	FooiiyJwX6F/xQxNWionIvYvPCoWsYl9XzXKK+wl1rhA5tiLe33sJYeuJHFuMmuvFSUi
	qENGuooPxYNn7ccnoidknssSCqMk8erqCi22tvFVSugqhmlHw/9MoH8vMfB+R4vYnncR
	OGag==
X-Gm-Message-State: AMke39k/CodTwKOkekS/mkx+MYecRBLSqPCZmPe8sPNaSpnEyPwoKmdtXWzjKLZ0AZVmHA==
X-Received: by 10.223.177.136 with SMTP id q8mr11261535wra.134.1486816779096; 
	Sat, 11 Feb 2017 04:39:39 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x69sm5074156wma.15.2017.02.11.04.39.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Feb 2017 04:39:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Feb 2017 13:39:34 +0100
Message-Id: <20170211123936.4128-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH][meta-oe 1/3] glibmm: add dependency on glib-2.0-native
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
X-List-Received-Date: Sat, 11 Feb 2017 12:39:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb
index 9479de9..9cf8220 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "mm-common glib-2.0 libsigc++-2.0"
+DEPENDS = "mm-common glib-2.0 libsigc++-2.0 glib-2.0-native"
 inherit autotools pkgconfig
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
-- 
2.10.2


