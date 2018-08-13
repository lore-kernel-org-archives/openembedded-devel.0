Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f44.google.com (mail-pl0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 706BB70016
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:17:58 +0000 (UTC)
Received: by mail-pl0-f44.google.com with SMTP id x6-v6so6601105plv.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TuaVCnwWEyWDTsiZivWRhNBdiTMljDlqFBLprPpthPc=;
	b=sFCxIlt9NYVH6dac252IfCOXggsWx8zw5B+dQYzUZs+vbweQtfEPalvGKpO3EcJwpT
	hfjSebDzVZevEcdPPwKUvDAS0cN5IL7kZu0rcBP+aX0+V8NrND3vtyFR1twuPj6cyS9a
	l7Ail+Qn3sh/Iqwxl3XJzk7aVnJalFnSj7lxGtNDGhLB856zCZNRMMv2Cc077Zpi0hZU
	vtbx1+oWXuAdIqAAYrYmEGqtGQTNkIP38gzF2lgFjvrdiJBC3clRQfKT8aJe/sVeS1j7
	3TF27pfAKj7V+OOEqrS0lbtB5xnudGrgT0Xj5761wXrLALC2uJyexkHkyYSEyqSmMMzb
	aztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TuaVCnwWEyWDTsiZivWRhNBdiTMljDlqFBLprPpthPc=;
	b=CqYkZWviQnypQQXVUhdtvI130o8u15Risu+ILxurvD/a9C+EoN/e30EZCxV5OgCeSC
	UN0z3rMtN80QkO41G1/nMUj6o89RvZ38ICI9GOswga6X7WcAyHxWAzSpLmdLAv4kYii/
	u+KODjqbZc/13wbrEXGceYgtNeQpCXd0D7hrgGMzpKIf95OStPr0gzMsMf8BU9LzFqya
	tcSXMktoZw1nmjM8OJ/qD5hfUnSq2rt4BQjDpnOULM7OAHnpp3GddlS8I0r35hR/V9Ki
	+eYJvHQ0hVaXfVDoFQRYMy7fNGUsjic4UI1C6hu/4mXSqdx2ZdELiK40zJ9lV2vXGVR4
	5CAA==
X-Gm-Message-State: AOUpUlGn/BeZ+Vndq5wD157Pc2YmC/JTIjILpjT+4Gh4wJb1yd1JVdin
	bvw7dWKslll4d1hcEkslAruB4fSQ
X-Google-Smtp-Source: AA+uWPyNJ+wZm9L2eUI8QShEbsPmzmRFI3pMMs7pXf37C6VTFCrhTYLyRJmyhqk/sAQ1iY0buVqJjg==
X-Received: by 2002:a17:902:b944:: with SMTP id
	h4-v6mr15339971pls.157.1534148279177; 
	Mon, 13 Aug 2018 01:17:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.17.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:17:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:28 -0700
Message-Id: <20180813081742.6961-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/21] lsscsi: Upgrade to 0.30
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
X-List-Received-Date: Mon, 13 Aug 2018 08:17:58 -0000

rename folder to match recipe name

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{lssci/lsscsi_0.28.bb => lsscsi/lsscsi_0.30.bb}         | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-bsp/{lssci/lsscsi_0.28.bb => lsscsi/lsscsi_0.30.bb} (63%)

diff --git a/meta-oe/recipes-bsp/lssci/lsscsi_0.28.bb b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.30.bb
similarity index 63%
rename from meta-oe/recipes-bsp/lssci/lsscsi_0.28.bb
rename to meta-oe/recipes-bsp/lsscsi/lsscsi_0.30.bb
index 4b8cbaf099..af34cdc483 100644
--- a/meta-oe/recipes-bsp/lssci/lsscsi_0.28.bb
+++ b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.30.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM="file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "http://sg.danny.cz/scsi/${BP}.tgz"
 
-SRC_URI[md5sum] = "4a39e3b09cd422e2cae3edbaf56b3176"
-SRC_URI[sha256sum] = "025d009a1af42bc5b2fca664c44c9ecdfd754356e4a44f5c6aced2420afadd50"
+SRC_URI[md5sum] = "298a700cd50bb4be1382d618f7b038f4"
+SRC_URI[sha256sum] = "619a2187405f02c5f57682f3478bffc75326803cd08839e39d434250c5518b15"
 
 inherit autotools
+
+S = "${WORKDIR}/lsscsi-030r154"
-- 
2.18.0


