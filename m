Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.310.1632372555631731702
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 21:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fruVZAMb;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id h3so5086572pgb.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 21:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rArYkzHkGDcRpURCSC0VCuSrZsGOg2mww2pxZnYD/H8=;
        b=fruVZAMb0IUjpr1hCYncu3OL14hVGo9gIPhmxAV6vOrYPYFvYn5uBwyfvhqaioAxhi
         QNkK5m0JjW9F7FlVeidFCv0L5BeNEHCJUYHDAaxdoZ7TGG5QseOtrZZFRlvGH1eNWsfZ
         CAIlRFGHeH2GcQmrON2UaDrxfqvMWc9UpnfT9TQWMEWP9eAscvTYZQ7dEBnC1Venijg5
         a5uioVPQFG31k04/cFeloK0vXi9O4ZkhSqz3HLF3PLFKMVWPiZY6BPtX3RbPzMQRs9dT
         B3dIEFfRhqCxG+cHZ5nK0PWvk6yGF7j20i9h1NLfv56OIja2ykocVwnzORLPY8j1oZxs
         rUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rArYkzHkGDcRpURCSC0VCuSrZsGOg2mww2pxZnYD/H8=;
        b=coenmD2vPylv96JGwVdnfS8AynuorMoUyHVflrfi7y7ywVN08SDLTBauG+BiQE24DM
         8IXaavo3sPCMyxeBkdc92IX4ehl6nXc1LzsTnwcKjF/MRbFdnbvEWa1CzI2qU5TNDW3m
         /b35Rc0Aru+mbqD7aPZYk6c+Jb+Xjaa2voU/rpg9sMFOGp7lnPj7iHnjK9OER+zyFkQU
         7nywVBD1K66comCRxPPysK1/yWoKaidyZMNsm+jZcN4eICltmM+8XaocWTAJft4S6WDe
         AiZ9D8nunRM3icyqd+H/Rs6NQdQLutaw6Ij60StFBwRLQp8T2uFWy1ZNCRtyae/IgzfR
         N9cw==
X-Gm-Message-State: AOAM531t7CgvrJBu/N24b1+KnK/7wsebl/sjKJjosWRe1Voq+2l+wjYP
	e6nbAD88p00Vw0Q5Z7QUG+1EtaT9q3i6Ww==
X-Google-Smtp-Source: ABdhPJwF0F3ooOBR8cb276HtcMTwEOw5l6xrzrusxyJ8Xy7ZNIXlF9eKZgDKO2uanbg5FjWrvaLAzg==
X-Received: by 2002:a62:6d86:0:b0:448:152d:83a4 with SMTP id i128-20020a626d86000000b00448152d83a4mr2311659pfc.38.1632372554948;
        Wed, 22 Sep 2021 21:49:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id 207sm4025588pfu.56.2021.09.22.21.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 21:49:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] fio: Upgrade to 3.28
Date: Wed, 22 Sep 2021 21:49:10 -0700
Message-Id: <20210923044910.1784581-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923044910.1784581-1-raj.khem@gmail.com>
References: <20210923044910.1784581-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/fio/{fio_3.27.bb => fio_3.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/fio/{fio_3.27.bb => fio_3.28.bb} (96%)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.27.bb b/meta-oe/recipes-benchmark/fio/fio_3.28.bb
similarity index 96%
rename from meta-oe/recipes-benchmark/fio/fio_3.27.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.28.bb
index 96791948b0..6e4b648d26 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.27.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.28.bb
@@ -22,7 +22,7 @@ PACKAGECONFIG_NUMA:armeb = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-SRCREV = "0313e938c9c8bb37d71dade239f1f5326677b079"
+SRCREV = "d83ac9d3d30d5f5dc6d0e425e4ba945a772839f6"
 SRC_URI = "git://git.kernel.dk/fio.git \
 "
 
-- 
2.33.0

