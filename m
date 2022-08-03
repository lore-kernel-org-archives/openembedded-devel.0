Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55286C3F6B0
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 18:29:09 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.362.1659551343027602442
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 11:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=ASk4EmdZ;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.46,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f46.google.com with SMTP id
 p8-20020a05600c05c800b003a50311d75cso845824wmd.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 11:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fr/Z3xgB37l/YddRSHd4u1GUFZlsXIedeX1VKQ9IEd8=;
        b=ASk4EmdZCp/Qfzb5bX8y+cHeNl6XLqy3tLZDci+5iK9oEXBxejR4YHlNkj25El5cj0
         uYoz5xGYiBRX4LYr5Qc71t9CobFAIVUvxDg4UpTPSv38yc8KdCI7H4RQvOHQiwMWNtJO
         03GqM4aYcawHd/L+pXKC/Xeq9gREmTPVukFCZV/qG8sOtWko1jFLSZCK9qFYAY/BE2mJ
         QKFcdvWpbflNsEP39s2fO+med4yZ3YzJXMccaCA2DVN/67trZIKwzuO/HbcJcZPeFcHL
         O+1LR17QpB26RPeUyg/9TXoyk6pTFRnY6EW8MNw6QOOrmpY3xohjA3yIJLQobq21m9CC
         MkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fr/Z3xgB37l/YddRSHd4u1GUFZlsXIedeX1VKQ9IEd8=;
        b=6yis+lMhLGh8vM83ycRB8kgPzvHIbVQRlqQmF9ezJzWGVeZ6/hIrVzn09H6a/Yr+G0
         FQCcgbNoGEHKDe2YvXh9rXKGYgkgtJG0sgO6ACL/UqlrA56l0PvEfEfPwHFzLS1T6k4N
         tKmvReLlmEQ405roWJcZLZNePCXyGOBp8eYRhmO/Bk9bsY/BHWyH6utw/8fLmFgLI45O
         GOjkY3hcFbmUbodGQvqzv21lB0X9hb0VaXAnE/joA1F/mGI+RTPvFZVcrIZu3J7v9ef5
         ErVRIDnN8D/ud5XlsU3d29DHL6L796xMIRQf9jvDfu5H9HFfkmHE/Xo3ZlJkon4c76Gg
         LjUw==
X-Gm-Message-State: ACgBeo0LWxNPux51GwsBVEiEOkvsOQzCZuqc/0yU4+DLjzHo+ZKKEr3H
	Oe+tzvGfLENUyOuK/H00/P3AwA==
X-Google-Smtp-Source: 
 AA6agR5ukgTILf9KOYcwQ8uLOkIAzRYbyw2XGhksPvSFeI5S7tz16PgJXhUIR8P8D7Rz/PFz267HGQ==
X-Received: by 2002:a05:600c:2216:b0:3a4:a5bd:15a2 with SMTP id
 z22-20020a05600c221600b003a4a5bd15a2mr3570511wml.126.1659551341394;
        Wed, 03 Aug 2022 11:29:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4a53:da6b:7724:118e])
        by smtp.gmail.com with ESMTPSA id
 x4-20020a5d4444000000b00220606afdf4sm2730280wrr.43.2022.08.03.11.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 11:29:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 2/3] python3-matplotlib: add packaging to
 RDEPENDS
Date: Wed,  3 Aug 2022 20:28:54 +0200
Message-Id: <20220803182855.104135-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220803182855.104135-1-brgl@bgdev.pl>
References: <20220803182855.104135-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Aug 2022 18:29:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98112

matplotlib needs python3-packaging at runtime. Add it to the package's
RDEPENDS.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
index 7dfe46f3c..e3e5d85eb 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
@@ -51,6 +51,7 @@ RDEPENDS:${PN} = "\
     python3-kiwisolver \
     python3-pytz \
     python3-pillow \
+    python3-packaging \
 "
 
 ENABLELTO:toolchain-clang:riscv64 = "echo enable_lto = False >> ${S}/mplsetup.cfg"
-- 
2.34.1


