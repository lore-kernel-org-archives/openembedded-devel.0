Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.18141.1590941820783287122
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EZUXZKrM;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id e9so1190058pgo.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=YDuqX2hZYvsWvRcfcz0LXx3QdK1Tm4ewUOk0rsr7wr4=;
        b=EZUXZKrM+VMen0xCKDd0ioGMUIUF0dJ3m4fS8nnFCN3jeYcGRmBZqKKCNarh368AZP
         A0fos+4u2d+sU5iq9dP9xTo6p++oQYWOWllFpq737H1I9m5TsBgGonokvA8PvFuWU8G2
         EBKHNs7bjBgVoV1XTvTTDEsxMDFyzDVqxoqtG+7KYNiBMSB69QILPYtzkkwIs83dqBF2
         jFhcvD36pj6Yrbf9U3OO/CZ0d0WTPhKocfLbt0VA/mxJJ0gA9AgRvBI+36fw6dFye8Dz
         R/vIds5J6+bf5khjl+HG7qTF0xr4Mmu7tVqhf/Llr/9Syxo6byxm+qs42dcN0Fnw5gKD
         48yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=YDuqX2hZYvsWvRcfcz0LXx3QdK1Tm4ewUOk0rsr7wr4=;
        b=CyW+4gXvkZo5TM6f/MdE6DZb5SZCGAMmgTm+u9CiNg+pipC8ju0ttoFUD7uDZI6xhP
         zl/U7xVKB1oVo64IJFI/He5DkhVVAmuzz1LPZbBCj882gjR23QBN0Z6v0Jy58KsV7BgU
         Eq1hCVmzR3ogmaF654H23tj6A/hQhqS440W6VmigLGFZ4O3B1ClewaKG1uPNh/J28ga5
         Z/uvwFR7BZ3uegVs2lmOQpC8IY3jp6JqdSpZ8TpEUF7A/LMyAHtdR+kv5l+NrSzQs3Ku
         YFyWl1+S5vgobIje50KT0giK6XSVe5l6X2iV9BDvtQbCbiMtCI6yCXFyOnzVWzi+ESEI
         yGtg==
X-Gm-Message-State: AOAM533L4pbJXj3rsrwuVOFbxMSuxG6eJh2VBh4W2SYnyxWYmVXVpN8f
	Q0BAg1pjJp6ydwgNIlaRnHxE+zRa
X-Google-Smtp-Source: ABdhPJzUNH5g9xSeloWNrq/c5QtL3dG6KS8mo/ROHVlPreTx3/HY5LGDCiN1grc/ADGWzegxQkOmog==
X-Received: by 2002:a63:4504:: with SMTP id s4mr15675193pga.175.1590941820057;
        Sun, 31 May 2020 09:17:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:59 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 30/35] cryptsetup: upgrade 2.3.1 -> 2.3.2
Date: Sun, 31 May 2020 09:16:17 -0700
Message-Id: <17391b2160b23710b49adcc4a3e02af0e05dadce.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4dacdef41c27eacd1aa46401b00ccd3b65381d67)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../cryptsetup/{cryptsetup_2.3.1.bb => cryptsetup_2.3.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.1.bb => cryptsetup_2.3.2.bb} (96%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.1.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb
similarity index 96%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.1.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb
index ec375fed9d..b9668eb099 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.1.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb
@@ -21,8 +21,8 @@ RDEPENDS_${PN} = " \
 "
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[md5sum] = "cef482c0579f34d9524311ac70c0875f"
-SRC_URI[sha256sum] = "92aba4d559a2cf7043faed92e0f22c5addea36bd63f8c039ba5a8f3a159fe7d2"
+SRC_URI[md5sum] = "6e4ffb6d35a73f7539a5d0c1354654cd"
+SRC_URI[sha256sum] = "a89e13dff0798fd0280e801d5f0cc8cfdb2aa5b1929bec1b7322e13d3eca95fb"
 
 inherit autotools gettext pkgconfig
 
-- 
2.17.1

