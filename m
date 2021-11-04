Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97B9C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 14:42:42 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.12634.1636036962035040264
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 07:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hwfweLs2;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id f8so7506000plo.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 07:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fziZa4XHf4lWufWrGtwtLxLQsw81Q1uQIhyovsRSGkA=;
        b=hwfweLs2MObev/rzYkf1tU7dlcIiety/nKrv79MhJ1U2BmFKLmN8afjl0G3kYth9GI
         hCBsqGr5SpKQ1mNpWcaH9qXRKzUrCmc52qgBjMKxCxDwDaNjCUe8xg2lmgAjwcTZov+e
         BqVE5NgwYxQI4B7AtlgBLMw8p7N7IJIFwF2CQkxYuHM3iqwly56bQ/KR/2m04tvM1qwk
         i9DwjK70U+u8Wr/Wbb2U06Q/OaaFBFCSXuf7Lw3sk29zRNAuUoODqn7rJb07qSj2NJDy
         L9jzRSTtnkT9MKGNGM3M9pD8zyjdbNf0CNObdO+KutqpZwEpt/2J+kssIgq5uu3Dq9HB
         +u4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fziZa4XHf4lWufWrGtwtLxLQsw81Q1uQIhyovsRSGkA=;
        b=vvKrV1HgfuO8pjBqVJwxBsvUQ5OfP1J38j6nMCCmUSg4JfMygb5XH9Yjo78jUNFKla
         f2oqyw+uWX1fmCd06LT3Ge219tchcbz7/VzaDjwuCh9k21CCvuMO7BEkLxhZ7vJRfhfu
         18P2bN5LaN+9E7dp3jf5Fyss2+Eh2ErnD1Q2VUVTDyARpbtF9u2gcb9VUIqG0z6N+Ckl
         Wk0jI41AEL0d+bvaKfh1rJKV2g8dYpsbLFwxBh+APLXMsLZyzoWwiBnx/n54jKa/zj5g
         0sKaetMqPk6nMJJ0vBMrCcfYcN/DhjDb1BMohp8F8Wi28Duoe7bQzjX/PNZFOtNM/smz
         uOyw==
X-Gm-Message-State: AOAM530Ygwo2l6A1GND0Io71R8vr0GFvm9I27Cnq2ajSncs1/0xhoLaX
	7/OyZkNTv3xb7b296a2BF6Fqsux7VpQ=
X-Google-Smtp-Source: 
 ABdhPJxw78lhrcZW9k/CxRsqMUy0/o5TACiUiHGQVlsnXEbBIMO8qr2oHmN8LnamQ/blXjZ3/LS5qA==
X-Received: by 2002:a17:903:2305:b0:142:1bca:72eb with SMTP id
 d5-20020a170903230500b001421bca72ebmr11875327plh.67.1636036961312;
        Thu, 04 Nov 2021 07:42:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 t4sm5445597pfj.13.2021.11.04.07.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 07:42:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] packagegroup-meta-networking: Enable
 mdns on musl systems
Date: Thu,  4 Nov 2021 07:42:33 -0700
Message-Id: <20211104144233.3225963-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211104144233.3225963-1-raj.khem@gmail.com>
References: <20211104144233.3225963-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Nov 2021 14:42:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93821

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-networking.bb  | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index bc06fed4a2..3e3297c262 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -172,8 +172,6 @@ RDEPENDS:packagegroup-meta-networking-protocols = "\
     xl2tpd \
 "
 
-RDEPENDS:packagegroup-meta-networking-protocols:remove:libc-musl = "mdns"
-
 RDEPENDS:packagegroup-meta-networking-support = "\
     aoetools \
     arptables \
-- 
2.33.1


