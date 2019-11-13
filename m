Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id F405C7F369
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 12:09:59 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id z16so1447328qkg.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 04:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:organization:content-transfer-encoding;
	bh=TAfr+O9f6ZZsiAopjxIDd7v43JQ+BrzIpEBWRKsZxHM=;
	b=s/XLu6dnhY8MIA2xvYbGCyHSwzQWC5LuxvJjc1GzgBu2KfqAs2HzOuyX69rY4H93Ib
	mitmC37esgoVh15zmovcuEd4DerxB8UoeOwi67G4hQQL1H0bKQMxLPWU0sQxdv3OwwWe
	F6YNgpcW/LPNE9oR5oocSLtCcIpG5geiQwH1/1LQZYpTxR0pZxfMAzwYG/rxCix6ZhJP
	pc5GW/9lk+CQsyeyV919er+gs7IZlapiiFBHbQDGgybgWK5VKEAGyBX/fHl1Ja4l7Fcm
	5aMDGt4x9GC2PCl6Tmwkdkj1vHhKnnDREY6NQ4p7Y8TphxR543qDKauSn+UE5Jwktvs1
	gLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=TAfr+O9f6ZZsiAopjxIDd7v43JQ+BrzIpEBWRKsZxHM=;
	b=VE8ztZ3TbbOm7QrCHZs/fgF13FTQIrRRR650WTtblS0J+BUmcJmY8zh76q0nw2ttYP
	dNw1DOL5CEw9vOA2ul3ykhi3kjBKrQit9T+wz17xPyRxzbooLnuvNPLpgjdHue2hhe+8
	vrS51d0irYQjIPo7ny0WnbmkrAXaTRXaIF0WIGQ+qh7yVx2JWo75m/A0z8jq1PFc8gjn
	kKaQjwr1B3b6gz0XchrtnUbgPZUEaBNGLVhiWYq1+2hHQfxtMTlUWUeket/jgN7Qw46F
	PrEYejxVl1QLnSPARCBJWgzkTwr6WItl3EOACOoD0DW53wPt7AcXHOQ3Ao6QHpVyXfKL
	cbtQ==
X-Gm-Message-State: APjAAAUOLekFYl/m/CbDtO2eTwOGto5FkW/3DP7cKHLnsbwyFGFYy6hQ
	ijzX+XemZ+34LPZ/nRXw5gau1esUfvuiBA==
X-Google-Smtp-Source: APXvYqxqS8mjeITK4BUDuXveY7RK6347oSqdAJqv9comDwVEUJVXwmDhZbLVpkkQuG/NXrBqbHBb4A==
X-Received: by 2002:ae9:de05:: with SMTP id s5mr2057970qkf.175.1573646999950; 
	Wed, 13 Nov 2019 04:09:59 -0800 (PST)
Received: from centrium.lab.ossystems ([181.220.83.67])
	by smtp.gmail.com with ESMTPSA id
	a137sm830252qkg.75.2019.11.13.04.09.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 04:09:59 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Nov 2019 09:09:42 -0300
Message-Id: <20191113120944.10668-3-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113120944.10668-1-fabio.berton@ossystems.com.br>
References: <20191113120944.10668-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 3/5] python-pathlib2: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Wed, 13 Nov 2019 12:10:00 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-pathlib2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pathlib2.inc b/meta-python/recipes-devtools/python/python-pathlib2.inc
index c5ba99d4f..3199b56a0 100644
--- a/meta-python/recipes-devtools/python/python-pathlib2.inc
+++ b/meta-python/recipes-devtools/python/python-pathlib2.inc
@@ -7,3 +7,5 @@ SRC_URI[md5sum] = "f2bd0a363eb0f8fa0556f35c1d9e66fb"
 SRC_URI[sha256sum] = "6cd9a47b597b37cc57de1c05e56fb1a1c9cc9fab04fe78c29acd090418529868"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-six"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


