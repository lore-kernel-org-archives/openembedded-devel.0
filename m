Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.1826.1621647336386284461
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 18:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LwDt4lZS;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id o5so16296346edc.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 18:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eQKjtA9AralD1I20V8ONf0sJ2eqocwXjbRK2pLbB3Bs=;
        b=LwDt4lZSFoLQqLR7Vq54dDxzSVi8IyJqqy8hozE0xXlFXy/rRH8VculRsdP2c9OD8c
         rJf05eMv5zI4c+yCV94MBS7r1Kzv+qE0tNjkHSKhnHtDJWGw1ZrEytpd3+CSgTCqXFTh
         gyiD3beKJFS8GXu3ZlCoy752ptAHXOnRUVAHckmqKMa/n4N43/CixFkW1eVzhM4/nWoR
         HwealtXORYXaL+pXMNPNo8rQCQTfmXtVdX8LGjfraRBuZOcp6uj50tx5vVJIGLXWnBCC
         XLZ7cOr+Eq2RF2rPR5vOdIeaxM5+vRTCaHfZhVg8npeMmwXEI1BmSLkuRITgXd63kHSs
         Fb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eQKjtA9AralD1I20V8ONf0sJ2eqocwXjbRK2pLbB3Bs=;
        b=VK1KFsAgCdmqPN4NNIYIwBS0R9wipcvRWtyaExwLAgZlvUPzMlFBCSyv6Wvf6/hvAo
         r5Bapu7elmrGjxWt22Azmqst/JtPQcHeoJ7Z+XhB0Ndy+PIFuD87Y92ylxWqsRYqFaM0
         yzJs5HvrMUT0RSGukjMdc+RPp2V12HM4HKuOLIHFjecpnC/gfpIv089QLyE+w+qUWhNM
         Bq1LL1p4tT+lwIGZ8MKDKcCKPWB+OX8p7gyvVok4bNnCLj0OC7MkJ+0RzBx9T9/uUId7
         Rq/c8/tIKi0pGd2VjR2PUZENQ31FsRNoj/jnU0ESOTnNMLQiNeaFs1+3MyqGUfCSCtKW
         qKjg==
X-Gm-Message-State: AOAM532D6dEOF2gcA8hTRhpgRSuhZedwcVsORpHKscE1mx+k35X5UONW
	gcuMMU0JHcMn1MR3DlJfosWhyqPJgJE=
X-Google-Smtp-Source: ABdhPJzMiat377PJpL8FvUPKcYMouKvfZnQi4MHjdeyOVsXLnxGNBrMTRb8QOGhQqvbQt6tR5oCL0Q==
X-Received: by 2002:a50:9e2e:: with SMTP id z43mr10139487ede.70.1621647335030;
        Fri, 21 May 2021 18:35:35 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b69456ae2a4ae47bbb1.dip0.t-ipconnect.de. [2003:f0:7f1a:3b69:456a:e2a4:ae47:bbb1])
        by smtp.gmail.com with ESMTPSA id p9sm5361337edu.79.2021.05.21.18.35.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 18:35:34 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/17] snappy: upgrade 1.1.8 -> 1.1.9
Date: Sat, 22 May 2021 03:35:10 +0200
Message-Id: <20210522013521.588774-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522013521.588774-1-schnitzeltony@gmail.com>
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Get sources from github repo

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../snappy/{snappy_1.1.8.bb => snappy_1.1.9.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/snappy/{snappy_1.1.8.bb => snappy_1.1.9.bb} (63%)

diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.8.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
similarity index 63%
rename from meta-oe/recipes-extended/snappy/snappy_1.1.8.bb
rename to meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
index d6d1e4110..2ebe3760a 100644
--- a/meta-oe/recipes-extended/snappy/snappy_1.1.8.bb
+++ b/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
@@ -10,10 +10,10 @@ compression ratio."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
 
-SRC_URI = "https://src.fedoraproject.org/repo/pkgs/snappy/snappy-1.1.8.tar.gz/sha512/efe18ff1b3edda1b4b6cefcbc6da8119c05d63afdbf7a784f3490353c74dced76baed7b5f1aa34b99899729192b9d657c33c76de4b507a51553fa8001ae75c1c/snappy-1.1.8.tar.gz"
+SRC_URI = "gitsm://github.com/google/snappy.git;protocol=https"
+SRCREV = "2b63814b15a2aaae54b7943f0cd935892fae628f"
+S = "${WORKDIR}/git"
 
-SRC_URI[md5sum] = "70e48cba7fecf289153d009791c9977f"
-SRC_URI[sha256sum] = "16b677f07832a612b0836178db7f374e414f94657c138e6993cbfc5dcc58651f"
 
 inherit cmake pkgconfig
 
-- 
2.31.1

