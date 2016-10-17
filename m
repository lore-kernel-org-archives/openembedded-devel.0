Return-Path: <net147@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id E1818719B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2016 05:05:32 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id s8so11964403pfj.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Oct 2016 22:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3hM4Uc7HZfXXPd0E8elU+k63z1EN6IMuPCJJFt6Uiy4=;
	b=MD+I58PrjDWnilK63mU+4ze+HgqrV0xj4aVCPwAKHasOv+IW0Sd5EoxjJ3a88Fun4y
	tF+l2w9B2SDa+65pwODM2iSvBRTc53UQIfb70t7cdqeMDkDo3Rji75tB4CzysFPFoqme
	oH3fhuIcjpzDZEUZWEm9fuKDWBba0MQ/3+KnpXfTZvAKqs5I9gdAd4yGuF/HPr1gE9yQ
	7TPOAK9bl7YDbQXR0WOON9F99U6WGUiExRdn8kOJpd/aXclKg0w9KyBX2PRUghNZZ8XA
	Ub9IKnMsyob/Fl7hJ0F3CMEOiN6/mJj4ajsD5OS8QsW6f7H6JQ3yiqRS8dwkhV8wLLiY
	63hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3hM4Uc7HZfXXPd0E8elU+k63z1EN6IMuPCJJFt6Uiy4=;
	b=PA7QH+VTSTKRAlUAq1B6tUJJhvjWBxV+7IrZ74gxUmYbPJ2G+tPmvl5a99uJn6kCp8
	Od5IGNkqQa+pkeG1Q7z+7WUQs1PUV4cxah9VIAecTCE2Zl9xnfcMsWq+WwhMJ4irbxOM
	2cJt6STrgE91NUgAz7p7iPoMDcRhHTQDBZl6/Z0RYbsHeDA8mInqJQcZ6kxcgXXtoFB2
	kz2YbuaoMUBEbAQBv53fymYAQ8kGLgk4cT7a9+F6K60+tHN5P9fwYF9iYLJeoJvFIEuh
	03rVGsviHCOFGdo3zglD46I3AGrLy0ng5kaSkOwHAx27HZXevN7seNV5JWXI6WfFbu/C
	u+kQ==
X-Gm-Message-State: AA6/9RlJfnODaCMePrYNtRDTj0F5USFa34i2pHl2/E0V4LBTcwptZpKde+ZHaC+Iow2B2A==
X-Received: by 10.98.61.85 with SMTP id k82mr35081880pfa.7.1476680734404;
	Sun, 16 Oct 2016 22:05:34 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	d89sm21690523pfe.32.2016.10.16.22.05.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Oct 2016 22:05:33 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Oct 2016 16:06:08 +1100
Message-Id: <20161017050608.16565-1-net147@gmail.com>
X-Mailer: git-send-email 2.10.0
Subject: [meta-oe][PATCH] nodejs: update to 4.6.0
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
X-List-Received-Date: Mon, 17 Oct 2016 05:05:36 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/{nodejs_4.5.0.bb => nodejs_4.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.5.0.bb => nodejs_4.6.0.bb} (96%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.5.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.6.0.bb
similarity index 96%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.5.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.6.0.bb
index ceba2b8..7479371 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.5.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.6.0.bb
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "ac8e38c83f29e83d496d4bc4283487b0"
-SRC_URI[sha256sum] = "97b99d378c56802444208409568e2e66c46332897f06aead74d1ffbe733bd488"
+SRC_URI[md5sum] = "40f3613f679d252674e000013e75ed8a"
+SRC_URI[sha256sum] = "42910dbd34e49bfc40580e06753947c30d31101455a38e9f0343a23d67c0c694"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.10.0


