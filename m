Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 965836D3A2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:36:12 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id gn14so4862341plb.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/+XSWgNEA9pl41O5Dlta2LCjbO5n4lq0do9qxgdZbMs=;
	b=BkgriNTbR/t/d7B2CspbHsjnb+yxwBRH4jCqA7tsj1Nkzwv7IMNFLCUQpKmQxnaZou
	OsabDmqAmwVMj3iZn19gK0ttY6BHBUglo7HilaxMcPSQGzLbWunZjUyiUTQ9h+VNhPig
	bab4tdMNb/BGqkFhLi/TNcYdia7FSUGqjcmOR1SiCGC9KrJWljkw+3gPLdoQKdHd0gE1
	GyEmPBUqb4i8oEg3XH4mRfaGb5cPDiuaFy4jce3fUK3/3GWC4jHYPoqzmYSKR5wwZJ7x
	1h00oK+Vab8Syr+pvCxoZwef23oJUZFrKHbartRskX7Yyc/Sfxz7OkckWRQmAU5Ja4zA
	dNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/+XSWgNEA9pl41O5Dlta2LCjbO5n4lq0do9qxgdZbMs=;
	b=lTvQyDv53m0wa4PoYQKKqpi94k4OJiitcMmV1z+v1agWl9X82AHZTwrLyWFVs1lZ2c
	A3SmO65wQ3t4gdG6eYW28850Va25vomA9RMmFYiZYgg2GuwsDpHv5rz1LxlfJZ7hE2yb
	2TJjg0j2/RpQq49j+3oOQ2FZzZmwtjP+oy3j1Pqgq1BNuQZzVbxZf/CYz6njyMNt3CRQ
	qn7+5agyWoy5841kNbpwl6ijMoNfwmBmyD93GBeXZ3yIP2S04Xo/vqtFxs9SV4ycomup
	q0kgA3nocvecjSxII40R9eqyK3ad7tWlgDy+5Z4b89k33oGWZzhIplT+rqlp4vgVA4Br
	ISkA==
X-Gm-Message-State: AJcUukeB9qAZWW92F1u+7KDZn6lO+JpxT/dcRGz/cRLCua1mu6wIWTLs
	rE1aPr/wTZSQmyVa7xP2rXPVAbzZlv4=
X-Google-Smtp-Source: ALg8bN49+nSgGLlp7KnHsbUGXJ/ydx9MaZyYo94rzwe29aVTJP9V8xWuplHgvNj4UGV40SCz5rOOFw==
X-Received: by 2002:a17:902:6a8c:: with SMTP id
	n12mr10898061plk.85.1545600973349; 
	Sun, 23 Dec 2018 13:36:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m9sm33340800pgd.32.2018.12.23.13.36.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 13:36:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:35:44 -0800
Message-Id: <20181223213557.7834-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181223213557.7834-1-raj.khem@gmail.com>
References: <20181223213557.7834-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 05/18] libgpiod: Rrecommend python3 only for PN-python package
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
X-List-Received-Date: Sun, 23 Dec 2018 21:36:12 -0000
Content-Transfer-Encoding: 8bit

Fixes overdependency on PN

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb
index 30289b983b..dd080ff9d2 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb
@@ -7,10 +7,10 @@ SRC_URI[sha256sum] = "b6b9079c933f7c8524815437937dda6b795a16141bca202a9eec70ba58
 
 PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
 
-PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3,python3-core"
+PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,"
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}
 
 PACKAGES =+ "${PN}-python"
 FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
 RRECOMMENDS_PYTHON = "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '',d)}"
-RRECOMMENDS_${PN} += "${RRECOMMENDS_PYTHON}"
+RRECOMMENDS_${PN}-python += "${RRECOMMENDS_PYTHON}"
-- 
2.20.1


