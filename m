Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7890C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 04:23:19 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.4531.1737692596238647631
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 20:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kRG0RsbX;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21634338cfdso37291285ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 20:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737692595; x=1738297395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Gk4az6T4c9wlKFzGEsF8C1FGb5M0yGUkV92Zhu5Y9o=;
        b=kRG0RsbXy60wVXmmdwCD4bcxSARmlJTXsj7+JqlOXz8Z1/3WNP9vlIJas8pR74pdzG
         EpxWQXAAxTy+hFgxMnm9xksUpQ0jxaZklcrav0ZRUn9+wteXx7Py4wRN3d05svQ9Aeas
         Oqwl59sXG3TR4c6sxgX+fNXAAp9xb9uvLWBUz2PXJPdv/TjmWOT4qbYk4MHaad7h7xWc
         grPQHiuRxjLClcvNEg3ZwEcl9I6fl+79nYebqXgcEUtZi4xwFUOkT4Vf9PF1Xr/wD6hV
         mt2ht7uvbGwA96jdf32nMxQNNF9qNbKc8PtXLwfFGDuITewAWZn8BqAj376pk792RycP
         Qmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737692595; x=1738297395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Gk4az6T4c9wlKFzGEsF8C1FGb5M0yGUkV92Zhu5Y9o=;
        b=ZU/wveqr3So6ROVJz/RQczLI+v93P6k0B+uLgbmYwQlaZg88I+kekSox598A75uECV
         RtgsmqAinTUKmaxo0khlkhFLhx4Sg+mrEKaSz8rgLp4FzJsQZ4b3JdWWR/WYO7JF5vfP
         aR6sOFetnXxnUNYt8RBpFveZrjiDIY3qY8bH19wR7gdT6j51p3t/atJuUiv7KA4L87R6
         wYjg2TxPsl3bHd30IRUz/BmF1nXJxqzYStwGu6fCM7y4b3/1X806Dmovyapei19HNv3t
         mkdUnfj0EF9RaHZ2nM+/R2otu+a7X0QJBowL8CbLBz66TWfIyg0fUeq1Iw+Co+FJOYW3
         v8vQ==
X-Gm-Message-State: AOJu0YwMwAcqOSdtNal0xuwP8jVWamLaeWuWJoVp1AOszyek/nSYIY95
	zYsh2u/WIdgwjONjV9YziwpeJSKIP4XHoKvOnX2NdXrev1c4APMgQLJoa88E
X-Gm-Gg: ASbGncunCZfUJalDRggNqgD7LRmebgfOiBxMuxQUrKb+OBNfCVW0q2eT52RSAD9vp6t
	KvO9hQ8mR02pHSc+jPGVAHkXraJyRQDWWzE+O0jbyE001s34IGveBFiM+FI/W6nvEX9MAuQsazZ
	32nSb4VD4OUaiK9c22ZDgMJXGWU+WUX2mYk1hqTvmd7NAlWzHnRCY2nx6GXTefrPKRR9104HpWY
	IsV7OCHnSxuE2Tex2mGsX1E0kNQb/YcjKzf7x80517lc51ojU0dotQwSmZEG2hPqjRho2LF
X-Google-Smtp-Source: AGHT+IEVnRxfwUQ+KJrWTZGcmeJqHhHiFO9pWjAfJOqo4ArNJCIRGCP0xc2YBOVbzf9yzxhGvEgCHw==
X-Received: by 2002:a17:903:2d0:b0:212:996:353a with SMTP id d9443c01a7336-21c355750fbmr460406985ad.12.1737692595281;
        Thu, 23 Jan 2025 20:23:15 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::d2e2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414d927sm6830045ad.173.2025.01.23.20.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 20:23:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-portion: Fix test_doc.py ptest
Date: Thu, 23 Jan 2025 20:23:11 -0800
Message-ID: <20250124042311.567886-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 04:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115049

Add README.md into ptest package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python3-portion_2.6.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.6.0.bb b/meta-python/recipes-devtools/python/python3-portion_2.6.0.bb
index 8bdbc032cf..2c2e67579e 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.6.0.bb
@@ -14,8 +14,8 @@ RDEPENDS:${PN} += "\
 "
 
 do_install_ptest:append () {
-	# This file tests README.md and deleted as redundant.
-	rm -f ${D}/tests/test_doc.py
+	# test_doc.py tests README.md.
+	install -Dm 0644 ${S}/README.md ${D}${PTEST_PATH}/README.md
 }
 
 BBCLASSEXTEND = "native"

