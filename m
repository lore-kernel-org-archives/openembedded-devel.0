Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web10.7331.1598942843326720839
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 23:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C3gIhQdT;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id q1so142683pjd.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 23:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OXxn2YQzqf8mFoyI/7ZWkwkF0kb59qr54vq6gHWt7do=;
        b=C3gIhQdTpIA/gi1wpXR0FLLuf/am0NMAhTh5dTO6dSVNpDmVpMyE6NIQGsVDJA4u/U
         cAwgcHOCEDQlxGiG8LXoWIgjGXPyw4X+ckrxzb1ZYzXX675wLZXJGP1aS4Bzml10GtLj
         eGvx1CrrVoQ2lfHFMbnBRwl93MQEn8oL4A6llPRpuaaF7CUvd77jJklVMHpKvbgEim07
         BHuOblRo2bBS5wNU9s2K7fwmjoE4U/kT5ryrI+LoR0htOSBy1YDRlCF5Hujui5rSl8Q6
         7AL5FJKvCJfiBlRzdIP41qv2oEHzV0tWWQA7NHa0PMR8yMapP7JiyqWq29GtiF6/wOGA
         7GPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OXxn2YQzqf8mFoyI/7ZWkwkF0kb59qr54vq6gHWt7do=;
        b=T//e8ywhma2gDJawccsA2SvW9kolR4APAbBEc+zDLSnTaC035FO/yxl+RnODWDQgJR
         bH8NAkPadL39ihd7em4aVnDXXtaXqklgogGHYJAjr+Vh65BwtPreMR6H8BgrnHLRtWcQ
         V6cF4vrf75vZO60ZfmeD9yseSQZgl1Ag9Ak1aV5+n/ik27dZVXdw1DZeO94u38+Eq+IG
         RQIaEUqOTqDEpjnSmTD9/y7V1adyTS9UJE1s/qUPuPX+0GTkaer1y26aJslctIH+aKdC
         V5uLa6w+ptjHoNFrFq/9qntsnwGrZmihQw8njU1GItTcQAAxVQhw+HRCKkJNv+Gf3Kj/
         MDmQ==
X-Gm-Message-State: AOAM530vDkzfKGweqBONXrNTWBi3FpEbf/8kXyWcKRSquQM9geNNQ1s1
	Qpfp22gubU0KNEhDKn7zn1E0WodoNUj/ww==
X-Google-Smtp-Source: ABdhPJyFIM7iPKVIXN9l8/mEQ40wzNalCET2Y//EpjJ36IzgNx1NN9LBoduAtx/IiJOk0ESUNh8jOA==
X-Received: by 2002:a17:90a:2e0f:: with SMTP id q15mr194141pjd.49.1598942842607;
        Mon, 31 Aug 2020 23:47:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id a13sm778384pgn.17.2020.08.31.23.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 23:47:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/5] packagegroup-meta-oe: Exclude from world builds
Date: Mon, 31 Aug 2020 23:47:14 -0700
Message-Id: <20200901064714.2206751-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901064714.2206751-1-raj.khem@gmail.com>
References: <20200901064714.2206751-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 52171a5fac..55d623d95e 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -936,3 +936,6 @@ RDEPENDS_packagegroup-meta-oe-fortran-packages = "\
 # spdlog span-lite uthash websocketpp catch2 properties-cpp
 
 # rsyslog conflicts with syslog-ng so its not included here
+
+EXCLUDE_FROM_WORLD = "1"
+
-- 
2.28.0

