Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA62CF9C71
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:24:43 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.8982.1727245474671484522
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WpNSVZZu;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3e2886ea751so1237926b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 23:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727245474; x=1727850274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tq8cAmdhAkj3RO5I4s1X2SSfPOd/edvwvUbSaoMp7io=;
        b=WpNSVZZuS6RYqsYDFIUldr56vORnih5TILiMiWvhem4ouCFa+9/Qc/3xINPrNZsYuJ
         I23e1huykJJYClQCaWdPLIc0717OJyaOSQeevQUNGRcHR6IxQ60u5+9ZzLbMIvKmgfwM
         9wBMc5DP+Ew/zNIQPwyzucvjOvqI3kkbc98l6DBuIZ9X9vaFjhS/YyPfwtsDNYIbMoO3
         h4Y1Rq70If8PdcCb5VNFOpMgvbBAfhUYXYlN4y/JBojUbW4//DJAg141Qds/TDDxnB2b
         udhpk9/8xHdNg4shF91s5vveeVyH/edpPQQs9mOXMhotFFgdBvu6ftFGMrj/Peme24Qe
         7iGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727245474; x=1727850274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tq8cAmdhAkj3RO5I4s1X2SSfPOd/edvwvUbSaoMp7io=;
        b=WO5O58xd7ne57so4ROWms7eUaTJbc/jQVPg/x7g1VXb5URDNB4gX0rXRyxzYEPZMv2
         h9/jefz5MWoGvLRIleXKvp1tKwy3y/6xJZ0rWGXyGoOnxby4CCnxNwzj0BV2kHpAhe0i
         qNnYI8azWW8Pd6q8wIE+3A7evcMnNyWtz0XEgZOf3nscouiZWWxq9RRpBi7Ro6KHuGuI
         WjhwpVY7vLQ29N+46xMCq6wjq3eAlrhDw83C8LIFg71oFA3ThL6FvGPqjnKgEG8HpH0s
         G7ipPHokrmT7g2279fBCfiFj00euMnEVrbq5BABR93TQjjSaOppcsO3nAPwQFdDed+rX
         2xdg==
X-Gm-Message-State: AOJu0YxcSTvr4KvZlcns4sK9atGhBIzZx+nzq/1JjO6RmvyktH2fK6XU
	xGO1k05i6W+45mfKWJSZS972qkskNLHMfvJLMuqRY5cZ3glA8grqxSK+fwMp
X-Google-Smtp-Source: AGHT+IHkuGLVML+BXHxRTiXkxZHkvZ/UXLJJhrJwGi4MB4sD+UCRh2bGR9pe/W9Nqpfsn3MRVcKNLg==
X-Received: by 2002:a05:6808:3207:b0:3e2:9953:f894 with SMTP id 5614622812f47-3e29b76d3a7mr1180034b6e.7.1727245473761;
        Tue, 24 Sep 2024 23:24:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f72b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c46f04sm2106309a12.38.2024.09.24.23.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 23:24:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 8/9] python3-python-multipart: Add recipe
Date: Tue, 24 Sep 2024 23:24:21 -0700
Message-ID: <20240925062422.3146738-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240925062422.3146738-1-raj.khem@gmail.com>
References: <20240925062422.3146738-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 06:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112491

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-python-multipart_0.0.10.bb            | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-python-multipart_0.0.10.bb

diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.10.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.10.bb
new file mode 100644
index 0000000000..df52f7a35f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.10.bb
@@ -0,0 +1,9 @@
+SUMMARY = "A streaming multipart parser for Python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3d98f0d58b28321924a89ab60c82410e"
+
+SRC_URI[sha256sum] = "46eb3c6ce6fdda5fb1a03c7e11d490e407c6930a2703fe7aef4da71c374688fa"
+
+inherit pypi python_hatchling
+
+PYPI_PACKAGE = "python_multipart"

