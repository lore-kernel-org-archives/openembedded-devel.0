Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC318D33A4B
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.27867.1730831926343824507
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IkF5QYdT;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ea5f68e17aso57239797b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831925; x=1731436725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41nSHwsXwKbvr9UQnzgHWoMzchbG6WV6zZkknrpJCw4=;
        b=IkF5QYdTL4We4gSc8+WMpYPnlCshhtzgoGg8TmFpGf9VLYCbpXfW9gnG4nVvO1LeEo
         nVzV7JpU5NpGjSb7g+OolIMfrkNZR2cGYZS9cnCOjVPuoNw4wEDzXtl0zB5U/SST4Kh0
         8RrNst7eiyQC+RHb1BIY3GBZHJtpdPemw5wG+W7TNdCg8lYG7KWa7SLX78wVhwOEvm1v
         mj07ilC/Bka2BiGhaff0sov7QMap0HOPydZZBCjjjR//D0JjOCi8OMJBFn/JOkRS3EYg
         iQ26WuzvMkqLsxclIfIqnH8Ad8Uud3WflYhhd82sSagJX23otWw9s++KxqdeuGSqq5T4
         nmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831925; x=1731436725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41nSHwsXwKbvr9UQnzgHWoMzchbG6WV6zZkknrpJCw4=;
        b=MCjnhXYjj2UCeeODXSe0ZyA/Wdd/R5XV2puIiInOdijHRhhxxvgGmLHZ9yQ4Y5Od8H
         DGCThbgieUv9xK2RNhzrRBc6EGVIooFwMZqnOxpHu0OCgUU0u2poilslLhDfCI+kA1Ht
         t/2s05/ctccpFpP3WmtekPo2QfmKaC44/9CHGvx+UDs/8acuaYvX32R9OaHcrxNkaez9
         3FDdGMgV9q49EPYSVp789Evkrdy/EpavrUe6vAcovIkZW/qBf0K5ocJaZTRy7Jm3eb6M
         1Evm8KPiUczJVCN+C5nxQa6ygeH4o43nKfskQFK96oZiJCsCFNWC0wj2NeKEHlhqdIFB
         Df1w==
X-Gm-Message-State: AOJu0YwX3t7Tf/taAniLUy0eX7wSr5eTki9RBqioMDfIpmP6mfBly94c
	kEfo2xVr+Spd6yepI1S5JhPczBoH7kEnTtzRh1fqqk+RtOoEa+zam875wpd0
X-Google-Smtp-Source: AGHT+IHK3QJsjSiPu0ppamwnXbqgsYicJ+jyFyCVbDYnEG8Nn8u6YYAR6v6XhcVkY6yfPW7at0uCiQ==
X-Received: by 2002:a05:690c:6c08:b0:6e3:fd6:6ccb with SMTP id 00721157ae682-6e9d8932b09mr390927327b3.13.1730831925096;
        Tue, 05 Nov 2024 10:38:45 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:44 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 057/161] sblim-sfcc: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:33 -0500
Message-ID: <20241105183658.34982-59-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113572

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
index 4eb1c2f25..4aa3668e2 100644
--- a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
+++ b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
@@ -8,7 +8,6 @@ SRC_URI = "http://netcologne.dl.sourceforge.net/project/sblim/${BPN}/${BPN}-${PV
            file://0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch \
            "
 
-SRC_URI[md5sum] = "0bac0dec19f17ec065b6c332a56d7bae"
 SRC_URI[sha256sum] = "1b8f187583bc6c6b0a63aae0165ca37892a2a3bd4bb0682cd76b56268b42c3d6"
 
 UPSTREAM_CHECK_URI="https://sourceforge.net/projects/sblim/files/sblim-sfcc/"
-- 
2.43.0


