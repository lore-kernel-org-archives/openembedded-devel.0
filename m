Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.1459.1614975758209375682
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 12:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VPt09XDW;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id 18so2937825pfo.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Mar 2021 12:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zhNVZu/sSyIspe2flyK2qUAyIjs/D4/G96XyqKkljsU=;
        b=VPt09XDWXfOVgjvz9XEu+yeZu7iUPYJbXPurdvM/iOe+6tcBFb8w6M/QV9TG957tez
         BZQf1WW97No3LnxX5QEVfLbqkLlIRYzGeSxbJgsUqaM9zXjMF99IlHeChBRAi1GTAHv8
         339ZVhgRW5AFZZblq02990cg6WlZh/iFfg+03qtQk2EN9UBUQwU3ou4HV+mAXevh5dGm
         ifniKfKcUn+7vsKgsPM6Uh23h6CxS5SpIovAoY0ArLjszNoO3Q6ZKhCcUwMV8DrcQBOS
         xoy9cO8HExUxcKf9QNS1HBWRXBlDAda92Cw6lIc+RtgwjCMbPB3gczWTa2p5XGMTFxa8
         ARdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zhNVZu/sSyIspe2flyK2qUAyIjs/D4/G96XyqKkljsU=;
        b=XI5kZBC7WCYgB2TqT33ifWDRBm6FDhZmpvkxw02XdFy/OFqKVRbu/fNx8XixU9PC5f
         ZF66nJu9tHgA33/35MuW06EtuIjJYgrUrzoCGfDeLtFNAUshm2NZ2G3Qf9N9yPA3OmjZ
         ZO4zRYoBE046mZtgf70XtQNr8QOrfYhCGyBZyycSpfNsAKRuTUKJ4tZTuEk1pE2A+0rY
         gEIIOLhn5aNGop8DtwrsHsUL3Tckn/AEADt6b8iI9/2ySpM0J4SMlA6GX8FHeBkwl3Ph
         P40LZxFWcKBkGPc0KpRvjRqLpPRLfdu9Wrt3zTPrTW9OGVv60iP/cl/gemXdsocDnF4n
         90ww==
X-Gm-Message-State: AOAM531YqKdEmQT/FcMwknoQnqeokGRA07U4NWvmZtPZjFdo1kyvRu29
	RILwRsJ2Al0uWDPLo9u7t39o46uTHmzB3A==
X-Google-Smtp-Source: ABdhPJz5Z2Rz5FtdOq7D3kLtjoX/gw2egmvONXi5izpwuGzW0M/WcOPyCftO+RFZQ61LebmchpgPmQ==
X-Received: by 2002:a63:905:: with SMTP id 5mr10114499pgj.337.1614975757099;
        Fri, 05 Mar 2021 12:22:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id c6sm3340218pfc.94.2021.03.05.12.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 12:22:36 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] nss: Disable Werror
Date: Fri,  5 Mar 2021 12:22:33 -0800
Message-Id: <20210305202234.139391-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

with newer compilers we are seeing new warnings, e.g.

error: argument 1 of type 'int[1]' with mismatched bound [-Werror=array-parameter=]
    8 |     extern void pr_static_assert(int arg[(((long unsigned int)-1) > (long unsigned int)1) ? 1 : -1]);
      |                                  ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

with gcc11 and clang has its own set which triggers here as well, its
better to disable werror therefore, we still have warnings if someone
wants to fix them but they wont break the builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.60.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/nss/nss_3.60.1.bb b/meta-oe/recipes-support/nss/nss_3.60.1.bb
index 0d668ba067..344cc34728 100644
--- a/meta-oe/recipes-support/nss/nss_3.60.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.60.1.bb
@@ -121,7 +121,8 @@ do_compile() {
     fi
 
     export NSS_DISABLE_GTESTS=1
-
+    # see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99420
+    export NSS_ENABLE_WERROR=0
     # We can modify CC in the environment, but if we set it via an
     # argument to make, nsinstall, a host program, will also build with it!
     #
-- 
2.30.1

