Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id F22FA77FF9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:10:39 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id q85so1025885pfq.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9P+QarLBiwQgK28XhRFvK52lgfe5PVbnTod0cP/eOq8=;
	b=ACfJG0v2+PlwKcDvMSB5lz8PbBb2qiwc04Ocg7P1Y/AYf6lTCmbGsce3UNG+zUwlcE
	8ifs9BWCpUFH9MN5tgeykvyj9Qg/BNx/t71ylI3UDMSgxfZyLCK6UUwhUr8Z22Wtfdyc
	6e4b5dQg6Y29zyIQOhNU9m7373EPujvqmo3ZdAGL8NEIT2e8IalCip7SuD02Qb2ttlbF
	lJ2RgMHgKct+v6FnrT2BGTc/S9OpHzohClzmEUeEurI98pVsXUJvCoP4AnYLRPeXjQEb
	a5VrwdXGttsgMc/kNsX9AuO9aGmLQM7eecS5xyBQmGpV2LvdFJoS/txdoeBGrqRbYjbM
	9V6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9P+QarLBiwQgK28XhRFvK52lgfe5PVbnTod0cP/eOq8=;
	b=jzmrRuCiiAkMTnVcNT6bCLzZRpYeqJ+Sp+bLAZ7xbl5SVHCbQsaK6pvQl02CIMA9ip
	Y5SYr7Z+Oqt4YcozldCBKG+4tBBWvhMoX45y1mbiJeYd7IFa8Lhm5SEhPjwP4gWO1cUH
	Ram98xpc2OLoVqQ9NMlt/0Dzh2+v3B+RHvDhOVZBFj6qhG9cV/rFa6Xgbozow96qyE20
	Cpw21Dvza8M/T643+I697Xu4+LJeWZZg3pVpZVdIQx/zbn9CE/lNy0unJDI08EC/lyKU
	2mpTrl8aTamR2dXSgy+oNZUc2DjmXFenrJeoB63Qq0sXnMYdAV/WsBrQ2ouypV6HvcgU
	bftw==
X-Gm-Message-State: AIVw113XWZU//za/gsfYLUhAX8VV4NKyx/vyc0ZpjFTLI6VDAxvnu1J3
	t2iyxuxdX/Y2ddKe
X-Received: by 10.99.150.2 with SMTP id c2mr791053pge.166.1500347441042;
	Mon, 17 Jul 2017 20:10:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	w85sm1086674pfj.115.2017.07.17.20.10.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 20:10:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jul 2017 20:10:08 -0700
Message-Id: <20170718031013.44536-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170718031013.44536-1-raj.khem@gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 12/17] sessreg: Fix build on musl
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
X-List-Received-Date: Tue, 18 Jul 2017 03:10:40 -0000

musl does not define _WTMPX_FILE or _UTMPX_FILE
use versions without 'X'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb b/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb
index 2e25b7d91..3885d613d 100644
--- a/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb
+++ b/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb
@@ -6,3 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d938a70c8280c265a1ccd2954365d185"
 SRC_URI += "file://0001-Makefile.am-Error-Fix.patch"
 SRC_URI[md5sum] = "e238c89dabc566e1835e1ecb61b605b9"
 SRC_URI[sha256sum] = "551177657835e0902b5eee7b19713035beaa1581bbd3c6506baa553e751e017c"
+
+CFLAGS_append_libc-musl = " -D_WTMPX_FILE=WTMP_FILE -D_PATH_WTMPX=_PATH_WTMP -D_UTMPX_FILE=UTMP_FILE -D_PATH_UTMPX=_PATH_UTMP "
+
-- 
2.13.3


