Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7759.1793057192807273443
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 16:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UiVl2pk4;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-181516de561so257833c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 16:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793057192; x=1793661992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bYNx+OQnU08EZVxw8IFFGe7RZZcPuttfNfXV5f3v65c=;
        b=UiVl2pk4oDe0cTb7QvlXuc6Ge4RbUszQ9UFjsjNv9MsXwAa3eLq2TFXGH5J5/YcL6Y
         L9z2C5WiKUgJTM/AX8WLf+AwhqJIndfQx0ZW1bbjrnmoz7eicjtVJ3nZ6b5m07I92Ayb
         TIaAmTVPkQN6vMUU/0BAyDIVO2HilJ/0WzWzbOSwkt4cx/zsA/wvZF1t1+VoMDtqLRja
         oqWLj/nFjkTyFkWO2ACFo8fy7urSQG8lwxsdYOJ0Wv3E86J+FGi4ci7WfJWR25jVniEg
         CApr8+qsNePI9JG2tzzCPLdeBjxsTLKmC2S7TClLq1tapTXh0vzkQqjeGmhnsoQXrVfc
         3Buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793057192; x=1793661992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bYNx+OQnU08EZVxw8IFFGe7RZZcPuttfNfXV5f3v65c=;
        b=0TYl4CAm/WeQgTFlUs2vZ/PWGLvJ6S4r8Ot9EDhnVZDDGwMWMf8WdpHIydPqgfN35v
         6vVa4cDRY6MFdq20078a8dnJq8mekv6FTqAZyRRdiMabcRFBabnzwowPi0pzw2rEPMdX
         6yDsA60Ca/CAZ+RgVpU1wqjyGRxPlaFLdRVos1p+bfFUoh1cRUYWO692VpF77wsa4l/E
         8YjsmQMjgkMul+SiFwHZw0pvigtxKgS8ZyUgcIqGTmhInxCMv0Pr29KpygzJkpmiyPl3
         RctUKFh66qK3kFKXbFSgoTDX6Ymcssz22P34Ip0U3SDSbPukj1Lj1M89gDGRcoij8W7J
         JJVA==
X-Gm-Message-State: AFq9FYJyLEcgOlym/EbiAdJGkdr8usieOOL/egEyGsEFcJDyaFutYCoN
	jxXpdg26aBFXbUymBM3CwE+9ubVEEcN4ZTD9otAxRbH3U0ZAybfzF3OJsP22tA==
X-Gm-Gg: AYBFou2AKKrJpoPJUSBLfIHEClJxeU0xioErW1HozrO5+16Ert4whyigRLhEQwb8JHT
	N9t1Cp/F/IFY2Lel9veqgZTZYyJIORQEWIOgLPgC9kwp4cT6VoXPTj5QeXoAfsXE9VU3GC8zwPN
	p2giXm3UbAGjE/mI8rPCG22zZ304/fChH8EdvBFKpT85ExmG4QoMdxxc5mfPkSFVjj3Ip5ntk1u
	d6PV9kLuxUDZTqrwaYBfdx9fHODVBYn4C2DGZwE4YgbjG3cVIL2kRlcTz/nL0aV5zxsamO+gWPH
	yXs5qfPnw+jRpJVC9UNZchWHEtNILmOQxUx1Si5bW1gWaiUX0Sj/9yFH76sIYKDdunM6Ws33ZNq
	hXCGH0YBAmeYiblUn2RKJigqu0ejWGhu/Hzhk81xXx0I1zVgmVlZv2aUcVw3sJvtQFDUqYG+ejk
	TwlkbkHSPFyWOhG9l8ZDqVuQn5RMOglRa8n9UjqZry4e+lpDb2vlKp/CnPfx3CT2Ma1SHiKBJ0G
	AvZfcOlTeRr60Vaua7l0Ek0HmJb98fttayeWWkiX8MwE7sSr6WZB696T1A5/lx6RjednKiJJjCk
	GIUMVXBjACXmSdk=
X-Received: by 2002:a05:7022:f8c:b0:1a3:cbd7:1269 with SMTP id a92af1059eb24-1a3cbd717e6mr1806011c88.23.1793057191832;
        Mon, 26 Oct 2026 16:26:31 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm32234982c88.10.2026.10.26.16.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:26:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 1/13] swagger-ui: upgrade 5.33.3 -> 5.34.0
Date: Tue, 27 Oct 2026 12:26:13 +1300
Message-ID: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 23:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131441
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.34.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.33.3.bb => swagger-ui_5.34.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.33.3.bb => swagger-ui_5.34.0.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.3.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.34.0.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.3.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.34.0.bb
index 6f69070033..688a2e52a3 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.3.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.34.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "38ca10e1867a66525751590d8d51011973107ad1"
+SRCREV = "a3d333d7e99611288312d597c4023ee10df721e0"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
