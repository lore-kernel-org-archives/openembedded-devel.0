Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC32D40CEB
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.31240.1730840615759841654
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 13:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h2dYwH6I;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e30d517c82fso5427808276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 13:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840615; x=1731445415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cc8MQ4ktPSCCszp92Hz6XMxDDbyG8QHPNOmMj4vlZRU=;
        b=h2dYwH6IzAjgrivp5J9Ar6FBofhgzPRxVfB+HX2EQL5slQfZfTSuVWfihSJVbQigqt
         9TJ0mc6KrWA/QzyCm57x4CfAo1Ha2aNWNBNezmkhalO06bIx/sQhEPm3gWR6Zc69+wLv
         9W5e8g/nhl4liRIghGee7XcqMEfIDIgPk4cscCm/PbXuNtFgg/4tTgpRcNGv0DDKTc5q
         SZ3OK5cnGrXqLNw232Ny42B23LRMlNH8uBoTIdooZ1zsRdwmlP9kHGkxDSwuQmcZ8ZVG
         CCf1E8lnc3U0B3jWjflX+IXUknGI70sjM8Fqp4QeTwqhmrWgofXjeQwzdkxVTKs+LRxI
         sLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840615; x=1731445415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cc8MQ4ktPSCCszp92Hz6XMxDDbyG8QHPNOmMj4vlZRU=;
        b=bEM/fk6OuJivKjkqaVaY05dbJtHUroukt75qAJ1dYKh4BpFC3LTmqrBgKsnkK9VMU1
         /ETPpNKh5jvQUs+dpd1ePWnKuA0wnf8mZVqvy1KKhJ/rbXJbBRQnB8CegPBwzdhyBJfr
         h/DCgCXWPb70XvdJimMD09NT0AGYNhy1fcvezcUR7HZWgw81bqcsiR0byV4NSjLmBbX4
         JIwEnbvP4lABZUEY41zTcCvBkWi2j8LWb+yz9GnPqoPDWdXMC/jDrwh8KjHyK5m6rtds
         d9ziCFFlyMXDCg/lfI9v4SKpUtlxvJ0cn6e1d5GPXZXPRagfxr5/caC61Un5FO7wGbyZ
         0IjA==
X-Gm-Message-State: AOJu0YyhuzU1rNBeDSJvVmtlt59HEpN6qi4U+XwcV23hiBA4iCd0vOL9
	ZfCsQ9g2n5NGE84TBa9nOrhTh2pHHUlnDeHaDBumbFsb7BhiMh7fZsEnkEoo
X-Google-Smtp-Source: AGHT+IHB79XEPkJWJd54DhFDON9LJIrIpz27453hJoYDqjJleh8GXlplFJYuk8mHXlUDAIx1vSvi7g==
X-Received: by 2002:a05:690c:f15:b0:6dd:cdd7:ce49 with SMTP id 00721157ae682-6ea3b87e266mr262200067b3.6.1730840613356;
        Tue, 05 Nov 2024 13:03:33 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.13.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 13:03:33 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 161/161] cxxtest: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:47:07 -0500
Message-ID: <20241105204707.4155-161-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113677

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb b/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
index 8c8fb6098..4eb4e8ecb 100644
--- a/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
+++ b/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
@@ -5,7 +5,6 @@ LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI = "http://downloads.sourceforge.net/project/cxxtest/cxxtest/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "c3cc3355e2ac64e34c215f28e44cfcec"
 SRC_URI[sha256sum] = "1c154fef91c65dbf1cd4519af7ade70a61d85a923b6e0c0b007dc7f4895cf7d8"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/p/cxxtest/activity/"
-- 
2.43.0


