Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0052C433FE
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:18:50 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.26008.1651346322825209829
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Uzccfsq3;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id x23so4181737pff.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r/U3EDphoPdN9tsbtNSHu0Op/NzRgqMmwewolERh3O8=;
        b=Uzccfsq3U4D16aKCIGHMmReID4n7sKWPLB1nFGGAXfwQwHGBCcj5ZkI7C2uPeMV4hD
         MzzZOLGs8meXmkQ86fzQpuJJ+gzC2U6Y9cmcEQgKij3lMiZg05BdzBDr/jIzp0OIQoOJ
         OgAB2kIjj0i+wy6Y1ETv1uOp0yqj/Q45nlPbgjdTpQzMg9x1/FNgxzSZxGMeFvCLwcNe
         eaHR280J8tETKiO+sEIXVysH9DDcii348k+1DnFG7YYPgdLP6ZHzNksD6d69+jEr2HAA
         K/GZwfj7vE+lfsi+a7P2G8CikFJmYhgUsRSrGVVGQPT6szfZMXV0R5z0m30rR81i4lqu
         SBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r/U3EDphoPdN9tsbtNSHu0Op/NzRgqMmwewolERh3O8=;
        b=XZN3XXTSg1rQPL2QyPMErAOTXW0UlUhvD7oUoiu3ovIWjs44if/htNPStL/W9Mjtt6
         Y5oOXHzj6Ty2sm14wdZNLZyHQE1CM8Ryth/skUhzFvnV1t3SdpdiVbcYMKyg37P0o3A2
         cvzo/b6KSNjbgsXND42Ol87EQXJqsz0xPzTCKCdvQSn3tZEm+xc/RIVaVeAuNFFcJkYV
         65OdREwuh+QcN1QrmI2lHeFgSuWpUyGs6ZH40jhm0Ls4P0JNydWqttL8f59/KwNYVoQx
         U2xM4Dw3v7XBOaStzYFTVGVgHZQ4wVPTXlqLmC6uIxBlfwAyGvUevZ7zVh7SMwfCDwO4
         HzZw==
X-Gm-Message-State: AOAM5306QdDtfpf1tD9qqQKpA2lBvLdLmmIVH1mc0mjsClATJLFRGAvC
	7UXOMsV8VHZDl19i3uPIlKZuALfN8IbZ8A==
X-Google-Smtp-Source: 
 ABdhPJxNv5O39KzWgZODl9wRWzIvaqpVrqHkRjqFRWq0gx9jRQmWN8oIjB1jtg/7InGdY/OLHxKKew==
X-Received: by 2002:a05:6a00:21c7:b0:4fd:f89f:ec17 with SMTP id
 t7-20020a056a0021c700b004fdf89fec17mr4401088pfj.72.1651346321994;
        Sat, 30 Apr 2022 12:18:41 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 11/39] libldb: Fix installed-vs-shipped and rebuild error
Date: Sat, 30 Apr 2022 12:17:51 -0700
Message-Id: 
 <231fd21671eac6dd679cdbca6e58f552b28e39c1.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:18:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96878

From: Robert Yang <liezhi.yang@windriver.com>

Fixed when multilib is disabled on intel-x86-64:
MULITLIBS = ""
$ bitbake sssd

ERROR: sssd-2.5.2-r0 do_package: QA Issue: sssd: Files/directories were installed but not shipped in any package:
/usr/lib/ldb
/usr/lib64/ldb/modules/ldb/memberof.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
sssd: 2 installed and not shipped files. [installed-vs-shipped]

And also remove bin/ got get a clean rebuild, otherwise, the rebuild result may
be incorrect.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5f6156c0ef842bd39e9eb1f7ce02eb7c7c961d3a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/libldb/libldb_2.3.3.bb            | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-networking/recipes-support/libldb/libldb_2.3.3.bb b/meta-networking/recipes-support/libldb/libldb_2.3.3.bb
index c46a9784e3..6dd3ec3a9a 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.3.3.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.3.3.bb
@@ -68,3 +68,14 @@ FILES:pyldb = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
 FILES:pyldb-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
                    ${libdir}/.debug/libpyldb-util.*.so.*"
 FILES:pyldb-dev = "${libdir}/libpyldb-util.*.so"
+
+# Prevent third_party/waf/waflib/Configure.py checking host's path which is
+# incorrect for cross building.
+export PREFIX = "/"
+export LIBDIR = "${libdir}"
+export BINDIR = "${bindir}"
+
+do_configure:prepend() {
+    # For a clean rebuild
+    rm -fr bin/
+}
-- 
2.25.1


