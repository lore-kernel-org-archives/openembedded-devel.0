Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7789C4829D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 13:28:26 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.21310.1707226101048446128
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 05:28:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KYWkPbRt;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40fc6343bd2so37582355e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 05:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707226099; x=1707830899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0UEn2W8Zt7WdLhnePlYwiV2qQiRQszL5zczFWFQ0xU=;
        b=KYWkPbRtwhfScAFvdo36Ny1Zj5sfFTXhr5Fr7OIav5l004WaWIpMGye//HxB0SCwwl
         /IsQEf1NNoC8NK5SdaaguG8CtmAeS+wLWCgsqnZw5KhbvRM2/Jqeg8afcRFjZw7JqqD+
         0XVxBnoszFHctCjpXToscLJ4xonjMcfSyGqD7nT0XDReNVX3xJrVSCllG+QcwOvwk4na
         WkK0WCx+u2BeJfK2x6rJdiWm2b+v6pMWGJm0mxR3W+/Tauyp7UZ8jkX82ZoY+Y+XkjZw
         PG9T+E5HRKSQjF+AGwko7sZpfU1n9PfFiYEKCBMZxisIxXIHeejkpZn1bJ/I4Csj4ZJg
         eCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707226099; x=1707830899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0UEn2W8Zt7WdLhnePlYwiV2qQiRQszL5zczFWFQ0xU=;
        b=bxsbnrgGVNVgBctEr24zMmsqCX/OLDfk8xGOg58fSKSv3HSlP2I/ppKqCQQFyy0FP7
         1PE7VymNEWLjObxOEXigys2/EiP6M6+seYPXyqm7dtRlviWJZ+NhN0XXYzTmJg/B423W
         qKoWc06uRadsTiJjhxPbcSnJ+llrbbj0/MogUs9/Zb3fuqp3KvFrSVxql6Id+xTW6Ou2
         1/NfSALPG7tqnRY1TTU1z58nrgI5xsDM85mc2pE9XTSYgLhoR0xePZg8/FaQNIQMqJ6l
         punq10X74I3LlPiY13zQArCj0RXfA2FWztxJb+98jh8jCImKECSMTPvbOETfhv30hy/m
         We/w==
X-Gm-Message-State: AOJu0YwwoIc+/W9Kb0jw+rsHyLe4KQbJmMILJGwQIJIOn/70ruYeKa+d
	3QMynzgrGbb9PbeQLaZbIyVnZmdszTt0Tou5vwDc28e+UB978ihk6FPA+oyH
X-Google-Smtp-Source: AGHT+IHt+8nz0WZsGHdBgDmoiH2IU8E9LO25zVUCMn5U/IjhJ9Mj/lSaUOL34+Elg8+TR/M1uxB5aw==
X-Received: by 2002:a05:600c:4eca:b0:40e:fc29:f52f with SMTP id g10-20020a05600c4eca00b0040efc29f52fmr2023337wmq.21.1707226099498;
        Tue, 06 Feb 2024 05:28:19 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id fs20-20020a05600c3f9400b0040fd3d8ce5csm2003068wmb.16.2024.02.06.05.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 05:28:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][RFC][PATCH 4/5] ne10: append +git instead of gitr+
Date: Tue,  6 Feb 2024 14:28:11 +0100
Message-ID: <20240206132812.1362456-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206132812.1362456-1-martin.jansa@gmail.com>
References: <20240206132812.1362456-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 13:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108630

* looks like a typo introduced in:
  https://git.openembedded.org/meta-openembedded/commit/?id=6e431331d18ded23a78e238ed40d03434e7719d9
* use +git as most other recipes are using

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
index 21ef9fdc3b..b10c23984d 100644
--- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
+++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/projectNe10/Ne10.git;branch=master;protocol=https \
 SRCREV = "18c4c982a595dad069cd8df4932aefb1d257591f"
 
 S = "${WORKDIR}/git"
-PV .= "gitr+"
+PV .= "+git"
 
 inherit cmake
 
-- 
2.43.0


