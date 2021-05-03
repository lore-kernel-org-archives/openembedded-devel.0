Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web09.1806.1620069138121166595
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PLghHj6/;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id l6so6454434oii.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 12:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=p9HJx8nXCPHB/xFC7b49ZhosgcSkqvrXL2ct0F7Ipxc=;
        b=PLghHj6/n6hZVLSNhFMjGvMSI936Su/Mg9YA3YcPTzbb7h5Hwsyblhs1IEbSg4+bJg
         lPgXTGMYM+Dbb412S8TQTcWiH02cr/pJDnztWutAe1F6/oG7b3rctGyOAWq88H0cr9wc
         qrdXU+RBNmvExRxLkFcePa56a5ki+KvMbq10t8Q4e/BtumjO7PCAeLDdAyG1NQIS2YkV
         La8LoDySAWhhS+lufqNf6EtQf0efq1aXYmyetG0d6s7ArLX5pUT8PLfVne9U22R1g2KQ
         gapLUI3O7jTHo9hMlsepq+naJHW0h8ETblSLTa4WJKXW7wu/F5MDbERoGvvsbcY6J7e4
         eRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=p9HJx8nXCPHB/xFC7b49ZhosgcSkqvrXL2ct0F7Ipxc=;
        b=SAnNIVpJsxYY479dtv6AA23GVWzTMJ2GYbDGtovjVsy9+U4CloRirpisTgN2V6a77c
         Rg/vZ7+K3GYHcc5qx0xmVb4QF0U3FP0H8MOy2fwcgjfn+IFMFKsKnkiTYmioCbY5r5uI
         pQuyRxx7x/ZYhICuyRNSnz3XZjTEW+28+vZTgfqHiuOOaLxYRUX4kq20AVxtzjbjnXfi
         x2/Wcoq/lXf9rE0C9M9e9bkm3ocOqMsSN46X56bGkxfnUk43ZoZsZjA3Lnuefiol6cH+
         kKFajrlDMqL2VzBxnRz9llqJ61mDnZIcA8Hg9Dx85TT+Ua6y/t5TrU8NyoQWVavg39yZ
         kGUw==
X-Gm-Message-State: AOAM532kTFwslWzurU4PrORzP6iSb1BrA/lu7awIRGAfM9L+jRwSQ5cx
	ITOcF7Z2XyXq9c8/eN9KI5FcAnd+dr1BFg==
X-Google-Smtp-Source: ABdhPJxdNCacteSOpjudHTRvk/EMA57lRWxoR0z9M0/+nJkQcPC1MyVDJ3k5W3rjNL4/ZhO2+cpfNg==
X-Received: by 2002:aca:5856:: with SMTP id m83mr73009oib.20.1620069137144;
        Mon, 03 May 2021 12:12:17 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:dc35:22d6:72af:c1da])
        by smtp.gmail.com with ESMTPSA id s85sm150047oos.4.2021.05.03.12.12.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:12:16 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 08/14] redis: upgrade 6.2.1 -> 6.2.2
Date: Mon,  3 May 2021 12:12:01 -0700
Message-Id: <085332dcd273564b13c9261429947ebb33f1652d.1620069041.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1620069041.git.akuster808@gmail.com>
References: <cover.1620069041.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4b04112fddb7b2ef5d4b61975d385b386bbd9f5b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-extended/redis/{redis_6.2.1.bb => redis_6.2.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.1.bb => redis_6.2.2.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.1.bb b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.1.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.2.bb
index 89990df3de..65b525709e 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.1.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "cd222505012cce20b25682fca931ec93bd21ae92cb4abfe742cf7b76aa907520"
+SRC_URI[sha256sum] = "7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce42d3017bed6add0b9535"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.17.1

