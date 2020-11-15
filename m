Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web11.24339.1605468137109765919
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2020 11:22:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GvYcTdlG;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id 10so11336099pfp.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2020 11:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B/QBELtf7Z0+we56Acu/p6X5TjSwE3KvEZMuLOKAFp8=;
        b=GvYcTdlGq5PxUAegLKzEST7Ott8j9exQzkgXdUQ2pyacr+SWYDGTW+873oF9Xjyw6e
         nR4AuTTBVaVsAdDmndfvEdI9KwCWVKsuz3jgbers1GSZEO/A1uDWwhVyRJBiyZAPfAwT
         EZM77VkQgTmREBWjfub1uCiQW2Q7xq9pkXNDaxay83GUK9MKTcYl0z8zAKwnflAc1Apj
         mfsKuU89IJf5M5cXTlWzO3RrVe4xB3AK9RdhnuTuGiWuZEeyyFKIAJI5kWpbpVRy2K6A
         eAvAg3u+VuR1uAmAgd3woI87mjLvQiDWHzsjfTPbWtfn9T/guX1V//E/wDCS9+eYgDuM
         Dh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B/QBELtf7Z0+we56Acu/p6X5TjSwE3KvEZMuLOKAFp8=;
        b=oAOjWqis3+UdLVAU8f1EGaj4UVf5m1D6M5GHHQZcuBSSGp39zu5Bd7AjLkRHUV4kT+
         rMsK0ms4F0dX1QVUHCU5GSyQ7fGnZVPXoWNc9tJ0rWJBZsxdntXmpMuHof7p5AvzUjXQ
         hTF/TGO4yDt4eFXmqnXYqD8pCWliwscMr1+YXa9O4ED6GnjFoIoCfLV521IA8K4poBjH
         VLMSzD4FCj24EnTA/+21D4pkPbeNqElD0+AHK7ynkH8cEvX6VY4G0PuoRaqKwhyjKT/t
         KoQqQA2Rv0VIopcljMxWR3uh2GA88hAq30UEAyY2TLj0MOYPh5MaEMLvV7gUENSjYrUB
         9zOg==
X-Gm-Message-State: AOAM530SeD0vZ/u4JG74OuH3jcqEPk2yRxvUAZlh7utkjAPK58XlHrbs
	E+fXY8qJnrt1j0N1x5FKt+7c1AFXeS0KYQ==
X-Google-Smtp-Source: ABdhPJz5kKGjI92aaXlBwJ+MImqidNbWfovQje0AY/pQEPc5aZgiyIKaDfLbWsDKIsJoyhNppgh2tA==
X-Received: by 2002:a65:420c:: with SMTP id c12mr9927795pgq.53.1605468136190;
        Sun, 15 Nov 2020 11:22:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id g2sm14874107pfq.107.2020.11.15.11.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 11:22:15 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] librtorrent: Disable instrumentation on rv32
Date: Sun, 15 Nov 2020 11:22:12 -0800
Message-Id: <20201115192212.2735454-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

instrumentation code uses atomic ops on 64bit variables, which leads to build
failures on 32bit targets using libtorrent because of missing builtins on
riscv32/gcc

/usr/lib/libtorrent.so: undefined reference to `__sync_add_and_fetch_8'
/usr/lib/libtorrent.so: undefined reference to `__sync_fetch_and_and_8'

The developer added a "--disable-instrumentation" switch which skips the build
of the offending codepaths in libtorrent.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
index 3ee69554b6..e0d3bef3ca 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
@@ -19,6 +19,7 @@ PACKAGECONFIG ??= "instrumentation"
 
 PACKAGECONFIG_remove_mipsarch = "instrumentation"
 PACKAGECONFIG_remove_powerpc = "instrumentation"
+PACKAGECONFIG_remove_riscv32 = "instrumentation"
 
 PACKAGECONFIG[instrumentation] = "--enable-instrumentation,--disable-instrumentation,"
 
-- 
2.29.2

