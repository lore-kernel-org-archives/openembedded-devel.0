Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93154C433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 19:35:35 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.506.1642793734876744685
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 11:35:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JQGptcNp;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d7so9491522plr.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 11:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=srNxbA3NpIvQDeUb2zPSLU/1CPoNJCsH52Qj1X09dug=;
        b=JQGptcNpVvbX20Jf3c6v4eDqKmihB1fj8AbsrPj8xHxT9zrq3xF0BC0HPxkSXwCq+6
         neHjyu8wLauoezDKyLkfrjyrrFyddzhaM6blPgn4D6ucqMLKY+JQRP/u9U1Evx+DsGx/
         IX+qIa1J75Zuish5l7KfboygnqRwnBrnocZhOh36dKTrzBqfIyO06d0Aj7XYcfRAHmF4
         NN7YbGKD1ALqQnFtYzxsjl5dZoJVws69DT0L1chZk4JSEA0YMa6AnS1m8qmgDi47cdNv
         sFffCzlgj/sDCmbEdeDhbimnqi8qYswsY4RKvo3/9NlxWmwoMuqbd9uOSQqZQAyDFfgw
         Zqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=srNxbA3NpIvQDeUb2zPSLU/1CPoNJCsH52Qj1X09dug=;
        b=b/q2ENIOg3gNDAyOPOtJnlRISjCwfakItrqmSS5wQ/JYFC+0+J9iKoWcL0g422b/zB
         j64KTBijErSy+vBjGLmJugkBZC0Dhl7ejqi30v6v1aTi1KsxFZiTre1hZ0DTw6hA4rvz
         pQfy6kev7N4giVFRQu/m5hKJpA8HTGsns44nZU6gvoX8Gz/UM/Wfm4NuIhlM8/CRUqBw
         LD1xkAjm98/+kHeTEan8ieQ/R15Lf6nZSpjY7aewWbenXV1K6Pjy25R/G7ZTB9fAghTa
         MRTE33e4uLIfga020qsM0oF1qns9dLGTU2y/8ZBcW2y/PNGxXdK4DizzgCkpPGeJCPNS
         JtMg==
X-Gm-Message-State: AOAM531MLQAs6BxpXjZe6MdweE+69d8tdDfV7+i3KEDIJjKr/l86be4Z
	tQ55ZfewRw5Dwpl/p19foHjWZlBsIZbLiQ==
X-Google-Smtp-Source: 
 ABdhPJzbADuo5ILFLHnZlXJLke+SWGLnjghwnxuomDZclMKm1PKHuEY+QaTk3uUEhVCFFRR32HN2Ww==
X-Received: by 2002:a17:902:7882:b0:14a:fd51:3b5f with SMTP id
 q2-20020a170902788200b0014afd513b5fmr5187376pll.98.1642793734163;
        Fri, 21 Jan 2022 11:35:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 z21sm7797541pfe.108.2022.01.21.11.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 11:35:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] gtkmm3: Add missing dependency on gdk-pixbuf-native
Date: Fri, 21 Jan 2022 11:35:31 -0800
Message-Id: <20220121193531.66642-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 19:35:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94977

Fixes
../gtkmm-3.24.5/demos/gtk-demo/demo.gresource.xml: to-pixdata preprocessing requested, but GDK_PIXBUF_PIXDATA is not set, and gdk-pixbuf-pixdata is not in PATH

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb
index 428ec69d76..a8c7713645 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "glib-2.0-native atkmm pangomm glibmm gtk+3 cairomm"
+DEPENDS = "glib-2.0-native atkmm pangomm glibmm gtk+3 cairomm gdk-pixbuf-native"
 
 BPN = "gtkmm"
 
-- 
2.34.1


