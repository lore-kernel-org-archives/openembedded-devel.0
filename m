Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17C5C636CC
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 05:36:47 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.4581.1675402604040540185
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Feb 2023 21:36:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K1yXHy6e;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id v23so4239945plo.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Feb 2023 21:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QsDLAt0ZmZGyId8z0vjyelU9IRIKpbkUFAXsxJToCY8=;
        b=K1yXHy6eeMWxqPscRQBCqlJSH8ihJExHM1F49CExhfUW/BLO130avqSY7BqmpxwVjJ
         hH+5Ro39QHnMmE8e7/xmJwrEpcVmtmlej7ju8SIHvJaY2Tt9uovTOlNZ4WuoEpGT8Her
         5x1YNgX9RjYsCUgR3RAC7BrFbAT039MH1SDNEZKWIXS1hAMkiDAlhA1vdOFDgXpv544u
         ZpUFPnot5yNOv4tRjUK+ZDcOHI8R+ymUL7e6R2gY3HwEIEijKqfA6eQoPouJj4uQOcsY
         WTOAL3XH8KB8ockrWycmo4vQJ77pzEBz0Vr7QaiwD7EYD0JmZMlzub8yE6pexmrSz8gD
         z4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QsDLAt0ZmZGyId8z0vjyelU9IRIKpbkUFAXsxJToCY8=;
        b=apeS4dNNf7VsBFSGfoqmyX4GpklnyM5LaP4yRA6yZtYUvsgzh7CnRq7HU9CLnZwikM
         KiggkdKH4ai+oV+urrQLBU7gWR/ic6PTLFXMl8BlHf1iMXThHbEfarsvhijnkypRz5+2
         EPMTJB6EXsEe4rE7D0GGx20oEiVaqYQ7vzwPuTJJ3Z4gUziZOgDdtUHwYEq/le6nVso3
         dACCzSphAkVaukxDQJauW3J9aG2xPoQSfR16I+BQz1hdEqmg9l2qNIfkTsaIaa5pFQqc
         bKvZ9KqSb4P2eGVZqYkypfUACTt5ikF1qvpp2VxNbWRMqcC4ltDCbVhm4Tw+7igdex2C
         sKYA==
X-Gm-Message-State: AO0yUKXyL/uIX4puAqqGvp/1pRh8JHHKvji7eGYA7TyWWqHfjWkmkegp
	oETUCV5UmJYl4mxMNVtaLyjjZQS+f5QSjA==
X-Google-Smtp-Source: AK7set8fzTha/bhex3Jky42fiSI+SLnyJvVdJqqIZYPPYAMyR5JEoJEMwkTVzZDzF3eIZ0DBbL3T0w==
X-Received: by 2002:a17:90b:1e4c:b0:22c:b1c5:ae87 with SMTP id pi12-20020a17090b1e4c00b0022cb1c5ae87mr9196724pjb.45.1675402602999;
        Thu, 02 Feb 2023 21:36:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id y1-20020a17090a154100b0022bfa25dd88sm4119410pja.40.2023.02.02.21.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 21:36:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH] zfs: Update to 2.1.9
Date: Thu,  2 Feb 2023 21:36:40 -0800
Message-Id: <20230203053640.1767447-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Feb 2023 05:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100919

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-filesystems/zfs/{zfs_2.1.7.bb => zfs_2.1.9.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/zfs/{zfs_2.1.7.bb => zfs_2.1.9.bb} (95%)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.7.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.9.bb
similarity index 95%
rename from meta-filesystems/recipes-filesystems/zfs/zfs_2.1.7.bb
rename to meta-filesystems/recipes-filesystems/zfs/zfs_2.1.9.bb
index d328cbc27e..77daab7dd5 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.7.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.9.bb
@@ -7,7 +7,7 @@ HOMEPAGE ="https://github.com/openzfs/zfs"
 SRC_URI = "https://github.com/openzfs/zfs/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
            file://0001-Define-strndupa-if-it-does-not-exist.patch \
 "
-SRC_URI[sha256sum] = "6462e63e185de6ff10c64ffa6ed773201a082f9dd13e603d7e8136fcb4aca71b"
+SRC_URI[sha256sum] = "6b172cdf2eb54e17fcd68f900fab33c1430c5c59848fa46fab83614922fe50f6"
 
 # Using both 'module' and 'autotools' classes seems a bit odd, they both
 # define a do_compile function.
-- 
2.39.1


