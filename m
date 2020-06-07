Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.1342.1591500297080950129
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FlWJvNBi;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id t7so7131236pgt.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1W/87zXxOU3OL3BuPGEDp4GcldfwlNNM1O/jVypYkL8=;
        b=FlWJvNBiXv6auY9EBvY0urR29fpja4IxaOR7KS1XgqKOEQNbIclK4pRluTORJqdBnU
         7x/GldS7/sEjTJlRJJQRKzUbftEUItVM57tDobIrOVXnpuLjyQGqPBnDEgKgNZ3ROGe8
         SjGZCin6DEWIUtgchl29wZWPJoEq/Hfgf/1GZgfNZruI38T/V+EAcvtqjQia8oxm+L0Z
         FMemrSO1Ii4+Q8b9s4YTVY3Ai+7FwvuZZrh08bFLZVvdtX2WPAOrfb5iwUJfKFLlLKrB
         Nbe5ZY//6t6eW86j+/XCebXrG1P2nSgB8n+l7KgfnOiFWP85TS0bbE5izAv2agh5eApz
         OiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1W/87zXxOU3OL3BuPGEDp4GcldfwlNNM1O/jVypYkL8=;
        b=f39xjU+kGwwkn6TcyHQMYfQVp+YOiwnAWc1WMMGmRg51DL+CpXOgWnmeO8h/zLqnT2
         EGoC+8wQ/+oRzTDfGHpBbJYVUCq25jw7enVsBrfMYomIEdLeCUiMShxn2VTsU3R6UwHD
         FdcrbcHycEP7rsUm+jy91ZRJHcgzLc1wYptfWpb5c2Zs2Twfn19HJmqs2+KuFrwcbBI8
         +X+hqiKJUofrat9yqXfqQjEqOFUGb6l6JpZn3n27cYSCEj5VVZlpVUXqf9m6bAE13WiP
         WHPoIHVO3DBmVZZUqaeizxywLgM82Vp1hKLxrva8xefWWVhzYsaNOPnNOZ08V6nCz8Pb
         CxPw==
X-Gm-Message-State: AOAM530bKXElt+FqyPv5GgVRCc+/AFjnA8DEGneNUntw9jCs2DWwxs3n
	ZkVJFVrzVqm8tulC+1unaav5H9I8
X-Google-Smtp-Source: ABdhPJx5+zgK35m958NdvmKVoUT4S+TRSXC2a9aufMwN7DWi2ys/CJg4zO7gigiebuLxabhFuKCsmw==
X-Received: by 2002:aa7:9af0:: with SMTP id y16mr16838537pfp.231.1591500296498;
        Sat, 06 Jun 2020 20:24:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.24.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:24:55 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 14/26] logwatch: upgrade 7.5.1 -> 7.5.3
Date: Sat,  6 Jun 2020 20:24:24 -0700
Message-Id: <d77894e527b08cb3d5973a633e0379640d74c6f5.1591500140.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 778cdc8480a68d9eed1daa21b628802c1475a57d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../logwatch/{logwatch_7.5.1.bb => logwatch_7.5.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/logwatch/{logwatch_7.5.1.bb => logwatch_7.5.3.bb} (95%)

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.5.1.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.5.3.bb
similarity index 95%
rename from meta-oe/recipes-extended/logwatch/logwatch_7.5.1.bb
rename to meta-oe/recipes-extended/logwatch/logwatch_7.5.3.bb
index b6ab43ccf7..644e420711 100644
--- a/meta-oe/recipes-extended/logwatch/logwatch_7.5.1.bb
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.5.3.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ad199c8aca74e70f296f731ad9a1521c"
 RDEPENDS_${PN} = "perl"
 
 SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BP}/${BP}.tar.gz"
-SRC_URI[md5sum] = "3d14fa6e0fb56f890d2b3fd9cbc3162f"
-SRC_URI[sha256sum] = "9d4a00625065f25058f8966e7fb11f9f72db25507b4dd9c05f57e14447c33295"
+SRC_URI[md5sum] = "8bcf3edc5a4687c8aad1b9c01e2be54b"
+SRC_URI[sha256sum] = "1b2b96879dec01cd02754fe00f8989b11ff16158c3dc7c4aff0faa4b1d34974b"
 
 do_install() {
     install -m 0755 -d ${D}${sysconfdir}/logwatch/scripts
-- 
2.17.1

