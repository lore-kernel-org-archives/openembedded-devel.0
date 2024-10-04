Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D6ACF8860
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 21:45:43 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.99.1728078336158970150
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Oct 2024 14:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lUvDc4xO;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20b86298710so22614435ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 14:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728078335; x=1728683135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRmD26FMTsTk4sD/hL7CLupjKAuW3hcrZTX8VSYmnV0=;
        b=lUvDc4xO3F5L0dHJr5F2BjPvu3HD/8cYgV+6XjXkYvwZnCctRxL7T8ylZyp5uBwnzo
         dM2T1bpoKeRXoTIXnCEmJ7qAIrUwlW7BXTMlzsiajyfHOEl/sUuP5SJdFh1XJZhixcSk
         IIP4+VdQq2ooAJJ/hY9mgqyAyS8UUmCLGx0T/zolCjnqG0xXqqxB2tU8AAo2ZF9mOFFb
         IQoFw6D2yfix2ZMXpii+rPnxKBjCSu3+UTCqH+2QjE+yd5B9gko2IS64y91CYHdMSjYN
         QWnG1CzrmaJshBd4eNrlFf/tvUW1CAe2X0kX9uTtZEOJE57j6lWNNhATeVX2eTZHrJrD
         MdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728078335; x=1728683135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRmD26FMTsTk4sD/hL7CLupjKAuW3hcrZTX8VSYmnV0=;
        b=wMDlTpY4BdGRofs84Yp9k1stTnmkrFZ5MYh4GTVDkKjAHK6qAq4p09gH96Ba/KNgfB
         ubQuI7yJ4ejf+78diHCOuF1HbCtlnPp+tkb/D6KGfizPQdda3/4Hp2Z8KQhBhzpCoxo2
         ljg9croGZS4VBbGmtOGO9I1PR6s5bk6/8PhF5NkqMjYF8VargL87IjMH2FNdaPbyjmvL
         trjYFukDujf04/vHN9guvxjqj4sXqwPnw4pf6tGwd5cVFeg25HnS+Y9hDIP4/tPuj4GQ
         iwqs2hBdrx4TFY6kF/zHJHqxc9Mq8Dbm59DmDhsEEPNKb6HjSA9SAArkcz0tPtKf0JPz
         kiAg==
X-Gm-Message-State: AOJu0YwU+4XrIhOmyJeCA1fOZ6xyVG5+918iaRI1TT8LqJIgWulNSvw9
	upG1HiSVcYv7YokHPEfDntwtssIRn0NyQKA/EMHVEnebctX87oxPVVnKUoli
X-Google-Smtp-Source: AGHT+IGRZtiBIfgA+A5NR6LIlUjzdfDkyPoRU/IvC8YE66Nyexvg/4ME/0cBZ/UEoFBSl83ZEUpCvQ==
X-Received: by 2002:a17:902:dac7:b0:20c:2e7:1165 with SMTP id d9443c01a7336-20c02e711e1mr49876785ad.52.1728078335350;
        Fri, 04 Oct 2024 14:45:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9f70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13992b84sm2957955ad.284.2024.10.04.14.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 14:45:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] fuse3: Add missing rdep for filecmp python module
Date: Fri,  4 Oct 2024 14:45:31 -0700
Message-ID: <20241004214532.2503043-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241004214532.2503043-1-raj.khem@gmail.com>
References: <20241004214532.2503043-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 21:45:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112670

This is needed in ptests to run successfully

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/fuse/fuse3_3.16.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb b/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
index 47b070557d..e75c88210c 100644
--- a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
+++ b/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
@@ -29,8 +29,9 @@ SRC_URI += " \
     file://run-ptest \
     file://fuse3.conf \
 "
-
+#python3-compile for filecmp module
 RDEPENDS:${PN}-ptest += " \
+    python3-compile \
     python3-pytest \
     python3-looseversion \
     bash \

