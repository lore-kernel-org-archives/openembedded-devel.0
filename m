Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web08.15157.1604943507483420314
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 09:38:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CLiqz1lJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id z24so7758514pgk.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 09:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/FZvJQ2+VVWEOTu9gbQ2PbTvcEdUVg+Tuz+WqO3Vfz8=;
        b=CLiqz1lJXBR2eYYyYVqLIMNvMcV/NoPW5cttKo/XZ9VL3eIMS1CsuxbO3GVpYM9cXP
         nMdjN783NXWOAs48ydXTk7yFNXQW/v4kRm3O6EeGdG3ObqHdD2OcKS4vQAPbxy7PNA2x
         3MS1N0IilooMgjJfLiVpI2di6VFfsoYd6DmKRvCNMtwQxCclVI9ds0s2zICfstQ4uz+J
         TMiGlTwQQ9CgJBP178U/AQ5QfT/WETgc6G6iFxCkP3KhSJygD/zwu1XHLfowp4ayfNiQ
         mTUvkugBpo0i8k4AbsjHdruTbNb2gOpju5TFDyZVWFEe2zBLQZvdkqSvuefy+mRik2Vj
         qjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/FZvJQ2+VVWEOTu9gbQ2PbTvcEdUVg+Tuz+WqO3Vfz8=;
        b=av4/YhPMTqvV2Xo02XiEnm4/s1byDiFG0S+agFLL0W3L2u7HE/wucivKy4JdLUr/Wy
         cvP4JXbhbnskPkJYwC2mc0A+Fdukv+v8p+qlVAN7p6bFocWi7+RrI3jP711Zf78yjrNV
         uiobjF07E67AqWTSyYYDwh9WAIcFjrmZPLtqmrbJDKMUhfZyiBVXVt4utQiU6wdu5FiT
         buJPS/jINaOL4fj9XIunODPFeMaKjrtNeoo44BYP9T4cDWuVpmAHWtgABifOQhewH1wN
         4xOyodvqSTYn5cu64EBZzy9UF1UDWSKSubQsq5zL6zLqkyPANIoOvvMCjuxUsxXLvcmq
         g4Dg==
X-Gm-Message-State: AOAM530ygs8UWebpr7pjb1dK8h5yY1MHLtlSm+02qKnt4EK8xP8QOSJy
	pgu2RitUuZsPXKYkTpdBHUvt7UghAPvWCg==
X-Google-Smtp-Source: ABdhPJy3IFcETbbUdspNgzYQZPzQ2npkPAECT6CP4daS3iIVPVCLJPIYfNt7W+IjtXodsVV6HNgVRA==
X-Received: by 2002:a62:2c8a:0:b029:160:d7a:d045 with SMTP id s132-20020a622c8a0000b02901600d7ad045mr15046570pfs.65.1604943506709;
        Mon, 09 Nov 2020 09:38:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id d7sm11198467pgh.17.2020.11.09.09.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:38:25 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/8] fluentbit: Disable LTO
Date: Mon,  9 Nov 2020 09:38:16 -0800
Message-Id: <20201109173820.3545516-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109173820.3545516-1-raj.khem@gmail.com>
References: <20201109173820.3545516-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
index 411268815a..ae5457ae4f 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
@@ -26,6 +26,8 @@ DEPENDS_append_libc-musl = " fts "
 
 INSANE_SKIP_${PN}-dev += "dev-elf"
 
+LTO = ""
+
 # Use CMake 'Unix Makefiles' generator
 OECMAKE_GENERATOR ?= "Unix Makefiles"
 
-- 
2.29.2

