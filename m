Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web08.28164.1624148848530789620
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Jun 2021 17:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XD2X6hXP;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id m2so11022441pgk.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Jun 2021 17:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GMw0X4Kh20pjo2g3fn/jnJj3khdqC7HUMGKQIG9nIGU=;
        b=XD2X6hXPyyYT/C2eVeKcuUqQTYaPb1iW2ZyLw7MUyVmnURliuFa8IW58ThoIzJg9nV
         FmoKuFIyyl7XdyajTWFw8PEFrySeDX/cs/PskN6XXWcwdX+m4AzmfZDzvBzJRVD2p4tT
         yMsxwG0icLPIfBQtP7qauJ2jwiJ/jQwl6LN0Zh3GMT5++GZTRKxzlQMpw0o3PtfbbvlL
         0qtwdwLgjtJdqFSZ7+qheGZvX10jScDyFYVP0r39cwMmDrG8ORtZQEyCvYup0/VyA850
         4vTv/Pwf+opLSbUXiTb6PoXQl5nMEsB90heQ43R2hOdKU0yrSjSZubfxrfe1YYCzoVCe
         b6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GMw0X4Kh20pjo2g3fn/jnJj3khdqC7HUMGKQIG9nIGU=;
        b=VGftboFj5LQ5ae/y7hUdn09rr+lmNQlER+t2qt/nSAeGSGROlM3d9WGrwJsSVfzuPN
         3qtMK0VnrTXAItjo5NExqxly8GFG6SJ/MowuySk5WB82KuENmk0ZTMJudGBUuQgRMWn7
         lklQiTiUFuIAGICuAO1cIQk+Kzcuo2m9v6QzzuHNlFW2e2V9xj6LZ50K4ytOKbpwcGxc
         bqS9GSVu8WwvyaMi+BDPJaiOMIz9DNfZUWLuce43ePWvQ6V0s22HifG81+t3IzgYPC71
         nADGdSGy3UwXb9AsZQtw7sFvqi2x04o5ki4G7WDIovztIQxXBFHMowzfmWIVTmbO5NNt
         Q3nw==
X-Gm-Message-State: AOAM532QyLNMEHhCRNogrGuXZ6c9B0nywSfnI+cqg6qnkipCGo9wnmia
	6qBG5HowdKQM2I9h8gyR5U+4xtCa5HT5Ww==
X-Google-Smtp-Source: ABdhPJzoMP/xB9oeLPUJTmkuKsJFJEeZ0/fDqT7bqknYwjnoO++dZm76iX78x6Le+flFOIUP7zSf3w==
X-Received: by 2002:aa7:8749:0:b029:2f1:3dd0:674 with SMTP id g9-20020aa787490000b02902f13dd00674mr12394549pfo.65.1624148847939;
        Sat, 19 Jun 2021 17:27:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5cd3])
        by smtp.gmail.com with ESMTPSA id b1sm2923628pjk.51.2021.06.19.17.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 17:27:27 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] czmq: Inherit pkgconfig
Date: Sat, 19 Jun 2021 17:27:21 -0700
Message-Id: <20210620002724.3894951-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210620002724.3894951-1-raj.khem@gmail.com>
References: <20210620002724.3894951-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is required for cmake's find_package to work

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
index e6a4bc4c42..27d3b648f7 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "5d720a204c2a58645d6f7643af15d563a712dad98c9d32c1ed913377da
 
 UPSTREAM_CHECK_URI = "https://github.com/zeromq/${BPN}/releases"
 
-inherit cmake
+inherit cmake pkgconfig
 
 PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-staticdev ${PN} ${PN}-dbg"
 
-- 
2.32.0

