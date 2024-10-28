Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E06D5B15B
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:15 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.50622.1730119264220884865
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 05:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Knz8iSkJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e2972abc807so4211772276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 05:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730119263; x=1730724063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cSfhag8HVGdekuuB0qTc5WUvp/gNdXhakVllgyIAUNI=;
        b=Knz8iSkJ238PTQwVwZUCR85Bjew2OndmikF4Bdy5vS9aBkQLDk7Yz+kh8/QebQwH+8
         oiR+kKtbhiQe0sbiFNTiSTmbSrCWu91YII0IbiZFDcWHS2hZ4mS2joZnp7HAT/Z/198g
         oLfjPK+Q8leJa66H6bs/8YwCD2O7QQyMCNujvSVQhi1QH2Rnrt2oiuFb5xhio9Q9jmEg
         K3UDDyTEc5C3gKEiWDTy4YoebxdVmfoPCMFP6Qc6dQnaeEfs9/RBne+o3uFgErqt0kKv
         gmqUSLmcWiJDqc+G2bwvpgA+VyfBximqGMDTQF9VbT0MHo7Jh/wtzyV2v3RZlS2f5nzQ
         0p3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730119263; x=1730724063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSfhag8HVGdekuuB0qTc5WUvp/gNdXhakVllgyIAUNI=;
        b=UeizLxvjwB0MdsYmK0SIc1sozUTQz9U+zyPyE3Tlk256ScItnAthmLQ6QbYIuEZo0D
         x6OmuVGVbn5fvkEXAL4rbMFVb7etXK5UnzzGIwHJ8OWS42rSMtURYn7oylLG8PtZ1jeg
         YuIw0//B0eOKcuIecdSJKboCPSt7ahU0C86UH0GMB2nVZv2hNv2+BW2w2kIPcfqZ2TZB
         EaUFzbJZd9Hc4oVND0Tzm4iwrKNYX0/7E1kFVVHjaCScOOd95S4eMDTFhXNkSjwzP6PW
         iMUtgwJn5wOtUJIH0RtHVkTYe7bQomsbc/VR/AO0mledLA/frrqZpSmfDMm9Lf7NYNFP
         vDAg==
X-Gm-Message-State: AOJu0YzbIn3Fxd7pUvSY8D5AQUAUaMWyuMrSqzFn9rXMX6wJEjxGNqMl
	ENe+FCofaakoaJ1NSYr8aqnNGRPXiMPjxz0xFISKrDPcZwDW0W76eNwhqg==
X-Google-Smtp-Source: AGHT+IFh0pRssBrBLevKCU7PWE1HbXuFnhG2x0HZfdG+Gv1pZiFWwjFgq1EwJmGD9ywEwLd6GrlEFQ==
X-Received: by 2002:a05:690c:2b11:b0:6e3:2ca6:e666 with SMTP id 00721157ae682-6e9d8b1501dmr58568347b3.41.1730119262716;
        Mon, 28 Oct 2024 05:41:02 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c76fa5sm13974777b3.97.2024.10.28.05.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 05:41:02 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH v2 1/2] libhtml-tree-perl: fix QA Issue: TMPDIR [buildpaths]
Date: Mon, 28 Oct 2024 08:40:42 -0400
Message-ID: <20241028124043.5014-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113266

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
index f07019660..7bdebcd37 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
@@ -25,6 +25,13 @@ export PERL_USE_UNSAFE_INC = "1"
 DEPENDS += "libmodule-build-perl-native \
 "
 
+do_install:append() {
+  sed -i \
+    -e 's|${TMPDIR}||g' \
+    `find ${D}/usr/share/doc/perl/html/site/lib/HTML/ -type f` \
+    `find ${D}/usr/lib/perl5 -type f -name .packlist`
+}
+
 RPROVIDES:${PN} = " libhtml-element-perl \
     libhtml-tree-assubs-perl \
     libhtml-tree-perl \
-- 
2.43.0


