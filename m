Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.15073.1610481816716231571
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 12:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nYX5M7cN;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id h186so2063878pfe.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 12:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=D99VYtRnc17R7GG/onuzfZHY4U0k3Mm4uP/j/cd9f04=;
        b=nYX5M7cN6+5oCUj/i3dY0kAhmpg6jV4Nu1/Tn77jHp97CA1g30boZjPoBh1qJeN7Zg
         ci/Ii/7H2yyJO3dVVK4nr8AM7nWryIDqM6+wEfzDeUUuFa3L9HzdrmKdtHAIW8b8hJak
         mmOCslom7/iRkC+ImEO+IzZOJsZMhAhkPFHhRNCyvciBKDTBmMhiTqHdXKIcJxsBEE4F
         C2Ck9Lvpe4eJchIJURCSqiEuM9XRGyQFra4yeAirDJTddHlRC/kU23+1QVfuxLS+G/Yy
         IXtu18jwPOkQrwJWGf2kiOEzqKvMgwTFdJx0sd3slIdrTNeZsXcTgt5A1wMCspOfJF6d
         IuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=D99VYtRnc17R7GG/onuzfZHY4U0k3Mm4uP/j/cd9f04=;
        b=jI1xhVZ5IDabwBEehHwfpcyo2OM6EJyIpFEmbZkrrxYtb4kfcvFozuECKIChDnRNhK
         R/l54zijpdHysu3lWSnI5C808U/g5ipDIOAt4MI7/jsGmmkvfB9nJFeUkQn94BgW4n/S
         IVLzZ3smUzSDr+RfnuPlODToD1PH8YL/nk6c21AArTAbTmPc6yQOoZEJzn8zvVek0h4Y
         6Sn8zK9Kca4WwIZByGQd/hKtqJqSCuZKxCHE+WHOYGX0HkpWLpLUVZgymnxH434xusqj
         Re9x1IeGtBBId1qBUTB62UjbgrKlvwwxUHlXyY7VyP/OOsPBqUdpNtf+jgz3IrgWV6gA
         UlFA==
X-Gm-Message-State: AOAM5323CMTt98oBHAKcMU+i+b/iu7+wkRDIGSsH68zlU4QkYYRKNETL
	MsX/t0Qxl/muZWUkuz7xlDoPsfAdv+PpfA==
X-Google-Smtp-Source: ABdhPJyXd+1APCGE57O8Ob+3F539jCy0Hpp6ZHzpJYPsv8ixPbFZSv1OUHPVsvcvfrh/qSpmJ7j4Og==
X-Received: by 2002:aa7:8f35:0:b029:19b:1258:ec5d with SMTP id y21-20020aa78f350000b029019b1258ec5dmr778614pfr.9.1610481816136;
        Tue, 12 Jan 2021 12:03:36 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:2960:99d5:cba5:7114])
        by smtp.gmail.com with ESMTPSA id gj1sm4314188pjb.11.2021.01.12.12.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 12:03:35 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][master][gatesgarth][dunfell][PATCH] wireshark: Several securtiy fixes
Date: Tue, 12 Jan 2021 12:03:33 -0800
Message-Id: <20210112200333.2603-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Armin Kuster <akuster@mvista.com>

Source: Wireshark.org
MR: 106181, 106696, 107655, 107673, 107682
Type: Security Fix
Disposition: Backport from wireshark.org
ChangeID: 57df6ac3b11aabd96e6aec728501ce7988bc176a
Description:

Bugfix only update including these cves:
3.2.8
CVE-2020-26575
CVE-2020-28030

3.2.9
CVE-2020-26418
CVE-2020-26421
CVE-2020-26420

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_3.2.7.bb => wireshark_3.2.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.7.bb => wireshark_3.2.10.bb} (96%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.7.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.10.bb
similarity index 96%
rename from meta-networking/recipes-support/wireshark/wireshark_3.2.7.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.2.10.bb
index 65f925ce1f..d284824149 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.10.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "be832fb86d9c455c5be8b225a755cdc77cb0e92356bdfc1fe4b000d93f7d70da"
+SRC_URI[sha256sum] = "1e9e239f2449f240a7910ed598084ccaf8ea308b2b46b196c5adbec59612226c"
 
 PE = "1"
 
-- 
2.17.1

