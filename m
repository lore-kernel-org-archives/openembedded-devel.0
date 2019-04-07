Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by mail.openembedded.org (Postfix) with ESMTP id F39977D53D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2019 15:11:14 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id o19so7591899lfl.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Apr 2019 08:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=95XgPjYMOW6jHYDDR+b70Sfbp9qHYcqsvkGqnpzVEOs=;
	b=uWkeVHwd/i/y090fSRZvUfT3PRcC+blKM6nSKmflAkHqTDlpmucsfcpUDjL1Hcvth5
	TX/ILtR9ILLpdakIpIxm8TDC09Ka3s+b/IkClWeztXuJ650g0X5Ty0OZRyhz4w1eHtBw
	YTIvtPutQD3ujMGszxWPSRbT6StzUknUGkRwrtmKhQx2CNFzLqREFHAQqNSP5MwkF8ug
	FUBkL6Qk9l+HYRu/GdM2LKIE0MLCcBOXjlFjTDWTCOy6aqgLi85i2osXdNlxdLrWPeyD
	TWKlFo7aZq7vxizxgGJnPJaJem4wx0AOhbJW5ROEUIF5deXO556EvYLAXM1S2Ihv6fFU
	rPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=95XgPjYMOW6jHYDDR+b70Sfbp9qHYcqsvkGqnpzVEOs=;
	b=erVsrFill2MCGLPSeZDoMfzoVIJFqY01Y1+SSAOuSbUqIP00S2iKMrrUD+TEOyYhlW
	nGwMsTq+0LyktjL1/Exayn2XUC/un6Me2qnYdykt8y2Z0FajS1BQjWzUHe6GZa0baQA0
	rOQCE6U19QRTxYMFelFGoV/xZiLzJz01UZhTw8qQbLjqmfu+2eNoYaNlD/AMEZhPCkUR
	M1icnYCeJqgqEPdXnuTewj4TC8ENDGMXtAecMuHlgfyv64TWrT9bkS4la9sPrnmg+DdC
	pZE1HdiuD7iHw4Oni3whIlKMr0DPwTghGuZ+Urvsw3vMy53CIatCVg9qmqk8vhtGu6eL
	lPeA==
X-Gm-Message-State: APjAAAWE+SXWrtGqcKaSrWB395dG+DrnmGgSD6PRs+88GWVJ5WOV9Va4
	LRXsVt6UCFeaZIuddkMlBehRVUn0r/8=
X-Google-Smtp-Source: APXvYqxGVDhvIe9MCJJLuRzUYEuH1+XugQhJLrap1mw0B1sIC9+wNvux9+6r47xpw5IJ5sYHXum1yA==
X-Received: by 2002:ac2:4312:: with SMTP id l18mr1818656lfh.80.1554649875233; 
	Sun, 07 Apr 2019 08:11:15 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	t14sm5550950lfl.38.2019.04.07.08.11.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 08:11:14 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Apr 2019 17:11:06 +0200
Message-Id: <20190407151106.19592-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190407151106.19592-1-open.source@oleksandr-kravchuk.com>
References: <20190407151106.19592-1-open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking 2/2] drbd: update to 9.0.17-1
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
X-List-Received-Date: Sun, 07 Apr 2019 15:11:15 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../drbd/{drbd_9.0.16-1.bb => drbd_9.0.17-1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/drbd/{drbd_9.0.16-1.bb => drbd_9.0.17-1.bb} (83%)

diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.16-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.17-1.bb
similarity index 83%
rename from meta-networking/recipes-support/drbd/drbd_9.0.16-1.bb
rename to meta-networking/recipes-support/drbd/drbd_9.0.17-1.bb
index 8794c4f91..d6750ab2f 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.0.16-1.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.0.17-1.bb
@@ -11,8 +11,8 @@ DEPENDS = "virtual/kernel"
 SRC_URI = "http://www.linbit.com/downloads/drbd/9.0/drbd-${PV}.tar.gz \
            file://check_existence_of_modules_before_installing.patch"
 
-SRC_URI[md5sum] = "6414a9eef2807c8210b6403e36ce3ea4"
-SRC_URI[sha256sum] = "6074b0d643f4bbae4641d3b4bc30f4840e74f2a212dd9c6555b8141e530e5789"
+SRC_URI[md5sum] = "ae8d5030760b2820a4b3e250447890a0"
+SRC_URI[sha256sum] = "86dd6cc0fdc8123056a3bb67a634cd7ba62a7b05b23caab9995cce7730891da8"
 
 inherit module
 
-- 
2.17.1


