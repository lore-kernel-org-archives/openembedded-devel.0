Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9662FC77B7D
	for <webhook@archiver.kernel.org>; Sat, 13 May 2023 05:44:17 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.42860.1683956652673421743
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 May 2023 22:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PzlC4G+v;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-530638a60e1so3435243a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 May 2023 22:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683956652; x=1686548652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rRZCu8a2clZ5NqlTARicKLT3fHFmvQ7jkSHrKlcJsFs=;
        b=PzlC4G+v4Nr+vDD2xEfEDOUZu1pUp9HNnQxhWgjzreUW67YuOPyT1pcKBcALqq1/HQ
         QoOSXs3S76PjK2amxvQvtH+XY+cGDJ15o0+1fBwSVvdK+lyd+W9gphWEd2bcKSQlSux8
         fTQHJ4DlhCjxImRT6Hf3/fUqjA5kiP4LI/VdJ4g59Oxr6Qfj4N9Tw+Vy5PQEEM2daBXK
         p1zaGPmLW9TWVs+659jysVcXR8OWwCyxUEArmpFZ9hr8OiKb9Oxzkoc8K2cz4HxrmDAL
         mnZ44zxZl7ncVPJwqgQ/IV2bfagLj9Rvp6y75Wz7YCyBxsLdlYYkySW9dqm778wOQdW3
         vMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683956652; x=1686548652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRZCu8a2clZ5NqlTARicKLT3fHFmvQ7jkSHrKlcJsFs=;
        b=XrPD0MXQnBeYk7xKOmqKL9ZQqddbie92sIjyL+w63Ttg1wXkbinB+JdopikS1UwFg/
         dBbl0AMhHXpeIvP7RROxRcd8wPZ4rC66y7GAQzkXyWIm4YW1/13i6ZzWvXNEoYMxotn7
         BlIlMHMjwDqljUrkRkBG43thSDq35zFGm14Di60AhpGubqzngkNZSQhbYpsfTfde9TAi
         6t9bST2Y4Zf3rIlS7JOaIqk7h4ze781Sj4LEV2nXZnUUa28pzmbdAHIRqeMbmqnUcToc
         aZuGQivnS3pk0WuQ9RFCfQO0NrIRyW6f4SztGTZLF1x3kyfgz9z2kLbWH5eSwKIviosf
         rFhQ==
X-Gm-Message-State: AC+VfDy3+ZnyZmU5/TVacnH4W/Qg1YuTvmQJXt7nN7fFmdk9bv9DlvdG
	aXFRib3/NAO219iuR3NpZsRO+h+PyEApNA==
X-Google-Smtp-Source: ACHHUZ6JIEBkdoZZS0tYF15xHf2qj4Qd7mZFotFL3Wy8Vht8Yyqtnf4S7pNKhoHvoCTuTrdRQwWo5w==
X-Received: by 2002:a17:903:124f:b0:1ac:451d:34a with SMTP id u15-20020a170903124f00b001ac451d034amr35352801plh.33.1683956651638;
        Fri, 12 May 2023 22:44:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902690600b001a072aedec7sm8917694plk.75.2023.05.12.22.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 22:44:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] etcd: Inherit missing features_check
Date: Fri, 12 May 2023 22:44:09 -0700
Message-Id: <20230513054409.3297646-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 May 2023 05:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102560

Its needed for ensuring the systemd distro feature

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/etcd/etcd_3.5.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb b/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
index 3e7bb0f68f..9a8b9861f2 100644
--- a/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
+++ b/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
@@ -26,7 +26,7 @@ RDEPENDS:${PN}-dev = " \
 
 export GO111MODULE="on"
 
-inherit go systemd pkgconfig
+inherit go systemd pkgconfig features_check
 
 # Go based binaries do not handle being stripped
 INHIBIT_PACKAGE_STRIP = "1"
-- 
2.40.1


