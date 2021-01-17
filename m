Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.21231.1610905605379257031
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kFjrOcWI;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id y205so2990040pfc.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=DSjWY995DCcKMbyAIBW39iFQsl52yGThVI+1AvAEY/g=;
        b=kFjrOcWIA2HN2pXCBeXdwICc71qVNq1Ur7AVl/mnwQ8wOlCYAi1efJJkai5gbxph5v
         b4z3VokOoXvGAD6TOmp5tyVybU0kIqpFjgXGuabrFm+CyGVgsfuurUR/0gGv/zWs7NY+
         BdlcFOy+NL8bKNbSB6WjG9bFeBXSl37NMgnBqRk5AXtLEihaisnei0PTiV3reBnNzT0g
         WsjuHGaZGNmA58h11kxSat2oH1P1COAlgEJM14GTfWAsCJEq7wOQS1ih5fDDwR0fJfww
         W94XSZ5QnDvjNJAdZuIdXGYZ9tHPkmvs4kQLzhpZo5nLyEA8vezks3O/Q+cE++awgcN3
         47OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=DSjWY995DCcKMbyAIBW39iFQsl52yGThVI+1AvAEY/g=;
        b=NPPAglMRccy+CerivZY0PBeuzLzRGPIkQfdC+s8g0cXr73n/bcVJWjirKCqa+yZYf6
         ArSAcsn9iBUKeguTnaM5znILNyqSrlg9SsLkarXAZMRrKRgft9AakJoZnlJo18PyTP6k
         yCvjQENaxrYJY9Onl495pdTtcHPH36y3aCSRTAnGErSsJF12P4E6LGGjsI1dNCw0H8aF
         GmUsudobvw3dE9igiq6QMfCyJveg0vrrFnQD5wl6RjD4YihEsHEZTA9Pypt5no7yBVdr
         cSIjGgVk12W0tPgL8qKpQdaOWEPi1TA1QF8b0CvmFNHBK+h8R1i4Gcx1E6bgYSE/HGlj
         BWzg==
X-Gm-Message-State: AOAM5316Nz24DavU6A7mGXtJoetiqlqSmlg88wfD+XEafhkvL8oBQabt
	oTfszQ1kCotmuoXRBvbXMCGWIHX9LE5eJg==
X-Google-Smtp-Source: ABdhPJxA5XOVdU8S8VPiwOnVojwV/fzmqfDgoe3/ubhRyVTcD3I6SRCc0A/vdkLycfVVWSD4KHkykQ==
X-Received: by 2002:a65:6207:: with SMTP id d7mr22961262pgv.92.1610905604851;
        Sun, 17 Jan 2021 09:46:44 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:44 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 13/28] apache2: upgrade v2.4.43 -> v2.4.46
Date: Sun, 17 Jan 2021 09:46:11 -0800
Message-Id: <b64ba801a59bc4ade423d1429a6786e19d1c68d5.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

From: Sakib Sajal <sakib.sajal@windriver.com>

Source: meta-openembedded.org
MR: 105034, 105034, 105124
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/meta-openembedded/commit/meta-webserver/recipes-httpd/apache2?h=gatesgarth&id=fc995b3cfed86850ce5ab1b70da1e31560ac350f
ChangeID: 37b9f376c5e4b9a9355f867bac56454e2630d86c
Description:

Minor upgrade inluding bug and CVE fixes, namely:
  - CVE-2020-9490
  - CVE-2020-11984
  - CVE-2020-11993

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fc995b3cfed86850ce5ab1b70da1e31560ac350f)
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../apache2/{apache2_2.4.43.bb => apache2_2.4.46.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.43.bb => apache2_2.4.46.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
similarity index 98%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
index a7083d80e9..197cb83e64 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
@@ -26,8 +26,8 @@ SRC_URI_append_class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[md5sum] = "791c986b1e70fe61eb44060aacc89a64"
-SRC_URI[sha256sum] = "a497652ab3fc81318cdc2a203090a999150d86461acff97c1065dc910fe10f43"
+SRC_URI[md5sum] = "7d661ea5e736dac5e2761d9f49fe8361"
+SRC_URI[sha256sum] = "740eddf6e1c641992b22359cabc66e6325868c3c5e2e3f98faf349b61ecf41ea"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.17.1

