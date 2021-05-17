Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.19738.1621261508863808746
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 07:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DfQa3+IW;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id i5so4797677pgm.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 07:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=yRsNHHmbFsImNpEOWXQtehkQTTpWhRrsqhq+d9qmTiU=;
        b=DfQa3+IWWIVSrTI8Iv8odonsQHZlYnaeRJ97FooP7pPVsWNwBSSL8gaozQ6jsY7D07
         irGFMDjeUbrT9jpIG29zclbpNRTzY5N0ZU8y7XN3caivpFtXcmbXE2XgO4oalyY/ixLR
         p0G45f3KPMS0adSu2r3Sls844l4J7x+3bCLZEJQMWbDsVE3oZMDwhdFBh1zGwn3lPFWk
         Msft/pW3txKO7B9hlu9OdI1KeMTxfsp83ISJhJqpKJrPZf5vKFTpSva+xlEd10O9rk83
         2lu0d7oRossiNMSXwUYLoO39+OKCSeZ5xCTK6refDMlcQVn3XGbPz1iInBVbo+KRD59f
         EAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=yRsNHHmbFsImNpEOWXQtehkQTTpWhRrsqhq+d9qmTiU=;
        b=Rqp+Eik76U1au6qbMfOWGIki4iVwzw/9jEAOEo5Cmo+JNjSzyZmx9sH/BQPl0jP1Gl
         yaHQy7iwtudyTEhaStzQsGFSjV/x22H8A+RFY1zSPe7nYRbVlQGwXCx8fyR8KDYcNVpl
         kTZdR+4aEHbks3Uub8J3/oR2A/OboJGpe/BEjoqo4Dq61lRLLACaXFOhdefd0J7ipq+9
         rmr4P7jrRwBCdpK7KHpfNWndtc/tnfEO3JuV47TPJcAD396hlpaL3yRVBCIH7XLDWa1u
         IpDXsp2kxqwbMpxIa2iihEjVhr39tSCtHVHOZ0oXPQvvHY7DYQKddVBcBQd7V6Ni8a6z
         ksEQ==
X-Gm-Message-State: AOAM5338LT5hMfXdJ4FcwEZDg9TDwApWbAuWwDPY9QblK3TfO6cwTvZ6
	TL9fzZWDU3NHZkGWCmwa4et+q9Lznf4=
X-Google-Smtp-Source: ABdhPJxONQkz87xEVYjnIB4eduvbgUyolD5hYrtEPW3ShaiRblUZER7D2jwbUuuB7wbyWH07pJO6VQ==
X-Received: by 2002:aa7:8202:0:b029:2d8:c24d:841d with SMTP id k2-20020aa782020000b02902d8c24d841dmr11766689pfi.57.1621261508161;
        Mon, 17 May 2021 07:25:08 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e1a5:920e:5720:62fe])
        by smtp.gmail.com with ESMTPSA id s16sm10872008pga.5.2021.05.17.07.25.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:25:07 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 01/11] tbb: Disable PPC as COMPATIBLE_MACHINE
Date: Mon, 17 May 2021 07:24:54 -0700
Message-Id: <0cbced2d51a53830adede45aaa1a007a143ac906.1621261426.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621261426.git.akuster808@gmail.com>
References: <cover.1621261426.git.akuster808@gmail.com>

From: Saul Wold <Saul.Wold@windriver.com>

The latest version does not support PPC architecture, so disable
the it. Otherwise the following error occurs:

/srv/nvme/yocto/hardknott/builds/tbb/tmp/work/ppc7400-poky-linux/tbb/2021.2.0-r0/git/src/tbb/tools_api/ittnotify_config.h:338:12: error: '__TBB_machine_fetchadd4' was not declared in this scope
  338 |     return __TBB_machine_fetchadd4(ptr, 1) + 1L;
      |            ^~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8170a965d0cedaafb60d83c370dd095228088865)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/tbb/tbb_2021.2.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
index 7e57ebf555..771ddd49b8 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
@@ -45,3 +45,6 @@ LDFLAGS_append_mips = " -latomic"
 LDFLAGS_append_mipsel = " -latomic"
 
 LDFLAGS_append_libc-musl = " -lucontext"
+
+# The latest version of oneTBB does not support PPC
+COMPATIBLE_MACHINE_powerpc = "(!.*ppc).*"
-- 
2.17.1

