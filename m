Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id E0A2B7F4BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:32:02 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id u72so1104442pgb.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fDR3ZtuHOoGaEl6DZ/xEAMXzexVZvsXJeHSIhoZTEa0=;
	b=ENqk3RXMgNYitWo5fxQBHsXZ8RcjJdnZiB6fZKgldQfBLnCF6V7bQtKLNotfFHvNhY
	e+KUBk5miev5jjPmMvtzVhYcDDWeU2YqvqYoJkz9FbbYK6RSdjaGbuoMfTq5q5jESORR
	PwZQvQ1GglYqyaulxzAVp2XZiMQJyYylwcWLgM2hNLqNJ+IandtJ3clCZvuTXje4qL3c
	OKQWnpUc9ys2b2vScJTofeIk7r6t21nG2RHQXhs9Of4Iuxs6j+5cF9WZydCr3OcJZN5e
	cK325oDvzpjrQLu2QpWeVIr5c2KgfTACZhwttVSHaN05W93vyCmWZvAQJqoI5U8HEPRu
	RSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fDR3ZtuHOoGaEl6DZ/xEAMXzexVZvsXJeHSIhoZTEa0=;
	b=i6kO3sWJw0XJxFsEGD9pDNW2XhF89Gi/f14aa+lDvJHoDpNRvVUh/erN/QzH4pujl6
	TqnkfuHmvs3w+mTJELk6mbR1lRBbg9UGiW0NXMl8cHFS0Tdwq0SF2BDc4b8y9ibYuf7G
	/BGYXC5VRZMEVcO/58zTLGg3SRwsgJzQUPKB+G322hBehmixsbxRJe6jY9LlPvpdIqUn
	DKkdjD1ep/t1ENffRgqt9ya6Y3L2DQp12wUjvMQFMOc9A7gOJIbmJHlEavkBk/XiwC9a
	ANdoxy1tzKeRfg4WM0PfLHMrRzdp9lIXOdxAx82DZVNE1Q6fSPPazLPf4p12RC75gOwm
	JoWg==
X-Gm-Message-State: APjAAAVs8hcP3tHFuuePQCLZhxD/wylYQljwIDj1+bsvambDLYhyC58Z
	BxhW6pQjKECXmY+wDftdPS0cqZH6
X-Google-Smtp-Source: APXvYqyS07dRPacoWqdSudAjRdWoSiO0N1isqsts9wNbF1sxIucpy38G3em1LKMwWfMaDWe3+3rSgQ==
X-Received: by 2002:a17:90b:14a:: with SMTP id
	em10mr5262469pjb.26.1567287123711; 
	Sat, 31 Aug 2019 14:32:03 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.32.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:32:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:39 -0700
Message-Id: <2f92495b0c88edd9d094a1e6e971bf97fc211524.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 18/23] zeromq: Upgrade 4.3.1 -> 4.3.2
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
X-List-Received-Date: Sat, 31 Aug 2019 21:32:03 -0000

From: Adrian Bunk <bunk@stusta.de>

This includes the fix for CVE-2019-13132.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/zeromq/{zeromq_4.3.1.bb => zeromq_4.3.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.3.1.bb => zeromq_4.3.2.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.1.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.3.1.bb
rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
index 6e13376..adf2c7b 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
@@ -9,8 +9,8 @@ PACKAGECONFIG[libsodium] = "-DWITH_LIBSODIUM=ON,-DWITH_LIBSODIUM=OFF, libsodium"
 SRC_URI = "http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}.tar.gz \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "64cbf3577afdbfda30358bc757a6ac83"
-SRC_URI[sha256sum] = "bcbabe1e2c7d0eec4ed612e10b94b112dd5f06fcefa994a0c79a45d835cd21eb"
+SRC_URI[md5sum] = "2047e917c2cc93505e2579bcba67a573"
+SRC_URI[sha256sum] = "ebd7b5c830d6428956b67a0454a7f8cbed1de74b3b01e5c33c5378e22740f763"
 
 inherit cmake ptest pkgconfig
 
-- 
2.7.4


