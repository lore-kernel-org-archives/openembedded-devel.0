Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.7326.1598942841572333755
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 23:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QS7PYipf;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id q1so142646pjd.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 23:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EOTlpJlVCa/xNAOZABGCpy3t+7qWilMzhwN6Nknhgpk=;
        b=QS7PYipfLZQA/8J7UYxmSN4FThRb/anmNX5rmuf1tf5R5kh26YYtsBDG0fO7TnMJO3
         ToukEOOQxaqAtuudE5/63nu4RV0DOAwZtDvBw7fGMBTh/ThgwgpfOgbQNaMtm4HRoxoW
         OK9B5GTOI8lH7An8TDA69Uwf23KU82ugfePa0VS9gQ7wY+/V7c/Hurtbel1SIbO0s3Cg
         c7TJ0SYHZxOuQ27RlE+yaF9NYYSUIVms1/44RtxNkC9bx7ceJ9JZ6JgO4RwK8NbgBGy3
         UiCPJDfSUjkHFmLPoRobZtaYXB+0B9fLEE8RMuy0daG2X1xehc1DK67Z1470zIDGutm2
         vuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EOTlpJlVCa/xNAOZABGCpy3t+7qWilMzhwN6Nknhgpk=;
        b=B6pa81iTUh5TuC8sChE2YKJ8KaX8aOG5FEkEW8fMu1RSNuyx4Jh7Xa6Xj18EOZDVTC
         j3khX/9jpKv88uVxBB4rvBrvyvUPgrYRdDsfR6gtABn1qqrPUm8PYMrt7/feZu6mtwdT
         iiYEX92fGVu0J7fqgL7MgqjZt5JTpIP8KAGQv+oFfvBHxO/aFSOHrGgy6syOtrvdFjZS
         4UiJxn4Vp7cNOCzRi7LqyUdqF4TMVLMPLAtiUbUBP5FJBUXRmcR2VMPNIxpmea/V1rNW
         jcc/AcRdnPCFgXn+RrBhViKqRzLVFCgqpo8jANWRQc1oI6MPEwMrrnqd79zlmoBUER7X
         i4SQ==
X-Gm-Message-State: AOAM532lv2iz2jG6ebhIZpQd7ViOKO5tliDIkaPL8spKCAQ7v5hHhaRi
	LAjntjwWc4Y6ZVbAKFFYvKciJrvlqSeeaQ==
X-Google-Smtp-Source: ABdhPJyc1wJGrm0W+MmyRQfJCsbySSd4Y17bWAB/cEwD9SqZwxXaXqudoaZ8bObZsaP/R35KHvrTrA==
X-Received: by 2002:a17:902:7b83:: with SMTP id w3mr167057pll.28.1598942840847;
        Mon, 31 Aug 2020 23:47:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id a13sm778384pgn.17.2020.08.31.23.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 23:47:20 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 3/5] monkey: Remove /var/run
Date: Mon, 31 Aug 2020 23:47:12 -0700
Message-Id: <20200901064714.2206751-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901064714.2206751-1-raj.khem@gmail.com>
References: <20200901064714.2206751-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is empty and its a runtime directory which is created by base-files
already

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
index 289f069b1e..698f8608fd 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -39,6 +39,7 @@ OECMAKE_GENERATOR = "Unix Makefiles"
 
 do_install_append() {
     rm -rf ${D}/run
+    rm -rf ${D}${localstatedir}/run
     install -Dm 0755 ${WORKDIR}/monkey.init ${D}${sysconfdir}/init.d/monkey
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-- 
2.28.0

