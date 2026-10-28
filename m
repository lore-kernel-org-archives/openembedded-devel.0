Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36203.1793161500399092827
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Z1XEunuo;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so472268a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161500; x=1793766300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stkMjPhXPiD4icmfR7fy1+pxA66CHinTvvxhxWi0vng=;
        b=Z1XEunuosSgavK490kROIPwotirGoTDyJ6KJJ6Cmr4lOD3yYf3FKmscAdpiqLkVMLO
         cEKaiRhYqBABuDUfR5Fa1raFCzdpx54E4rFiUF06rYvWIijjznY0SCbIadK+FvHf5Uta
         z13bJbccXkDqsPl1BnlraUF9DBJt+btUMwPDEqx4BswawHsWuI6aedwnKSSp8+RqGQJf
         SB17qqrlhp/c7Tg0JNIjoo8wv/LnTSxIn1QYo3Ky+DA+mCD2yHuotg7Rvksu2uwO0SKD
         8XNkoqXaWLGWU+nGszJX/8/UQ3UmFLaJuGSrdCe3u9YQ+qRlVS+ezfoaIOH0eXnL0bDL
         MgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161500; x=1793766300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=stkMjPhXPiD4icmfR7fy1+pxA66CHinTvvxhxWi0vng=;
        b=d5bp/jghincNmdIGeBTA/fSpMJpCSAm4IG0uCJLD3D3+yU8GKAOgY0szin7RaAE/t4
         3TZQVR6fI7voqzJRjl9OGHTVVsl3K03sDugyCowMI3zphCuq35orrPFysiwL4oFwuwj3
         PEsP0Yim4igFbdkXEvOkvQepgzgwo5eYfHNu6CQ6H3lu2F0OcHxWDwg+K+9HEzaN/1ya
         e7Oyh1Asx8NOW6vVuw0ZOYz9WYMxDUJYU5Gpr2EQylNjxH8WlkHNA/QfslZw07fQPAe2
         IDbph/3KukY90lGn1+JJJFD5tl/Jiw/Dsin1aOUI5mrNvZImFNQt+tANIKbUtuBYvulp
         k74A==
X-Gm-Message-State: AFq9FYJG1cTK2e7H/+zLK5K6pubt9+5FARcDY9VycFhC7OovOKq86J6b
	15ZSMhwG+9FNTSzgUlG3PtDaVDHqQX9Ghj1Y0sXEp/5ZVXunkCEeQQVp4gpoUQ==
X-Gm-Gg: AYBFou0OLDn9zDUa6pCoCA4xJ7GB2fYEm10LwOJxA5jbz27N9UWg70u+MkM4J8tuWsP
	thdQfgyXEryS+75otydgUHJB8rzGicwcHtyOR6fvCQTyd4Yne+i5d+mlBAmeGc10j0VbM0gvYyq
	aiLAjmOFUC9bTTrfkNVf9qM6M8vWOjVBcu7qNH6wUGcOCNBAFfM1r4IbyyMvOtAU4NDmn4BnJ2J
	gYBRK4eS/C1G2uv/zbWL3prCgzW2EonH5Uli5kQtszFNn2ngvMq7QUlQipx+2vvcw0GY+BvXNN2
	Hhu+wDSCOeEqY/SdVn/Jv3I8gEgIzBK0+DCrVY6ZN+XJ8Rnk2mtzE4bd2AJ7IjfjX+XTUjtWA3Q
	AlrHW3W1/e+cbf1ZfGkpZngP2xGychbZJ2XJFFbAia8/Xy+poy2CDnvbqhDblZCb8b7U/LNBDt/
	aTyv+psHtSxiEqA2ECNXLOcEd4efaMfq9ZAK61ujPr0TvExaDoscZTmkeNVNDOVmUfAuaVwzmkE
	SWKWcAwd3AyNl6qiQ4xyoUU4YJcCX5kHM0SwEjm3dqsLf4gOAZhg/6aXYHh/e2EVREfjpipJSJM
	hDnMfJNwHrC1cZ/CZT33SCBrUY3Bf6srapL1anGAtPkte0FG3nGOPlvN6jPnTc+Vpzj/prS9uAj
	jTKdWTzIinw==
X-Received: by 2002:a17:90a:d008:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3ae5814119dmr1044780a91.55.1793161499699;
        Tue, 27 Oct 2026 21:24:59 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 23/60] pjproject: mark CVE-2026-26967 fixed
Date: Wed, 28 Oct 2026 17:23:21 +1300
Message-ID: <bb27c215be50ff54ac07f976337432f8773baddc.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131575
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-26967

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
index 8aa7775205..59684ac7c7 100644
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
@@ -118,3 +118,5 @@ RDEPENDS:python3-pjsua2 = "python3-core"
 # and ${PN}-staticdev (the .a files) by bitbake's own default FILES
 # patterns - ${PN} itself ships nothing.
 ALLOW_EMPTY:${PN} = "1"
+
+CVE_STATUS[CVE-2026-26967] = "fixed-version: fixed in v2.17"
