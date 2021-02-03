Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.2983.1612315913960765583
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 17:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IoUkR9dh;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id i8so16569643ejc.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Feb 2021 17:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EIWPCF39t+rbsWIPO0tedkwrz54ZQ8mC1lR1s2MKQoY=;
        b=IoUkR9dhceP11DY2Wa8i8XAkharxnWz7FMHdd2Z0Qrd9mIoeN1oN3gfqGeqDAztDMo
         vWw92xiJfK3vPlLGbZ29xQkxpTRgKpbghWgkruaK4ROV5UtFFxsGy+0tA7+2/NIXB2x4
         rJqzS+ODVF0Mk8eDaslwoYtwl3r3Bw5rSdUjBgjY9tL5cPzFGct9TbteXwsX6n93jC3L
         wlAragdDOAZdq3yTCtjnfcG+/Hi2uohj6Bk1cTXN3LWV6Hfkne9o+nK67VOC4AlfgF38
         e/5P8ly+8idPo4AKtJ4LGOb7b0Hunw3vz9wnJ2kJruS4GcHourb33J/wTG26khaAzJNE
         35hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EIWPCF39t+rbsWIPO0tedkwrz54ZQ8mC1lR1s2MKQoY=;
        b=DCe+Q1GmxG893lzErn8qlRlOZASjLUCguaCpDSLgwNSnC5K3qNgtd9SZlUgrRH5RZ4
         Y7CKj+2yio+8xeKrGJ0MC9StwKBUcFHutJrd6GJZOiCarlltQhhQu2HqQz4pIL3yD241
         rUJY8BSpcebJmJRrfa6FbnRXcH83rqLAZzqW1Ew4znzoBVKRXvA4IE+g5u78UI2BHcfe
         yrk4q/KlRSGn16iRQKXac1zboVML1vp4+PkNIQD7e0UK7GYji9xSlLPHfhR3E283ysqm
         Ukv/pnAFsjRHNlfwZyT9C9nnYS351rV61hLh7jWXZ2fspti0yx4uuyfJbEHjzwBigNx9
         YHxQ==
X-Gm-Message-State: AOAM532SBkuSp1/zU/EqRwPt/9feEeuHJuqlUjEuvu9lEvORaV4ltLVx
	LAJNRB9ndpBKPIlPjflJhPdwV9P/RfBNAQ==
X-Google-Smtp-Source: ABdhPJw20aia0asJ8v7USXBissIMkQToGO6R3FLoGZWBuePiLYl1s3WHo6i9deF/yUMtju8s6GDE4Q==
X-Received: by 2002:a17:906:3603:: with SMTP id q3mr745562ejb.382.1612315912523;
        Tue, 02 Feb 2021 17:31:52 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n6sm226373ejy.123.2021.02.02.17.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 17:31:51 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-networking][PATCH] net-snmp: fix build with dash
Date: Wed,  3 Feb 2021 02:31:49 +0100
Message-Id: <20210203013149.6936-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fixes:
  | make[1]: Leaving directory 'net-snmp/5.9-r0/net-snmp-5.9/mibs'
  | sed: can't read net-snmp/5.9-r0/image/usr/lib/pkgconfig/{netsnmp-agent.pc,netsnmp.pc}: No such file or directory
  | WARNING: exit code 2 from a shell command.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
index ac78ed2d5f..6a4d5b1eff 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
@@ -133,7 +133,7 @@ do_install_append() {
         -i ${D}${bindir}/net-snmp-config
 
     sed -e 's@${STAGING_DIR_HOST}@@g' \
-        -i ${D}${libdir}/pkgconfig/{netsnmp-agent.pc,netsnmp.pc}
+        -i ${D}${libdir}/pkgconfig/netsnmp*.pc
 
     if [ "${HAS_PERL}" = "1" ]; then
         sed -e "s@^NSC_INCLUDEDIR=.*@NSC_INCLUDEDIR=\$\{includedir\}@g" \
-- 
2.27.0

