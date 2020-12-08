Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.4649.1607406930384299028
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Dec 2020 21:55:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hDIwnfLB;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id i3so9269770pfd.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Dec 2020 21:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q86CPFkRJS6MoEvN71ngezqFac+ftH7Qvtp8nz8wJf4=;
        b=hDIwnfLBLbut4h2nBi1ZnWnzdaVYBXxkCGKV9sP8k7w5Yx/ggAoFfQeDpmaGCZ/1vi
         XYYuwt3lU4Ies6yTagqbT4IitJiQC3dBE2A/dvfr36hkY+DduqBlvf/d4AARJkesYTFM
         6EO4HMuJz/5PZJu0FEGTt3MNsQ+5CyQATB0kr0vSn6GGIwg5dTxq7WCgJeeoauUavJBP
         705Mo0NmR9MbTBtsSisutXKdRjaENQEAhqz9jBIfhwAHMHJZk4Pg64M0msv5Z7A5KYwc
         +XjTAskKD0SMihePAocAyG299gc9zGofwzr5tz0VuYYnsajic1wWQzV7JcBxVbiC8p/u
         85GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q86CPFkRJS6MoEvN71ngezqFac+ftH7Qvtp8nz8wJf4=;
        b=SyMDuOfNZeoH0QVPekTGBaccepA2eYRlqZKmgtqTy5cZ1fICPY3HAgPjpx3PYtmTqv
         1spJupiaYNk6bN2rokY8VgZ9R27jOpvPBvToDmwN3enUpV02SxB8PU8lTk7OnU5tr0dc
         +hCKm/q2PvRyP+KBLJDzwM/8quOxhYfgO0CMmugiCbXqPGtBqqpD4SxMVvwmli12nH1z
         2KMTi6on8qepj1Le3tvDibqWt5CGl8ZzYyxk0AuGe8a1jZJpjaSzO4qsYA53jCTx5ksb
         0sSgfHPEpp+LFB1qJb5shwBCgGJXVozsZf9uNgwKvl/+vURMO03gL4f/klJHUo0SX3qq
         IFjQ==
X-Gm-Message-State: AOAM532xawGMj7Eto5Fr8lBQPh38tAfoBmsC4ryP+B2aD8SaK25S9JV1
	cp0inIhnJJUamY+6s8/8lZhhUV9bM4Ne7w==
X-Google-Smtp-Source: ABdhPJxS/y+t9FyV6rRdCuKiRhqnIyubotWxfSewadtnYRt4DFXeTEYNU6yr03eMK+9smLsI/aPrIg==
X-Received: by 2002:a17:90b:3891:: with SMTP id mu17mr2741128pjb.140.1607406929629;
        Mon, 07 Dec 2020 21:55:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::23fd])
        by smtp.gmail.com with ESMTPSA id a10sm16182009pfi.168.2020.12.07.21.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 21:55:29 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Roland Hieber <rhi@pengutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 2/4] fbset: use DEBIAN_MIRROR in SRC_URI
Date: Mon,  7 Dec 2020 21:55:23 -0800
Message-Id: <20201208055525.877400-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208055525.877400-1-raj.khem@gmail.com>
References: <20201208055525.877400-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Roland Hieber <rhi@pengutronix.de>

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/fbset/fbset_2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fbset/fbset_2.1.bb b/meta-oe/recipes-support/fbset/fbset_2.1.bb
index fbf834da18..e3e406ff53 100644
--- a/meta-oe/recipes-support/fbset/fbset_2.1.bb
+++ b/meta-oe/recipes-support/fbset/fbset_2.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "bison-native flex-native"
 
 PR = "r4"
 
-SRC_URI = "http://ftp.debian.org/debian/pool/main/f/fbset/fbset_2.1.orig.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/f/fbset/fbset_2.1.orig.tar.gz \
            file://makefile.patch \
            file://fbset-2.1-fix-makefile-dep.patch \
            file://0001-fbset-including-asm-types.h-is-needed-on-all-linux-s.patch \
-- 
2.29.2

