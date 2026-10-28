Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36044.1793161468930462699
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Z/0UYNqV;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e5378b281aso2488775ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161468; x=1793766268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uLxgzOj5PVjJcA9KrdjjodUQeMPLWlydBZ6fmvtUig=;
        b=Z/0UYNqV0FkHF1w21emthGFh+HpxPbnEcFn/8Wx0gNhAYR//XPwIWrZfllflquCuDN
         +7xEfBYgH7ZfZ3H/iP3I9uVA5RlqPUNhDzwoMpX85HKgqeURVaoAY0PpedEOyuOiHR/4
         oOrzzBik6eTrZ6OrJS6aK9EaRkQthiKCSomqW/PtiNR5+VOLYcZweAWmFPfuGczVpYi4
         fb1uQiFd0JaW3lBGbIDCGRGTPmMlF3nY/TOrhN5JySbMpNtQSg1dnuLFsUEDDwNLgLLQ
         1g63VJClgzRxVaIsCQfQxSKAzdVZAg7TQ59sfs4yv2a0rBn14oGk+CS4g7rkmCrP7JHm
         faFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161468; x=1793766268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3uLxgzOj5PVjJcA9KrdjjodUQeMPLWlydBZ6fmvtUig=;
        b=BnnTVbK4FBLC0W6EGE08S8Bk6NnpgmY24tWoZvdkdL3HsttW7Banh2jSKmWzfjSxVx
         3eUc/qpYyX08LDu8dmITdI0i1+gsm1gqTvLtB0AThk5lCCpQJoJDqufA18uNQ4VQk75v
         lP+LcPC60d+6x1SG1LdWYoM16R+JvlgHFi1AxZof/cGlCsunAt3S/gjxoo/7Q8l1M2S6
         tquQ6TN3JVX5CEIV33d/nG6mIcWXxJ4C9E+mYuspwK5MiyJQh/Mud/tdB/9ZoxemD7zE
         b4EMkoUFdEsjSFo/NPa9LIEvqnPJkypQa9i0qLyNduANDdJNhiRxADqwb/Xqbg9XEboG
         QswA==
X-Gm-Message-State: AFq9FYIlRUT6z/YKc5Gg9oXzhm6xgxvw4cygisf1kAFllea1Qafxf1YO
	K4o6jWwfeOid+H6lui7nwW3jQ3nI9DhRuppTHhrbTreX6dcRHpjnkj5gMdzkbg==
X-Gm-Gg: AYBFou1SUxAZPEv1N0MsybRt94kio3ldwdmXnsfaBnqOWIS5D/m/zXfDIKBkWBgfBtB
	Be4q/n2vGDuqSh00AMDCna05bqdDrgMu/amowEoWXaw7cJQLT69jFVYgHverEtkyVIFO+B4bZNZ
	6fZty+A2F/b6KHRHqOWRS20XfAET3O3i37OoQDjdviOARoZJfyvb4MenDhnMYlRiVB7NSTl9r05
	vSD/62oFDmQrN3xm24JyH2kjA5LRTXZPqJsBAoJz/l0uhIu+nlY1FtlUN6KMdCmwkjZ2fBvUOJx
	QtXpVAH4sVyuy59kEWjblsrpbWvAhkvnntR3m4Gbm5jZnDvVptbZfTYPUa8j+fTW0QXu3ZhESz6
	HpVM4pV5CMMfdaEodrC5+IwdGTe2PtwHvbLcAWL5kF0d7eiQbyMMPBJLNhdyCnAxZVhIabFSRc2
	20n5C6CPvLkexuL2S0tGM595k5ryFWujI94k558csavJpMTXkdpy/eHsJJlIvwd4zQmstv6hgKl
	fmYLfB6Dc9pxDM/RBdE7ItrJE/XXzOmkLT2FmMbzn5ktdLANZBf/ev2kMoXiJPHWxgmBuYOSudv
	6IrnGlR7w+aWHlvAIzJWpGhKOwjLgIQ6B15M6EjVXIVLHpHNxfJ0eqoiOhg7PWNaosKA2hsNc84
	9k34oCaU=
X-Received: by 2002:a17:90b:1c8b:b0:3ad:6738:db14 with SMTP id 98e67ed59e1d1-3ae5814509amr909590a91.55.1793161468164;
        Tue, 27 Oct 2026 21:24:28 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 09/60] spitools: upgrade 1.1.0 -> 1.1.1
Date: Wed, 28 Oct 2026 17:23:07 +1300
Message-ID: <b598e510a560c6eafe0815182e4ef6fbfb86496b.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131561
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../spitools/{spitools_1.1.0.bb => spitools_1.1.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/spitools/{spitools_1.1.0.bb => spitools_1.1.1.bb} (87%)

diff --git a/meta-oe/recipes-support/spitools/spitools_1.1.0.bb b/meta-oe/recipes-support/spitools/spitools_1.1.1.bb
similarity index 87%
rename from meta-oe/recipes-support/spitools/spitools_1.1.0.bb
rename to meta-oe/recipes-support/spitools/spitools_1.1.1.bb
index 69f527a6eb..e2ab0a5d11 100644
--- a/meta-oe/recipes-support/spitools/spitools_1.1.0.bb
+++ b/meta-oe/recipes-support/spitools/spitools_1.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/cpb-/spi-tools"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 
-SRCREV = "a19dffe44fee857124a993598caae0c85894f914"
+SRCREV = "74ba65b19e0cf9d1eabd52d17d842200ef901d61"
 
 
 SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=https;branch=master;tag=${PV}"
