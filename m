Return-Path: <kelefa.sane@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84427C369D1
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 14:46:37 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.10624.1745419588925874888
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Apr 2025 07:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=grtLxjpV;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: kelefa.sane@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-391342fc0b5so5394698f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 07:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1745419587; x=1746024387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oh+AdI648kn21nqsFCzNQ2bS+IhzOPMCDb0qlgQ5BSs=;
        b=grtLxjpVd2aHiHQ2FdiCdswdfvbdfZXXWV2VpIxuvPS7G7qe+13NaAfOmynitLp6xj
         F7rUrB4XY7wQOGVExKyFtgbS5LMbJdkHPzmWLHdpJgEGV5gglhUCX5CLO/9ePju3xCK5
         SQFj0EwpsSNc4LX3kTQCAy6azbF09Bpk5aokE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745419587; x=1746024387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oh+AdI648kn21nqsFCzNQ2bS+IhzOPMCDb0qlgQ5BSs=;
        b=ND52ibDSIAOpoT1o3MVczqzHCvOrzIwNcgv2D3b8RCnqOt3beHqeAYpzbIGr5LFPcP
         eqFGRrqn7yWwis9XLWVhALbj2mctGfwS6ZHZx5sLtSB64OhFXxKqYsf1eRtJGjOlskkH
         2srcQ9o5Tnbm63skXGzmOBuffdScs1zhOMF2ETjAjjduoQCVyQAkos6jKg1HBnMX8ydc
         5rXMIhfiZE1xgX/oFe5gueu2GvjkYbvaCPVQErckKJBzJ4mbDQg5TeDfrIXMcs/D/uzE
         mP3n4EX9gj7E2xzqQEc3pNAqdXYTJj9EQO52Oo4uexYGh6YqeQdYPA/7F8Njsy/xHQCb
         kDMg==
X-Gm-Message-State: AOJu0Ywe2aEu5jQqxgH1A8uAJuMJFPCbaInKLAIdnqe5u+gCUPQBx/+F
	QPPnjiQoLe3iijWerH5kL3cxwxgHSBUJuzYu0hMHkVxZRTvZVtJAJYFuvmmHwLHJixOJyLRZY6l
	8
X-Gm-Gg: ASbGnctMm3AIzUZwlbOJbAEspDupXjca+LBoA7nS789R+sRrTEm8leO45dbi4MsyPFa
	6oE38X1SE26XoALvkEDe+YT3DgaOKxWKeg7K1kdGU9xPFcvqk+YMTBej8xCTBLhfSKvNXHcpyhu
	pf/ArdkK8ZZzWI+NZ9KFHUED+Gs8yamK0tBV6ycgG8MLKQAcuSnQYnS8lTP2gc0ZuN+ygCTSxXH
	XyG6lULJKPXi4gXSz03h+TYUcNxTZs5bOszoHOtjmF8EFFVucyzFpmPlF9LhnJplip+GORr+nrH
	wi//A8h6eu7Doh3QTd7V4d3dc0MbchqJlL1gDDk77BkpamE0TZpFJbiQbLlz1jCWvqD+Ou3rNzD
	gOorE7Xn4/yCN0UjWIW3w2Bt8F8tSU/tLBGWEFWeCpe4=
X-Google-Smtp-Source: AGHT+IGACVzKcc/CWqn8ebiPa0Lg4jyb8Fod1LXSVkdTcvNC407dhTGnKhjoFcgaT1sQHm30IbxNrA==
X-Received: by 2002:a05:6000:402b:b0:39c:e0e:bb46 with SMTP id ffacd0b85a97d-39efba383d1mr15175622f8f.4.1745419586899;
        Wed, 23 Apr 2025 07:46:26 -0700 (PDT)
Received: from FRSMI24-OUB.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207c5sm18764249f8f.6.2025.04.23.07.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 07:46:26 -0700 (PDT)
From: kelefa.sane@smile.fr
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?K=C3=A9l=C3=A9fa=20San=C3=A9?= <kelefa.sane@smile.fr>
Subject: [meta-oe][PATCH] reproducilibility: remove cjson-ptest package from non reproducible list
Date: Wed, 23 Apr 2025 16:45:45 +0200
Message-ID: <20250423144546.1737495-1-kelefa.sane@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 14:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117081

From: Kéléfa Sané <kelefa.sane@smile.fr>

The reproducibility issue has been fixed by the commit "cjson: fix
buildpath warnings (0cc731540808d848c03c2e345c36904b83529266)"
which replace the build path present in files:
- CTestTestfile.cmake
- tests/CTestTestfile.cmake
- fuzzing/CTestTestfile.cmake

by PTEST_PATH (/usr/lib/cjson/ptest).

Signed-off-by: Kéléfa Sané <kelefa.sane@smile.fr>
---
 meta-oe/conf/include/non-repro-meta-oe.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/non-repro-meta-oe.inc
index b8b5adf45..ba0874941 100755
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc
@@ -4,7 +4,6 @@ KNOWN_NON_REPRO_META_OE = " \
     asio-dbg \
     asio-ptest \
     asio-src \
-    cjson-ptest \
     cpuid-doc \
     crash \
     crash-dbg \

