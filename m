Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3B0E978268
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:00:18 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id u36so15349943pgn.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OxSaHLMxK7d0dWSaNM/psfOq2zE5ZabZJe8aL9sqYhQ=;
	b=i/P4gkQFgbDy/CUgaQuXz6qsnufJ1Ix+q/nHn5WkrYbvaoTDFt/mqvsNavG1unGTnz
	JtE5Slfr7mcXEc4tOLRoU2Iy86Lo/RtwwCm0HRhzoWjdrZ/M4vbmGUjdJZej4m6qXaFO
	PXsI1afNUqBF1yXR7Mvx6vpQJ34171qkHeG/Ax1ynh4lQdoEU3W59Y58bx63tLjZnZme
	2a58LUs3XvJj7Y5ZHKn/xoP+JdjRWCQqu9oSuAZ6TbYVsBKD8Rsn+nl+k4ASDK360T6F
	DH8DAtPLwimm67hcsnZnJUGky7Cvenr5Jo3npTLSTIj4fBo4YqpcCmTLcED4hHjWwttJ
	VaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OxSaHLMxK7d0dWSaNM/psfOq2zE5ZabZJe8aL9sqYhQ=;
	b=cWNAg04eH2Y/2Ss94liexnPRfD9DrUpul1x8ahDrvSh7pzCVuyznz74fo2MKJd6+NI
	FfhWMtptnwDGJbnLOUZNugGE7DCEenUkka4/Svxa7JZmRS+irrFSyH4FQHwaBrWkv5BZ
	/NtI3RbyRmK/FfS+COqG2REuQKEq4H6WaSefwQNuTryxQFzI848jYg6AwZkP5gHTb6ia
	oZLyM5Y8OaYvzsg625WOWcMxdmQKZGzK0WX4ci2dmVvnmN0CTxyw5KyHN2vAOORVDY3A
	kARIwJVAalQofxR3QTYsphA8kz+nhA1bl0YMt8q2JF6kS4W8CFWJTHMp0t1M9bf2jYj5
	9JcQ==
X-Gm-Message-State: AKS2vOxwWwN8FBIAQGGrwc3j6SbwFDcvtBbkczxFHBG7i2OxxaDvCo4w
	36csKIVh9GFdtYGW
X-Received: by 10.84.142.101 with SMTP id 92mr24014576plw.29.1498827620039;
	Fri, 30 Jun 2017 06:00:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm10735590pfl.41.2017.06.30.06.00.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:00:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 05:59:46 -0700
Message-Id: <20170630125957.3342-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170630125957.3342-1-raj.khem@gmail.com>
References: <20170630125957.3342-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 06/17] babl: Upgrade to 0.1.28
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
X-List-Received-Date: Fri, 30 Jun 2017 13:00:19 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/babl/{babl_0.1.16.bb => babl_0.1.28.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/babl/{babl_0.1.16.bb => babl_0.1.28.bb} (72%)

diff --git a/meta-oe/recipes-graphics/babl/babl_0.1.16.bb b/meta-oe/recipes-graphics/babl/babl_0.1.28.bb
similarity index 72%
rename from meta-oe/recipes-graphics/babl/babl_0.1.16.bb
rename to meta-oe/recipes-graphics/babl/babl_0.1.28.bb
index daea05212..9d8c90fdb 100644
--- a/meta-oe/recipes-graphics/babl/babl_0.1.16.bb
+++ b/meta-oe/recipes-graphics/babl/babl_0.1.28.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 inherit gnomebase
 
 SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.1/${BP}.tar.bz2"
-SRC_URI[md5sum] = "a1c72e5f5d55a8b736ef2fa67ddb86ec"
-SRC_URI[sha256sum] = "7d6ba55ec53ee6f6bf6945beec28839d09ff72376f4d83035eb379cd4f3e980e"
+SRC_URI[md5sum] = "cc53d8474a43aafb7cdaccea56cfde44"
+SRC_URI[sha256sum] = "63f3ed23e72a857a0e6df53d9d968a325024177b01edbe314a0c98b499eb8603"
 
 FILES_${PN} += "${libdir}/babl-*/*.so"
 FILES_${PN}-dev += "${libdir}/babl-*/*.la"
-- 
2.13.2


