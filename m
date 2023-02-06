Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC0FC636D3
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 22:37:37 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.69049.1675723054760876111
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Feb 2023 14:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FF/NHurI;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id i5so4719603wrc.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 14:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cIhAqahCi900XmIZUO45ZIx1grm4uyXmQ9RHWUH9Onc=;
        b=FF/NHurIPc4D0aByo84zThZgAhrQ2UO73CDXgxm4T7RfOZSxEk+8+qaNTpcOTl9OWv
         axupTMGVlJRdTqIKZEHUMHwNv4GqRlT6p0bubZH4OChKNIjK0sb78oTW+Y4VyK99KRDM
         HR5H4q84EYpCXVf/lmUbwSYTYAsBHbYAIvZAB1yYb9ptPm5y/vqHxEegczFhP+CJ1cCW
         vPlUmx71chQ3nS0p/zZv/lwjd6Do6A+c0mjt1ijK0LFZbPWfo6ViQqkP+5Wna4pdLaR4
         fiN+hq/7blexZybplHJhYEZFgL/byr9Cbat6yW6CcFQOG9o4cWGQNHHMi2Ftj48rFZwF
         6Vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cIhAqahCi900XmIZUO45ZIx1grm4uyXmQ9RHWUH9Onc=;
        b=jniVO8+QQjk+3BVmcfQ58dDfbJdz6EtkoTCkyYa+88iji8EPTa9zcooQMd0ICM6OxM
         glgt7145LKdrVmr98mdIeH6ZPG1EY37h5taNGZOtGgxaGRbLIgNkSC0JvVAWreu1kkY6
         AitJE780o4mY8OeFyvJGnk8rDLQFweRKRI1Gt/Yzl69kTiEXMv7/LdIrIYQLWeZwL9fX
         /2FRe/S5K9db5ZLFYJRIsJVlC+oexTbXqWfF0bKt7PRqMZda4Fi2Aync7UFD8ScccAY5
         7Vw5xYZzYE+OCv6YJyYotN7L/X6nhTmVJ7d1dFLTA0iC1bmgdK648pkq9dyI2ecm7RPg
         CIHg==
X-Gm-Message-State: AO0yUKW7NsQe9X63aFPx5NrJ4Qq7cdUS+YgjSAgSrVNqx15BgXgaxffO
	ssrJpo5w2XDSd5ON7QiESedCpj8lF1g=
X-Google-Smtp-Source: AK7set8qGPbcO4mCXoK1maGelXoalynbfgsuUjvMzQNNf2Q8Dob5Sf2EYmTcXcqxBkPq6Lyjnqx4tQ==
X-Received: by 2002:adf:e2c1:0:b0:2c3:be89:7c1d with SMTP id d1-20020adfe2c1000000b002c3be897c1dmr10747346wrj.0.1675723052778;
        Mon, 06 Feb 2023 14:37:32 -0800 (PST)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id w5-20020a5d6085000000b0029100e8dedasm9694651wrt.28.2023.02.06.14.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 14:37:32 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] dnsmasq: Upgrade 2.88 -> 2.89
Date: Mon,  6 Feb 2023 22:37:24 +0000
Message-Id: <20230206223724.4738-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 22:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100948

version 2.89
        Fix bug introduced in 2.88 (commit fe91134b) which can result
        in corruption of the DNS cache internal data structures and
        logging of "cache internal error". This has only been seen
        in one place in the wild, and it took considerable effort
        to even generate a test case to reproduce it, but there's
        no way to be sure it won't strike, and the effect is to break
        the cache badly. Installations with DNSSEC enabled are more
        likely to see the problem, but not running DNSSEC does not
        guarantee that it won't happen. Thanks to Timo van Roermund
        for reporting the bug and for his great efforts in chasing
        it down.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../dnsmasq/{dnsmasq_2.88.bb => dnsmasq_2.89.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/dnsmasq/{dnsmasq_2.88.bb => dnsmasq_2.89.bb} (98%)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.88.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.89.bb
similarity index 98%
rename from meta-networking/recipes-support/dnsmasq/dnsmasq_2.88.bb
rename to meta-networking/recipes-support/dnsmasq/dnsmasq_2.89.bb
index 4bf1dd8954c6..1a009f2da3b8 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.88.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.89.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq-noresolvconf.service \
            file://dnsmasq-resolved.conf \
 "
-SRC_URI[sha256sum] = "da9d26aa3f3fc15f3b58b94edbb9ddf744cbce487194ea480bd8e7381b3ca028"
+SRC_URI[sha256sum] = "8651373d000cae23776256e83dcaa6723dee72c06a39362700344e0c12c4e7e4"
 
 inherit pkgconfig update-rc.d systemd
 
-- 
2.39.0


