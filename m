Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 88FDD6FC4A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Sep 2014 19:11:33 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id rd3so5400859pab.18
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Sep 2014 12:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=glByJyXCvf8En9XMjipQeXEprj9+MVjmJQdYLdVxdEg=;
	b=uACjWwyvflgFWwyyNQNwmq5IdeqomlK/8WtNBRl6wLiCIQxY0OGYsJXBEdQXLPIiNN
	VEL2QpIkDB3aFdIqXhX4ccmQJc3nnyP1tB6AWAHVpN/ETzPfXbGQtD24DYLDSRuN+z71
	zg4JB+i+NT0dDE+fU2HKNRGX4KAlSNSga/59cLmLElJZp2BFvrXn1ZpUDbAUJrhKpLUV
	YNfVilECObvx7eSRMt6Ieo8N2jGSpNrmU1M6PVYCf7bIKoyMw4bItUAJ2eFqaW2gsBVg
	FDS4xVVnY8TmewyZoNE5Wbn+RdAfUtITs0xkZ1GcI7wpc/rLlhO04ZTH3lWLaKXO3EP3
	uGQA==
X-Received: by 10.66.162.40 with SMTP id xx8mr44476676pab.31.1411845095001;
	Sat, 27 Sep 2014 12:11:35 -0700 (PDT)
Received: from haswell.localdomain (c-76-103-58-225.hsd1.ca.comcast.net.
	[76.103.58.225])
	by mx.google.com with ESMTPSA id d5sm8158858pbu.45.2014.09.27.12.11.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Sep 2014 12:11:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Sep 2014 12:15:26 -0700
Message-Id: <1411845327-16713-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1411845327-16713-1-git-send-email-raj.khem@gmail.com>
References: <1411845327-16713-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gumstix] omap3-sgx-modules_4.05.00.03: Add missing colon after FILESEXTRAPATHS_prepend
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
X-List-Received-Date: Sat, 27 Sep 2014 19:11:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bbappend b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bbappend
index 77abc85..8fde96a 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bbappend
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bbappend
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PRINC := "${@int(PRINC) + 5}"
 
-- 
2.1.1


