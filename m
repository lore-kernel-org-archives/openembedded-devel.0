Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD3EC4708B
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 07:19:22 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.5173.1669792757776039481
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 23:19:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S/YrzQ2Q;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id 4so15842413pli.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 23:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyONKL+1bavU6okd0FF4pSR66QoaQEPeYyYS/oXpMH8=;
        b=S/YrzQ2QKUJCPzKC1kRGiPtiUaunuqOcQfNHh6MJyIdDVOCZ4/6VPbatPKtX7r/+2n
         LJ7ghI8IqR+59IV80DLYgZLLyxzBq0KS7v7w2gQlipKu2qdhx0sHxRh5AfF0zbGsyxDN
         oPJh8XX3YLXJcmmm7jdXEIQXJfbwmVCXb0JgZQ7H9ojRecpxmYN1n2gaxvMo2CP3x8YH
         ANlryLlN1bP1gkueELJdIxihPNn0sn15478RtpcwpM1MdNO+Uy+km7AjbZ5xTjyS+mjz
         8OVvnZlVGoiAUSYWGJJcX+AIRZW7Q8v6MZs4ISF+4CU10ZMrac/e/nDcYEkIRPlJNwqb
         y1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyONKL+1bavU6okd0FF4pSR66QoaQEPeYyYS/oXpMH8=;
        b=F5rR9hjBSyqJbPF1x2+3fPRJH72cMWE40FxZVT8MEo0iBOW9Mwr7CTl8RliOdQJGGj
         dhrjKZOunDRW5aVk1CuDjo1RnLMQzFECjzE1xxdG869wBKug/jggaeg9b8oeMEfFqA4U
         hxDIcjFdeTX4zbhkXtYE3OrwQReb5EcLirmAJQ8pQ0svSA6vPVM9PFGx1iNN7p1hSUta
         XJlMjci0NFHkytJi5PKjGFiiRw09zc62kH6wKhSltBh5C764gV7uH8ebZNX3QmHUisYg
         pyzJX222h6cJ0G5OFVShjm89CRVqBLSf5KzA89W/mWpoVBaXY/GJarjbFO6rCo3e7fw5
         AjiA==
X-Gm-Message-State: ANoB5plE2lEliOHLauMhokl3ZEqJF2z69tUFZpQIaYWEfu+u2hYIrDv7
	pV5uZ2VVofnRlr3FNtm7N2rYthCPrVE=
X-Google-Smtp-Source: AA0mqf5PLdJK2WONDmF5gsbLAfJzPOEmmS8O0abLp/Z9WmtNr1fchpZGwLxVAatlqTmdTz0aetWf+w==
X-Received: by 2002:a17:902:864c:b0:189:4139:2054 with SMTP id y12-20020a170902864c00b0018941392054mr35559159plt.64.1669792756916;
        Tue, 29 Nov 2022 23:19:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b00189812a5397sm577447plb.180.2022.11.29.23.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 23:19:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/10] volume-key: Inherit python3targetconfig
Date: Tue, 29 Nov 2022 23:19:05 -0800
Message-Id: <20221130071913.1805812-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130071913.1805812-1-raj.khem@gmail.com>
References: <20221130071913.1805812-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 07:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99859

It uses python3-config during build to grok the python specific
includedirs, therefore its important to ensure that target specific
python3-config is used, otherwise currently it defaults to native
python3-config which ends up adding native python3 include paths
which might work out ok but is exposed when target is 32bit + lfs
enabled, the headers don't match between native and target python
and compile fails e.g.

| In file included from /mnt/b/yoe/master/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/volume-key/0.3.12-r0/recipe-sysroot-native/usr/include/python3.11/Python.h:38:
| /mnt/b/yoe/master/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/volume-key/0.3.12-r0/recipe-sysroot-native/usr/include/python3.11/pyport.h:601:2: error: "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
| #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
|  ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
index faf8dd362d..aff555ad54 100644
--- a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
+++ b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "6ca3748fc1dad22c450bbf6601d4e706cb11c5e662d11bb4aeb473a9cd
 SRCNAME = "volume_key"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit autotools python3native gettext pkgconfig
+inherit autotools python3native python3targetconfig gettext pkgconfig
 
 DEPENDS += " \
     util-linux \
-- 
2.38.1


