Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.21198.1610905617045643704
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lr/dcdwg;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id z21so9494643pgj.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=DDQIF3r4IYbHTzs8I4cgDeL4jURBIwmCjMhquAbvRuM=;
        b=lr/dcdwg2hmHXpsgVVPpN5CUZEBGLdR5MDZYrPC8uN4zEgGJsbd/Krl7kxvFNxYXy4
         SbVcQoNWNiIDpd6/xDUMTPofXSnCtbscQukKkCuyYHOE7lh1QaIh5zhvmxlZTJ8AN9S0
         wvJhaoJrdEa870eAT+BtNi3KCQqAi9ueDqvzeEiaHkxvZrs01zyvMjNnS5nnIQRla8Bq
         1ZHr6K8veg642vY+6SFaFFNuftWlHbQSMC8u6j7zoEQRtQxEkKxG553HLyaqsdqRo5FQ
         JMthnmMR2QQgT3DKqqTkR0j9aJthG3FF4CdbUAQfQWzDNZf26fQe7Hn/4LgK/aGXjqTa
         +dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=DDQIF3r4IYbHTzs8I4cgDeL4jURBIwmCjMhquAbvRuM=;
        b=oCJHLqbNBWym+bZzsWUOxGxBZc/DXY7dHElHTEsDlfGwOKH26vU2iB0VHHSXVQ2zFV
         7riZ2MRB7vEkzVtvI7ZZZpzTi2bWxLlxsVhkk95NmYl1PuoH0y/QIXuk/IOkn9rT6I5P
         Aju57pK8L6SOZpRFWnJL9x3H+tXxZZ0NEKJc+1GPJ4+Ekjk8yjZ2WXXcJusOMcOIw/3E
         ZKfx0w9FHgM9PE191eODJqlTqjnukr/qGfJQ1LDYh99S2jNqJkOT7i7t/wpLO/dbCKja
         oukL8/3yf9zEo5VCfTNk1kVvORMnQ/N9FzcWN0ihiQz+PSEhTmrY+wgSEFNoc2qETJci
         hZIQ==
X-Gm-Message-State: AOAM530vO8bQ2GYZDUDTMcqsmqLtWiSoEJhLEtYK7+tCoJYFd8oYDjHh
	dJOrP4OD2rqthjskmZmhFUtfMV+CsReaIg==
X-Google-Smtp-Source: ABdhPJzV/69upgkC1of3qETc3rLAmKbxcYNdTuvtwz3n3FuLNxT5j1N21O6Uu1yLprhoCtxXWy7V/g==
X-Received: by 2002:a63:5004:: with SMTP id e4mr22646155pgb.338.1610905616504;
        Sun, 17 Jan 2021 09:46:56 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:55 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 24/28] nodejs: 12.19.0 -> 12.19.1
Date: Sun, 17 Jan 2021 09:46:22 -0800
Message-Id: <42cb28ecd7074e92b281ea84eb0fe1a9583d43ce.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>

Uprev nodejs in order to fix CVE-2020-8277.
This CVE allows an attacker to trigger a DNS request for a host
of their choice, which could trigger a Denial of Service in
nodejs versions < 12.19.1.

See https://nvd.nist.gov/vuln/detail/CVE-2020-8277 for details.

CVE: CVE-2020-8277
Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a44015408253d8a4f64055f41fa1f497aeacfc30)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 387f40ce8068ec8848c2e3b76ce2e3267b98c3d6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nodejs/{nodejs_12.19.0.bb => nodejs_12.19.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.19.0.bb => nodejs_12.19.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.19.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.19.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.19.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_12.19.1.bb
index 9d15586238..8021fedf44 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.19.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.19.1.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "3b671c45c493f96d7e018c15110cdbafa4478e5e5cfc9e6eec83cea9e6b551e1"
+SRC_URI[sha256sum] = "74077e0cc3db000a6f3cc685b220e609807b61adc8e7d8243e8511d478d1b17d"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.17.1

