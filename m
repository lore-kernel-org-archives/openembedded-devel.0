Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id B44407842D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 17:55:50 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id i190so3173146qka.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 09:55:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=f68Q4NUMfQd1boTZgih3+mLgl+ae0ono8Kb8GAjsxyo=;
	b=FbbzMnIT4Pg11reZiesrTkLe9eyCpw9V7zm56NJH8yhWoy13msId2bXeinpQZBSFUq
	sVoyUQ3WHfJV89Al3RL9NbuJPguLkm9r5mUrEhRqoXb+fUeIgzP7CVvCp2arSLzs+eq5
	5sFMopXX6zmcThGP6WC2e6nV5wAWGWyCn9GyGqZ1KXfshZiAUsXyDJwcInmsMN17jiIR
	TxjNnfDNObuDeh6ZFtPEXaTigKYL2ysCqBWe1DH620ir0295KJQbwP5xPlhWnFoxZrpz
	gsACcvirrq8J+2nwXHq+ziqYYw9eoB/hHGNsf6cQjVhGWyZZByuv8WG0EyvT6CsUULX6
	A7BA==
X-Gm-Message-State: AKGB3mJ8+jKLB11st8Dm9ZUZVSBCfleeC+QrCqYUKRO8VQx99HPXRJ/z
	rAWB/SChssbVUljem3XiM/s4+ehN
X-Google-Smtp-Source: ACJfBouOt/WOiWHWnZ9iJTsu6Zzaiuaj1AE2FT+2aQiUo3S0RMiQXkfHhPfkzi0w+8dvlt0uJIplww==
X-Received: by 10.55.100.201 with SMTP id y192mr4107357qkb.265.1513706151325; 
	Tue, 19 Dec 2017 09:55:51 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	e62sm9741192qkd.91.2017.12.19.09.55.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 09:55:50 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 12:55:45 -0500
Message-Id: <1513706145-30948-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pycparser: update RDEPENDS to add ply
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
X-List-Received-Date: Tue, 19 Dec 2017 17:55:50 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pycparser.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-pycparser.inc b/meta-python/recipes-devtools/python/python-pycparser.inc
index 6b05482..af82583 100644
--- a/meta-python/recipes-devtools/python/python-pycparser.inc
+++ b/meta-python/recipes-devtools/python/python-pycparser.inc
@@ -9,6 +9,7 @@ SRC_URI[sha256sum] = "99a8ca03e29851d96616ad0404b4aad7d9ee16f25c9f9708a11faf2810
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-ply \
     ${PYTHON_PN}-subprocess \
     cpp \
     cpp-symlinks \
-- 
2.7.4


