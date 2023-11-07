Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0557DC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 16:01:05 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.14527.1699372862920096310
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 08:01:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XXYhjc9C;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53e2308198eso9826149a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 08:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699372860; x=1699977660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zQFy7Tl4szXNU276WEk7ksKaWRQ97sJ/cMtUjVJmRKw=;
        b=XXYhjc9CeBRicZNrDREVWCZWKBMXxgFawfV7hg3TD1Ct5GYRhKrxT1G6lI39QO/475
         aD7xK+nZ5zfms/P+6wfC79oQkVDNkk6E5znJvq4GNnw6iUcZa4l0GG+A1dFpt+o+7Fuc
         HDPzB5zSJ3q22jh0QB/J6TnUepalYk1GoFtHfCAwS1XedIgQQacmuMRqOK1S64Hge6G0
         IE7/oDvDYzWunOPts0zBdDPyFIXrSEk2ZDv5ymqOiHQNA50+UPH8JCkP5apa9S5YA8L7
         VJUqUJ49g8Ta6fJ5eH2Tdjdzy6PG1vmV3s97PxY8TIFNHcMjcGcFdRzr5qc9F/igBB+S
         xS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699372860; x=1699977660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQFy7Tl4szXNU276WEk7ksKaWRQ97sJ/cMtUjVJmRKw=;
        b=dR3g7JBXRTR4FM1ALABh4fIowHg04BKHGfuvzTkLQ6tNSOhpU2pnSj9D9Fp27hXlHS
         aIOqe5GaGQRPqxKEpHT07mvRPqvihxoxZnq3QN/J11/Eh3HxLM45Taw+VZNjG6eXrPyQ
         dYDMxjiVgQQBZlmEStVXWXStkW7AjgNuk68zWI0Tc3WGrSHqUFE7J5EJioSC6fIe4/pQ
         JMXY+TMKpqWpqQVwA1NuljD6mVSchoudSz0rcOAX8zNG3mlbiGlvL3qJcl4QDlmGPERY
         g1XNgcngDVqiLphikQHHh/25D5sUm8VI+B52avJcOdoKU0905RbeZ80fntBjrg0DH5oZ
         tysg==
X-Gm-Message-State: AOJu0Yx0w+AVV7EPrEaB2T3sZPDMyVD+KUPK9pLAU4OOCQdXbieF3KQh
	2pdHqjG6FLRSue1eGSVwu4ItkGENOAk=
X-Google-Smtp-Source: AGHT+IF4DutVmeLjsbzecRcdShmX/z9fWZ0EGZ9QI+ZczVstJXpIJRtDVb/BrlLMBh4GYX09chsERQ==
X-Received: by 2002:aa7:d4d3:0:b0:540:3286:d2e8 with SMTP id t19-20020aa7d4d3000000b005403286d2e8mr27373840edr.18.1699372860389;
        Tue, 07 Nov 2023 08:01:00 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id v19-20020a50d093000000b005434095b179sm5596195edd.92.2023.11.07.08.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 08:01:00 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-ninja-syntax: Set BBCLASSEXTEND = "native nativesdk"
Date: Tue,  7 Nov 2023 17:00:56 +0100
Message-ID: <20231107160057.312458-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 16:01:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106457

python3-ninja is used as a build dependency by other modules.
For that, python3-ninja and all its dependencies must be built
in native mode.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../recipes-devtools/python/python3-ninja-syntax_1.7.2.bb     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb b/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
index ec7747307..2f94f7a6a 100644
--- a/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
@@ -9,4 +9,6 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "ninja_syntax"
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ninja_syntax/"
-UPSTREAM_CHECK_REGEX = "/ninja_syntax/(?P<pver>(\d+[\.\-_]*)+)"
\ No newline at end of file
+UPSTREAM_CHECK_REGEX = "/ninja_syntax/(?P<pver>(\d+[\.\-_]*)+)"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.41.0


