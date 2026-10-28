Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36062.1793161528282758184
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=V2itEW4I;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso236314a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161528; x=1793766328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3sB+LWFGt8SQCb87LBs5KpkRNkHANTEcZv8PHXnJYeo=;
        b=V2itEW4I2lD7vVwsROy7AuuJ3sFs2VGSnu5OkLGgGAIM/ScTKu2KffqUXpeST57nnK
         2rTYcsLoNIWDoWGThqITwoZS+iyl4kfst+ghd1QqhVSqxItP9Mk+CsPQpxBa0qW8aD30
         Z4MJrfZoCOZahGSJDRJhnImjmKJyoErUFRcUtwCbP30pjm6PCrX1xvo1InuOZ8zbOT22
         8Jt/2V/MeaC5Qi7fs4VgXMRIYeIPj1r2Ufd0tBGRnpXOzBugOhkW2c6Lbsn5M0NH9eS+
         K6Cl/LhAe9o6dvr6BsLM5O5WMLUQfvlgHH2Zqxl+aPf2kuP6o7gepNnVe0d/uczw52Pk
         n4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161528; x=1793766328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3sB+LWFGt8SQCb87LBs5KpkRNkHANTEcZv8PHXnJYeo=;
        b=kQBSamxEccTH5aJ2KrooHUYYHN7Za/KsbkERqvGFQs6/CqLU1HbJbQTZ6QHMoiv9W0
         W588i9bQ0uUVTbboQRZZUl6dBOntX0EURnXac3070KQJWbcnnJW4gFG4nFFoqBInD2gl
         9WF1rb8UcBJsHwwilEvyx/aJ1lclZhLSImb6g5FtTKl80KeeknCsu5jOrAqRe0gFuhvO
         O76arEGIkOLVpTzTb6oPLFII1L3lmWTS4piaELaxFADaBlP4Vml/raNG5g1ikMJKTsue
         /QNvyMeQ0aD68AbpYKnx6DP86kqtzxORI521W3tjANg68Q3qQtLVnxlx9PXCIC8JrTmf
         xGsw==
X-Gm-Message-State: AFq9FYKF/jivi/wqQkdzljZRZpcmNeIPDVmuuWSE4V/s9/8rIJOX0eRv
	hv2RP3BnkZz8u32AvHo1QWcDyrvZCmDJ+2J1Ejx8ywy64fRYbkw67Cs9NsaHcw==
X-Gm-Gg: AYBFou0AdX8GxZthUPwjf/c8rnLKKKgrAEQPzsniMsrAWpTiER233KAuFCFewuAJ4VI
	xQhBICUOqo9Er3j/RS/7hFX4vQYdd09y3SeSo/hWjd/KacDMZu7A0+9I1ZHWGgri3vXROCn9ZsG
	xJwo1tuUYoKfn50YA8WmoxCbcKrXd6Ja7F4bUYt2K2K4rMNsh4fFx4adsexX/bFu9effOZ4y5xJ
	lsGNFPFX4x36VOXipCxruZ2sgctYtqz1EJH6LcQFnMYf0/yf2EidkU5NRlYhEApOyQNx6pSc9Ml
	TX2Ox0YwLhH3Xjqo7aoLx1tHrX+PR33uptCL3Vb+E7WfMRoGJu+CWNT0SPxN6WRsUaQltzg2H5j
	g2Venizk30fo/Ocz9g2cb8fhyxYhQOOjwtOKm3B4h59wHPMNU//N+h8kxJ9qkPO16jJV17ER3za
	FsQFbwR2ymNQ+/ky7TaP/jUPC0HJY680D+0ygld25cYjefR1iuV0FKvzCP7R9M/6R+6QsHOTfSv
	yFJ9GXcoYun6E/V8sm401X4LcAfb8OEqgAHrJO8FDCqa3STII+o83pKU7LEmrRmLxDm1p95LsFa
	3FzUq2WJ6nk3yXSjnsNKRvfbau7k5a3Cnd0yXz7Uru/FzjN2BqHVCvyMbHDEPQ==
X-Received: by 2002:a17:90b:1647:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3ae580cce76mr758290a91.23.1793161527672;
        Tue, 27 Oct 2026 21:25:27 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 35/60] netdata: mark CVE-2026-83602 fixed
Date: Wed, 28 Oct 2026 17:23:33 +1300
Message-ID: <b05877ef8e518db252c94e2d67018622784c53bc.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131587
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fix identified by NVD is included in the patch release[1] v2.10.4

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-83602

[1]https://github.com/netdata/netdata/pull/22825

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb b/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb
index ed4c54fbe4..9df846cec9 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb
@@ -167,3 +167,5 @@ FILES:${PN} += "\
     "
 
 RDEPENDS:${PN} = "bash python3-core zlib"
+
+CVE_STATUS[CVE-2026-83602] = "fixed-version: fixed in v2.10.4"
