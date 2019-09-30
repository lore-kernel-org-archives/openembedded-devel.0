Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 397217F277
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:37:50 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id b128so4864492pfa.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mNFSbpsGdEZ3y1Djj7Y5a/bmL1Qe51WrCsGTIyRYcrY=;
	b=kexpg/Rsx/jlDrKBlCQU2KkSho/2tqRCAHbb/EO1Uj4nK92Ca0uFfkTncmQ3aHR+eg
	8x4DaAyQ/o5XgAP6hatblT//X5DWcCF9RgOK5z41OIMXsG88/ERHmwJPlnmiK9Cqm0Ep
	xM2uYxHcozDOWA5OwNZBH9wO4UZDiTglN2QdIxu482vUZkpAvEVQDwbXAzWObkLgL+sM
	V8zXIW6kXfRmRe11DN/iO6VndHOKkU80vIHMoG+lXIjxJ6Mmvu7fZSbyIAp84hO0xS1p
	cfdJNV5gLcjIQhgCBE7/U4+DjsUK3vUdiw3fUqZ3cQNkY3sjnvkpNO+pZG/C8FhTtPPL
	ZAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mNFSbpsGdEZ3y1Djj7Y5a/bmL1Qe51WrCsGTIyRYcrY=;
	b=T4rRVPD+l/LRy+sUSzpJI16JOvN5i78amyd9WP9FZfL+/Ze/yDT5VoN+RXevBINcI1
	QBimyFkTgWu7Kjh+Lwq6Vck3RQ2p8U/LhA31sOtmmmVAgu2VSDFcYi570gQF0wrzI9dV
	9ODWSZqmZZrAGiN71uxSssGdNNLgmwDjJZFVSy5yjZQvnGH37A1AkFRGmlsiIvaAtYdM
	TG6lbU8N9VWdbilqzpQLFbSQHRuJmtfh09p1q3QPd79bqAPAEpwGg7pN5AA3PejWsI5p
	GhwNdT9MXpADsPojZAWkMkB4BagXMjJiMgsZ3KzA3GISYAQGu7pA+pselisU+uGKD8wu
	L1ZQ==
X-Gm-Message-State: APjAAAWX+LUSqrkvOZ+lyDv0VwQE68dJ2UDJUX7Nikj9xWMnBqevzPvl
	rgQZdAzgXXKzW/RraMaYIxIIC13gjd0=
X-Google-Smtp-Source: APXvYqxrM2+jiysnJ/amGnwgzRD7kxAsOyAzvuTRqpm163xz0WijX6uqtlwq/DgTg25Qybc3XyNJFQ==
X-Received: by 2002:aa7:8009:: with SMTP id j9mr18822803pfi.107.1569818270834; 
	Sun, 29 Sep 2019 21:37:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	u31sm22513345pgn.93.2019.09.29.21.37.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 21:37:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:37:31 -0700
Message-Id: <20190930043733.2840975-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930043733.2840975-1-raj.khem@gmail.com>
References: <20190930043733.2840975-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/4] ttf-hunkyfonts: Use LGPL-2.1 which is correct version from LICENSE file
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
X-List-Received-Date: Mon, 30 Sep 2019 04:37:50 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
index 5cd9935d66..bd552c08aa 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
@@ -2,7 +2,7 @@ require ttf.inc
 
 SUMMARY = "Hunky fonts - TTF Version"
 HOMEPAGE = "http://sourceforge.net/projects/hunkyfonts"
-LICENSE = "LGPL"
+LICENSE = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=7fbc338309ac38fefcd64b04bb903e34"
 PR = "r7"
 
-- 
2.23.0


