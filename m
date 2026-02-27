Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09229FEFB67
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 15:43:53 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98913.1772207030423729499
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 07:43:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KnP4K2Qr;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4807068eacbso18134025e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 07:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1772207028; x=1772811828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xy7BJs/nSszuTKEd1YJKZRNp9aObdj+fJgkKosGyIM=;
        b=KnP4K2Qrf/99HIQURGOkseRQLOJBJMQLx3qm84fYJ4Fse7kht+li5x4a+sZeAQ80ns
         j2bbqhb5XyLIv9ijBtMFZWo1UH3cgsD7LuwKxXPLnvrwRgchQBfFWLj5haLMxb5U5tn6
         D6LKQzgm1/X1BRnBNjjanV6SzuWwJBFuqvalE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772207028; x=1772811828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+xy7BJs/nSszuTKEd1YJKZRNp9aObdj+fJgkKosGyIM=;
        b=bXFYF+FkJi2ONQtCIzwxsz8r2OMJ6qjhLxbx/0zxWFlhwDEBD0FK7J9zG5GvKhdHRP
         +v3Qcaj701HVJ6IEz0nCkBaVtG5BcRm0FSo5tlDnWfmvgmM+iY4OpjTS1MCQdHYeJVcg
         Lz7cn8NSdxsIbZDFP+kWB/FcUp8kaY6JB2SU/cJyft7YJ0xmM/neqUfrPB1r1ge3py+6
         oglOhIykXEyGpKjWklLNsSYVEWPWsJ4K843h5sev6hmX1icOh3VCWr+bQoCBIcw5eTU9
         Mf7hUu3Qr0hEYvj3s+XJOzGomPp8O+cYBgZ/sCl7jWVLpi7SZa7VkbSK6jwWSiiRVAmd
         yj8A==
X-Gm-Message-State: AOJu0YwIQtrPfreA/iErKg68RaP/NUrg4YmZvgGQlIj0qV5eyP5STzj6
	uaMvpxaqWZawd08Zf+X9vAJpHZLXZU8kebGHJTYHiYvvX7jPgnQ8JpxfhTLWLkeafNJ1FDHHnzT
	W7oyt
X-Gm-Gg: ATEYQzw4bkT7h+Z3aciZQyxNMVfcEFX5+IvBw99A2Lu2g3GvJusLfVaJdkvfj5Qfy/W
	uj6wOZ/wK8kr0nd69lntBmxMwfkdSVXaIHxEwwko3aGsAq6UUHjPjd/lRJTx153+25MKY8eQJ2r
	vVS7+InqwRxYaCAFeiv0kVNumEug3HXG9VCF+TJfmmOopjPPDzRfH/0dqrrZp01QdGzfCAnoL6F
	QoD4g8g9IScJSIw534yMukwXu5abgA02qNeacfuPDW+0etxZjCRjF10ku0GxfoWKeAain2nIrg5
	90OMrUIo9PfUNmR8u+/SmFeYEqz9w+yTHJw+biNmTpbSLrvdN1iOxErTUU8Ew7A/G7mE0WGIaWi
	r/FCCL+/BbtNXJJA+Xd8aTz6Iec1fmsS8KmhCFFp8f2lSuaZdcoYeuCMdJa4sMXr9N+sA83Oe6J
	IDq1WfQDkSLZb7//kiT8Ii7UaoUYFsKDGs0G3Y
X-Received: by 2002:a05:600c:c059:20b0:483:709e:f239 with SMTP id 5b1f17b1804b1-483c9beacf1mr38641145e9.22.1772207028431;
        Fri, 27 Feb 2026 07:43:48 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df9fsm245845115e9.13.2026.02.27.07.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:43:47 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-bandit: Upgrade 1.9.3 -> 1.9.4
Date: Fri, 27 Feb 2026 17:43:41 +0200
Message-ID: <20260227154343.3923152-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227154343.3923152-1-leon.anavi@konsulko.com>
References: <20260227154343.3923152-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 15:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124764

Upgrade to release 1.9.4:

- chore: fixed some typos in comments
- Fix B613 crash when reading from stdin
- Include filename in nosec 'no failed test' warning
- Fix B615 false positive when revision is set via variable
- Lower version guard in check_ast_node to Python 3.12
- Fix B106 reporting wrong line number on multiline function calls

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-bandit_1.9.3.bb => python3-bandit_1.9.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.9.3.bb => python3-bandit_1.9.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.9.3.bb b/meta-python/recipes-devtools/python/python3-bandit_1.9.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-bandit_1.9.3.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.9.4.bb
index 18387a6e74..d8e6f9da87 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.9.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.9.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "ade4b9b7786f89ef6fc7344a52b34558caec5da74cb90373aed01de88472f774"
+SRC_URI[sha256sum] = "b589e5de2afe70bd4d53fa0c1da6199f4085af666fde00e8a034f152a52cd628"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.47.3


