Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f49.google.com (mail-pl0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 66AD474AF1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:17:59 +0000 (UTC)
Received: by mail-pl0-f49.google.com with SMTP id t17-v6so6591678ply.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QUeKbvGgSmDmeyANHifDk4sVNBHvKNC98JHBnHghmkY=;
	b=jRAihNzCcLt3Ro9a1CHkzQ96nM636enF0pPCRWT7P8HhVbI4xoBse/OutHnMlcC0zA
	WvBdYAiG/HnLiz/rZ7Bdh3PkHbCZfWojTpWCvAu7i/v9JXvgBdhXcBuTIskPREbOkFEU
	XApgOoJ3i8kKyEhSKws16HP4eqTnkrcf5rtbH4y3mSYXsCmREJPynLs0Xj5mqKO6nTcA
	snZJUNTK2uzVCiAzH8eO5mO/EeMmthl5Qfag6L78cTrkodBrtwO30vuvWfEXr9aCiyG5
	i2ZImGWLSKWz2NYgBSymyhDrDCfB8kr+2y2ZqslQi0ASDR0h/IxlOA3k0bi57sXbmZb6
	Jchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QUeKbvGgSmDmeyANHifDk4sVNBHvKNC98JHBnHghmkY=;
	b=Vi28kCb90u+GKSt71vqkqO2dS77Jq2kXaZRuqRkwBHOUEbyIFIQMn3o/TTpLcUxEGZ
	ods/dFJw4bogIkko4ro96uzpyXh2+PBLnUuLx6wfnx6YNqjIbgysCRHUY9LoAw8vVjVf
	Y4ANi6eYmM7EXwdz0qE77xShbIo2rmsKAYJmpZc9pxosnNRTcSIXsIwOoIGCsLQenvYN
	OgbBL2rE+PrxP4GW4YlYSyF8VMHz4kIdYlnToqnmacPzIg3tmHf5rNz05WSFJAotjO5f
	LdvGOHpjRJPyDlkEW12KQk9Wr+tt46itKsjNorXO84sfE40vuW/30u/b4ogYL1oRaPBP
	hZXQ==
X-Gm-Message-State: AOUpUlHJ0nApK17fHPU35I7ohTdlG0LipVNCp/NNz8vaNquEaH498AfV
	36nSA/gz5/G+izJaXL5SwjSVQxjU
X-Google-Smtp-Source: AA+uWPzlC6uCVcmoqxfilfsxQMdQp29rEThOa9dypj13A6b0iAQZnV7tHs39aOH/DW9HbZC0YFQ+kg==
X-Received: by 2002:a17:902:24e:: with SMTP id
	72-v6mr15549605plc.74.1534148280189; 
	Mon, 13 Aug 2018 01:18:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.17.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:17:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:29 -0700
Message-Id: <20180813081742.6961-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 08/21] hiawatha: Add missing dep on virtual/crypt
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
X-List-Received-Date: Mon, 13 Aug 2018 08:17:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_10.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.7.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.7.bb
index a6926d8f44..d6c449b5db 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.7.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.7.bb
@@ -2,7 +2,7 @@ SUMMARY = "Lightweight secure web server"
 HOMEPAGE = "http://www.hiawatha-webserver.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
-DEPENDS = "libxml2 libxslt"
+DEPENDS = "libxml2 libxslt virtual/crypt"
 
 SECTION = "net"
 
-- 
2.18.0


