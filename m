Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.14294.1619911848010347534
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 May 2021 16:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pdajzNGE;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id v191so1610684pfc.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 May 2021 16:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tVl3TX5X8STj29Vuls1+ZPL4JGi/sP6b8EVDND7yb9c=;
        b=pdajzNGEt5WEnIl8vnIRPgOzy/TUBNG2Sf/bGJUpOYk2NjXdn2bjM9XsFyJJgIoJOr
         DsYBmBz0HRYNqYi5NJwBWHMYFCevMiAQDlHk5xuDPWsVU/8rhncoZz0dNAFnaJ8sKOz5
         unBNmTgN1RSWg4Hc3RBiULLcaKELauP6HV1mH9BtdiNAHWIjrahFBo17DgZbUQhoEDEM
         odrhNiOQahnHIPYp7NB1dMTINpVsUu5aeQtW53aIiTjm6J5Hh/Xz9Z1Z2abyaTcM+cfO
         1FQCJ48M0QdGjkzv39uXpaUZqpriSIYc1ApIr8FENL5xlOFoJTtElHam+5csMZMosbJ/
         0DqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tVl3TX5X8STj29Vuls1+ZPL4JGi/sP6b8EVDND7yb9c=;
        b=j+KlqgiZz6u0pEtO6Y+rZcXxJGvdNGAoyBAKy+kCKKLNjG3mhWCTOnqH7pLAijjMXH
         7NavXO01AAl3VlirjejsJ4KG/puUGUOWQ2v4LWYgO+AUgGPJiN+rn+Kpf04BlfBilFt2
         FAOrJf3k5Hq+9xcA4AlaemByBuzQ3TcAX93ic2H9L1HN1gRCovr/hp/whw/ZlMekURnD
         jdIRm9548JKbNhqsxV/NU64g0PfBnsFM80UzvVKxUIcLMcfNgvroqQXdxxs3ulS62xWo
         BIDSknWfoIxL6+hkjTiEkOwylvZK3ACkqo9IZec9fbQjqyXdJLAz/Ta9dyzNPHvfBR6W
         rn4Q==
X-Gm-Message-State: AOAM531PtzyMVVhsQyJW+WxAAzcPgNaSFAJKhMpia+VlRinGQMQ0GkMJ
	1fGPYBZMoKuOsNbWw1Jbpepf9IFa7G+vBg==
X-Google-Smtp-Source: ABdhPJxXrqhlhCTLu7JB/p4Xyt9vEN+Nnijd15Y8P2RqmI5vOTcAgiZ7qBGFkCbPQVRmKwwvapRXvA==
X-Received: by 2002:a05:6a00:2389:b029:28c:ede4:8a60 with SMTP id f9-20020a056a002389b029028cede48a60mr8966339pfc.54.1619911847410;
        Sat, 01 May 2021 16:30:47 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8589:f92a:54a1:6475])
        by smtp.gmail.com with ESMTPSA id in16sm5665574pjb.14.2021.05.01.16.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 16:30:47 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] nodejs: 12.20.1 -> 12.20.2
Date: Sat,  1 May 2021 16:30:35 -0700
Message-Id: <20210501233036.11611-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210501233036.11611-1-akuster808@gmail.com>
References: <20210501233036.11611-1-akuster808@gmail.com>

From: Sean Nyekjaer <sean@geanix.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6322c63987b1422d5a8c5e30077780b38011c89d)
[12.x is LTS version]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nodejs/{nodejs_12.20.1.bb => nodejs_12.20.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.20.1.bb => nodejs_12.20.2.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
index 0673a3202d..6acc36b4fb 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "e00eee325d705b2bfa9929b7d061eb2315402d7e8548945eac9870bf84321853"
+SRC_URI[sha256sum] = "961ad600f0706c396390ebc7767fb01d5e3792a5022dc2e7774796756eec6d3c"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.17.1

