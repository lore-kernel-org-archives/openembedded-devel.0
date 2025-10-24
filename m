Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DC4CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 11:05:00 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.7612.1761303892008683003
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 04:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nHJR9xAO;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-471066cfc2aso17579625e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 04:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761303890; x=1761908690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UGjlyRH0+ED4LeACuptKKNpnIlsWM35XTJnyGzRHNHU=;
        b=nHJR9xAOX7l3jb+TzSRN5l+V7WQ6XTHzns4LQn9OB9/9wwCM9oDoUHH0WeMpgWbYGy
         igngoo753cyfSvcJsOxBKYCL3oG9HCuKeU2R1q15AEZh/bfxxaYmyNX6Iy1oInXUgLnz
         tXBJ+S5drHEZgORq2zg1Tu2kHoko9Dh97786ijGiEYcuSrDOP1SPdu2UYHpfvJhC6mTC
         R9AsIzJyYt86h6KGWBOHtLR7B0Jt3ALVcFRG5bPFqwCDAz6ea6gB32cSPtCoJfgF/p7W
         2P0WbWC+upCFv1Zr/Cm0n6sPex3jR7twOjz3Xkss0kANYAms70d2/o2t/grjlZguXqm1
         DKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761303890; x=1761908690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UGjlyRH0+ED4LeACuptKKNpnIlsWM35XTJnyGzRHNHU=;
        b=NindFWc+OW7dDPHHN2/ZgdmB/0w9qmTQRzE22fMMuLzo+alyhtYQ9ZrC98JKlm2WcJ
         BsFtg74+MqrIM5VSIA2nSmRD5JgcGv+h4oGTbiTRShCdkb2TWznacaoiYQbJJjjqrj6x
         8tVSZb8fbcMdDxvZY8vw5jkJZ6Ar7c7T0V6dOuLjZ7+RmRXjkkzRKdYx5ihBR+GJZZlB
         ikbFAxM7H1kE6Mor1E39bpfqWT0aL5Uaz5BVKQ8xDhOZpWOgMBeT8evxWdEuygfU+aIc
         XE/O+tqf6Cq3S1RPn8DK1IJAJqlG5Jtyyk89lkGbI+gBNBVdbavJG9vPt9FhmO9OhF2l
         jk3g==
X-Gm-Message-State: AOJu0Yywx/bTEFB8TtTppGPU35ZZrwA9AMEqGsJ0AcIOdrJs8wtH8WBI
	jO+6dPBiaqrlWnkl7cLr7vOG2f5VQeaYCG3/E9owBNAfPUyDszK9o94qsFhWng==
X-Gm-Gg: ASbGncvfGwHpV4wmF2FQ232ksu6DIXFtf55Cu8Zy5sC8F4kJovU6MP3mB7nSt5bZx0n
	4ig4xGMCLNtwkhnkHRDdPuOizgaBnAMqdTVwBvNVLqtkFGvYlUmGeUDDZtuDCWrMhS+Z/R9MawU
	bGH6wuCvEZS5HpIcp2/O5G3EPKsZLQzg0ayaxBea880m5Wfe9MJq+CFuTNUFK5MRSrQlxzQCAU7
	JAT/dwFpYByK4jEMW0UJLThICR29RnGlE7Pj4h8F3dpu5F2izdNMNtOIpdAy/7si90eUEgONSX3
	7uYNX0xQYchf8HxjWBJN4z0kS+YrCMJCrktL7pZrliuwb/p+ILU+dZO7zzICZ9+IJB9w+kn4kof
	743pT/fk3M/5C88oeLbylovl561BlT8gt63Qmt2kjSROn/PAmgBC1atxJDgIjKXr34G5v4/13p0
	r6w+Nebdlo
X-Google-Smtp-Source: AGHT+IFOXQUJmJA0oVHLpxjSWMCbDg2h33bnjSIdhaLAwyomouW1xGG2mjns3IUgqDTP8fAsng+uaw==
X-Received: by 2002:a05:600c:37c7:b0:46e:477a:16cc with SMTP id 5b1f17b1804b1-47117902f6cmr165029875e9.24.1761303889976;
        Fri, 24 Oct 2025 04:04:49 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496c653a5sm84479175e9.6.2025.10.24.04.04.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 04:04:49 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 1/2] python3-gevent: fix syntax error in cve patch
Date: Fri, 24 Oct 2025 13:04:47 +0200
Message-ID: <20251024110448.1174021-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 11:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120949

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-gevent/CVE-2023-41419.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gevent/CVE-2023-41419.patch b/meta-python/recipes-devtools/python/python3-gevent/CVE-2023-41419.patch
index c92ba876a8..300f37cc32 100644
--- a/meta-python/recipes-devtools/python/python3-gevent/CVE-2023-41419.patch
+++ b/meta-python/recipes-devtools/python/python3-gevent/CVE-2023-41419.patch
@@ -356,7 +356,7 @@ index 0ebe095..078398a 100644
 +                    # we can't be sure we can synchronize and properly parse the next
 +                    # request.
 +                    raise
-+                except socket.error
++                except socket.error:
 +                    # Don't let socket exceptions during discarding
                      # input override any exception that may have been
                      # raised by the application, such as our own _InvalidClientInput.

