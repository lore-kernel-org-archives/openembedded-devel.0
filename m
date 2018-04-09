Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id EF04674A45
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 22:03:15 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id y55so11035040wry.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 15:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=7fiQpSmNG+D0Fw2wyuJZUjFu4j7ZAK8qPyYFnNobLaM=;
	b=ks0blGYQjDUYZScSpNhnpfSTR+gMy2lhTb/ToC472JP3NSE0IwyqgH942Em3zBIeGh
	52LOM3WnD1rxn8ht2RuyS3dvpokPio0hn45xsxv64z9828i5szuN0Pi2Od7T3DuWm+IE
	GV074b4IeVFkW8XmTFTCf1gXGXrDh3nU+9ic5OP1mHchsCTE/bx7FTiUCuoqF2txIxXM
	It6f9tspKtdPTWcZW8nO0LmI69oaYmQhnsxTwMW8CloW5yQUXvThefLAq7xtG46x4S3Y
	hCwwox1KB3d8L16mW3I42H13FlO9k60wl0PHGmDjybYtJVwZPjrOb8pnRftt5A8N3I+N
	TPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7fiQpSmNG+D0Fw2wyuJZUjFu4j7ZAK8qPyYFnNobLaM=;
	b=m7f5el0mLjXJAMSpg1aUKVliJ4Smq5700VisLhnHeWFGKXgnaMygLmwWGE7yZok7ot
	+fqbm4H6MCidIoYr/6I5FpP5vxOhJTNKsuC42wgKfueADZ/ZFV/AZJuM9ZgNg7RTeHAJ
	QT14NkV0CFfBqNTiSBBmyZo5ayXZhZDsjnrrQfXXzz3r+geal/JTgi2xkagZ1sIKvZiF
	Zr0ZB4pbvR3qoKHIx44Ob93GQ50+6LMhBQ6gZpMQRXes0MiHc92MO9s6QUxpviSBiatT
	+VNgiGNjOdibnuWbCv9MCIIIq1fdk6S7XKYPAj9PLxr2sEJoSwVQ2R4lrRfcO6+JvW2I
	PqbQ==
X-Gm-Message-State: AElRT7E4CUAVD66qhY8l2GXDWOlPyr/lBS0MTXnJMCk54tzS3x2XSof2
	Oy+Dxj0uE+HnrRDVahqokSLWBg==
X-Google-Smtp-Source: AIpwx48tNelJHCsVg/M0MtHq41BFCGQByubmxMR9uuZ9jLfvJ5On+QZYVE5gQJe73eFssDajSgypgQ==
X-Received: by 10.223.220.70 with SMTP id m6mr26191551wrj.244.1523311396011;
	Mon, 09 Apr 2018 15:03:16 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC14F231E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:4f23:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g185sm650954wmf.40.2018.04.09.15.03.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Apr 2018 15:03:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2018 00:02:43 +0200
Message-Id: <20180409220249.11796-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180409220249.11796-1-schnitzeltony@gmail.com>
References: <20180409220249.11796-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] poppler: update 0.62.0- > 0.63.0
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
X-List-Received-Date: Mon, 09 Apr 2018 22:03:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/poppler/{poppler_0.62.0.bb => poppler_0.63.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.62.0.bb => poppler_0.63.0.bb} (93%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.62.0.bb b/meta-oe/recipes-support/poppler/poppler_0.63.0.bb
similarity index 93%
rename from meta-oe/recipes-support/poppler/poppler_0.62.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.63.0.bb
index 696621938..143df3f73 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.62.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.63.0.bb
@@ -6,8 +6,8 @@ SRC_URI = " \
     http://poppler.freedesktop.org/${BP}.tar.xz \
     file://0001-Do-not-overwrite-all-our-build-flags.patch \
 "
-SRC_URI[md5sum] = "42b801f2defaccb6b6cf1bf783ee1552"
-SRC_URI[sha256sum] = "5b9a73dfd4d6f61d165ada1e4f0abd2d420494bf9d0b1c15d0db3f7b83a729c6"
+SRC_URI[md5sum] = "66a54da4896b1408611699feda5c1821"
+SRC_URI[sha256sum] = "27cc8addafc791e1a26ce6acc2b490926ea73a4f89196dd8a7742cff7cf8a111"
 
 DEPENDS = "fontconfig zlib cairo lcms"
 
-- 
2.14.3


