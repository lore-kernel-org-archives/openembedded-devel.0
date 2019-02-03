Return-Path: <scottellis.developer@gmail.com>
Received: from mail-yw1-f48.google.com (mail-yw1-f48.google.com
	[209.85.161.48])
	by mail.openembedded.org (Postfix) with ESMTP id 95B3C7C344
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Feb 2019 13:38:12 +0000 (UTC)
Received: by mail-yw1-f48.google.com with SMTP id p17so1936483ywg.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Feb 2019 05:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=czyM6it1XPX3taEZMcWrTLiKGIKyr1ZYdROSTP7KIUM=;
	b=OJw3aK3BGpItfLq2EkNjC3wzxkp1OpGgwhJMJjTNmYy9UGfB6naJlq5X/kdhUbVrgQ
	1D0lRfRcaVY0bD3uXe8YLghKsE3SPwLS1mmnEOPuVllw/pY+pNvQ9tYomBUNk3s3JQiV
	h61rGEMsBySUYd6tmbOr6sxNk24FMhlPg0JFJQD54jm8hc50kkZOC+OhQk1Nq+Kp4wKt
	UUibycpmaRK1wHMObINewS1wrtZNFnJl0gWgkk3Gfxg+evMVn3HDtTGaLkpLkbj5XSEn
	lo1IVvJmdzIWyLVuMcr7kWC4hYq+XVBeVV0RMfS17lrvu1+f2bOYqhpBm+tcYfbVEQqg
	5ruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=czyM6it1XPX3taEZMcWrTLiKGIKyr1ZYdROSTP7KIUM=;
	b=bbnijFETXlFEF4zHvvxlyCFywYuteMqapGCVAwAbXmBP8JN5oiNWIcrNQy/yS8vYLo
	VjTgZDEQ6CRX3KimWKiiT9PQO1x7iI6zIrRcQzRuzfnE9aIn6Fn/Oo/yfWDLn+ho3cWO
	sOjn95c2q1XiXW8vrmoBDcHK9J27ZbM9AmN99xJf1e9JpHGthaKYsp2po81DqH/aMhz2
	XhXR0m+SRJn+aBrashDCZ8ZUL9tKH3sB5JJpJ1BPsDgzJq9mrJaE8C7LO4BawLCdegsk
	aHDfVABRP6WCgT+PWEK/URSFvOThhIe2KBRyLnZZrAvda1Q7u39gYGW/hrQyDs5GYq1l
	GbQg==
X-Gm-Message-State: AHQUAubncEJ8Pa3WMZNi2FgjfTRVJlia3qLHXqWiC1JRBWoaPmqEaujP
	Je2ncG88zJfEzEF6W3P2JoyNJDpa
X-Google-Smtp-Source: AHgI3IbQAYieuIXZHjahJ7JJlYxgOO1RRWvRlOB4rmGbA4iGbVRelSIsKnaVnc0ZkmQ96c+io0cyQg==
X-Received: by 2002:a81:4b56:: with SMTP id y83mr733843ywa.290.1549201093335; 
	Sun, 03 Feb 2019 05:38:13 -0800 (PST)
Received: from fractal.jumpnow (c-73-234-253-132.hsd1.me.comcast.net.
	[73.234.253.132]) by smtp.gmail.com with ESMTPSA id
	z74sm6186557ywz.51.2019.02.03.05.38.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Feb 2019 05:38:12 -0800 (PST)
From: Scott Ellis <scottellis.developer@gmail.com>
X-Google-Original-From: Scott Ellis <scott@jumpnowtek.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Feb 2019 08:37:53 -0500
Message-Id: <1549201073-6116-2-git-send-email-scott@jumpnowtek.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549201073-6116-1-git-send-email-scott@jumpnowtek.com>
References: <1549201073-6116-1-git-send-email-scott@jumpnowtek.com>
Subject: [meta-oe][PATCH 2/2] nmap: Include additional FILES path for certs
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
X-List-Received-Date: Sun, 03 Feb 2019 13:38:12 -0000

If both ncat and ssl are in PACKAGECONFIG then the installer adds
a cert bundle to

  /usr/share/ncat/ca-bundle.crt

Signed-off-by: Scott Ellis <scott@jumpnowtek.com>
---
 meta-oe/recipes-security/nmap/nmap_7.70.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/nmap/nmap_7.70.bb b/meta-oe/recipes-security/nmap/nmap_7.70.bb
index 1b4163a..df9b00c 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.70.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.70.bb
@@ -43,6 +43,6 @@ do_configure() {
     oe_runconf
 }
 
-FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
+FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}/ncat"
 
 RDEPENDS_${PN} = "python"
-- 
2.7.4


