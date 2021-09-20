Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.848.1632170529891753125
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Sep 2021 13:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mMxDJl7b;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id m3so70284118lfu.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Sep 2021 13:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eYuwm6rpYbwxnhP9vEIIpQwivrKK6BWElp2bsfzfV5U=;
        b=mMxDJl7b7C78rQBR4dEdjtRjGzAs07Gt6s+4MZCY4IUByDW9IiLxiNdsGmhrey4NSD
         L2tmfzEmZzJH+xlW9UJboYSuXHiakSZBA0mowKnKpIqw0sg5MuwasaVWxeaWQ4Bx6712
         xNRCn2tRcAYzzRYPUc62rMXYcpSf0dnJFgq4Hc0ei6Bl1EW05bLRVJdNSv0q2Gqjfu4t
         coYUuIQERIA9Ipg8DY2GkTJERz64t8/eQO7vaq+7CQ1cefUgQxW6VZoH3V5uXSmp+QZD
         1e4t69QLQt11Cc1dt6Olr4P0zd78GmvmY87e/VUG6DOjuG1DQfMe77ytG0nDTZyW8VbE
         vKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eYuwm6rpYbwxnhP9vEIIpQwivrKK6BWElp2bsfzfV5U=;
        b=t7WTtQWTmXiXZl8oymFbnwa9/8Sgu/ndL3gkwd7wqxxP6BYovZQKQLjMXsizmenRei
         Yli5BYqrdF/Tn4x4ozk1IzZvmnAuEt6YDrRX8MzHKAlcxNknxe8MM53M0VHcqjBY2Eay
         mnuCN6qxSKL2OeoDnTwrIJh++ppspVMR9KohZOTa+F3uKz80sWNOjuLT3LS2CWuCxpWq
         vIgKncgdENQmcNvYP4xgTyOHR2otI4m6jV6GHLbAki5hbPRKfhElWZqVUHEtLhK0J381
         40i0ACOoL/8FgV3yBbj52JM6UgSV13mLmGT3O1dSMkrEL/GNsjEzjY8wwKIR0FeTKaIJ
         3Htg==
X-Gm-Message-State: AOAM532cIzG7bmmO1GDAc5vwC8ZATKmU4JEG3PejpKrtUFqzG3QzEaqE
	AHpxdYtsfEStJ4mPQAQrlufrFvVPga2AfA==
X-Google-Smtp-Source: ABdhPJzdnMhdHCdtQBbrEQE1HjmQWVCkjZ8GoRJ/eybNDKyh/w2sLiOTEuF5wn7H5sVn7K6paotZEg==
X-Received: by 2002:a05:6512:3404:: with SMTP id i4mr10699556lfr.432.1632170528252;
        Mon, 20 Sep 2021 13:42:08 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id n26sm1350919lfe.72.2021.09.20.13.42.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 13:42:07 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java][PATCH 2/2] junit: Fix task dependency typo
Date: Mon, 20 Sep 2021 22:41:23 +0200
Message-Id: <20210920204123.1449479-2-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920204123.1449479-1-jacob.kroon@gmail.com>
References: <20210920204123.1449479-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 recipes-core/junit/junit_3.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/junit/junit_3.8.2.bb b/recipes-core/junit/junit_3.8.2.bb
index feaddc3..36ca453 100644
--- a/recipes-core/junit/junit_3.8.2.bb
+++ b/recipes-core/junit/junit_3.8.2.bb
@@ -23,7 +23,7 @@ do_unpackpost() {
 	unzip -o src.zip -d src
 }
 
-addtask unpackpost before do_deletebinraries after do_unpack
+addtask unpackpost before do_deletebinaries after do_unpack
 
 do_compile() {
   mkdir -p build
