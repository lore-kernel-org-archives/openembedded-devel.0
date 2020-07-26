Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
 by mx.groups.io with SMTP id smtpd.web10.26422.1595759233241111647
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 03:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=tRTlZCM/;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.216.74, mailfrom: 3gfodxwmkakkfjtpxxpun.lxv@flex--wak.bounces.google.com)
Received: by mail-pj1-f74.google.com with SMTP id jx16so9769307pjb.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 03:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=y2YLB/ZfR9lpCf7IcLaIZOOBflJp1gO22GLQx/rEy9U=;
        b=tRTlZCM/XwG8/R/XXAJIE/tWiHDjXypuQhrGLXYB6EqCkmdPw2MJjXEGGnYvtaqA7s
         igJk80e6jK5pbWuqPbRDoMf+hPceTjPXQ4MF4XN6LDdJoQTR9koODeEUleK7OHVGAWtq
         cLi70OpmpEMaOO9rap2BFV06Cd+VKctMSsDFfleUt3sl4YyynSs4eQZ9DH1R5YIBDyAp
         Mh20bLbeDDeY623v8WHGvzR6jvFZ/HUW2JmS//cxmaHEDD79KBx+75ZPiaQVT1NHVwMz
         pCXu2o3//9e/H/yDxnRUZyiazE3KXZlqiGVbs6/ObXw0ubsizyepOt6DOr0TLxE3V5/m
         bSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=y2YLB/ZfR9lpCf7IcLaIZOOBflJp1gO22GLQx/rEy9U=;
        b=iO5ss+Ps8vt85fmSm+SO6VCgayKt1ZzCLidn6TdweDVfQAzW/sbddEBS0ghYjU0YbO
         ClUcnv+FFHEDSpfl0PAVKFw0f3NUo/LKAFFNVj7N9TBdCrpjPLUPOSC3v4OURCxWXPgQ
         dVV4ZHL5KffTZkdN5DTjV5v1DlqRBVl+LyqUsREmRQ/Yi27WJmzs3/z8TH4zDOmNwz23
         ockY3QGqQNu/CmKbou7eBJcD/59Hnfg/8u1fE5p+uolAFF9aIlAEUXrLq+ihCceEu6Hc
         BEUmbj2j7sfdH9MMROIYbnFtrpSnS7q1M7tbwbCJMBIRmX5vfyZIWPvTQCl+Lf+hOHI8
         V1Tw==
X-Gm-Message-State: AOAM532m8hSsA8GOjgu+YQAtAllNSoylpzJQXPDe8Zk1He9vLnSBhR7P
	0NqlEV27R+O1eS3Ae9uKkymGE5lZ+EhXk/MCyx7ttFYUZujueCjIMSPsZjKOQlPoq3pZFCxb8Gj
	gZVfh8vyM3ytFKrcpA/bOsV77m7YpnD+4DeUUMlQhg1XfPGzdPJNUF2pgjx/h/It43llAsh1DEq
	uY7UA=
X-Google-Smtp-Source: ABdhPJzsa1J5xF6u1s2T7BRoDzJ5D0Y02dCcV7phIjOYArOfyBvR/XidX6klPZX5p84sHLUflJR0rps=
X-Received: by 2002:a62:8407:: with SMTP id k7mr16145228pfd.258.1595759232228;
 Sun, 26 Jul 2020 03:27:12 -0700 (PDT)
Date: Sun, 26 Jul 2020 03:27:09 -0700
Message-Id: <20200726102709.648031-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
Subject: [meta-oe][PATCH] function2: 4.0.0 -> 4.1.0
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: William A. Kennington III <wak@google.com>
---
 .../function2/{function2_4.0.0.bb => function2_4.1.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/function2/{function2_4.0.0.bb => function2_4.1.0.bb} (92%)

diff --git a/meta-oe/recipes-support/function2/function2_4.0.0.bb b/meta-oe/recipes-support/function2/function2_4.1.0.bb
similarity index 92%
rename from meta-oe/recipes-support/function2/function2_4.0.0.bb
rename to meta-oe/recipes-support/function2/function2_4.1.0.bb
index 556a25aa1..56dc30acd 100644
--- a/meta-oe/recipes-support/function2/function2_4.0.0.bb
+++ b/meta-oe/recipes-support/function2/function2_4.1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Provides improved implementations of std::function."
 HOMEPAGE = "https://naios.github.io/function2"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
-SRCREV = "d2acdb6c3c7612a6133cd03464ef941161258f4e"
+SRCREV = "3a0746bf5f601dfed05330aefcb6854354fce07d"
 PV .= "+git${SRCPV}"
 
 SRC_URI += "gitsm://github.com/Naios/function2"
-- 
2.28.0.rc0.142.g3c755180ce-goog

