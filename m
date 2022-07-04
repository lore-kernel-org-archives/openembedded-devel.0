Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCB4CCA47F
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 09:20:10 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.70347.1656926407448411040
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 02:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ptnf9bBI;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id pk21so15683149ejb.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 02:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jXhkyPHOoC8HhpUwfO/SuYPic5cZmn8JSCocE/tbLCU=;
        b=ptnf9bBI1Ioo87zQy9f1TfDxCeqhi/AAWc/aN6fT/kxHr2xzxJL0uu/lUQOOwDZzu3
         qh7Myvdvmx8aWGVtFmJzpDdRuQrzA52/F7hQ/FZ0o1w6sjSuYeGyjL8pal5HJVC8Yp5G
         sjPkxN6dB9/jPFfWhqJ3jQXqrnmoNcOmBrWorsCBxcdyVMV1v3tpP4GyfUhMrnQFe9p6
         skc/h/9hNfFUliR8W+9wO/AN7t2E4D6RQPaWUE0fFWWpB+e3TIgV5SIouiWxzAYJG0X0
         186h6czuKkVYJPA0bJUaCl04EZJrj5RVra41tTV7APiYSh1isrim9TA+cjO+qXlxUIw7
         dlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jXhkyPHOoC8HhpUwfO/SuYPic5cZmn8JSCocE/tbLCU=;
        b=K+EJq3g4aF99PqLix2Fyp7Do9mz/QrBfz7j0YaW7ySuffqDRC6ducQHT01z1xBNfnp
         Gs6NX6d34HahFptvTJuBwN5SUA5NUBclbLcDVDSORhZsQ8ccMR75KriBtboZuY+C/b+w
         mZBLgo0vcGEylyd/gWziu+LCvpfsqF12vW9DZzmZoST9GZdqxXOXH7M8JJBnp+CYjsoA
         IOn6abWnqrdpzwGPK6fyzFkJIhD1f+8oG+sQBagmkTwM8DPcQhvvLofrlFkIXmr0qdJ+
         4bT/7V/J2JpoCtI5UkpQriz8nplgTA3r6DyCsnEmWfAJOflup1ZZnTQOGDJ5elSoYn0h
         xReg==
X-Gm-Message-State: AJIora+NCpFMUJc3kl19yUySkdJWrXZjHkJy3rfjriUTsPU5N9rDDDFF
	+VmRNVk6eFvuPCT0jIj0f4kkkYQaCcA=
X-Google-Smtp-Source: 
 AGRyM1uveM83w4zkvZ5QwqmdxZtjPRVwpWlzqxSRGpRuilxUQEs3JcCT0mEw7ul+2OFrHJlc0pRPlg==
X-Received: by 2002:a17:906:9753:b0:722:f1e3:ec27 with SMTP id
 o19-20020a170906975300b00722f1e3ec27mr26946870ejy.355.1656926405454;
        Mon, 04 Jul 2022 02:20:05 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-162.retail.telecomitalia.it. [82.60.178.162])
        by smtp.gmail.com with ESMTPSA id
 n7-20020a05640205c700b0043575ae2051sm19960646edx.62.2022.07.04.02.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 02:20:05 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-oe][master][kirkstone][PATCH] emlog: ignore unrelated CVEs
Date: Mon,  4 Jul 2022 11:19:55 +0200
Message-Id: <20220704091955.32154-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Jul 2022 09:20:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97686

This product is not present in the NVD database but another
one with exactly the same name is in fact present. For that
reason cve-check is outputting CVEs that are unrelated so they
can be ignored.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta-oe/recipes-core/emlog/emlog_git.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-oe/recipes-core/emlog/emlog_git.bb b/meta-oe/recipes-core/emlog/emlog_git.bb
index be9ae5823..e2dcd4633 100644
--- a/meta-oe/recipes-core/emlog/emlog_git.bb
+++ b/meta-oe/recipes-core/emlog/emlog_git.bb
@@ -24,3 +24,14 @@ do_install() {
 }
 
 RRECOMMENDS:${PN} += "kernel-module-emlog"
+
+# The NVD database doesn't have a CPE for this product,
+# the name of this product is exactly the same as github.com/emlog/emlog
+# but it's not related in any way. The following CVEs are from that project
+# so they can be safely ignored
+CVE_IGNORE += "\
+    CVE-2019-16868 \
+    CVE-2019-17073 \
+    CVE-2021-44584 \
+    CVE-2022-1526 \
+"
-- 
2.34.1


