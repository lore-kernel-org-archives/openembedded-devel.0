Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7615C52D7C
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 19:08:01 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.41700.1723057677120823250
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 12:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kgs97JwU;
 spf=pass (domain: konsulko.com, ip: 209.85.219.49, mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6b79293a858so1353006d6.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 12:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723057676; x=1723662476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4zS8j3+ro9xAxbNVWmKIvqUj+pKnSzKn0ZKWuyHiHYI=;
        b=kgs97JwU5Zu742Y7GibiptUrcwTII+YFADHSWd/wdzw5bW1cDEwIe7LuAe4gG+MVoF
         7ms+Pl6xExbUlfYaUB/limId+PI/hKUA0/H20zmZwYb4iu/NW/aF8r3o5gDHIjNQIO4s
         sN1fVB9f5ahn7shLZCofbrXq6KsTB3fnEdPy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723057676; x=1723662476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4zS8j3+ro9xAxbNVWmKIvqUj+pKnSzKn0ZKWuyHiHYI=;
        b=WaUo/TOpZ68Lv4UV6VV/AC/tdBh3pC1EFXHsZlLhdZHaCjTj+5h234C1QSuBlynjB3
         W/7h4w/t8l59JHsZ1SK8Y/hZZc78QSZn/Oy8MtcE02/ag4BXhVEQGB4o9qKxY/wsgExY
         EaeiJNAebYOW7wB3QIzVhy6xJaLepYnd4+3SAOe8wX4ZaaEiXnKLnp2HJTpk7Ovu5Gxa
         arYCevg1k5C6RenDkwrE7ebjAZfBuiVzIPsuzMwl3sF/mTXyn2am9wmMRSwT+qLVLIwt
         19mxWlst6DP61s1ZBBzpOcaWC2qQVX5drJIR41m/5uLWHGS3IHkv3Ab9l/Bi5dMRc8bh
         4hzg==
X-Gm-Message-State: AOJu0Yw+IdUrbSqS7QUaHFf10VFwBWnTI2KJye49MYgVLGmDE7RODczK
	IhfcSomTX9tVrhnkwd6NH0MDRnqA132Az+2Jfw3NRQAX2Vx6fc4pp760rNCaqlgX7Jj6ki+TgQn
	v
X-Google-Smtp-Source: AGHT+IGwX3rVec/GdW+GM8fvtr3f/mch/tRVqvMKATjwFwco1LXHWj6cbRLMCRYYIPOwWyFm5vlilA==
X-Received: by 2002:a05:6214:3d98:b0:6b5:d764:69d9 with SMTP id 6a1803df08f44-6bb983a9940mr251475676d6.7.1723057675849;
        Wed, 07 Aug 2024 12:07:55 -0700 (PDT)
Received: from ghidorah.spiteful.org (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c83bcb0sm58288286d6.103.2024.08.07.12.07.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 12:07:55 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 0/2] python3-grpcio patch backports
Date: Wed,  7 Aug 2024 15:07:33 -0400
Message-ID: <cover.1723057257.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 19:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111638

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


