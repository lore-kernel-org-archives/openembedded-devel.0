Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E620CD13D8
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:57 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27214.1762704048783266222
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ivvQANrt;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3b29153fso45457f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704047; x=1763308847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJsez2q/EmJ8agOBxeIEunJJ35PgxV5FpG+Tf5Z0SIA=;
        b=ivvQANrtcXk7IIEUpp64xuisrW8GZT1WlGjNHt+4SuGLfFfyPESg1wFlc80oJPS5/e
         MmZ0nKPepznO+ndBdEpa5OM7z2lbav/rWVgnTzKdLAtMhcKMWRH7jinHFjzuiGNRHA1A
         kpmfsdfu1bjUtLd/Q4dZ0Yk2AuLdLg0WDBIpSQ0twQb1QIkPKHlEwlALjWfXvJqsa1Tr
         4hEOjSmnNOoXMqWkVKWWXFbolJIf99fwTIenjxV0vUyj8E9rqOGY9SNLrFsaMIqv8SHc
         /mYgUtw6wp2PQmNCZldkpXm3bfYwvd7tLrI2RxDenPJk2rUmXDnRzk/ZdV6x5Gd2sHIw
         aqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704047; x=1763308847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NJsez2q/EmJ8agOBxeIEunJJ35PgxV5FpG+Tf5Z0SIA=;
        b=LZk49AX/8/uYxyDu/fFak6i/IqxZPXWZd9atcAjCsX+R7p7kQ0XRMPHq4UTeyb4HDW
         p0IBofHbtkSKnfWIOIrezwX+r00dcwt6ixthkzrp30O0OsrTFxTAPubEQH3GyKZUqkZH
         qyW/tTiwD1SZL/VfJtIuzFVQEF/sdnm5nvzA86GpVqqKfy/a1yDg9kqRi/Pect6hC/5+
         G42vvaAsJAiy2apLV0DKkiRxQ40WNABjUCBKzCYKAXym9qv5UnKmdafYwRHYlqjwjxdB
         SDNrtvrKazoxnN4IaDf09ik+gc/H8i472Qd5VkWHKh6kjWuRHED45mA2uNUK4HpjocVs
         AL/g==
X-Gm-Message-State: AOJu0Ywc9CK2cevCegDUdD5g5xk5oLkqQVifI2/iLzkHvLUdijOIKzk/
	gkMFgf/w27yHvmtCUuSXtZpDoYW1ctQQW1EVm0tdGwF/ahJga0d7rOYuJucL6BE+
X-Gm-Gg: ASbGncsJBJA1XNTPGMSG3lbJbiNVieYP2EOtMX4lYscL/AR1t/yA6HiZwMu2tS3a2jr
	N29yefuhgHQ7YD7dDoD+xFYCL0UzefxhB4OZJmzYhS3m3bDOgDZNxKvkUoYYN74TeyZOroT0WbC
	7e8WN9gTlq4yUxxMj/uBo3qDbfrH+4vT0YidaAvnv3oYNZVCshTF8yGKbdqA0i4nqkCgDZFHnFR
	Gs5dfIIskAE5pc7UET9Y3OT+MVLTx+T28tYEHt3djfEy4yvtJB5o2KPOg0Ycz/yWOE8JIhCaJB5
	9CYh1aF/OSMtXQfNeECTAY0VmCwqhqfofxRx4Le+UiHqMgi2LG6u+fEuX2vrBpmOP2jmzGTWlAm
	U3c+o7DSQNEjTMokIP4Ron9gqDWBzy26CmBCF+2QWxJn5rwXBMTFlXR4a8qjpIFF/6PaSUz34OA
	==
X-Google-Smtp-Source: AGHT+IG9bbm1B3jeceoiJnp89lRbAU9nfPJcdzKQOa4vPguqY1fEVd4oiETKbszqpaQV57Z7cJsimA==
X-Received: by 2002:adf:b649:0:b0:42b:2eb3:c910 with SMTP id ffacd0b85a97d-42b2eb3cbdamr3438617f8f.3.1762704047094;
        Sun, 09 Nov 2025 08:00:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 22/27] iksemel: fix SRC_URI branch
Date: Sun,  9 Nov 2025 17:00:14 +0100
Message-ID: <20251109160020.2522353-22-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121438

Master branch was renamed to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/iksemel/iksemel_1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/iksemel/iksemel_1.5.bb b/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
index 017e7d26a6..39377597df 100644
--- a/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
+++ b/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 SRCREV = "978b733462e41efd5db72bc9974cb3b0d1d5f6fa"
 PV = "1.5+git"
 
-SRC_URI = "git://github.com/meduketto/iksemel.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/meduketto/iksemel.git;protocol=https;branch=main \
            file://fix-configure-option-parsing.patch \
            file://avoid-obsolete-gnutls-apis.patch"
 

