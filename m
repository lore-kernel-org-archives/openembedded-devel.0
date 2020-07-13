Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.11836.1594608988050116598
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hfmwcVkD;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id gc9so5499079pjb.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zQxbgxykyKg0B22z/FIXC7mFeX01PrEJwD/vOw7DXwA=;
        b=hfmwcVkD2hT5bYh6xyEMwE2AqrJKgfNvEi1E5LqGBkzp9XD6iPHyL79fshI2hYJA5K
         nuuR6Al7chmgoScRLyUmjLE6jl1N61uXyN/gFG22Jetf8T3vDoKx1qmeG1w5knTPwIRr
         xJIuegxxPjCZhuY46is58ORsPcOFAmYoITSDiKRGAthQT5yN76y3gl8FdbZFyErJQpA1
         40+dOJMxySF5x8qEPLmJHXWMFxQ0VAn1wkNTEFbPV1+1khAOH6hSK5pxKokBSO/sScsy
         XYR6luMmi7RJj9DeNiztkdno74bzBPSMqVSWwlMJnL9lQne9L/3c3OERh99re72PrtUr
         wXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zQxbgxykyKg0B22z/FIXC7mFeX01PrEJwD/vOw7DXwA=;
        b=Y806qQnHMb9wWUPtzzFCMDONZSjsaOxf5A2y2dYIYcZUPZvBofvQtnzHzgKm6wFDyF
         FwsvMqeA4vHDccVqYdXrTzf7HqlVSirOBsC4odQRxZ8dsr0X7nv6iiYdyFSxWJ1v6Aqm
         5V4QlYdAak0t2RGnLJFbH6Z0Kq/3frx4iGBRcUPLexMvmAM4sQuhcX3u+m3NASi8cDBu
         N9LW1/lxU+ZQHlvbcWv1vGP9Pk0DbZNLY+del7uTIsL3OFbKzgTlFrI02b5Tzmaq8kVN
         LqurF01o3xj+RR63rTQMYSDmL5ocOGpvowul0lQEaMPkjl9drRBz45upFBxC+nPvVL0Z
         SOgg==
X-Gm-Message-State: AOAM532277gbqREVufVIIyFxuQBTc5U4C/RS6F/8TcDkMFSj7nuUHwtD
	+QzhEqoyEJsD8Fx+kflCF6lFte9K/c4=
X-Google-Smtp-Source: ABdhPJxC8T1rJZadDYWHfr7qFr/c9goDCeqS2zg0phYb+6wwERvGGhQY7xljmvdFrv9DYQOr8Zbm1w==
X-Received: by 2002:a17:902:7611:: with SMTP id k17mr68849136pll.255.1594608987424;
        Sun, 12 Jul 2020 19:56:27 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e013:ddd8:d9b9:dad6])
        by smtp.gmail.com with ESMTPSA id u19sm13687976pfk.98.2020.07.12.19.56.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 19:56:27 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 10/18] nftables: upgrade 0.9.5 -> 0.9.6
Date: Sun, 12 Jul 2020 19:56:06 -0700
Message-Id: <7ed1adba7993bf3d619cb5bcb4f77ace9ea247ff.1594608813.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594608813.git.akuster808@gmail.com>
References: <cover.1594608813.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b0d884a994197a9bc0b181545fe67f19a7630cd7)
[AK: This release fixes vmap support which broke in the previous 0.9.5 release.]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nftables/{nftables_0.9.5.bb => nftables_0.9.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/nftables/{nftables_0.9.5.bb => nftables_0.9.6.bb} (93%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.5.bb b/meta-networking/recipes-filter/nftables/nftables_0.9.6.bb
similarity index 93%
rename from meta-networking/recipes-filter/nftables/nftables_0.9.5.bb
rename to meta-networking/recipes-filter/nftables/nftables_0.9.6.bb
index 0fd187f1b8..41f7f4c91c 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.9.5.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.9.6.bb
@@ -10,7 +10,7 @@ DEPENDS = "libmnl libnftnl bison-native \
 UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "f2c1957eabc370057c4576b8f33a71d91a6ad019b8b335abafe61c9c42cc7e16"
+SRC_URI[sha256sum] = "68d6fdfe8ab02303e6b1f13968a4022da5b0120110eaee3233d806857937b66e"
 
 inherit autotools manpages pkgconfig
 
-- 
2.17.1

