Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.10236.1605211126315697431
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 11:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b6nGLl8p;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: alexander.kamensky42@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id a18so5546148pfl.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2020 11:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V8n7p0aALtLQUupJLbZdF//ii7B/Y1ZCTQ1ki9MF9Nk=;
        b=b6nGLl8phGY3q19iCFHVi7Zj6zzwbtzdpHwfvXSqRpPokltY++AszyG+gPYrp3LVCv
         6wifVOGZ9S3ypi1B3hejl9EEW29dGM1lYYvafZwVSBbBhlwWDnchgloICae+hpnGH72x
         Y8taZYfAynHxd5o/UdzUMpfLoK4lAFV7IwJUh0cQv6O7J9AtlnMW/yuDWBt/mmSTUQke
         6o1XB/m6ryIE5oxKB12PcYWIdbLD1Pb+qYskS/YTjK3PCPrQjwz1Mm1DNnGH9kWbG9sK
         +EjRvQJcPhYfPs4hUhiTx9uISYqnxf1ZP5Jb2nEF+PzOvaZIvZYBWj4ChbzwpegIlukR
         9ukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V8n7p0aALtLQUupJLbZdF//ii7B/Y1ZCTQ1ki9MF9Nk=;
        b=Yd/1RZtCcBswtItFwXIPmvnDY5DENLeIc2/47M79Y7WZcymvUCadEjpYzzHDS1/kWf
         gt1HTJd6I7KPnEseBycjsS0irRQJaL8amHWVPMCqTMTQXSHNzptqyabyJSJpLLVJkFS7
         G7M3ONMUNsKaiRr7vXXm+kpvNTTrx3tP1qLNkyKIuRAsQNZZzw4v6adpnEwpD3G1a6FX
         q652gbwBGEFp63Y0sxED8BO1OKt7f8vQuLCglgJa2Ktiz74XEPtG3UDjqOcdjMWQzoH1
         U3H3snemb5G6wJiaYO+xEu9mmDGPjtl2o+1alRfAqBqlL4sR9YyYQ6upNTBMzWTQxafj
         nV+A==
X-Gm-Message-State: AOAM531vN9rb1eIdq/mq0b9U6c6xec32BVAvm+Ga1MWs3r2JRg4B1+Hz
	DS8I9jClGFjJzqpXpGXX9tj7i2FM8Cs=
X-Google-Smtp-Source: ABdhPJxQ3z+pwlaVJd9oaaDWGqTDwBARQF3bHLJQhOxzNY9Q6kLoMMZ9M3D/crNlfF9EziiSPw6fNA==
X-Received: by 2002:a17:90a:4483:: with SMTP id t3mr848801pjg.116.1605211125611;
        Thu, 12 Nov 2020 11:58:45 -0800 (PST)
Return-Path: <alexander.kamensky42@gmail.com>
Received: from localhost.net ([2601:641:8080:1a70::ffbe])
        by smtp.gmail.com with ESMTPSA id h16sm5138421pfo.185.2020.11.12.11.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 11:58:45 -0800 (PST)
From: alexander.kamensky42@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>,
	Mingli Yu <mingli.yu@windriver.com>,
	Haiqing Bai <Haiqing.Bai@windriver.com>,
	Alexander Kamensky <alexander.kamensky42@gmail.com>
Subject: [meta-oe][PATCH] makedumpfile: add PACKAGECONFIG options for lzo and snappy compression
Date: Thu, 12 Nov 2020 11:58:36 -0800
Message-Id: <20201112195836.2953252-1-alexander.kamensky42@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

makedumpfile can be compiled with lzo and/or snappy dump file compression
support. Lzo and snappy offer faster compression time but slightly bigger
compressed files. When reload time is important it might be beneficial to use
lzo or snappy compression.

But it brings additional dependencies and can make crash image bigger.

Add makedumpfile PACKAGECONFIG that would allow to add lzo and/or snappy if so
desired.

Signed-off-by: Alexander Kamensky <alexander.kamensky42@gmail.com>
---
 meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.7.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.7.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.7.bb
index 165e192cb..ad1e09c35 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.7.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.7.bb
@@ -40,8 +40,13 @@ SECTION = "base"
 EXTRA_OEMAKE = "\
     LINKTYPE=static \
     TARGET=${TARGET_ARCH} \
+    ${PACKAGECONFIG_CONFARGS} \
 "
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[lzo] = "USELZO=on,USELZO=off,lzo"
+PACKAGECONFIG[snappy] = "USESNAPPY=on,USESNAPPY=off,snappy"
+
 do_install () {
     mkdir -p ${D}/usr/bin
     install -m 755 ${S}/makedumpfile ${D}/usr/bin
-- 
2.26.2

