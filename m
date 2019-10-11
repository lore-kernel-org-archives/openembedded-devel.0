Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id F06D17C89C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 00:49:17 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q10so5016099pfl.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 17:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NPvIVEDj6g66Y2QD8iRJxBRN53HJUh2CE7NSLVMBgqc=;
	b=WTiw9NU9Fb4L6h9WEe5kdrM8spZzSZpchWOTs9ojkw+XnARVJddS6ebmuLWjkpkSgT
	ICKLp/bhvPJ3p2nKEozv8Pvs7TQx/Ttx7eGPk0ndhJN70R6BgIlNGtGLp7TMalZ9/Wab
	jHz2SAFQqR/+5iK37GMiZrZ7E8P8hjGBzf6DDRskLHDFMEtHaRvszVZVkjPTua2seHrh
	jMCKyFjkWIlx4FxLHeIEIiXqMZkvqiVR0ATFSYPSKZfr5xj+sRhzozS+mnYlLvvlEd6U
	V5oOqERWGvXlft04ErnAxNMQFjjbllTKJX9/ZeMb5TcA8PhGKrE8loQDCTVoD8cgcPJS
	s95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NPvIVEDj6g66Y2QD8iRJxBRN53HJUh2CE7NSLVMBgqc=;
	b=SKSGoEtIQwYwWDYkaUg7QUNtpeXMSnusEQVZlfH9O/RZVfCZSnQdXi6thl5wqUNhHL
	Wjtd3s05ypukAZ3YCXxGaMevloI+yXQRd2N6mg6VmJgWfCQ9u5uUgEETY7kts2MEZLJh
	td4vCsHYcCsBOysyzat8J0Mj5EocrlA2auGqXB9njoDxf94nhRIGlwKI6wZiIs7AYnKb
	i0dIsDwLbdy889FOqDHMT1pnkRYXQJaV8fo+FsGw4RG4ulpBJNtLOckVmfa9X68gTQdH
	ZgnTRAnicEH8EWWPLVz9+Qfle9jydoaNGRgaD5wgUp+jYTplxo6l92j9kMyswDDIVbzU
	oyRw==
X-Gm-Message-State: APjAAAWe0XY86cALqkV+yt5H3zs9/6Mjt5E6l94HzSDvEyCrKOFWI5zb
	nlJXSajoQUseBmQHXC4N/adTmfxfktE=
X-Google-Smtp-Source: APXvYqx0Y4Gyo3t8WmO7fP6D7+BAGTjjx5JkX6jAZDScUohOf6s3m55gedQh08npE79gMR+zuLfQiA==
X-Received: by 2002:aa7:8ad0:: with SMTP id b16mr13756138pfd.255.1570754958120;
	Thu, 10 Oct 2019 17:49:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id 14sm6822850pfn.21.2019.10.10.17.49.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 17:49:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Oct 2019 17:49:07 -0700
Message-Id: <20191011004907.1347765-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] jsonrpc: Disable coverage in default build
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
X-List-Received-Date: Fri, 11 Oct 2019 00:49:18 -0000
Content-Transfer-Encoding: 8bit

Building with intrumentation is only useful during development or
optimization phases, in production, this will just make it slow and in
some cases not work where file system might be readonly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb
index b23775708a..6ad0a49abd 100644
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb
@@ -18,6 +18,7 @@ inherit cmake
 
 EXTRA_OECMAKE += "-DCOMPILE_TESTS=NO -DCOMPILE_STUBGEN=NO -DCOMPILE_EXAMPLES=NO \
                   -DBUILD_SHARED_LIBS=YES -DBUILD_STATIC_LIBS=YES \
+                  -DWITH_COVERAGE=NO \
                   -DCMAKE_LIBRARY_PATH=${libdir} \
 "
 
-- 
2.23.0


