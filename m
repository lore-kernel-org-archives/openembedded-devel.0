Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209FCD2B952
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:50 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.19499.1730817403473299163
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XH5gCKHO;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ea11b32ab4so36751927b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817402; x=1731422202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O327L93bMrTAleNmD6P1/MbzQbhKmH79PzjFZJRiYh4=;
        b=XH5gCKHOP9W9xvO632hV5TQ2lt0NoR2sa3wYdBoFaiD5M4xpTpmdXmZ7oTQet0cKoo
         ZJhsTmaGRKW2NPKINMSDQEEC2/YRC08FpJrsP94r2tcF/t9VKfKkC5WqcDgE7XzXjRhA
         W87bMTSRC9yhzdVURoXVMqM5hfwcIRJQ6TQi9GUaiyh+12AX8f0mo7e5xqV5QWqyglrj
         z0XG7Di2c9nUfS4sRn6fN+YN6rkzTCRj7QsuU/ZmZ7C+ufMSBvJRsebzcEPuH3cw8N5H
         rSX4ffsYZgthXPEeJpBrSla1EuE5JLNligk+lJL0gcLgoh5U5YK/U7DZHRul2mBSusiv
         IIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817402; x=1731422202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O327L93bMrTAleNmD6P1/MbzQbhKmH79PzjFZJRiYh4=;
        b=aZBdCvr6Zc0pDGzI7sIGajMuFfZJh38ruc7va5L5f0IbyfNF8XJoWoxkv2qz3nF+XE
         0FA/j7iru/shIFNvSma6qmp1TAOmkg01tYJZOD4Y1Qx7Q6wviTvU6IqSWcpL5l6EorwY
         /90rt49SlPLu9mUqM16abJwkIJP8cRyC9BEcArYIp67/9wQAkGzEj6Sokr8VUXRLfcvE
         +q9VlTte7j76P2q7qArsBGPTV6LRhw0p2QGP7wvOOmI00vLwQeaUopTAk3DqPBWVyAow
         nCaGkdoLQYAw7YSXWi4m2nq/ueMR9i3xiPvhSBaTm2jy+p07EOAajlAypJDfddvaExy3
         Pk2w==
X-Gm-Message-State: AOJu0YwCRMkFhrkePpWanykfUFzK/AXWZLn6XlvOO/bgcz8ER1iOsHBr
	mqVcdIkqUOKD/PO1J3+N174/ZSVWKvL8Vw+Z4OmaUAkafEYwy5OS7DHnGw==
X-Google-Smtp-Source: AGHT+IHmtoVhhKBeBExfFLxUN4PXRUVRJLUklg16Zi3YDlCyeePlN7a3dSJDca4kyW4fkCyAiPmIlQ==
X-Received: by 2002:a05:690c:7281:b0:6e3:6a76:ce45 with SMTP id 00721157ae682-6ea643283e4mr127077927b3.13.1730817402545;
        Tue, 05 Nov 2024 06:36:42 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 07/90] pegtl: upgrade 3.2.7 -> 3.2.8
Date: Tue,  5 Nov 2024 09:34:32 -0500
Message-ID: <20241105143638.2301245-8-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113424

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixed build with '-Wshorten-64-to-32'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-extended/pegtl/{pegtl_3.2.7.bb => pegtl_3.2.8.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/pegtl/{pegtl_3.2.7.bb => pegtl_3.2.8.bb} (93%)

diff --git a/meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb b/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
similarity index 93%
rename from meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb
rename to meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
index 2e32e3e788..fc227734d8 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://run-ptest \
 "
 
-SRCREV = "cf639f7f4ee125f68e1ccfba8d99ebc0de57b9fe"
+SRCREV = "be527327653e94b02e711f7eff59285ad13e1db0"
 
 inherit cmake ptest
 
-- 
2.43.0


