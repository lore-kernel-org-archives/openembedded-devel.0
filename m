Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web11.9608.1607054919887390431
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 20:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JRqIJsVC;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id t13so4058224ilp.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Dec 2020 20:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pM8HZL4KxVzh14wER/klvzZJAaDxsrQEyv12u+1hIh8=;
        b=JRqIJsVCbGu0sC9gQ70Us1UMsm5ipoaAbX+YJBw7mkajN5o8gbfUoNDdPMA5p6N9N0
         445CU+MKb93VXonZKEbx6UJVYtWQAfGXIK0mYUOtViGonfTdNF5/vS72tt9+ZQyHHkDV
         Dr64EVON2NlqfR4Pa3zOw5AIFK45imuVdYPq/FOnE1vNU4mFcRLSe7NXk+ayjlYgW+kk
         xzRMoRfKvjWMqxKKLFxjMxXzS4cfISZGlLAH8bO5RJIbCpGA/ap11eN5VwzaG5zJj6jd
         +9JV48Qu44a5FWznjJGLryU2P81G/0PjDxNgdTTJLY274lakihealv4b20lU1hqnXqhf
         71dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pM8HZL4KxVzh14wER/klvzZJAaDxsrQEyv12u+1hIh8=;
        b=dB+03n/ZDLX2MIry4hBdCTK37S2jAVhThW3ncUzAP07UWdGvbLx9Sbg+qQEcLxfOoo
         vnsP2a3BNOEwW5VlEW8WTLOGbhKew1vSOxq3SfxEsDwULMS4fTM8U1XbVnCaIz9Gswsh
         Lkva0YkZYz4wCPUWjyL+OrS53P7qz7Paq2mPlrGtw9urTYN9BIwrwsOby+Z3tFuO5WKK
         TkV//l7KMTBIS2azlptpzjd3KIKggVhcT60ANGT5Wz3no/53uJTrwOqH8ocXwxqlgv/J
         spM+pI6S8InqCgbBET2XC3zeC6wB67y5z0gfRGI98qNHFAzrwTnVAZll+/TPavQFqBIO
         CM3g==
X-Gm-Message-State: AOAM5306WY9WtUuFeVbOGN6fB5lE51NCi2Q6nfYajehhQGRQ+ZfIhTcD
	xmuJcQe+zRqx7b8VNgRVMRuhw5EIJUlYzg==
X-Google-Smtp-Source: ABdhPJyJkTtm8ZcF2xXuQdbQskhLmtlN0bJXHhIMYlrAmhCDGVChG6X9FoybvKbJdkhfXfJM4VD7Gg==
X-Received: by 2002:a92:d203:: with SMTP id y3mr3505822ily.206.1607054918655;
        Thu, 03 Dec 2020 20:08:38 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id u1sm661328ilb.74.2020.12.03.20.08.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 20:08:38 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3 1/3] glmark2: update information
Date: Thu,  3 Dec 2020 23:08:27 -0500
Message-Id: <20201204040829.38707-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.28.0.497.g54e85e7af1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to https://launchpad.net/glmark2 the preferred "home" and bugtracker
for the project are on github.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes from v1 to v2:
- Added. I had forgotten to submit this the first time.

changes from v2 to v3:
- None.
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 2e727a01c..320d07dfc 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -1,8 +1,8 @@
 SUMMARY = "OpenGL (ES) 2.0 benchmark"
 DESCRIPTION = "glmark2 is a benchmark for OpenGL (ES) 2.0. \
 It uses only the subset of the OpenGL 2.0 API that is compatible with OpenGL ES 2.0."
-HOMEPAGE = "https://launchpad.net/glmark2"
-BUGTRACKER = "https://bugs.launchpad.net/glmark2"
+HOMEPAGE = "https://github.com/glmark2/glmark2"
+BUGTRACKER = "https://github.com/glmark2/glmark2/issues"
 
 LICENSE = "GPLv3+ & SGIv1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-- 
2.28.0.497.g54e85e7af1

