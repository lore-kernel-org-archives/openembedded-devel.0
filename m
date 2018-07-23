Return-Path: <freebendy@gmail.com>
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6D05174D49
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 13:49:49 +0000 (UTC)
Received: by mail-pl0-f42.google.com with SMTP id j8-v6so192557pll.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 06:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BR4X/a+fR7izNOWhxKwhJMD4Wh+E8WG6JrqRwclrDWU=;
	b=RvFTBSNdStTkcGWHpQDJBl7f8HExpzEOTNFF1rSGgf+e/9ZJGHagoTsu/nCMu4aWEO
	jv2X/eCGl10Ew3/C2zDwA9F0oeT93TyGlTFUKSISVNL6p7Mk8IsEQcFcCniv6f12+WzL
	D4sqyHathdRuRrO+VFMxo258a5U3qHw1WgrZ59bdwsaoqYFEdKX+EFHOjZZriKJZo/yM
	kN8A5ghvSDs/mnNYsKkxXUYYZ6mITXczg0NKP0PgNtb9xdFr97V/R/Rrb7Yp/p2lvUs4
	inFToEJqlyWgcQhd699TTKLVDglTuae45REqBP7FAy02Pj7c3UMvnUiTWynLspawsKGb
	ylMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BR4X/a+fR7izNOWhxKwhJMD4Wh+E8WG6JrqRwclrDWU=;
	b=XDl/kmQY9MgjEbj6UTeyf6ou/MlgQ/06kng6G9UXjLHnj96vAYqV2GladCaM3UoDPj
	YL4f4R0h2+ydRyrqFS3OoACfGVLHqRc0A/J/Y03F0/Hq/1FXTG8jHANzqEVVrBiqFZow
	eI6xtlwpiPehbHfsieK37Nmtp44fgfNwginXS2P98J1Gkkde5tU8jP38ITFGVIHGnfn5
	l7FLBIrkvLT0TESW4+ZwEl50JADgIpxw1QsfKY+TNXnrc9xqqlA5UzvIdj3xJYt+16V9
	oHIJkK3roifh8b+nfHTemuFJ2EjUycJB+Wi6WJNHy3MHbM70aNA/L1q4C1RieG2ASIIK
	wWrQ==
X-Gm-Message-State: AOUpUlFMSQ2/rpZ3YJvZoWd6PpZGm4p1dL4lSMxLcPJ2b/vL26Gp9oBk
	je+lteQW5G8vNBLfzCeyhjSU4bZFEGOz
X-Google-Smtp-Source: AAOMgpd4iPLnw27Zygn2W6Q0vGFy/eA/ObjsAsGYhxMymU4rESbHDFVkxzU1iYJEcnylnCKpXmU73Q==
X-Received: by 2002:a17:902:7896:: with SMTP id
	q22-v6mr12993860pll.47.1532353790282; 
	Mon, 23 Jul 2018 06:49:50 -0700 (PDT)
Received: from localhost.localdomain ([116.7.218.38])
	by smtp.gmail.com with ESMTPSA id
	v23-v6sm4182356pfm.80.2018.07.23.06.49.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 06:49:49 -0700 (PDT)
From: Binghua Guan <freebendy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jul 2018 21:29:47 +0800
Message-Id: <20180723132950.4543-4-freebendy@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180723132950.4543-1-freebendy@gmail.com>
References: <20180723132950.4543-1-freebendy@gmail.com>
Subject: [meta-oe] [PATCH 4/7] python-pep8: add native and nativesdk
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
X-List-Received-Date: Mon, 23 Jul 2018 13:49:49 -0000

Signed-off-by: Binghua Guan <freebendy@gmail.com>
---
 meta-python/recipes-devtools/python/python-pep8_1.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pep8_1.7.1.bb b/meta-python/recipes-devtools/python/python-pep8_1.7.1.bb
index b12d72d38..54ce9781a 100644
--- a/meta-python/recipes-devtools/python/python-pep8_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python-pep8_1.7.1.bb
@@ -12,3 +12,5 @@ RDEPENDS_${PN} += " \
     python-prettytable \
     python-cmd2 \
     python-pyparsing"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


