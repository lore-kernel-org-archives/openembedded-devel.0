Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web09.3071.1605582859220235806
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2020 19:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IvCvYMuz;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id t21so8749741pgl.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2020 19:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=89EUS4QuFDc07vF5kuGRHR3YS/2p8A5siHatsUOydCY=;
        b=IvCvYMuzuLqbTgWk601DtEuiWfi0VRXPeTvvcjiVpmvNNza9Br1Zcqn//QCE19e5Eu
         Is0eSjKM1kTHWqhj/LLG7IB1QO0tAYX2hzlozvhXhT3C1gz6Evu4hIxIef/JBG7zejgq
         iSWI1YqgpDmOGVz16dWAnsGG9Wnw0w9QBZ2qy46VDzr2Nqz3OOh8IBxn6UMAkXBoDSxp
         5kEO+clX513Pw+6Py/9DPQcWa9fUGcQbMvaAX0jkwxjvYc8m5hShTQRJct4Xe6ExF/OM
         13gDfE/NhXrkODfy68q4RwBmQL27T7Hz7O6kLqR3tFMjvlS5emNy51c8Q9QwGPa8iWJz
         fM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=89EUS4QuFDc07vF5kuGRHR3YS/2p8A5siHatsUOydCY=;
        b=m4ytDUJhSKbF0CpdxGzh3LYj+0HVguMY51jh/foTORTh8LhoFa1IsymPU+3TUXYKyS
         WjbzoEPtLMlTGU+R6h2MZNRCKUcecdYNWjEIZL4rA2M9X7E9UThboGRpWFp0w+hunb5E
         sy5rhx5a/sVuO3MIKRO/fwxuJT+7u+d0n9E5WipTCJn+jDqdjpaKWSYOigDmDd6V7fpc
         niyGviFhLIxyXq6tyxGvGa9p82fbH6+1ZEchaGAqq/Q3YS4H2cD9Su/OZos7N3q3QGBD
         Hskc+i4j8Rp4pNXCaVLLZN/rVrbqmtxwzHne3AmZBW3TCYAfnhh4bGjIwl1O7OC04Ehv
         51Yg==
X-Gm-Message-State: AOAM531hYlzXrgKVOVSjQFLDmrM9tZrCvQTaesT/XjSwspkDygGwejxy
	s4Sm+sqGaowo+kYqZ6n2y2KHN47yAvjx9w==
X-Google-Smtp-Source: ABdhPJxp4ED4lGkvmLPt4af7m+Wq3SLjJqLVOUekT7yHR/BdkDHBPY8lTaJY7i1QFAfwqQtdP66bew==
X-Received: by 2002:a17:90a:e658:: with SMTP id ep24mr2277010pjb.171.1605582858326;
        Mon, 16 Nov 2020 19:14:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id y10sm973852pjm.34.2020.11.16.19.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 19:14:17 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fluentbit: Link with libatomic on riscv32
Date: Mon, 16 Nov 2020 19:14:15 -0800
Message-Id: <20201117031415.3596312-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
index ae5457ae4f..bc4cd0cf9c 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
@@ -46,6 +46,7 @@ EXTRA_OECMAKE += "-DFLB_SHARED_LIB=Off -DFLB_EXAMPLES=Off "
 EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES','systemd','-DFLB_SYSTEMD=On','',d)}"
 
 EXTRA_OECMAKE_append_riscv64 = " -DFLB_DEPS='atomic'"
+EXTRA_OECMAKE_append_riscv32 = " -DFLB_DEPS='atomic'"
 
 # Kafka Output plugin (disabled by default): note that when
 # enabling Kafka output plugin, the backend library librdkafka
-- 
2.29.2

