Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8C6C57808C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 06:14:32 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id f127so6990860pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 23:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xuwpo7PDz8oZDYDROHujUI92Wyeu7zOH7QB/lUcalz8=;
	b=ZIvbkInQHWvAPeAAvR7ZoSJQHNvHMoLOGpAKxizQJUBHT9GaT+dEGwLLUMSs01rEjK
	jM3GCg++EwwEk5wR59K3i0S2Z2/+65z1VvrBwJCE0/paL3UErzARsG2FmsbeZFCaNUwi
	joQZ+Gqs/ONiyhYvGtZwjcJmjO5ju5e9BJWXhuZU1zGye2W4/TI7NndqKGxoBtPlP+po
	hbdpb4c56gL4lIql+Z6DCCj2MGrBOLHnBDwHXZ1A7OM3zGCh3BuubEpOtMB6Di/SPwMq
	bo7PF/qxa+oGsme+rMdFWmg0UFp1mHh8lbZGpZApaCZZTp5x8HFRTtSg2K6wgv0xVG7G
	Mogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xuwpo7PDz8oZDYDROHujUI92Wyeu7zOH7QB/lUcalz8=;
	b=QDl1xSKeNRCvDVS3mjUXEVhYYbHYSeJb6oVWUPBvpAqusLBUsZKyF22hbg9cJZ1HzE
	cAuM0MgSULjyOZbzHLw6A4Iti2t18mQ1x3xwjwyksFxsPjdaWgMB/i/3RYZJBYfzrnVm
	rsPrMXfrubkTNEQoAnp84pu/8YFtXxQ+A6Q8O3aiql0Ulx6at11n+h5SLCe/F8ezMkYa
	jJ/wdZhU3qRDe2zDARXn9Zr5H0DjrcYE2VrPp3jJaU6sprq7Hx4cNgQMBEXSU88gcQDz
	1kCrgH5v6ER8nEfrOJ2USR9ZM1XOBBSitbDW4+gRFwoWa7evTNv0SwbFuyp0AiBPYUGG
	yFPQ==
X-Gm-Message-State: AKS2vOyy8GB7b2OP8fN0WfAcGEyioDPZt5VaLonm6q8pdniPv1pBLJz+
	hwYILepZnmoOnrud
X-Received: by 10.99.122.81 with SMTP id j17mr8872840pgn.97.1498630473424;
	Tue, 27 Jun 2017 23:14:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	r129sm2102839pfr.112.2017.06.27.23.14.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 23:14:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jun 2017 23:14:17 -0700
Message-Id: <20170628061418.16693-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170628061418.16693-1-raj.khem@gmail.com>
References: <20170628061418.16693-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] crash: Pass optimization flags to configure via CC
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
X-List-Received-Date: Wed, 28 Jun 2017 06:14:32 -0000

This is because when using fortify warnings we need to have
some level of optimization, while we append warnings to CC
we dont do the same for optimization, which results in compile
failures when doing build with hardened flags

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/crash/crash_7.1.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/crash/crash_7.1.9.bb b/meta-oe/recipes-kernel/crash/crash_7.1.9.bb
index 93208e398..d40937e93 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.1.9.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.1.9.bb
@@ -35,6 +35,7 @@ SRC_URI[gdb.sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5
 inherit gettext
 
 BBCLASSEXTEND = "native cross"
+TARGET_CC_ARCH_append = " ${SELECTED_OPTIMIZATION}"
 
 # crash 7.1.3 and before don't support mips64
 COMPATIBLE_HOST = "^(?!mips64).*"
-- 
2.13.2


