Return-Path: <stanley.stanton@taitcommunications.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9644D60CF8
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 22:16:35 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.6484.1731968194697225330
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 14:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@taitcommunications.com header.s=google header.b=k8yoVa7p;
 spf=pass (domain: taitcommunications.com, ip: 209.85.214.177, mailfrom: stanley.stanton@taitcommunications.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-211f6e1c865so4660025ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 14:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=taitcommunications.com; s=google; t=1731968194; x=1732572994; darn=lists.openembedded.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lK5r0WDp1E91dkEMm8o1Cz+u4OAjfctMdfJkeui/PVg=;
        b=k8yoVa7pXgUppSC/KSecBMg6BovH9ScsD5yCo4e60KKws3uXb5Lf2jPMyL2auElZuA
         kB3ymzl9/is7agquLasNmlTmuzDgNQfkCRpZ21Gkgivh8vZgGZyohVN2kfGlB6qY/w9l
         Z1Gc99d74YplpjUVrAQ3tkP5JbJy31ZlHM8gV29sMe7eiQERjRgJQqjuneznv+ccXlgn
         DRCyHYFogtE6UHpLmL5AChyogsIhkhY1HhBRVoJJ8wf6/Aisn8FVIA+9pLkkfbYgOR4q
         uBS/UrXtKk2Uw8dDjFfZrhVuYBMXzs1PaffUkpxenimuld36MIfXKz9kRiC/sTwTS/A6
         iGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731968194; x=1732572994;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lK5r0WDp1E91dkEMm8o1Cz+u4OAjfctMdfJkeui/PVg=;
        b=sVUtAga2gM9kKKEeY1dOjAIbPe3e8wV77QkoSm6fl3F+k555LW9BoOgKcUQFJCJ1X9
         zeC//4TTQTsCqZ1ARe9lWwjIuMyxLDqQuDEcMWHN4K0mdlmxwOH4j10VrefrUUeGCPd5
         twCGyBMVi49ztt6LTKx6YrpFY6ZnWoGW5VknDPjfXTn7OuhP6dT/l7WNFgbLh+KAy1ip
         kqkMbjDG3iwgckI322h6IHxAiJAnmEISG9m7DERrfXpMekSu2QQfxT12CC0kal+OgJaL
         PnXj44HAD0XDsqSwGj8yV+JG0TobDyJvF8IWNM6ts1SGE0qgdYArgNQShTq5x0rb31lw
         6KEw==
X-Gm-Message-State: AOJu0YxRNVE7CtJtTi09zzuq+XA+lwMlcLAfu2I+CDvPzjpTnuh6JKA5
	cZohN+S35CSDVA81zN3+ofOQovXjhWe+A2ZwL336qLs0WMbfGMjFSQTruHZ8joLJZ0jDqVtKhUL
	otVJMtwcDi4qXAaD+d2tbBf1Y22jGO4WGEGXm9SGsxv01f/h7OgYeVaFOKP+E1tC1Exz9Kgi+4t
	MVcpMTrm4=
X-Google-Smtp-Source: AGHT+IFNim7prCYKeDQ3/LYb2pFjkcyZEF9A0TrWHmXYehVlOywsn/h9aYoTUPPU6byQPCpZrPnIvQ==
X-Received: by 2002:a17:902:e80c:b0:20c:959e:f706 with SMTP id d9443c01a7336-211d0d6357emr74021835ad.1.1731968193834;
        Mon, 18 Nov 2024 14:16:33 -0800 (PST)
Received: from WS4976.taitradio.net ([202.37.96.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211ff9000f9sm38528615ad.140.2024.11.18.14.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 14:16:33 -0800 (PST)
From: Stanley Stanton <stanley.stanton@taitcommunications.com>
To: openembedded-devel@lists.openembedded.org
Cc: Stanley Stanton <stanley.stanton@taitcommunications.com>,
	Ben Slattery <ben.slattery@taitcommunications.com>
Subject: [PATCH 2/2] cacao-native: patch to be buildable with gcc13
Date: Tue, 19 Nov 2024 11:15:32 +1300
Message-ID: <20241118221532.2468927-2-stanley.stanton@taitcommunications.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241118221532.2468927-1-stanley.stanton@taitcommunications.com>
References: <20241118221532.2468927-1-stanley.stanton@taitcommunications.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 22:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113906

Added template class operator== and operator!= for DumpMemoryAllocator
in line with the Allocator example on cppreference, to avoid compilation
errors with gcc 13. Thanks to Ben Slattery for developing the solution.

Upstream-Status: Inactive-Upstream [lastcommit: 2020-06-06]

Suggested-by:  Ben Slattery <ben.slattery@taitcommunications.com>
Signed-off-by: Stanley Stanton <stanley.stanton@taitcommunications.com>
---
 .../0001-cacao-native-fix-gcc-13-build.patch      | 15 +++++++++++++++
 recipes-core/cacao/cacao_git.bb                   |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 recipes-core/cacao/cacao/0001-cacao-native-fix-gcc-13-build.patch

diff --git a/recipes-core/cacao/cacao/0001-cacao-native-fix-gcc-13-build.patch b/recipes-core/cacao/cacao/0001-cacao-native-fix-gcc-13-build.patch
new file mode 100644
index 0000000..1af8a89
--- /dev/null
+++ b/recipes-core/cacao/cacao/0001-cacao-native-fix-gcc-13-build.patch
@@ -0,0 +1,15 @@
+diff -wur git.original/src/mm/dumpmemory.hpp git/src/mm/dumpmemory.hpp
+--- git.original/src/mm/dumpmemory.hpp	2024-09-24 11:25:39.769462195 +1200
++++ git/src/mm/dumpmemory.hpp	2024-09-24 11:26:26.429863119 +1200
+@@ -197,6 +197,11 @@
+ 	}
+ };
+ 
++template<class T>
++bool operator==(const DumpMemoryAllocator <T>&, const DumpMemoryAllocator <T>&) { return true; }
++ 
++template<class T>
++bool operator!=(const DumpMemoryAllocator <T>&, const DumpMemoryAllocator <T>&) { return false; }
+ 
+ /**
+  * Dump memory allocation, used for for ENABLE_MEMCHECK.
diff --git a/recipes-core/cacao/cacao_git.bb b/recipes-core/cacao/cacao_git.bb
index fef7f34..c050a24 100644
--- a/recipes-core/cacao/cacao_git.bb
+++ b/recipes-core/cacao/cacao_git.bb
@@ -14,6 +14,7 @@ SRCREV = "6c4694f9bd175386a8c451531e9a5ad97aa23b6f"
 SRC_URI = "git://bitbucket.org/cacaovm/cacao.git;protocol=https;branch=master \
            file://0001-java.in-Do-not-use-hardcode-paths.patch \
            file://0002-cacao-use-system-s-boehm-garbage-collector.patch \
+           file://0001-cacao-native-fix-gcc-13-build.patch \
 "
 S = "${WORKDIR}/git"
 
-- 
2.43.0


-- 

This communication is confidential. We only send and receive email on the
basis of the terms set out at www.taitcommunications.com/email_disclaimer 
<http://www.taitcommunications.com/email_disclaimer>


