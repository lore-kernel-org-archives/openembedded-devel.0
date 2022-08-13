Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D016CC25B0D
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 04:38:11 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.2011.1660365490829216387
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:38:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p+KFvfm0;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id s206so2345959pgs.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=lVEvYpU9EuwxDgy57v7UALVl6c8x+8/hqI3gl4eZ+U8=;
        b=p+KFvfm0iJJsDswXOt2+wecMRvDBOjOcCMLlWoJKtRT5S9A++rwVFP+QqeFet3L4K4
         AiMbYCsWGZr5qiYq4C0UM+JGmDM70Shc9wsF8sAZUSajBv+ffAQr9wiRynd5ekPVyHRM
         nRF5yAcsRy9JPrCVRm/ojuJ/+EdHSFmUCqJLytwQwBRVjCfyfCsvmKADNkP8DFZuFVNR
         p3/SBI5ABTjBqhCku8wWdLk1i8F+DLZfn7LZntt5sP71u4ESsOX9DKXarodZeW7VaCH1
         oqqseBRLLPj33y7UzgH6761tkAbsVgbW3GtO1vg5IGpPB3lAaTo2RubfQ5OPBhE4p2eI
         Bk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=lVEvYpU9EuwxDgy57v7UALVl6c8x+8/hqI3gl4eZ+U8=;
        b=pfEOxXGha14HKBJJfY7F+bG0Bz/EvJUQ1retnCyIqQOxHkB+kPPnXXKL70BmF9cxvF
         PCTPIg+isH3prPjHybJ77OVz/2dFIPU3vn+e/tVKQ8hRxKQTwAS8q8Am/gzs0xr/nLRJ
         wFCraAYBgQyx0+C6IqALhuq4+/hkX98bKmrd/M7+XUjyNJTV+iJ7+cczjG0yaAxuACCH
         f++ZQ+yJl5q5a6HQ2GKKsmweeRMy5rMdhO3RGJ2iqd6gxIKpmhjeyLQ9ZP2N+u1YKUNM
         Jw6U6MqPsLKsg8xSBZV6AX1XZBvwlld4BWk2YusZPdqaAybA5PagbtBzJLQfhYbfgOxo
         STtw==
X-Gm-Message-State: ACgBeo0oxLXiOHOQWL2DAuhqg9wA0buymBYnzNllpq7/iIwqlg1Odiqr
	Tka+J8oG1BKs5QJnq7nZTGCRVvQLnKM=
X-Google-Smtp-Source: 
 AA6agR6sIJgr2wP9jU++kxvhUHSqCjJOiFuLPvzGUb3HuSEVK8g8h1v0MAh4I+lIXETiMudBh3Y9NQ==
X-Received: by 2002:a05:6a00:1650:b0:52f:20d6:e858 with SMTP id
 m16-20020a056a00165000b0052f20d6e858mr6536210pfc.36.1660365489851;
        Fri, 12 Aug 2022 21:38:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 j4-20020a170902758400b0016d62ba5665sm2601694pll.254.2022.08.12.21.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 21:38:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/6] unbound: Always enable largefile support
Date: Fri, 12 Aug 2022 21:38:01 -0700
Message-Id: <20220813043803.3548501-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220813043803.3548501-1-raj.khem@gmail.com>
References: <20220813043803.3548501-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Aug 2022 04:38:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98222

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/unbound/unbound_1.16.1.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.16.1.bb b/meta-networking/recipes-support/unbound/unbound_1.16.1.bb
index 5eb9ec1bfc..c11bf513ac 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.16.1.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.16.1.bb
@@ -22,12 +22,11 @@ RDEPENDS:${PN} = "bash openssl-bin daemonize"
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--with-libexpat=${STAGING_EXECPREFIXDIR} \
-		--with-ssl=${STAGING_EXECPREFIXDIR}"
-		
+		--with-ssl=${STAGING_EXECPREFIXDIR} \
+                --enable-largefile"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile systemd', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[dnscrypt] = "--enable-dnscrypt, --disable-dnscrypt, libsodium"
-PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 
 do_install:append() {
-- 
2.37.1


