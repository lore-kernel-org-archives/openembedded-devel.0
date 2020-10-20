Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.10214.1603158096512358833
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 18:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i7T0JZpc;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id e7so178050pfn.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2020 18:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pwI2rQciHeEiJYn6LdF7SUGCuHyMe192GCGbWz4BB60=;
        b=i7T0JZpcbIy8zrRvMrPTprjTQRk0W1vjjj6Fn6JRlIVOLHlWnO6InwR7AuWCgF74wA
         3zpVm1nxaaqTlxPA1zRo4gFD+bpJGvOKeni0cJlE2/lzRk2RbuW0U81zM3wvGbo/8WNl
         UiO0n6nd+aiOfypE9nnEIfPnpMNXR7QB78VCEj7psAUGUPJU3jsHpgI3uQUT9SK0Im1z
         DdLPIXhBR7+GGETV9QVPgGYjXCQeZvA1YnlDDwcCi/OLFXKYGoLwbmBlrVYHEUZ41M1j
         0f5QZbISltbirOc8mCcuHfY8NOdeMXMhhrxzWAiOt7bXjyJcO6SMv3wkfogCGEFumWB0
         AClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pwI2rQciHeEiJYn6LdF7SUGCuHyMe192GCGbWz4BB60=;
        b=lP9uUK3SHQkfKCV0nuJO+zqG2LdQ+pzi8nf9uLbPFiDqlHchkmrOrQsw1bdJY1+Zki
         Y/eXKqNbo6aGxdLyCw8Jbsvd25HmyQkZQT/HlSlY/YmFBNIBh4TLi/H+9G3x/V2I/4N8
         3jidZRgcr0sbYX7k/eDJhouuaIpFjKttLESuonf4UVJ34nYo/dZWAwKZdpiVg1S28276
         yxCk1K+AA1uFlZCZQqMASCJIzSl9Voj033WLpJB7+jkfUt+9ZKqkJ32LQjzzuXtySoZf
         tTeKsldo1RZqSw68zbHb6+BqRmdCWAzG1i5ftlqTTO5fVvFb/jXy3SB7F0G2Y1lzyM2n
         P7bw==
X-Gm-Message-State: AOAM530xFtSBJ/EOI9hYVMUDo/i/FkxGqTG1KwR/Sx+UQFaua8pc+8y4
	k9czA4+6uGN/YVWUVXrO4t4rI4azIM7HBQ==
X-Google-Smtp-Source: ABdhPJzCttf+F7CKppr7PyGw+xG1vTRBqxtQcJsyFYk8783hs+IShE+bidpAGrg0gVP0SB/xxUwaYQ==
X-Received: by 2002:aa7:98ce:0:b029:152:5ebd:428 with SMTP id e14-20020aa798ce0000b02901525ebd0428mr419804pfm.4.1603158095675;
        Mon, 19 Oct 2020 18:41:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4467])
        by smtp.gmail.com with ESMTPSA id w16sm199226pfn.148.2020.10.19.18.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 18:41:35 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gianluca Pacchiella <gp@ktln2.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] Add missing dependencies for rsnapshot.
Date: Mon, 19 Oct 2020 18:41:32 -0700
Message-Id: <20201020014132.1048405-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Pacchiella <gp@ktln2.org>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
index dcadede0ed..33f5dccca2 100644
--- a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
+++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
@@ -13,11 +13,13 @@ RDEPENDS_${PN} = "rsync \
                   perl-module-getopt-std \
                   perl-module-file-path \
                   perl-module-file-stat \
+                  perl-module-file-spec \
                   perl-module-posix \
                   perl-module-fcntl \
                   perl-module-io-file \
                   perl-module-constant \
                   perl-module-overloading \
+                  perl-module-ipc-open3 \
                  "
 
 SRCREV = "a9e29850fc33c503c289e245c7bad350eed746d9"
-- 
2.28.0

