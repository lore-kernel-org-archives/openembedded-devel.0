Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 789506FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jun 2017 01:05:28 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id f127so13553345pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jun 2017 18:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Kke/Q35HKcDKb9L9LinfdcoMvxZd5LgqkQMaebrVPUU=;
	b=Q1K1e0OU/vu8wZM5bV419kHRBGjxXepiYKCQWgKmYV/eWxQEZi/3+5SmjTLINljiOH
	acMK757NaNOw0WTP0ejDksidljYn6zerRURv9QECkquwnIdPokhGVhFUMrj8WTLSD7j6
	plHYK7wVqdhsFT5uE6dTuP2GL9hWZnYQoyDPn3fgwMY4KB4XC57aYXC9fmsx0l34FjCV
	zFGFNiNz5BoAGx0kpucRh9MxsqSYmpv2RAxfSbxzuI9eK5K8hoNo/+o/kV+UyUtODadd
	vKRO6UuhKt2+nWON4xSkYD7T/HReF4Kl0+Tl5u7jAu0KV96XIJrksUrA6nlWZmadPNfA
	b7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Kke/Q35HKcDKb9L9LinfdcoMvxZd5LgqkQMaebrVPUU=;
	b=MZKp7kU+j4SJDQuII9QlYDZM4wJn264NlPFB+7Nhsw+fI50PaqTzYZk24K0g1KxcTS
	DcAYJudRfNgowiPEIHx0tAKsaWO5MaEp8n7asQJ21BHMze2LpJx2OUMX7C2A3kNtlEJ3
	OkihZJ47ewtlusZkSg1PBETzLtORwWCANstXJL0VEZAuzdNs42i2rsSB5dwsnxmEdeQs
	JtNzWn54zuh4eW/t7tGKPlSI6t1NMnb8bQaCBsBEzf83mDg+WaQoIFj79RRR1jC6ag1D
	mIjHIXdYbaVVj5fZe5q/34QnkzRGXzBCjNETw7E+edBATLc0Ho3KseoJgzqnvo0JYCnm
	OvgQ==
X-Gm-Message-State: AKS2vOyIIFbtMGkw2J4upYezlWiZQeDxpUqAq+6uh/FvyunVGsL3wbFh
	KTfz0JBB9Wr2M8re
X-Received: by 10.98.117.11 with SMTP id q11mr22426677pfc.137.1497834330048;
	Sun, 18 Jun 2017 18:05:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::36d3])
	by smtp.gmail.com with ESMTPSA id
	t128sm15389319pfd.64.2017.06.18.18.05.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Jun 2017 18:05:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jun 2017 18:05:16 -0700
Message-Id: <20170619010516.11453-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170619010516.11453-1-raj.khem@gmail.com>
References: <20170619010516.11453-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] xmlstarlet: Update to 1.6.1
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
X-List-Received-Date: Mon, 19 Jun 2017 01:05:29 -0000

Enable PARALLEL_MAKE again

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xmlstarlet/{xmlstarlet_1.5.0.bb => xmlstarlet_1.6.1.bb}   | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-support/xmlstarlet/{xmlstarlet_1.5.0.bb => xmlstarlet_1.6.1.bb} (69%)

diff --git a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
similarity index 69%
rename from meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb
rename to meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
index bf99aff43..e3d52e616 100644
--- a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb
+++ b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
@@ -15,8 +15,8 @@ DEPENDS = "libxml2 libxslt"
 SRC_URI = "${SOURCEFORGE_MIRROR}/xmlstar/${BP}.tar.gz \
            file://configure.ac.patch \
            file://0001-usage2c.awk-fix-wrong-basename-regexp.patch"
-SRC_URI[md5sum] = "0c6db295d0cf9ff0d439edb755b7e8f6"
-SRC_URI[sha256sum] = "47b4ed042ea2909257f2a386001af49fceb303f84da7214779ccf99fffc6bbba"
+SRC_URI[md5sum] = "f3c5dfa3b1a2ee06cd57c255cc8b70a0"
+SRC_URI[sha256sum] = "15d838c4f3375332fd95554619179b69e4ec91418a3a5296e7c631b7ed19e7ca"
 
 inherit autotools
 
@@ -24,10 +24,3 @@ inherit autotools
 EXTRA_OECONF="--disable-build-docs \
   --with-libxml-prefix=${STAGING_LIBDIR}/.. \
   --with-libxslt-prefix=${STAGING_LIBDIR}/.."
-
-#Makefile:2116: recipe for target 'src/elem-usage.c' failed
-#make[1]: *** [src/elem-usage.c] Error 1
-#/bin/bash: src/escape-usage.c: No such file or directory
-#Makefile:2116: recipe for target 'src/escape-usage.c' failed
-#make[1]: *** [src/escape-usage.c] Error 1
-PARALLEL_MAKE = ""
-- 
2.13.1


