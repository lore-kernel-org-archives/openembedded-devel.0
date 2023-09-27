Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36329E7E62A
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 04:02:45 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.10390.1695787360123563159
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 21:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: straka.derek@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-65af1037ca8so40566556d6.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 21:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695787358; x=1696392158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdItlQ1UEJJ2LcLXRwq9IvdzAQYoTC7N4u9ynlE6yjQ=;
        b=o13cJs3ziBg9N7TKSkAqNTLq1Ji4HQt4HcGewyTnE8jP8iMig4iRVQ3Ugcb6OsYqi9
         YgMxavcG//+GDfE4fpQ3IzJIwVG+lJko0Lv5r3pdugq8sSDrBp/hWdh9UZleOMMDjnus
         kY31Tw1endYi8JAjpzCp0ZZlxjYkaaH3WG2/SBxO/lhYob6InOOJhtAvEvCUEOFVu28z
         CBlg8F4CG5bzQzsHPv2ewOwRrgBRSSKl+52WBiqOpi5Abr2QLbkFcIHbEr21CV8gIMUz
         I11C60FXGoEBExxQcmwLOi1heWDtdm1jaMLegZyFt4Hir8rqUfqLAsN0KQf9TXht20TR
         SdSQ==
X-Gm-Message-State: AOJu0Yz5JWyZyas68vbhR/lxmsfU5ZvUeXAwBbUtxwH4Hghtgdp2BGv4
	OF4OFzYIKDJLpqY3vtTD45TpYfADbMe0yQ==
X-Google-Smtp-Source: AGHT+IGzQMsLqsQlsNydW3dnG9af+aS1El8UxzFmK62rvtiXXKF5TW/WeF8PBkOUdRS8HcT57Ky5DQ==
X-Received: by 2002:a05:6214:14e8:b0:65d:c:320 with SMTP id k8-20020a05621414e800b0065d000c0320mr155406qvw.2.1695787358504;
        Tue, 26 Sep 2023 21:02:38 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id i11-20020a0cab4b000000b00655e4f57732sm3120179qvb.35.2023.09.26.21.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 21:02:38 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 1/2] python3-pymysql: Fix upstream check by specifying the UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX
Date: Wed, 27 Sep 2023 04:02:22 +0000
Message-Id: <20230927040223.1628803-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 04:02:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105155

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python3-pymysql_1.0.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pymysql_1.0.2.bb b/meta-python/recipes-devtools/python/python3-pymysql_1.0.2.bb
index 1f6fbd3bb..062d7e7ea 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymysql_1.0.2.bb
@@ -13,4 +13,7 @@ SRC_URI[sha256sum] = "816927a350f38d56072aeca5dfb10221fe1dc653745853d30a216637f5
 PYPI_PACKAGE = "PyMySQL"
 inherit pypi setuptools3
 
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pymysql/"
+UPSTREAM_CHECK_REGEX = "/pymysql/(?P<pver>(\d+[\.\-_]*)+)"
+
 RDEPENDS:${PN} += "${PYTHON_PN}-cryptography"
-- 
2.34.1


