Return-Path: <net147@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3018B60797
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 12:22:10 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id ez1so1118480pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 05:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1F2gXjEjRjgPidt6oYU9h6zcBsWdYkzgARtxZJvzc0Q=;
	b=F5c4mGpDgBYSSI2zfizZPp0GC8iVE5NySM0GxaXcu5tyumvXOSmOD2eCtYuLe9PXyY
	zVtWtxAScTqxsR43Hk6fALik0NQ28EUKWl3tf9T632SvMAHxubGY5ip38a6TXSysuG39
	T8Ra9j9O3X5QY3LXc24Mp3pI2PutKr7bBqtHhogrGkwSRBkWMRBWOHwuduN1H1Pq8H2/
	ABdD1hMh+9kHNnclDSq55Q05n8G9FsGASflTHbQ/Pdcb8TkWbuh+Q/SUiBYDNaPXnr0f
	0ASqvb/9xY1jBlFgPqfF26qSR7ioDNHdt5BhVAeKrsvqulwpezfgxX3qaPRhq9efpm9t
	dbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1F2gXjEjRjgPidt6oYU9h6zcBsWdYkzgARtxZJvzc0Q=;
	b=m+D0y3Fb6OEsavddeiqr2+P+pC6r9bQ6/9Kg+z+2UoHgcSjuiSjOxjDImlTDMYt+50
	QevUaiBdRZrkxxybFkvxwfnMkVX1kEgnRjPNcayXHgVx7fYqog1P88ZJPiSIokBZfuUO
	r9mDnWxuvEwt6I5BQmgsFjjh6K5FCR8ZvTK4/DaMDdSVgAU1ORRWblWjuMsF+Ocy4Zeu
	3zaZNaxaKhc0AOpQ0zbaZGjdqe6yti6rUWk4m9xlxGik4J1YAwqoNYCQpfQpBXuB03VN
	ZQdPGkK1ZprB+bgFRaABuI6W+NLD28HAzRzDBr3P07v/N7bTakBkcuFJ5jF3c+qWXPEX
	iY4w==
X-Gm-Message-State: AE9vXwMZWmb6yO9sFxdreYcAl2xf1FOKkAFfLeaKb+iR/68e1HwxfWEOMFzaZ0fmqQtcAA==
X-Received: by 10.66.164.70 with SMTP id yo6mr5054720pab.47.1472041331366;
	Wed, 24 Aug 2016 05:22:11 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	k78sm13351328pfa.78.2016.08.24.05.22.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Aug 2016 05:22:10 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Aug 2016 22:22:08 +1000
Message-Id: <20160824122208.26537-1-net147@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-oe][PATCH] nodejs: update to 4.5.0
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
X-List-Received-Date: Wed, 24 Aug 2016 12:22:11 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/{nodejs_4.4.7.bb => nodejs_4.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.4.7.bb => nodejs_4.5.0.bb} (96%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.4.7.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.5.0.bb
similarity index 96%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.4.7.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.5.0.bb
index 88b0e87..ceba2b8 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.4.7.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.5.0.bb
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "e4d118a3762a3e60b97a62cf83194efd"
-SRC_URI[sha256sum] = "1ef900b9cb3ffb617c433a3247a9d67ff36c9455cbc9c34175bee24bdbfdf731"
+SRC_URI[md5sum] = "ac8e38c83f29e83d496d4bc4283487b0"
+SRC_URI[sha256sum] = "97b99d378c56802444208409568e2e66c46332897f06aead74d1ffbe733bd488"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.9.3


