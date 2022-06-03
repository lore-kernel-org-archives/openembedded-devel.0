Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC11CCA482
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:45 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.2444.1654283977887153443
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BtxhkAc/;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id h1so7441683plf.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=M/mGKC7kB8d/5bnMLiSsRrULQY63aD0Cw/7keEWRqGc=;
        b=BtxhkAc/0YI4mnPi4fe030CV78UTVIWY7bRyXSTfAIfnAA4eKd0L494DnTG2/6PeYV
         s6Gpf6r1w0knlfnEE2IZKPaHxMqFlOF5lxgoeJAOaQDuovzSpCTxvlJXlgSF0u3nMN7R
         XfYLFnkuC7DL22LlsyKBMOAnJ8CweYambhoenJ4RIBv0u5o8YxUbKhbgmfUgN+HgbNYy
         6WhJLyF5casPZqzAf3/icLqAfcBkoC87BeuuNGA2hiN7OtqUKzjavLjvLzp6oyJH6R7t
         5l9Q95O8ge8HyIjRMlvivcqr1LIjB6NXMw67TTSYurT0ZM+GYOBz0wtkLQDiDLSG4lWg
         iLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M/mGKC7kB8d/5bnMLiSsRrULQY63aD0Cw/7keEWRqGc=;
        b=sP8hIqSl7f4hyfDBnxC4HUKmdF18onihVAhWezeyurS+CkqJljccHnXQ7/+lLJFuNW
         AWr0doM8tf2QpuPA0T7fkLcqGZT02nm+REi95PpKMbD11H5bkvQENZikqcXOi7rBq8vi
         TJ4NVX2f1pbj0/8g/PqBNr4sxvH595a5s/8vlqezkXnmz3xiijUU4nn4KmpaL9maFECO
         zdYTI7ckZsLUJTnFmBUebv1DtZjUMeguTiwYBB4pSJ4AO/dyLK0Gwk5VitPI/eECgD+g
         oMdePHbxxXahWKjdRNMNIWhE/uShnwFUqMqlLpaNRjhaGAmG9aZYtqrQPvACEWKzLbWq
         o+TQ==
X-Gm-Message-State: AOAM533tXihgFYr+mgt0OhcETcWJymbNiHYgRntSZ1w3BNCqxACHlWJP
	YjOBU61OHvvwIYb40nXfQqVoVUmvsfY=
X-Google-Smtp-Source: 
 ABdhPJxvaGEMQ0QrLEiodTn2+lLgPm8e1ZKNu4hwnswab6myxGfCLZOIS0KO4XwXdbTrXR/YRx4hWg==
X-Received: by 2002:a17:90a:c202:b0:1e2:e772:5f0a with SMTP id
 e2-20020a17090ac20200b001e2e7725f0amr12523923pjt.109.1654283977013;
        Fri, 03 Jun 2022 12:19:37 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 10/20] mariadb: Fix i386 Clang builds
Date: Fri,  3 Jun 2022 12:17:09 -0700
Message-Id: 
 <4895c4d652b2abdef2d1b7a0407f7081e11b8f70.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654282423.git.akuster808@gmail.com>
References: <cover.1654282423.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97399

Signed-off-by: Armin Kuster <akuster808@gmial.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d59578a8170266d0d7e62c132495c0e06a17e0c9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 3f246dc0a5..922373b633 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -77,6 +77,8 @@ LDFLAGS += " -pthread"
 BUILD_CFLAGS += "-fuse-ld=bfd"
 BUILD_CXXFLAGS += "-fuse-ld=bfd"
 
+LDFLAGS:x86:toolchain-clang = "-latomic"
+
 EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DWITH_JEMALLOC=no \
                  -DWITHOUT_TOKUDB=TRUE \
-- 
2.25.1


