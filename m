Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web12.42251.1606165688698154035
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 13:08:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C/yZKPfp;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id c66so16153924pfa.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2020 13:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2k+YfwokTadMzQEogBvzeqMt/HRreUdjgC+9KkV6w0U=;
        b=C/yZKPfpG3cNaoVjbV2aBLXarVbL0qep9xnG/GaBovFh77KY9sfzCSuD6iazLffsVf
         kpaoMa+f4Sxm7KDlhq/wrpaBbhQdgY1lJfD8O8yYzoA5iTP0RhKsBj5Xw/BQW14N8z6K
         sFUjGbmPKUxDqegX90ViMZ9fB76j7yy8ZrqJ/wTPMhE+8mWrGdCW6X/LV9cgVITNkGj9
         QQbRXCeDGoIb4E7idJsiw2u+DmcZ75vGuTNVv0Y2D5GHCohICo/UeOqi1h73qI9aB1u/
         DXp1mRsjqeOJiUGE85jkDBkEZ7m6o6fXC0wnAsoDjGrcNyfvYgQaEyAwYu08dDPB8i+O
         YLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2k+YfwokTadMzQEogBvzeqMt/HRreUdjgC+9KkV6w0U=;
        b=e0ZfYfIZ42exrtk/L+ObCYt6xEO1zodDQ6SNp6O4lREl/iAU6foQiJ1k8MJ2hmzrYO
         dW4o2Xz2+W9KKL9PusNIFVl51dnMawmj0/C9LjhJAUe6djf+2nLv33XRslJZYMESgtwU
         6PsIRadLwKj3RZz+tPFMPX21UfNj2BpSy6ikrMxYTDiH0gJoTShCHkOE9MuTivP+4dUt
         /6tVZpCQrz8CEdeb2Iy42sE6COqg2MqGtKMyyBH/+3t8ypxAfq4qHvxOQb6bMS+soSgL
         xgdivU28gq9CeKxYVexLUH9ng91l8sc2/w8l3LYuFk19cbhAS4wwsyk2JemdG5CUZvV8
         Gl3w==
X-Gm-Message-State: AOAM530Sbxt01/1QJ3hr27duWeJpMC55qRx26wuxSVpjOP4dnt7Yqvip
	U4s3TidjKWvSP25/y1U9tk97Y6jZwNW8dQ==
X-Google-Smtp-Source: ABdhPJwkJJ8J1d01qyYM78qK7l+yZkhU17sZ5wukDVFNRIpaudM1pMPHf6GSw5nnc8M87x68FJaPeg==
X-Received: by 2002:a65:6547:: with SMTP id a7mr1102251pgw.198.1606165687758;
        Mon, 23 Nov 2020 13:08:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::ed1a])
        by smtp.gmail.com with ESMTPSA id g8sm11666883pgn.47.2020.11.23.13.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 13:08:07 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] packagegroup-meta-python: Add newly added recipes to packagegroup-meta-python3
Date: Mon, 23 Nov 2020 13:08:05 -0800
Message-Id: <20201123210805.8949-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 142687f30f..024503d5da 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -429,6 +429,9 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-dill \
     python3-cerberus \
     python3-cvxopt \
+    python3-sortedcontainers \
+    python3-hypothesis \
+    python3-jsonpath-rw \
 "
 
 RDEPENDS_packagegroup-meta-python3-extended = "\
-- 
2.29.2

