Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F41DC52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 16:40:34 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.76906.1723567224543716447
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Aug 2024 09:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YyAmj2jo;
 spf=pass (domain: konsulko.com, ip: 209.85.161.41, mailfrom: scott.murray@konsulko.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5d5b22f97b7so4408977eaf.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 09:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723567223; x=1724172023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bNhLU5aBDVjySnOZveyAgwRZ1jMlN6iBQ/X2lXMeGNA=;
        b=YyAmj2joQVt4hvX+WPunsSVBEUdZnwUw3q0WhAfyRAEx6R+jaoDH6F0vYcWg14amoR
         QxZQFMNhjX4I0DqAAHAY4M77SRUA9iTnYfYxYon4awh1tRrVyslseuhJLPLXEggh8Xav
         usIH6QQ4xxHR6Q1+mhmj1IIMqfoF+SXgoeCHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723567223; x=1724172023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNhLU5aBDVjySnOZveyAgwRZ1jMlN6iBQ/X2lXMeGNA=;
        b=udHBO6sir1Wo+nPuwRAYuwUDcjireEVrLp7XkFso0mKqkX16/Wc4Pij+mdGaQ9rbv7
         sdKXjl/4UaN0LQuLZPfymKfA0a1s4IyrQNzWt+yVnHRcHS684C2K6G9Dci7JgDpesaPT
         wp1ZYr+fX3nAvQ/qQvK49+csqSoIR3kn80gybaBfitzhHdJ7g+9CCvLVK+bX23plp6RL
         2Ua3l+ImWllsrx7SYbr5iSO7JhSijnANUfb6D9dM8Hkcw4d03cQYV9zcFfjuD6S+P6Iz
         fWen8KyV90KRLNhoaCDdCk3l3eW04rfVa3mUKnWW3oP6s+gLEkkFXQ4SKG0qqetJ4gdM
         hk9w==
X-Gm-Message-State: AOJu0Yzq3sBUJ/YUYH3gqSm8JPYphvWg7bq9Z/a98WPdwI2JvdJ1T4xQ
	Oo89wyJ5CGsfkRbITh7R2I+W8bbsbzblg4Y7vnJAhMzwFUvzr8MKg37MoiJHOCevTI3RhFLue3d
	9
X-Google-Smtp-Source: AGHT+IGcKySttQQu+dOh2ASecOEI0SGCVg6cdlmkQ3739eGFEwbH9I6VQOrAtbb1bUwAuQKiIlhe0A==
X-Received: by 2002:a05:6358:70c5:b0:1a6:b034:b381 with SMTP id e5c5f4694b2df-1b1aab292aamr3315255d.3.1723567223292;
        Tue, 13 Aug 2024 09:40:23 -0700 (PDT)
Received: from ghidorah.spiteful.org (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7e01fb5sm353705185a.99.2024.08.13.09.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 09:40:22 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Scott Murray <scott.murray@konsulko.com>
Subject: [meta-python][scarthgap][PATCH v2 0/2] python3-grpcio patch backports
Date: Tue, 13 Aug 2024 12:39:53 -0400
Message-ID: <20240813163955.1683925-1-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 16:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111793

Sending as v2 since I realized that last week I accidentally tagged
these with meta-oe instead of meta-python.

Backport a couple of fixes from master, Martin's allows building
python-grpcio-native on hosts with gcc 14 (something I need for building
AGL on e.g. Fedora 40), and the second is a fix for a runtime crash
on RISC-V that I noticed has not yet backported.

Martin Jansa (1):
  python3-grpcio: Fix build with gcc-14

Scott Murray (1):
  python3-grpcio: backport abseil-cpp RISC-V fix

 ...aledcycleclock-remove-RISC-V-support.patch | 82 +++++++++++++++++++
 ..._Generic-only-if-defined-__cplusplus.patch | 74 +++++++++++++++++
 .../python/python3-grpcio_1.62.2.bb           |  2 +
 3 files changed, 158 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch

-- 
2.45.2


