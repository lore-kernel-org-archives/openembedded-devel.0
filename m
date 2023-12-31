Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C8AC4725D
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:53 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.219024.1704025426691583082
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CAKEdhy0;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a27c6c88694so57449366b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025425; x=1704630225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7Ip4VGcob3nJ17l2bKO4ReXOyFUMpVYuSgPZlsEZag=;
        b=CAKEdhy03Beq0WanaqgKf5t/ViXNrD2Hwx7y2eqhl5hilvzHdm/fvlsJd41zLNcNME
         JZrc6GhC7P4SM3a0qMZaj7K0NkOR7rp1YOO4VRUmE3Z7oKSNlEihtmcldjoNv+o4xuVa
         MDzgsffo7DzI6SeRkArOgHbsF81qfSyFX+iLzWkxfUriOm4J1Ir9VNEndqHuWFlPio4v
         vGyC3hScB+u1GB8SwTNJ94yobUdF/t9nqPFheRSgvcW5XZI/hjdlVhSCCb7EnoaUbm6o
         hB2BFSNf6jlqAxZ/LF0iZ/1q5C8izzKj2kDIDsSKtzOlu8NI7ueuzziaVgj3fvp/6S9+
         QKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025425; x=1704630225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7Ip4VGcob3nJ17l2bKO4ReXOyFUMpVYuSgPZlsEZag=;
        b=XpC3fW34XuWWaWA96Qg642aZyerT0EHJ9SzEtSMFVRz93V0Jsmo9oMcFpYZW3Cp63l
         uxlc9DoM+Z85j891PlQgvqQVkUOQ943eSrdG4YBCIzwyFdm8nD/nz5sU2Xh0dBqPNQB8
         dVMLYMyMnlW7uedua1AD8Xcz37lRsc//Zfs4R7qpIe2S4YZvhEEs0rK6cady36sg+AtJ
         q9YA5BFTt0Y7ARudCsHI80ca7AiqKUfzjFssaeXzUZVmsPGz/zXCbQSw3mn9jU4IxWMS
         YqTVoxVv2iV52acOtUMzMR8/mUr2+Wuag0adx0lxklqcZxovSsiG6BjvNsmZAqOoPt5E
         u9iA==
X-Gm-Message-State: AOJu0Yxp+pNVHt/qKgFfh2MUP1uHYw1gypy5hSrIyQnrpehkUVcLv+TK
	0JTld++BVzfUAT6j8QrJoM8NyeZ77V8=
X-Google-Smtp-Source: AGHT+IHg9NIKCHReuD5FHPjLUd69GTy58IWLl+jhXdAYsVZoge1qLTGGpwOlZaQjrwKnI+r9USPw5g==
X-Received: by 2002:a17:906:2d7:b0:a19:641:66da with SMTP id 23-20020a17090602d700b00a19064166damr6709089ejk.7.1704025425137;
        Sun, 31 Dec 2023 04:23:45 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/23] libsigrokdecode: add python 3.12 support
Date: Sun, 31 Dec 2023 13:23:22 +0100
Message-Id: <20231231122329.405225-16-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107967

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch b/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch
index a90f588d2..45556afa8 100644
--- a/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch
+++ b/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch
@@ -18,7 +18,7 @@ index 4802f35..e0e468f 100644
  # https://docs.python.org/3/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build
  SR_PKG_CHECK([python3], [SRD_PKGLIBS],
 -	[python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
-+	[python-3.11-embed], [python-3.10-embed], [python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
++	[python-3.12-embed], [python-3.11-embed], [python-3.10-embed], [python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
  AS_IF([test "x$sr_have_python3" = xno],
  	[AC_MSG_ERROR([Cannot find Python 3 development headers.])])
  
-- 
2.39.2


