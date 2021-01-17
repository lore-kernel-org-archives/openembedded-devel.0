Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.21176.1610905027104393599
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PRfzmH/d;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id n25so9496979pgb.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wALYLFYvqP3KlW75uSv2orC/HaDtSFkS9N2k08alarY=;
        b=PRfzmH/dbeh+GUsrJkOAZZuy7dj/Krpe73kn2+6jIWGvKHM/8oGuKCD6Ew/3SJZ1Ha
         wSp+0hR2U0E/fypPiOO3mFmdcRC6rHK1FSbUebK2BdayhRW9S5K9FG6J41hA25k5VuFS
         PIxrGDgmxLBjJ9/T/HyiGQDH2gI2GbTj+7UPyQa5heubCh6RARCycDgGlsyJTWiQtY3j
         OdkEJ9Q9GLQLEM1MjFZhIUwaqo9xtWHzHeXl+iVWFQ2hISU6IGtAzNtGx6yDaniYIj6L
         Y0OfdHydSuYsQ2+z9CI9t3mJaeCIWipiq8qPrmLPLj0QTiHhJawbiJ9RkOKtgOvhNRLs
         MR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wALYLFYvqP3KlW75uSv2orC/HaDtSFkS9N2k08alarY=;
        b=Hx68kAqGC0YxMjYiAmPNbiJppCawTUiSKjjh+kjyLeNpe26q0i6w35Nzh0dp2B2X5y
         DyPB6+XwWAxJOxLZEFlFgOnVDIm1h5V/mXN5O3Z5qKnakK7Q0wUncVltOnHojjPhOFaR
         mFSwAxwXx6fcJ8YBur6PVIda/5lARoycfQegyg99x8las5EiHOGx7Cj+KFNODi63UeAy
         Qr9WnBU9qCms3EyAvUB63W0JPx4lzyKAWwnQaj3FouiUJPhNhawqVHd0ymNRxiwMhSVj
         VDYFw8+P4ZNxjqgCpYB65S8By+zv+yX/tPYQaPA8qlfIpiopdRg2CbN1WnkfsRFXEqk1
         1CdA==
X-Gm-Message-State: AOAM531bVyecBtHUVsKHlmVEeZPRlXPDdb/K5O3PyFRMjLw+csf969eb
	qkDxn4TkxyAajTcOAk/geGGuKb5EMSTVFA==
X-Google-Smtp-Source: ABdhPJxuQGJz0ROyCEikPR5jVh0fe0vYz5SH+gVBNuk1EvsgVLDg9FGik6ZxDi3jwSoXsLFeJJJBPw==
X-Received: by 2002:a63:545f:: with SMTP id e31mr22684649pgm.327.1610905026505;
        Sun, 17 Jan 2021 09:37:06 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.37.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:37:06 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 25/31] wireshark: Several securtiy fixes
Date: Sun, 17 Jan 2021 09:36:30 -0800
Message-Id: <a10ea62a1c9c7b0c4810f2e4ef0dcc6f75b0ca6b.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

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

