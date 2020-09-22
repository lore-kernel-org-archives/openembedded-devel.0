Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web12.2637.1600758934588629135
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Sep 2020 00:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DDSLuG8t;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id x123so11599268pfc.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2020 00:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2CfecYB2DTUaxNnHu3KexVJwRg1GScviLZ/ebVGf4RM=;
        b=DDSLuG8tGtDcTkXUHo02GhaLCXotTl9YU7ISAW7Kz3fmUZXwskRQP4ZMEIcFZZ9LxQ
         aEYvjcWS0P77RSc0sSiQAgIf82B5TkKrRn78+FzHWoZ28FASZ+x1tgShUJO1LNrAaDub
         BVqpEqtqssXtkI4beCVh55f0oHx9TsOiKdW63H05Exzh/A0/0Xv7wbbt600pEaMIdpu0
         by7I9Y2RxkctxtACEAXLy6G+u9IQZFGAnHnrUeKehshiBSx2yxv2CeKnKzEgOY19cvju
         Msfp5rOf8Hr4xGDPBOIrTNXgPY9DjbmcB3gSm0VtGJO3U5kCspvDYLw0JINTJgMDjS0/
         dLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2CfecYB2DTUaxNnHu3KexVJwRg1GScviLZ/ebVGf4RM=;
        b=Vj08vU2GhQgtdZ5rEUonjsuGnGWmL9TshFA9xMqGQRgfvaa8ulUqIzTmNpnLAt8hnJ
         0oW8w13ezyTUnS8n+nVcUjLAP7HkYFkjXdXmWbqU3flhRclQqYK2ij2RpXbmRLMRwAFe
         j3MnwyfkpUC7EXSg1nuGQzIlB5UN9t1yi6+dt+r3xoL+p4IMQlYS9RpdAIhiIX1h0lLu
         KjBaSxmwGwf9MceDfA28l4iPZYynk4Eewt2bavuk9KBtIp5XpSajMhR1QMoUc1lp2TCk
         Ub0v6VUvUy56TfdNS/Pj+Ea0wN0b/ah+G8XEI4VLDBvGwvL5mgJQUv/WfFTg+ciOo1Mr
         X1KQ==
X-Gm-Message-State: AOAM531UdmDg3de29Lm0yIh2tySEiyWszIYeyw4mgM3m8gUgIYj3MEYB
	TTByfEfC1ZzWWE8bcc7vQfb6THAIvZY=
X-Google-Smtp-Source: ABdhPJygYey1xl3jwZ/rRvub3Kh8PbtWw0cQlh7XirVdq5AN3iT4eRKhJUyPgSsdiIlKqhRpf3S6Rg==
X-Received: by 2002:a65:6a0a:: with SMTP id m10mr2435633pgu.162.1600758933897;
        Tue, 22 Sep 2020 00:15:33 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:8176:7362:ce41:2f0c])
        by smtp.gmail.com with ESMTPSA id q5sm14043963pfn.172.2020.09.22.00.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 00:15:33 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python][PATCH v3] packagegroup-meta-python: -jinja2 -markupsafe => ptest
Date: Tue, 22 Sep 2020 00:15:31 -0700
Message-Id: <20200922071531.29259-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

The main recipes for python3-jinja2 and python3-markupsafe
have moved to oe-core. No need to duplicate them here.

Instead, we add them to meta-python3-ptest sub-package, since
we do enable ptest with bbappends.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---

Change in v2:
rebase on master, duh.

Change in v3:
left align " same as other groupings

 .../recipes-core/packagegroups/packagegroup-meta-python.bb   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 914359a868e..f62117e6346 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -228,7 +228,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-mccabe \
     python3-kconfiglib \
     python3-grpcio-tools \
-    python3-jinja2 \
     python3-jsmin \
     python3-greenlet \
     python3-idna \
@@ -455,6 +454,8 @@ RDEPENDS_packagegroup-meta-python3-connectivity = "\
 
 RDEPENDS_packagegroup-meta-python3-ptest = "\
     python3-cryptography-ptest \
-    "
+    python3-jinja2-ptest \
+    python3-markupsafe-ptest \
+"
 
 EXCLUDE_FROM_WORLD = "1"
-- 
2.25.0

