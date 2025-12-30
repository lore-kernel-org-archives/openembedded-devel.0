Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC04EE020D
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:29:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65113.1767104948525638835
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:29:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZrWeB5jB;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so100100275e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767104947; x=1767709747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUZ+lVtLlijuCblpox857TPbGXLw0Nk4+6nSB8VlYt8=;
        b=ZrWeB5jBWUKbHpq97d7239FvJcAuz15qxaIVK75Uh4vA7uIcdQ2Mo7dAjAVtC2a8Na
         HLl4S62zk4gtKcToKNwuxYBQSL9hJSm8GdGzIuYZDMcyn2Z9oan6g6rD/NZyeOexh1Up
         +XoA6LJMZ+AoQxCKVZ7+UdPdkhiHMx5jcQ9CTo6DBAJLzsuswscmWlsFbIIBSHzQpbvO
         hJ/TcCCxAAudHjL41qO7JO1JyVjWMW3q1tjEhgQz5maR6/i2IpQa8SWWOUO0AKEDQ91K
         c3O7WFx8crmxiJrVEo2mkf4fq01iJdZBopxM9JiQdW6DClvnupOd4c/tCJJ0e+0oEzW3
         ohyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767104947; x=1767709747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dUZ+lVtLlijuCblpox857TPbGXLw0Nk4+6nSB8VlYt8=;
        b=McDnGZL3E8aU09MVFBj004z2lNiGvMT8LA+GlDD7skZJXdTeFPA0rwh3b5nbgfaskD
         MWzTHFhqWJM6jyOPZGloXvNIAbxPw/aK6qM06PsplH85KJRGc3lG1dckGcS81PT53w8j
         /1xyBMdSysAZQ4SOWXZf4lKEX2mU8isbvbnXjLm6xScCrbaVXXCiX2KhYfUNhrnJaRUn
         b1Yxgj7lysTHvhsl7+t2p/53HG3FbFTlSjvHXIgfWbDo/iPKXXysuz1wZiKvBYj+mDCo
         KPcZV/tSHkA5wmfmRAMABQHhUAC8SdU8lKIyoSJb+YaeJ4XP33pBPxd4KVEaeYRjFdDY
         rpJQ==
X-Gm-Message-State: AOJu0YzNfVlm/4uqO1w1Kc+2BV9hGJqaPKQcqHjcGIzRfXsXH/Ey2eCU
	ruHTzdPnRyl+Cnek+2buwelZmaojzwVlvZm7tlh1EPT++S0WBsLaERIUf/Va5Q==
X-Gm-Gg: AY/fxX4izaYzT5ffq6oxge88EWMgSnG9wixGgrPdAEA5/+7NnzSAxestFgR0BnEfBX9
	eBcgEjjpcbj9A3cVh9ODw4MGjU4hA7k/OKZR9fpPJedmzloiI++OzvZP75rLD0T1TkUMPW1JfVj
	97oNGoCyl4/XtSLSrL0wfisyJRQPYTdFxq/AQAKuttZR9E/QbnkpuWrBZ6OIKwnWknW9lRKqFhU
	2lmCo1E+nu/+yndP7UgbsiwwjlroG6AIo1w64+DP3ikm92rNlxFNMQCnXChN9HkgKKuX1TGMAVA
	4DgOOSbXN0wLQYXQGLTBKQJv46Mv38aPrx9wWaxRPNb77xUeceuerQkFzV4QWugnwMd302K+6mF
	XMfDQYOjBSe1L7mFdOt1lH56/8K9bJGdJN1/zZAiFL6txq6JSGkMKLmxH6MZUSWfNOURKxOAl4u
	hGH6Cg7PXt
X-Google-Smtp-Source: AGHT+IG7DzgYtZifWPu4wrpVvT78bYGSc/guZ7w1ZHHrJLvNoXL5uTzBzXyNyCvxnAHE/q3d3Zfbng==
X-Received: by 2002:a05:600c:4fce:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-47d194c659emr368372795e9.0.1767104946839;
        Tue, 30 Dec 2025 06:29:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm653345045e9.6.2025.12.30.06.29.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:29:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 05/10] python3-ipython: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 15:28:57 +0100
Message-ID: <20251230142902.730667-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230142902.730667-1-skandigraun@gmail.com>
References: <20251230142902.730667-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 14:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123021

ipython CVEs are tracked using ipython:ipython CPE, so the default
python:ipython CVE_PRODUCT doesn't match relevant CPEs.

See CVE db query:

sqlite> select * from products where PRODUCT like 'ipython';
CVE-2015-4706|ipython|ipython|3.0.0|=||
CVE-2015-4706|ipython|ipython|3.1.0|=||
CVE-2015-4707|ipython|ipython|||3.2.0|<
CVE-2015-5607|ipython|ipython|2.0.0|=||
CVE-2015-5607|ipython|ipython|2.1.0|=||
CVE-2015-5607|ipython|ipython|2.2.0|=||
CVE-2015-5607|ipython|ipython|2.3.0|=||
CVE-2015-5607|ipython|ipython|2.3.1|=||
CVE-2015-5607|ipython|ipython|2.4.0|=||
CVE-2015-5607|ipython|ipython|2.4.1|=||
CVE-2015-5607|ipython|ipython|3.0.0|=||
CVE-2015-5607|ipython|ipython|3.1.0|=||
CVE-2015-5607|ipython|ipython|3.2.0|=||
CVE-2015-5607|ipython|ipython|3.2.1|=||
CVE-2015-5607|ipython|ipython|3.2.2|=||
CVE-2015-5607|ipython|ipython|3.2.3|=||
CVE-2022-21699|ipython|ipython|||5.10.0|<=
CVE-2022-21699|ipython|ipython|6.0.0|>=|7.16.3|<
CVE-2022-21699|ipython|ipython|7.17.0|>=|7.31.1|<
CVE-2022-21699|ipython|ipython|8.0.0|>=|8.0.1|<
CVE-2023-24816|ipython|ipython|||8.10.0|<

Set the CVE_PRODUCT accordingly to match the relevant entries.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ipython_9.8.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.8.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.8.0.bb
index 322ad36d5d..de0351175f 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.8.0.bb
@@ -24,3 +24,5 @@ RDEPENDS:${PN} = "\
 "
 
 inherit python_setuptools_build_meta pypi
+
+CVE_PRODUCT = "ipython"

