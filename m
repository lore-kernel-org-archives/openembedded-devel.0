Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D43CDD0C1
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:21 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.21780.1729612088123485155
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TanWPNy2;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e59a9496f9so65456767b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612087; x=1730216887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFinEZOifBCErZXT172XCBL59fKnlqDBUejiGzhKfjI=;
        b=TanWPNy204kqA9WUk/2uiZpaJbgj0FPjTuQUovx4FptK3pOw2N2tVKzo+KvHZtJPUI
         MO2/K9nC1l3OxKx3S9fjFEC6dOOwqyrGmQSkCbcX3QyACtQvnjGgLG/oa0P0IrcZmTRU
         3ZiBlo7SElx2f3lU2X72PnIwu1PYwIFczuUAoV5KszJ3AXJUGREcydxnwkz2pKdRtPsd
         sewRkoaOueGhaoOHmTOy9PgVYF657T4sJKnLHg3QlJMG4aIiyyzYliGeaFB1w3Jx0fE8
         CRCbIX+Srvk7q0GvZ2JQu+HSbvUSK6g0E3KkRGHmX5IGhrs+8JTa0zl6ZQ9Yqoi/nGbt
         qXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612087; x=1730216887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFinEZOifBCErZXT172XCBL59fKnlqDBUejiGzhKfjI=;
        b=sExO5rAzGq5WDykIsZgUlmkS2Rq2typ6C8hdne4OrQtv7pjTtVlkYdCL4gIBBEljvv
         xduEyXN+85RskQGJyZE9iYNA308kFrLxoeU/gDwWBVljVR6SqUfBXVFZ2Eo7JxWR9ls3
         siMNcQBycINoOQrvTrFIpRZBy7CNUCV9B5Wm8NfQnTILrdULHybVcaDT/npHdI/jq3Bg
         JD0e50x/7zDUMjI2CZ1/kuboEP/OCflSkpX2xcCZ0F6xJQSlCWrks5RK3EL5xKZ8gdiM
         A+ndb0m8PaBS81vOynQ/a6Tana0PwgWGAGaOroU7iIFIkp2ctewr7/3wri0WrJHrA7ix
         YusQ==
X-Gm-Message-State: AOJu0YyKCTVL2aSQExFxzWPBw5gMY+vptjcE/Q7hMlm5UunejCH1wv0x
	nwE1036skM2YTK+tooVPb9/A9Up1x9iJlnOcdF9V6By8XTVC1ylRcc95lw==
X-Google-Smtp-Source: AGHT+IHEnrYztq3IKZzwlx4ubxiHcIGulf6yfA9cPMKHk3Kqsgn1OeojQlvXK9z3APZvr6WJoDd6KQ==
X-Received: by 2002:a05:690c:4443:b0:6de:351:3e with SMTP id 00721157ae682-6e7d81e7450mr33398847b3.8.1729612086702;
        Tue, 22 Oct 2024 08:48:06 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:06 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 19/46] libhtml-tagset-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:37 -0400
Message-ID: <20241022154729.20331-20-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113110

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
index c871b97c3..a0ce7c0b2 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
@@ -8,7 +8,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=62;endline=66;md5=aa91eed6adfe182d2af676954f06a7c9"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PE/PETDANCE/HTML-Tagset-${PV}.tar.gz"
-SRC_URI[md5sum] = "d2bfa18fe1904df7f683e96611e87437"
 SRC_URI[sha256sum] = "adb17dac9e36cd011f5243881c9739417fd102fce760f8de4e9be4c7131108e2"
 
 S = "${WORKDIR}/HTML-Tagset-${PV}"
-- 
2.43.0


