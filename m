Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4510C4828E
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 20:48:16 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.3383.1706906894851679723
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 12:48:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3be90c51299so1540788b6e.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 12:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706906893; x=1707511693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNkAXKCmflNWv4I81thOjQH1Mq3w3B66VndeWjzHDfM=;
        b=Z5NhZdwF8zWWyyVw4K2lkIpI+Tk1EXkwaQTjkmbCTBvVYvWR2/bcHlunKUu5W/P3Cw
         fa7pBv+xbdGgi8JbJsIHmow/CrzVWE77NeFYAeejhq3FYRJnVwAOmwTnAusmzryFPRKr
         yjMyJSupmQbJbZIuJ2NDSNyc65asKTXgYS+g19GP3vECeqBvRKwOmmmcDlzlAbv7QppW
         5EmUuYcikoio7JbWNEX3xYZD8rFo5UzjzDMOBsDWJLuVB3+rQYOYDmuM3NeC48GU9Eyc
         AukQivz26/2B1B2r8aovViuB+fhEYgIDI6oCwubEiMmMO4QSV5NZepQgBOEiCsGuW+ai
         A+Kg==
X-Gm-Message-State: AOJu0Yyow9hebCNIZb5HLtF4tMrYe+5ItoTgLWbJvG5ERjGfq4T/SzGL
	f8OYL7w4nfRpHep7sCh19eO8FoeioB7o6UsYxVwjrAUvYawbDeUPQkahqYkRS0fZK9uu
X-Google-Smtp-Source: AGHT+IEV+z0WWLOlWOn3zHoWVg62sKEC00PRtulg8nIrJhHGAQMEv7N3Jd6AR6Zu2X8j9SXSmlWhUA==
X-Received: by 2002:a05:6870:4149:b0:210:d385:e497 with SMTP id r9-20020a056870414900b00210d385e497mr903587oad.17.1706906893293;
        Fri, 02 Feb 2024 12:48:13 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id x5-20020a9d6d85000000b006e12023de5fsm530402otp.46.2024.02.02.12.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 12:48:12 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCHv2] python3-ipython: update to version 8.21.0
Date: Fri,  2 Feb 2024 20:48:03 +0000
Message-Id: <20240202204803.1593262-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 20:48:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108548

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-ipython_8.20.0.bb => python3-ipython_8.21.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.20.0.bb => python3-ipython_8.21.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.20.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.21.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-ipython_8.20.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.21.0.bb
index 239d7deea..86e4c6454 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.21.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "2f21bd3fc1d51550c89ee3944ae04bbc7bc79e129ea0937da6e6c68bfdbf117a"
+SRC_URI[sha256sum] = "48fbc236fbe0e138b88773fa0437751f14c3645fb483f1d4c5dee58b37e5ce73"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.34.1


