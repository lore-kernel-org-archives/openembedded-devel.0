Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D18D3E798
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.30535.1730838658724713639
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:30:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VJSM+qAI;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e30d212b6b1so5213505276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838658; x=1731443458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qhplcj0aMK0ILTcXrC1xify2jY0xYr6MKwdVEgX4LtA=;
        b=VJSM+qAIvUyDrLs+frtvatozYSBdl3H9fQBDhrgYiG3PgYwUSITtnnUDbgZacbV36B
         ADoRp/xqkSF3/FnhxZW+K69g64upOODZ/BOdTDncvRlQET1OffeN6t8bhcHwk0xbFZWr
         otk0aqYObDD0Pprn8NRx9XXYOG1eyniro35TIZ3DD3v7xw0nq9b3om07WeSmCH0PiQTI
         LHUiy5hyt98kjtd+wWVfgAQ9Bvv9kq14hYFq3r88+oO7ZGC1BvmE22tjL813VfvRY2+G
         uoSCBlf9YlmK4SMufcXC3q68e8Vkz+Z2Nrvzfkwu7n/n8WbnzqwlCSoTWNpnlLwNYt7y
         ma1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838658; x=1731443458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhplcj0aMK0ILTcXrC1xify2jY0xYr6MKwdVEgX4LtA=;
        b=LBbQqlHVLe16p6ZcoaKoH/GxSG2PaZwBhF982zrUmAnrDhgk4GBizqRMNcPbVestlW
         wh9wcIB3vMYL++ZS6pWl+nkkOi1lfJ+DHid6h8UhDk2yJrRU+r6agfyhD3+oy1bK48j0
         7aKFWsYhZOEuFaD2P3OF7Byjhqvp4AlINFM++nXgs+p7s7DrlAUTliRDf8mBlZZbQ7WZ
         ivA75Ww4RRC8x6x+rY5sr2UM4n/nQx0HQ8N7S1UUVtWxf4RPxxRU6AjHdWPmOtoMiTwK
         U+p65Axrysjq4KIilexu0l5FECYsAehYqEwnRrrdu3SfSyVCoE3GW8V7XZZzVzWBGSpp
         jnHA==
X-Gm-Message-State: AOJu0YyLYP7L2k7DeFYcWfOne66zU5M+H7GsPE6BUuJnY8BALut5WMLQ
	O6Ztlcq8u02ItT6p4asjQ7NOukwUYb/miop1h36g+c7eNRu0mU99sJ8wLa2P
X-Google-Smtp-Source: AGHT+IFuq7Fnvjb/4JtDoIp16uD5qT0Yw7OMQPF51gSyPZsJcmesBX/sWBQO1VatlGXiY4Ol2KMEqw==
X-Received: by 2002:a05:690c:318:b0:6ea:8a23:76a7 with SMTP id 00721157ae682-6ea8a2380e0mr101772177b3.3.1730838657332;
        Tue, 05 Nov 2024 12:30:57 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:30:57 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 108/161] libmikmod: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:33 -0500
Message-ID: <20241105202827.3104-108-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113625

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb
index e0712ba93..d7a2820a7 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb
@@ -8,7 +8,6 @@ DEPENDS = "alsa-lib texinfo"
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "f69d7dd06d307e888f466fc27f4f680b"
 SRC_URI[sha256sum] = "ad9d64dfc8f83684876419ea7cd4ff4a41d8bcd8c23ef37ecb3a200a16b46d19"
 
 inherit autotools binconfig lib_package
-- 
2.43.0


