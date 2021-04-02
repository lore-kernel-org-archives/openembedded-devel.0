Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.10587.1617328729555139247
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 18:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HEVHRT0V;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id s11so2720156pfm.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Apr 2021 18:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=JLM/21Y7zR5kcxzj1JmwNlrT4PiQoK4Mi9ZDZvb4Z/c=;
        b=HEVHRT0VUHd9vH9RRgzSl6suWa91CR+XLprv8aRwJ27j1hcLxm+l5XkDiU70qyIdaX
         w8+zGObubkeM9AYQNk3dMbcWAoSY1OabIhx5z/wNyA6TO39GKR/xjLfZS/PXcAGkBGr8
         +sM6Dfbw4hI5sroKFpkIRgX3Xk+IPaXChVbOltVP9e/vdFQ08Z6RE3L8dOzRlMhmR62S
         1Qu00upiIbzKERltYDz369eBj+fa6B9jreWomKdZIEpNg5+bDydy2rcEIvWothqGLykX
         JEXP0ZJRQx4S7jKQ0ZNQSP5nIbH1tnW1+e5gPLhb0uvFyh/w1LB23w+tgyK5nHj8NFIu
         XEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=JLM/21Y7zR5kcxzj1JmwNlrT4PiQoK4Mi9ZDZvb4Z/c=;
        b=kt1xapNeKgCh+l2qbDi6+AFo5r15xufqahTClNf8DnozKZTkjf3X/KngtFMCLDSJ4f
         meLIKQ5tQdjVN3mkGSIxuyTpt3w3rmIVigpVLQmQ8NE44u4ASnGCKUlT4KnlK7gNxb1M
         vcInbT8Nc/fnDtG+g8FXFBRxWV6Hi/PRs8Mim76chvneSrSiIAreYAYe5ASli5zsbEdR
         RBGnUZuQV29vRBbU46TTHZKcfNSRfIJ58eEyDBhGJrQJi/XIjm/U8xeO8KMivYMqLn1p
         Xl8j8GbVri3oAkqaPrOUVEaI1TiP2XayK6EPUiRE007kILUzCjb764B2mpOi8+fUU6uk
         7gNg==
X-Gm-Message-State: AOAM533FpI/NbzEBX800pIGJBJPDxztuhzvG6t7GIlNLSYYuT4Ewt/x5
	HDWSdDHBKljqmlzYf12q+zrUae+A7TQ=
X-Google-Smtp-Source: ABdhPJwJz5PUg5CBFLLJ8WUrjqb+s/HWttpNneRErOvhECTBiZkPABHjBOPVwpomwzuF+TMPMxxFTQ==
X-Received: by 2002:aa7:99c6:0:b029:1f5:c49d:dce7 with SMTP id v6-20020aa799c60000b02901f5c49ddce7mr9924600pfi.78.1617328728856;
        Thu, 01 Apr 2021 18:58:48 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:344e:3d2c:47a3:4e6b])
        by smtp.gmail.com with ESMTPSA id x9sm707641pfd.158.2021.04.01.18.58.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 18:58:48 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 02/14] mdns: Whitelisted CVE-2007-0613 for mdns
Date: Thu,  1 Apr 2021 18:58:30 -0700
Message-Id: <fee2024d74e0262c3140f6ad004ce751a4915ec4.1617328609.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617328609.git.akuster808@gmail.com>
References: <cover.1617328609.git.akuster808@gmail.com>

From: Sana Kazi <Sana.Kazi@kpit.com>

CVE-2007-0613 is not applicable as it only affects Apple products
i.e. ichat,mdnsresponder, instant message framework and MacOS.
Also, https://www.exploit-db.com/exploits/3230 shows the part of code
affected by CVE-2007-0613 which is not preset in upstream source code.
Hence, CVE-2007-0613 does not affect other Yocto implementations and
is not reported for other distros can be marked whitelisted.
Links:
https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613
https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613
https://security-tracker.debian.org/tracker/CVE-2007-0613
https://ubuntu.com/security/CVE-2007-0613
https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f37e5423da984b7dc721d52f04673d3afc0879a1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-protocols/mdns/mdns_1096.40.7.bb        | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb b/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
index 086b408692f..d00c8bbfd9a 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
@@ -27,6 +27,19 @@ SRC_URI[sha256sum] = "b86f4816b4145915198e7c5bf0bc56dbbfd960e9a4518bb6486baa40cd
 
 CVE_PRODUCT = "apple:mdnsresponder"
 
+# CVE-2007-0613 is not applicable as it only affects Apple products
+# i.e. ichat,mdnsresponder, instant message framework and MacOS.
+# Also, https://www.exploit-db.com/exploits/3230 shows the part of code
+# affected by CVE-2007-0613 which is not preset in upstream source code.
+# Hence, CVE-2007-0613 does not affect other Yocto implementations and
+# is not reported for other distros can be marked whitelisted.
+# Links:
+# https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613
+# https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613
+# https://security-tracker.debian.org/tracker/CVE-2007-0613
+# https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613
+CVE_CHECK_WHITELIST += "CVE-2007-0613"
+
 PARALLEL_MAKE = ""
 
 S = "${WORKDIR}/mDNSResponder-${PV}/mDNSPosix"
-- 
2.17.1

