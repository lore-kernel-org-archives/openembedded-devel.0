Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5587678726
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 19:21:41 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id d206so3425787qkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 11:21:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=veF3bG+NHA0iRQwXmjPApgOWFN3J4gHubQxC8kMm6ow=;
	b=H1xlxZB/wfCICbhyEE21R9zNiUaLxeoFwhlTXFEKsWSV9/wrnXzqlGiWkNxt0wIsH+
	d0rxg1dWcJoi2olNYuiAy5D5MF1kuybCQTW99y0HLcxv3h/HEML0sI2Z/h1FJnkYJ51E
	QzLiPkuqxnbwZmPWOxag2TX7rMD7ekEIOIeRvbtnmAB6qa5fAcTnhFv6ejBEXmNFHJ7s
	KVBABX5n+RM4ZrIgYtFims2bPjFdPngShj1nmE0p8hOGEXIN1nsypVT6sUTTDgR8kDP1
	vixev4CMG8Cyd3C+9TTMJ4FlcrPJuiudEei9K6GJ6RAi0IIC89SW6J74y6b1ce/rsmP8
	Mzjw==
X-Gm-Message-State: APf1xPAysPIRZQCSXtUeKfcyDVzsRVh484rCQ9NKTkOjsURq7r4L40Am
	rpcJ+eBFU2bcuN9DUo8tSzAh5A==
X-Google-Smtp-Source: AH8x225xBzvr3brxLmwZW51m+lRS3UZzGCgzjnQVtPmXlk7S1r7SuFP9ierh+bsedy5n5eMOZ4JUjg==
X-Received: by 10.55.88.7 with SMTP id m7mr6767705qkb.142.1519240903097;
	Wed, 21 Feb 2018 11:21:43 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	r51sm7759475qtr.93.2018.02.21.11.21.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Feb 2018 11:21:42 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 21 Feb 2018 16:21:38 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Feb 2018 16:21:29 -0300
Message-Id: <20180221192129.2759-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180221192129.2759-1-otavio@ossystems.com.br>
References: <20180221192129.2759-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [RESEND meta-python PATCH 2/2] python3-requests: Remove RDEPENDS on python3-misc
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
X-List-Received-Date: Wed, 21 Feb 2018 19:21:42 -0000

The misc package has been removed when the python3 was reworked.

Tested using updatehub's uhu utility.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-python/recipes-devtools/python/python3-requests_2.18.4.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb b/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
index d91d993bf..0a2410f85 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
+++ b/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
@@ -1,5 +1,2 @@
 inherit setuptools3
 require python-requests.inc
-
-# Add the runtime depends for selectors.py
-RDEPENDS_${PN} += "${PYTHON_PN}-misc"
-- 
2.16.2


