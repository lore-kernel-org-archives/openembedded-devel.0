Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0838C531DF
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 15:28:19 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.7797.1723303690901715611
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 08:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iWVaUV0e;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6a4778dad26so698287b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 08:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723303690; x=1723908490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EILBgXeN0d1WUloHQymCihoezISVuKUm3KgSOu7jCLE=;
        b=iWVaUV0eySwtysvS3CwooKxsX/YyqA12aQzTaVkL4fptncxLiu/Eh48CwwWNHyWiQM
         5EUlbbGTkbRmZ8gk6/WcKusL23CyLZKxAxhxBJq0nubwkwISjByi9P4JskhRuJ1CKfux
         RcTS23trbEFk6xGfqg7CkXd4T+VnCQeyzZTx9zDEb6gkD3XEAINEdLF7DJ3FsSFmAQNR
         /uveUcWr0I9fJ3bS0WZe7HSAfidXla07LbZCoYKzQJk2jwTS/qCpurQaGuau0MbfvSAu
         7OzUNk1wOEN91Rgt72oeqoT7QvnLkswZtCHbrdhTfoQEBz8TIHEgFE+kd+9YOPJ6bjGK
         jerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723303690; x=1723908490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EILBgXeN0d1WUloHQymCihoezISVuKUm3KgSOu7jCLE=;
        b=hXbZdgkH8EhGFop2v/r4oS1BOq4NfchM0GvEE4XnCPNtP9JbFBLQRw/hjouV6YdbYq
         Q9NQulYYp+JvweFLmPDP9KFODAzwCeIYEqE4WZPhBIzB02ae8j4fCUanBeongqZuMkpX
         GJteseRCgfHRhQKApME9XF0VxIcwDI4ymhOt9+/n2jTqZjt8ZZgoOYwhDOg8JQN4UmWC
         l681q/iTrhW0crYZyJ7wYpld92iJ6h5I8pmYX7eRHRL7SPpK3/i66G3dOVQrIlFyCCla
         wXM2MTGxolTzjGJ8nhZi2PRkdsy6WjgTNgC3zNXvucTmlxoo7Y2oHeQVcd6kFjP8fLc9
         lzsw==
X-Gm-Message-State: AOJu0YxMM1dI0WAECfEPyS7XKDRiMcmv3kKfrUzleoRQPwI0kkrhTqiq
	7+l3+EPYrF35d4dLlGMtUeriHdqyPT865RUCPcYo/WT6e4ZP3lCB/T4P3g==
X-Google-Smtp-Source: AGHT+IHbAduioeVl8MAOm7MjaWMbuRQ7Ona3yCpMRuHt6wawC3EeHyIjdGAoeUkSRIxeufonHTDcjg==
X-Received: by 2002:a05:690c:6d08:b0:627:956b:dbca with SMTP id 00721157ae682-69ec8c90c6fmr62602257b3.40.1723303689935;
        Sat, 10 Aug 2024 08:28:09 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:ad:eb2b:7538:7504])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6a0a068cf32sm2848947b3.48.2024.08.10.08.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 08:28:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 5/7] log4cpp: Fix buildpaths QA error
Date: Sat, 10 Aug 2024 11:28:05 -0400
Message-Id: <20240810152807.899873-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810152807.899873-1-akuster808@gmail.com>
References: <20240810152807.899873-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 15:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111742

From: Khem Raj <raj.khem@gmail.com>

Fixes
do_package_qa: QA Issue: File /usr/bin/log4cpp-config in package log4cpp contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 78a69186be5db3f6995101e0f94a1d11e1155421)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb
index 729857eb62..a8b9b9a019 100644
--- a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb
+++ b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb
@@ -20,3 +20,7 @@ EXTRA_OECONF = "\
 "
 
 CXXFLAGS += "-std=c++14"
+
+do_install:append() {
+	sed -i -e 's|${DEBUG_PREFIX_MAP}||g; s|--sysroot=${STAGING_DIR_TARGET}||g' ${D}${bindir}/log4cpp-config
+}
-- 
2.34.1


