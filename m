Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216D6C6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 20:39:14 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.113720.1680640746560114795
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Apr 2023 13:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mTJgK9Ld;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so35209177pjt.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 13:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680640746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ec9KtFpIDElQFwiz4kWlCqRY6jHw63311KCu9KD+Sic=;
        b=mTJgK9LdfcWqf/xuRCVKWCwea71+GJax5UOMtr2Kq6ltW8RwlOrANz8sRTUcWFy4Nr
         oQ0ysxoHdcxFlAyAWde7MNG2evF01WKq+mdEZ3dFgZM/qXDiZDzve+rhAs3ob+L9MxEq
         RSrhmDIygOAslIXQbdsZfnCyz6jpO8qvU7JOJhBzY/UleJA+uoLZgAlZyqywrzlHFFVs
         J1h3z4hjFTgDBH77PLmZZr4yF1m1ALL4Sxptpsfn2Z2Oenrqi43+8QDvtdsmdZuHWB0i
         ZTXY+9vQuo0A5Zk61cBDWvGhs+2jlBczfeNx++ph1u/5ZxEL9Bu3FlocAFsMz7yG3CE4
         li2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680640746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ec9KtFpIDElQFwiz4kWlCqRY6jHw63311KCu9KD+Sic=;
        b=rDP6T1tQhU2xlNIDUfFoAHUQGZqWouU902DNDggrWYBy1hHBeCssme1Y4Z8VQEofcP
         LpP7G7m/hKFW1vY8HpPtVDHWv0CrwmjKBgoZSHxUrnYvUMW6cehVJhdmV3jyD9Y+W5jW
         CJGFYCI6iFKyaqfP2qySIvVzsL7sPrE/DpCmsBTxzmq9AkvygvAh1ANUKsVe8k5VcC/k
         zJ/7/UG5p4sziAwtodIvtDJNp3v9YDsVbwBuV4EjEeNkBNTygTJ+NVSbCouiZhSNBz2l
         jkaTXC9S7iR/lQUhGTQ6mJ4YOF2g1mdnMbzol5Yof31fzYf0s1/RJwvxuCmp9HJo1CEP
         Lqbg==
X-Gm-Message-State: AAQBX9ch3hLucD+COrZRt8C0EP5gB2yWRuakKUuMCGkrOvIdueoVKStT
	RDhqezwDe/7kbSWuOZZMNh7bEyX6KUPyIQ==
X-Google-Smtp-Source: AKy350Yj6RCRL/eo61o0sboYwk0C9NKgbFW1yvJ5X5njfAdep/4fbR/ZWklJqggPjO8vVeZ8ZwbnDw==
X-Received: by 2002:a17:90b:3b85:b0:23d:158c:a60c with SMTP id pc5-20020a17090b3b8500b0023d158ca60cmr4109685pjb.44.1680640745698;
        Tue, 04 Apr 2023 13:39:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id p17-20020a17090ad31100b0023f8e3702c3sm11742772pju.30.2023.04.04.13.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 13:39:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ptest-packagelists-meta-oe: Remove minicoredumper from PTESTS_FAST_META_OE on musl
Date: Tue,  4 Apr 2023 13:39:03 -0700
Message-Id: <20230404203903.3204544-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 20:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101951

minicoredumper is not buildable on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index e8898ce781..590e0e6e9e 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -36,6 +36,7 @@ PTESTS_FAST_META_OE = "\
     xmlsec1 \
     zeromq \
 "
+PTESTS_FAST_META_OE:remove:libc-musl = "minicoredumper"
 
 PTESTS_SLOW_META_OE = "\
     fftw \
-- 
2.40.0


