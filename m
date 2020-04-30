Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.1891.1588224718139539187
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2020 22:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LL+YH3cf;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id r14so2373899pfg.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2020 22:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m9fQmpvZzSUZo6MKMCj4uX3Vyr0Ec+z5CyU4yZNJ9PU=;
        b=LL+YH3cfmIPE/0LcFF8cJ9ZOa+HbP8nke7PmK9tdciqPO2LpKKXclo8ri8+a2/ehXm
         ts/HexncA6Qa9lk+LJGqtdYfKnFCNfWQUAnhyWVBUdPHlfuG8ZyVFL9Fg5g4svXxfTOW
         TAPwjnWvCW0I74yG/7IMnlre0v+3y1XCFTdB4an44Pg8/aToJTXOYKmJnikpoKKweMEJ
         uKBf9DxhTizKXlOSdkd6QSi7A8jVcOJV0cWWt5YUp8FFx34GF7Q179ldxzuB/ixK4cHo
         KmAYuVYz72Q9j/sTd0tGL7p9ITU6v9YUpZ5EWz9hmI/MAUMYw6IBVPkY7Ui+FvFfOPkS
         hYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m9fQmpvZzSUZo6MKMCj4uX3Vyr0Ec+z5CyU4yZNJ9PU=;
        b=EB+LOeuHTsn+KWOSVGT2OeiQoR0MsBWEdVrfzLKnpljbIBsNQ9K0+mS5uGsWZB4+t6
         WOoyrKxgb4D0HrkgT/FIB81r78LgWIFoPaKUZgZiHBxfxtpIz0aFp21ZMl/gUnUyyEhF
         30ND8Hix/g/djVXmNhk5y5htAfx/ywq744clWBxHba5e02C89+PkVpVB6xJ29N7CqKhr
         pjfN9uJhpvEgpXGDAyv5SH40wMoJsRfc06Myjr69yGndWkA9z/RUb+0siQuowtZJewtc
         0odqzzEtSYAyIL8hiDz8St7QGgvBTRmwpTNhXWGntYKWT6ox0pZFNgqgDazE74BjeZc3
         dTRw==
X-Gm-Message-State: AGi0PubQl4RAEOMb7A5PP/CqRTBfWvpfx6l4qw1t8ihkzRrt1JfOGSHF
	oFGwMC1hMTEAS5q1XG2wnDnYSOFDnGA=
X-Google-Smtp-Source: APiQypJR3Hs1E3DQgwzGIDalRYIfcg7qeMZZAhrMVJEC+GsAQi+e4E6aqo8StJCMPCwH1fkKSflUGA==
X-Received: by 2002:a63:141:: with SMTP id 62mr1756913pgb.101.1588224717387;
        Wed, 29 Apr 2020 22:31:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e11c])
        by smtp.gmail.com with ESMTPSA id v26sm2418780pfe.121.2020.04.29.22.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 22:31:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 6/6] libnma: Fix build on riscv32
Date: Wed, 29 Apr 2020 22:31:49 -0700
Message-Id: <20200430053149.226494-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430053149.226494-1-raj.khem@gmail.com>
References: <20200430053149.226494-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable vapi which needs introspection

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb
index 8cb0bbc857..3b1698e72e 100644
--- a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb
@@ -18,8 +18,9 @@ PACKAGECONFIG[gcr] = "-Dgcr=true,-Dgcr=false,gcr"
 PACKAGECONFIG[iso_codes] = "-Diso_codes=true,-Diso_codes=false,iso-codes,iso-codes"
 PACKAGECONFIG[mobile_broadband_provider_info] = "-Dmobile_broadband_provider_info=true,-Dmobile_broadband_provider_info=false,mobile-broadband-provider-info,mobile-broadband-provider-info"
 
-# go introspection is not supported for mipsn32, but vapi needs it
+# go introspection is not supported for mipsn32/riscv32, but vapi needs it
 #
 EXTRA_OEMESON_mipsarchn32_append = " -Dvapi=false"
+EXTRA_OEMESON_riscv32_append = " -Dvapi=false"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
-- 
2.26.2

