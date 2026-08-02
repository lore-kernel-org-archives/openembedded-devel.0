Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70B7C55171
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 12:05:08 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22333.1785672307595577170
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 05:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VzIrGVV1;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so2265130a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 05:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785672307; x=1786277107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NPpDZtifvzb4huLE6Mz009XEynfKXEI7d6bSMJ4oqQ=;
        b=VzIrGVV1vkkAJcDFFhg7ALUXkMhTHEC+GKLfddA75+wWPuEfCYmSLqPufC+58I0S5f
         UYbxly15UnEwQ6z0ulMuoWWZfn8nOdoQ2N0P+rrn94QLOCoG1Nq9zp8dKCzRLn1P65cn
         VDMb85PbevjH+u6H92RbGovnjyvoGIa/eA0vhWwwl5NFqSgNREXkYTqok3lkPhgt6G0f
         XJJrVCNSqwDugePbCZwoDEpp7jASANn9EV1iaKdoUU3+N2TnOPymrMF9w3e7ABALgQzF
         bEEPomwWoRzHiGVGLwyrW8mHeLRKwwruTKZ3STI453sph3mIXpoag/KXDbgrfaXgwc7d
         ewDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785672307; x=1786277107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+NPpDZtifvzb4huLE6Mz009XEynfKXEI7d6bSMJ4oqQ=;
        b=L/ucV3VKZjIgDdrIlYleeuz7u7aT/ldnm8daWnD0sn6C9S1s01ina+Jsf5I5esjBve
         mt4PJTqTaz8mTd5xqXuOIDOPfVsJIyFoS+XurMdqy9K3h1w29sgvFdGjsPEIt8d8Mede
         qlTwXgxZW5uGqnh25fYfK91eVO4smEMlirrt7eJodOYlLDupX7DwWeWP04Rh4ClsLHuh
         8fUllMvULcVXP+ikB/jqtAcmh8C/u6vxBcKqdJT5xEC2BdpE8b/uilkjAOxa+v+5yKkN
         CQJ64P1Jth2EOGIfBsBQn9XLFUpeqxnqffhhNq/lM5g6e8pTjPA9J1mOKb190z8hukN4
         8U+A==
X-Gm-Message-State: AOJu0YxxGbYym1sl7oaCEwfaOi905HoEr8KGTOfc0hj1UDt4D9CrhhPH
	iWAdn4noB6kmzIZ35jQn4i1B1HoDok/J1E0/FZXx1Bsbz35Lh/alaMyUBxXcrQ==
X-Gm-Gg: AR+sD11ufaysnkJz2b/Y+Xj4s8ym3jzvrXFaX3E65f3jFf6UY/wT2CwO5oy9pKHycrX
	rixtfbBAS2/uFoMJFFXdmV1U44WPUCPBkS5dSZyMfoJrgdJFSflvSMWGHqTp/JKLST8jk69wfqv
	PABOWih/LeBcNNm6fRJ/Aa0g9DR854rMoE0B0d6c96EX4Pv3rLe96bmOtRe4FuTHHkZhdimg3U6
	oR/wAp0pWt62YHE3Mi4c3fkQaeZ2RqX2jY4rbfV6vU7mB0xh56tmMCjCD+KpTrkRuxx68nda484
	kLI6WeY6yNsO0U4M6WPmtrIIHrQnbGDrIyoihoHg7HDl/QrNrwfGNwhg5jpJp7LTDPk8MvEvNwc
	RZprDyjrnbNwpHCuJcyZvQKovk5yZGFsG2hkJPQMT4zSgBGdlyLWBfRA22jBB5KgsClG+pnPFSS
	VNf5ns46uF4HAera2E1keOLVdR3AiBepqXKhEvZZG5pCEEUDdZDctm9ytFQM/SJVbX927UayDU/
	g==
X-Received: by 2002:a05:6a20:918c:b0:3b4:669c:ee32 with SMTP id adf61e73a8af0-3c92a8af2c8mr6379403637.37.1785672307018;
        Sun, 02 Aug 2026 05:05:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39eb13dbsm2556152a12.29.2026.08.02.05.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:05:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][master-next][PATCH 5/11] usbredir: upgrade 0.14.0 -> 0.15.0
Date: Mon,  3 Aug 2026 00:04:36 +1200
Message-ID: <20260802120444.2973561-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
References: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 12:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128660

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also included tag in the SRC_URI.

Changelog:
- usbredirect: Fix crash with multiple connections
- usbredirect: Fix win32 cross-compile warning
- usbredirtestclient: Fix memory leak

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../spice/{usbredir_0.14.0.bb => usbredir_0.15.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/spice/{usbredir_0.14.0.bb => usbredir_0.15.0.bb} (82%)

diff --git a/meta-networking/recipes-support/spice/usbredir_0.14.0.bb b/meta-networking/recipes-support/spice/usbredir_0.15.0.bb
similarity index 82%
rename from meta-networking/recipes-support/spice/usbredir_0.14.0.bb
rename to meta-networking/recipes-support/spice/usbredir_0.15.0.bb
index c4c091b0ff..e8cde41d8b 100644
--- a/meta-networking/recipes-support/spice/usbredir_0.14.0.bb
+++ b/meta-networking/recipes-support/spice/usbredir_0.15.0.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "libusb1 glib-2.0"
 
-SRCREV = "2d373432e604960c1dcc14fb97098febe4d64025"
+SRCREV = "41c79583a4eecaf6cfe938278554210c718c85d2"
 
-SRC_URI = "git://gitlab.freedesktop.org/spice/usbredir;branch=main;protocol=https"
+SRC_URI = "git://gitlab.freedesktop.org/spice/usbredir;branch=main;protocol=https;tag=${BP}"
 
 
 inherit meson pkgconfig

