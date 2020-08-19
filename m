Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.97745.1597870910993831632
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2020 14:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ioe0Y0qZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id r4so4572pls.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2020 14:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lVWS9PYZnfia7je/ErUrDi4cZajDyDefM6SjtwaM/uo=;
        b=Ioe0Y0qZcuPTWM/0/6yeZw30tqaHyY9Tx8JS4hDi8j93fCjv4PaymXhIvuFVPResui
         uS6NdW6VrIePqqmopKwrYxdRBzUZ9bJlFSwk2L9ATJNNGcGhmjdx4Iv+0l23FpcuOsRg
         0Ypyen27Ksfn+uNaHAXgGcYpMMSOSiYp7OaI/NYpmpBgUS2fYYcxpDb7LQujcdqbhwoX
         NlEFh4TfeJJbANenKRHh2D6wrFOBJbSgwUc8xRbUiWtHfzE/8e7jtGOibaPVbVhJtYeU
         wfIdxsnpb6RTSm2azlD2FM7q+1v2m+jHi3IzRd4dUfv65CHxsrNqNBxVkJryDQVSy2SY
         UIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lVWS9PYZnfia7je/ErUrDi4cZajDyDefM6SjtwaM/uo=;
        b=Wi2k4HKGwfUvb2v9CpxmJXhMxsp6C+6rp9ucYyldg9RYmvnowkv6/GMjMNkNENpSOx
         KP7sfMoP/vxLeMyrvSHtFiaXVsoir8xu4DM2xP9T7CpRqTWRNCDkRB4K93VmRnlZiA/W
         86GAvrKjzRvyEeXDj66AyO8p5iW6wbRV8NhJhXQg4X5R3c0A6USZfhjntQSMPXnP14DZ
         nL1OFm7Hi4zZd6kFeVCj1h79naHhHTvkl4O0rrqB0T5AcaKY5eqUQmizaRJOGG44M2OJ
         p8vgh8rcuDzS2BgCkHh2q31UEXMvjh/wRpFYJUayiCCOyo74jpyEvKAAYVC8CXqu+8+p
         F0cw==
X-Gm-Message-State: AOAM532nlPLqSRCaaDGkpMLWpBCXpZxP4c0xDsdCl7Fxfa3pmThKjPnO
	9236KMJOPbg5fwafPQYNtQTUo2wiAada7A==
X-Google-Smtp-Source: ABdhPJwU16uHa4NgvU2zdeNbAJbOSDZqMBTfxTgeHGug6B3/ghfIKg4GOxf0L0XRQeM/KxF3hJzKzg==
X-Received: by 2002:a17:902:bd45:: with SMTP id b5mr27179plx.22.1597870910170;
        Wed, 19 Aug 2020 14:01:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id b9sm111845pft.98.2020.08.19.14.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 14:01:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Stanislav Angelovic <angelovic.s@gmail.com>
Subject: [meta-oe][PATCH] sdbus-c++: Fix ptest packaging
Date: Wed, 19 Aug 2020 14:01:46 -0700
Message-Id: <20200819210146.1774046-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define builtin PTEST_PATH
Delete the systemd test fragment if ptest is not enabled
Fixes
NOTE: Executing Tasks
ERROR: sdbus-c++-0.8.1-r0 do_package: QA Issue: sdbus-c++: Files/directories were installed but not shipped in any package:
  /etc
  /etc/dbus-1
  /etc/dbus-1/system.d
  /etc/dbus-1/system.d/org.sdbuscpp.integrationtests.conf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Stanislav Angelovic <angelovic.s@gmail.com>
---
 meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb
index c4d63fd272..82860a82f7 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb
@@ -26,7 +26,12 @@ EXTRA_OECMAKE = "-DBUILD_CODE_GEN=ON \
 
 S = "${WORKDIR}/git"
 
-FILES_${PN}_remove = "${sysconfdir}"
-FILES_${PN}-ptest += "${sysconfdir}/dbus-1/system.d/"
-FILES_${PN}-ptest += "${libdir}/${BPN}/tests"
+do_install_append() {
+    if ! ${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}; then
+        rm -rf ${D}${sysconfdir}/dbus-1
+    fi
+}
+
+PTEST_PATH = "${libdir}/${BPN}/tests"
+FILES_${PN}-ptest =+ "${sysconfdir}/dbus-1/system.d/"
 FILES_${PN}-dev += "${bindir}/sdbus-c++-xml2cpp"
-- 
2.28.0

