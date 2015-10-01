Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 887B777088
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:29:38 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so34065804wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 08:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/6cmg9m6Z0QQnQ9DXVQ5sQHDl6HkJTJToyya5Rs/Ki8=;
	b=N1ytd6nrCISoyEqD1vwtIJNv3TaPaOAn27utiELYWRrj+dfZDU+4BXvpdchkgESFvR
	/1Euydix+VS4G22la5/EKhCySAG7RBvlyqM0Y2EcnADHvrLxEzqYj6jKgn53LGKr5uaY
	9LeezgQAAlAegvRHqMsKqdED1aVR+WJZeCAK0l8rxYMDTiglwWQshNCSLwVLCjsV0uX8
	GCSlJvaliAJguuyN2q1OxS2i8MGjWsfC2rbEQbBx2a6rOXYaq9fHR7WZhFKqjdHypT7e
	clPKeNYMEJUyQbnlFRgD4GaBimcOP2RlkCyOR72fOfRf/VoN2nVNr/D+jktwP8lse/zw
	AulQ==
X-Received: by 10.180.73.104 with SMTP id k8mr3789811wiv.90.1443713378235;
	Thu, 01 Oct 2015 08:29:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id go5sm3741839wib.3.2015.10.01.08.29.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 08:29:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Oct 2015 17:30:22 +0200
Message-Id: <1443713428-8635-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 04/10] sessreg: Blacklist, fails to build man pages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Oct 2015 15:29:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb b/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb
index 617811a..2ae25b3 100644
--- a/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb
+++ b/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb
@@ -6,3 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d938a70c8280c265a1ccd2954365d185"
 
 SRC_URI[md5sum] = "e238c89dabc566e1835e1ecb61b605b9"
 SRC_URI[sha256sum] = "551177657835e0902b5eee7b19713035beaa1581bbd3c6506baa553e751e017c"
+
+# | sed: file filenames.sed line 3: unterminated `s' command
+# | make[2]: *** [sessreg.1] Error 1
+# | make[2]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/sessreg/1.1.0-r0/build/man'
+PNBLACKLIST[sessreg] ?= "BROKEN: fails to generate man pages"
-- 
2.6.0


