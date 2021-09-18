Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.2192.1631991333336371579
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 11:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iRsgTq/Z;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id g14so12407786pfm.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 11:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MSu4FPP304UfEJR0U9WIM+nKEo25ASSJ1F1o2TQEADg=;
        b=iRsgTq/ZbX9PakIXtDKQ7UWcVC+1dmpdRQNcWz3lfLToNHiQKyXu17xeR8uhpwNRBq
         U3uQgviyNUWEb4QLoNjndnbVKKR6s3mOEZ/kw2Rhv9a3jESY2/p58E+sqkHF0Xj2nXjp
         g3gvGH4XN/sVdFSBrBqcr3uBhoMUKVkz0x5H3JS7BEDWza5i2XbrHF7Dan0V3isfW6Eo
         LDxp9O4aDBb8e/t6VYPnoKoC7ODIKHZrHEV0zLhxWqRnfPaQQIb8yYO8VaeZ6cm6LnsL
         gQGP+SnnAk2Rm8aUpNwACglG7Qs+EuiGwgEzyhg2mzoyFze3mKcbT9tlIf/EO2k0j61M
         yTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MSu4FPP304UfEJR0U9WIM+nKEo25ASSJ1F1o2TQEADg=;
        b=ML9/ht8SJkautc8s0GUtKpvLcXgh8csOlTTvWKcrjxwE55/L8cmk160TWJK0wjAkiP
         QK/qeMn7QVTS6KP6HJQ6VtExKhINOuN4ZHbfUgR59JJmXiM1icuuxtKDu1ZyDkD1zG/J
         74c3WdkXH3YajGXSNWAxRcDLBRuw5sOQnNpuQbKlwLeepp40B9TIDSXGZblMJYM3JWYJ
         I59svK2pbYFNg8SJGBZvICaGlf1k85fgOhgxuPyXrQtyO1JTzs8/n5DpQq5kb2eJe2ft
         KmZCpHvUMSrRn1qn84ecNRt5iNlIPNnKkhtmFYwuQDXLIq/kFPFA9MxTEEn+JIS9D5id
         2W/g==
X-Gm-Message-State: AOAM5327FVM6oHIFu3GTvjZwg+6ygkej6rkKuoTfdtgf++195lcsK9Wm
	otVxk5FkPZkUjwmoh3IqklkN5vARW6o=
X-Google-Smtp-Source: ABdhPJzAEfKWKe8MgSRMdRNI9IbEmlP9zZebF12vjEnUOMuIbrPMDfD2LKM1TgD0R2IEUjeEjF3ypA==
X-Received: by 2002:a62:76c8:0:b0:3f2:6a5:b8eb with SMTP id r191-20020a6276c8000000b003f206a5b8ebmr16844108pfc.58.1631991332741;
        Sat, 18 Sep 2021 11:55:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id j11sm14579383pjd.45.2021.09.18.11.55.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 11:55:32 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] autossh: set precise BSD licenses
Date: Sat, 18 Sep 2021 11:55:31 -0700
Message-Id: <20210918185531.3691939-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One file is BSD-1-Clause while another is BSD-4-Clause
Set and check accourdingly

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/autossh/autossh_1.4g.bb            | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
index 125dfaaa97..3dc304b23c 100644
--- a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
+++ b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
@@ -1,8 +1,10 @@
 DESCRIPTION = "autossh is a program to start a copy of ssh and monitor it, restarting it as necessary should it die or stop passing traffic"
 HOMEPAGE = "https://www.harding.motd.ca/autossh/"
 
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://autossh.spec;md5=80a6701134723fd3420e733b46a0eb97"
+LICENSE = "BSD-1-Clause & BSD-4-Clause"
+LIC_FILES_CHKSUM = "file://autossh.spec;md5=80a6701134723fd3420e733b46a0eb97 \
+                    file://autossh.c;md5=76c37acd40ac45050a4ced145b1e2707;startline=7;endline=23 \
+                    file://daemon.h;md5=6bbeaac616b9bc8de7b40049004f4289;startline=7;endline=39"
 
 SRC_URI = "https://www.harding.motd.ca/autossh/${BP}.tgz"
 SRC_URI[md5sum] = "2b804bc1bf6d2f2afaa526d02df7c0a2"
-- 
2.25.1

