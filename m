Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65394EE021D
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 15:49:13 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66703.1767109746275160382
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 07:49:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hGe+vKzs;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso40898515e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 07:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767109745; x=1767714545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3VWzdGescdwuULwUpE2kMJj2Hg/M8T8dmmcgcZ9g3t8=;
        b=hGe+vKzsA55GwEEehohdm++F1xIW2MYspa2BGv4H4ML+FGFGrJknl8WHsaQioPpdvS
         JDbSSV3UhM3AYu0LS/4sgLy94WiweIt0A1qWHuEqVR9OBAcmKOWF22etlcTc3UoljbfM
         g/3ki0YhGC6ywIiSTUM+Rn9DVfhdCXeB/pUqOUm6oSc5rg3PGklXeUyi2tmq7Rc5RWiA
         UqnxOfWknsalAseEqc9IM2o6xTNPr0sO+LGsDwmz8miu+vTO4cgHO6i9Ke+5HEqAyUP/
         t0ROIupzLnhkpvUMD+rC9GLQJeqzNQHfWfINIe6Hfn0lxOVFW8W2qsOyBzovBv6GKYeL
         FEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767109745; x=1767714545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VWzdGescdwuULwUpE2kMJj2Hg/M8T8dmmcgcZ9g3t8=;
        b=Y2Ce1RKM7XtlRoQqbz6cAfFQHqzjHFqlb5/l6o/b2ZiTnHetHwNksIpUDvpAKHgnyc
         WkEPMAPw9TqcP5KyQEMT9SVbb+63etAuT7UP+RM89pCiBemBrMurC/TUJ8kDiobbGgGx
         0lY3gtni/FnKlQ4HC5//n5ZUHi32f7aYk0RBrUKXmB82NHjKdSNiPeLT895WM+fNOv/W
         GEnnrVCHinBfoy4GtR46vGPJPB1WMTN4viTqHjZoGjpRl9uHGNcOoioMTVmu0AsrcN2a
         ZzUmcujmICwK1Hp9B2txaHJF0DA6zrRqqM8wSAyKRKFRuUSftQJh8Y3MsS9LNQX/Vi0I
         qb9Q==
X-Gm-Message-State: AOJu0Yza/XVtO/k9BUwepKBfXi7AoWA+LCj5L7DJnoYD57oMjkD0AAAn
	kLat0lD1hATajl4Gq+a+hszlh0pkbWQudnLNIVv1zAAyejwI+amCzUcnZHhwrA==
X-Gm-Gg: AY/fxX5jr3JKAfrKw3HoyUM+HdeJp6wcaRF9PZ1kksxRh5kBO7n7ParKuwYaYw+AUXv
	rb4qNKHAkXpzyadWh1FzDe3QtXIU3Oyy8y5Z8J4KhusdDIA4W8IjqRRGkG923IsFCIIiQZ5tZYq
	1LVRB1bB+c9U3bIdSGZJ5OFxjVRFN1G6w+hRe7JE9MV9W8P7oZO8EMur10vt967DTP02jWBayOU
	lSBzESUmKHp6oEglcQjhjGCNSztLBVW4Lrw5u7NcbZWsshegn3JNB4XxZiU4iROZpjUAQXTx7gj
	lMhb8/oiv926xUndTD+mYcOCx5UdyubM0pjttxQJX5G3t0HSMgWPZQ8tYJHdER6WwTnc9UkZpJr
	cxr1AIM8ECxU6iVCTc8tYzH8ixvfWch524Gm4py5UhlHcJELbL6BjRuMvlvR1lwbuE6WQZ8Cv6D
	tbEhh8zKGjtYoNWSuA784=
X-Google-Smtp-Source: AGHT+IG9ReqaetbguV3ey7u4UJgqcOlFaeHSWYN2RCcakCoamHdXYQguLkSQAoPmAs1+vklPp6sVCA==
X-Received: by 2002:a05:600c:3b1f:b0:477:bb0:751b with SMTP id 5b1f17b1804b1-47d20423ca4mr384405275e9.27.1767109744439;
        Tue, 30 Dec 2025 07:49:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a210e7sm253051225e9.3.2025.12.30.07.49.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:49:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 01/10] python-gunicorn: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 16:48:54 +0100
Message-ID: <20251230154903.736590-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 15:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123027

There is only one relevant CVE associated with this recipe in the CVE db,
but it is tracked using gunicorn:gunicorn CPE instead of python:gunicorn
(which is the default CPE from pypi.bbclass)

See CVE db query:
sqlite> select * from products where PRODUCT like '%gunicorn%';
CVE-2018-1000164|gunicorn|gunicorn|19.4.5|=||

Set CVE_PRODUCT so that it matches relevant CVEs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb
index 3c819a934d..a3524d6d8e 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "f014447a0101dc57e294f6c18ca6b40227a4c90e9bdb586042628030cb
 
 inherit pypi python_setuptools_build_meta ptest
 
+CVE_PRODUCT = "gunicorn"
+
 SRC_URI += " \
 	file://run-ptest \
 "

