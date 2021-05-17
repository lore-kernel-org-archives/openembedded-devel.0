Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.19742.1621261512722081788
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 07:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SX4qAFoH;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id t30so4754659pgl.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 07:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=z3KROhxA3VUkom8r7qn/S44BOciXBkb3zdnJMFvRrb8=;
        b=SX4qAFoHQKqvcUejLPjOM1/teMey1clqktyvqFRPqzCddX+BRgOrrV3XJfcs0jd7V9
         I+ZY8+ZRa0tQ8+ym+BO4gG0AhV4eaJSq88B1YonDNE5TRb1VT2xWlefFR1c9613qLhMq
         znvPtV82hFvPRoOi6yoAUFmYzLyeKSwsJx/Cyr3qj3TyOTIKxRQbPUmTJ+GW2EiKhD3b
         Kkfivwc8FfuK79lnVbsfpQBpKFa9vmWe4Abn7pNnxDs51/sVpTqqQl2DMOO7MfWS/A5g
         NtGRaIvpkwvQoh8pT2yhF+bCBnYd/ZJwwssptOlwdP+MkiBLD4BcRybvZu0l23npmFFA
         NJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=z3KROhxA3VUkom8r7qn/S44BOciXBkb3zdnJMFvRrb8=;
        b=s2uR4SYMraE5xf1ZFUy8w/WTzZDWpPRWBeQgkO3pR8riAZiPLPSH2O3etxWd5L8QRd
         vVPPNB9CXE/wukuqc5SWqsTp6Xw/9sOB8quoEoZOq8hjQmnXRC6/Rc5L+o3bQXEO/+g6
         8YNLZaC+IyuOgbiIV6Q6SbSykQyZZhEqJ6Y5LoQbAzwjbOWcyYTOXGYJNaQTuV6AikmS
         heuhS2ULAjfjhV9fb1HGV9BLgFmvHkkAljtwP9cckm5H8D3/5A25IHR87r1XtugDSN9f
         h2lWDNB6F9bwzMCrIb2nhbG0G0NFMcYQ+IG9pL5G5+KGNZ+0jDQGAOMF9kGwCG4zyovD
         +xGQ==
X-Gm-Message-State: AOAM532gAFwK67Fdx7Vs76YkpEqdcwXQzAa6sN2zlhlcdsM7Tj9I852Z
	6wKW7JHnoLJSHkcU5S7otmi57VP5SKU=
X-Google-Smtp-Source: ABdhPJwtOLj79hUCQthqzznhw4QpecCUta7dSi5L40+nYdAxo9u7/Zp1vOy/HA1oduWk2ZIxm2Utvg==
X-Received: by 2002:a63:7148:: with SMTP id b8mr61456087pgn.278.1621261512165;
        Mon, 17 May 2021 07:25:12 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e1a5:920e:5720:62fe])
        by smtp.gmail.com with ESMTPSA id s16sm10872008pga.5.2021.05.17.07.25.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:25:11 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 05/11] python3-jinja2_2.%.bbappend: Delete
Date: Mon, 17 May 2021 07:24:58 -0700
Message-Id: <e1cd1eb15376b3911a6a9a53ede30c9bb870e5b6.1621261426.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621261426.git.akuster808@gmail.com>
References: <cover.1621261426.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

These changes are moved to OE-Core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit d131aed9e16f50a38a09bd28e7f29b94a3766adb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3-jinja2_2.%.bbappend              | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend

diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend b/meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend
deleted file mode 100644
index 9fe358427a..0000000000
--- a/meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend
+++ /dev/null
@@ -1,13 +0,0 @@
-# Main recipe was moved to oe-core, but with ptest disabled
-inherit ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)}
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-RDEPENDS_${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-toml \
-    ${PYTHON_PN}-unixadmin \
-"
-- 
2.17.1

