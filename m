Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb0-f180.google.com (mail-yb0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6D382790F3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 15:32:40 +0000 (UTC)
Received: by mail-yb0-f180.google.com with SMTP id k5-v6so1709601ybo.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 08:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JNjqW941q//CJRMVhjIn8OX6ykVa67wU0siNvZFFAOo=;
	b=Ne00up3DkFBeo/QO6GQpOc786/hMnLX1f+GXPELWZrtRsOxrxe2IHnrghZPMj/ycMR
	kGlYF6rjlTKYHzy7JqJjCmXqvE7H8SyzUwUNN954uBBi7tcwyjdjbHFSE1xp5HC4m/5u
	foquZeqYlfW9b4c0gquGIuwCSEDK/QiG1J7yMh+Vt7PZUUeYA1X++Gs9tNbOsMdTRHtt
	B9QMBLmlUO5wLAWvIvCbXRoRCTbXgokeCpETHXmq8M6duMLW31OB69ZGhxI6Vh7ymSfc
	MK+TbKDqYOf0qw4HAbqT6eB9Ia2JNYP6xStD045kqGI7Ehw4uQ42FAaoXZ7ynuSWBjIa
	QZYg==
X-Gm-Message-State: AOUpUlEyWqmNoBvBtEHmYCmGKL3goyvoKc6p17f/IIfNsocFY6Keujbd
	FHYNHMdIi7hEoc77wh6V3GREb0M9
X-Google-Smtp-Source: AA+uWPwZAtAQdsr9A0lPadRD/bHs34hLsRJDbKzoWrWTjyirJUWItHzkohQmJAFVQyel/FLVn/r18g==
X-Received: by 2002:a25:1fc1:: with SMTP id
	f184-v6mr4465661ybf.164.1534779161373; 
	Mon, 20 Aug 2018 08:32:41 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	z193-v6sm1496775ywd.90.2018.08.20.08.32.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 08:32:40 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2018 16:32:33 +0100
Message-Id: <20180820153234.10990-4-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820153234.10990-1-git@andred.net>
References: <20180820153234.10990-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][PATCH v2 4/5] openjdk-8: allow to build client JVM via PACKAGECONFIG
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
X-List-Received-Date: Mon, 20 Aug 2018 15:32:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The aarch32 port will need to unconditionally enable this.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index 939155b..d04b0d3 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -32,7 +32,9 @@ PACKAGECONFIG[jpeg] = "--with-libjpeg=system,--with-libjpeg=bundled,jpeg,"
 PACKAGECONFIG[png] = "--with-libpng=system,--with-libpng=bundled,libpng,"
 PACKAGECONFIG[zlib] = "--with-zlib=system,--with-zlib=bundled,zlib,"
 
+# JVM variants
 export WANT_LLVM_RELEASE = "3.5.2"
+PACKAGECONFIG[client] = "--with-jvm-variants=client,,,"
 PACKAGECONFIG[zero] = "--with-jvm-variants=zero,,,"
 PACKAGECONFIG[shark] = "--with-jvm-variants=zeroshark,,llvm3.5,"
 
-- 
2.18.0


