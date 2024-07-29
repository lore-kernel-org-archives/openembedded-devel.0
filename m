Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34A0C52D1D
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 17:09:40 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.61070.1722272975698294429
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 10:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lE//LXWp;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428141be2ddso18903845e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 10:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722272974; x=1722877774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndESOvrOag/O3U5UCIJol5qnwh9z3273x0jluB3qZQo=;
        b=lE//LXWpC3SbIxGIpDquH9MB637Nu/vDJkvhzcX6gNhR8ND5gEFyrvH3g/c/r/RrFe
         VRRzMnFNDc42ke/Q1Ouo+nfpN8LK9sKG87OG3G2W4kPHoQP5j4gKmrJDO9ghSRpOVcNo
         P2+b21m2I/4oPhYn7xKY3ms9DwrGo5+7rn8lqjB97ZksoJCYyhzMz9DT7PQ9B86cBtAV
         y8XO6Qz87t4phfza1oby/+NNs38TLFjqohV6XFhDK8N44ycw9IFm6fgx41GhdMN3u9lr
         p1tOUp3b7483QH1ZSREoGxaCO6iAfHVrVMcMMUgb+o13anpCVZialuEKJAIDI442ApiA
         9VDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722272974; x=1722877774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndESOvrOag/O3U5UCIJol5qnwh9z3273x0jluB3qZQo=;
        b=lfczIE5nfgolQZgpVqQ+0FPz1vStc/mSMKIAEKvnYnOWnoTgpRSceR0ODlwrfcYJJL
         6kG6JADdcnufo53l3FZ2cTszUDQIqcbZ5O2qp5CZ99K/zvoLcnPH+cDAIHqZNVui9kNE
         G+9XBoCppeN59mSKQ3zpF/kyTSPtwZ+zZZ6wz93Qf9MgP6FNzpPQZLIZdhovuW0AITlw
         QNE0WqE+NSLXUZ6yJuTqP3QTPVJVb4T+O8dq6d2Mhapx6MskYLO9L7xjRDKgLQyKJaAL
         nEF5+FFO6LX5x6rg/9QRdBvDJkjpo80isxX+ofAvSo79QLux6BCDAqxoEfdpN5P8oTT3
         e6Gw==
X-Gm-Message-State: AOJu0YwzO8f9utSDFyKbbzj8xohPga5JQR7r7GP5yWurNgziGyxfEK6n
	Ts15vWbRPpB+dKV2dyZskgfKq8XuRXXQPTGVW7GeARus+GEzWRovcje2Kg==
X-Google-Smtp-Source: AGHT+IFvNR+HNkR1r3vWIGGLAHfbdVlH7bk8KUa/XDKB1bbAxGL4BSCa/BoLQw+S+H4VDShJibDxHw==
X-Received: by 2002:a05:600c:5022:b0:426:6158:962d with SMTP id 5b1f17b1804b1-4281ed406d8mr17640175e9.23.1722272973542;
        Mon, 29 Jul 2024 10:09:33 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280fa9a30csm115340725e9.30.2024.07.29.10.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 10:09:33 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 5/7] composefs: add native target support
Date: Mon, 29 Jul 2024 18:09:08 +0100
Message-ID: <20240729170910.2670446-5-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729170910.2670446-1-jose.quaresma@foundries.io>
References: <20240729170910.2670446-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 17:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111469

From: Jose Quaresma <quaresma.jose@gmail.com>

The next version of ostree v2024.6 will be available soon
and optional will require composefs-native.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 850a893f20988f67180bbd23700a2ab97be32c73)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-oe/recipes-support/composefs/composefs_1.0.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/composefs/composefs_1.0.3.bb b/meta-oe/recipes-support/composefs/composefs_1.0.3.bb
index 5d4fa9c31..38fc8d267 100644
--- a/meta-oe/recipes-support/composefs/composefs_1.0.3.bb
+++ b/meta-oe/recipes-support/composefs/composefs_1.0.3.bb
@@ -27,3 +27,7 @@ EXTRA_OECONF += " \
     --disable-man \
     --without-fuse \
 "
+
+LDFLAGS:append:class-native = " -pthread"
+
+BBCLASSEXTEND = "native"
-- 
2.45.2


