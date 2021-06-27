Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.2636.1624825345519316931
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kQrwqmAC;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id i4so7684079plt.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QQwBw1nM0TFDUaAn91Oe68vwkLD7Kn3xqXSTWMSg2EM=;
        b=kQrwqmACTnmHHTqTz7A4cNjjfMcG1nalu7FyzCwHHSG0Lt7pEq3NwaijqmXbiaEZQ+
         LU2mskPSZdxZarYvw2ABMqUrzOLSul4B3vxD+F3nUpMI3kRngeoKoyu07qqQpOTlyvVZ
         GKzOntYWxxLcM6mfTJEfIkDdy6wGfG/gR1CfsEMf4EC483MsR9wam0Bf98CLmJFgrrji
         4tqomHWCNtTQ5BGG2bLWsdgdrYFGABFu77+L5DAV0vSyWN4/54DDtUG37HAA5kXACow6
         xx2K+qLqpn3wyoEDO7iII4XhzuO+8tlTJV6eH2ZQrqVPgOcyk1Heu77zdVMksSQxbXN5
         pkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QQwBw1nM0TFDUaAn91Oe68vwkLD7Kn3xqXSTWMSg2EM=;
        b=KbEL3owtd8SG5smdUqax9Hn4ly6xkJI3Jr5bD31dJekVkRQIPOQJvSZDlSQj5QmJ3j
         koz/LAFkAwflXVrXiqPTuvOZx1bafKiFugQA/gB8iWDw0Ekps5/k8yf+nvi/AbjqU6uU
         rdY6iYEA2SRzdFLEUrTOWruPuJuZGT//0+M88Rg0Q4xS8X6R44yWlbEI20joAdPiu2oS
         HEPwWZGnroEMTlB+A0PiIMp1dUc+PVSoQDUTfb+kKZHKyKlUWgkM9QG05uZ/IxdOgbmf
         XaoDBG5+bdLSjKEB1G1NnEzsSmp555lhDfuzVQb1Ifw7CASYsRnkqgUyjoyNF/jY4JJ4
         E7/w==
X-Gm-Message-State: AOAM5333gYbE9iSmFU7QMmzdrLUgWFyse7qa6fBfQavyOMtRe9nNG05c
	y2BkLQms5Sypd5Kqq4HQHosVwJqgAoFDSw==
X-Google-Smtp-Source: ABdhPJxIZGaho1rccd2MukxGEFuqL1pIQkZ/GepeESjPDzmcieWcH0e1tnNu/ExvuX7Ent7wQc6asg==
X-Received: by 2002:a17:90a:b795:: with SMTP id m21mr23804318pjr.143.1624825344993;
        Sun, 27 Jun 2021 13:22:24 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:24 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 07/20] cyrus-sasl: add CVE-2020-8032 to allowlist
Date: Sun, 27 Jun 2021 13:22:02 -0700
Message-Id: <26819375448077265cd4c9dbb88b6be08b899e3f.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>

This affects only openSUSE, so add it to allowlist.

Signed-off-by: Yuichi Ito <ito-yuichi@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 711e932b14de57a5f341124470b2f3f131615a25)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb            | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
index 33de8ca7e2..c4b41ace8c 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
@@ -96,3 +96,6 @@ FILES_${PN}-dbg       += "${libdir}/sasl2/.debug"
 FILES_${PN}-staticdev += "${libdir}/sasl2/*.a"
 
 INSANE_SKIP_${PN} += "dev-so"
+
+# CVE-2020-8032 affects only openSUSE
+CVE_CHECK_WHITELIST += "CVE-2020-8032"
-- 
2.17.1

