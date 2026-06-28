Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65ECC43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:48 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14755.1782634358708822260
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ACGR0F9t;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so4929203eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634358; x=1783239158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwiIoQndw+10SE49iAe9WqyGFYJLHZOl/qiC3dgH+mg=;
        b=ACGR0F9teW27f8w+K/2qw2LUeNbND4DlqjM2GloPJ0/xZiW5ctO3l8cpRw/79+nJWO
         NXlEsvza783RyQH50YKjYkLo1lk6/WT3VjMbc0XpIfkZsWACcuZDaeTolx49VlSsdnz4
         wbhbp416ODj+wHa8i5/XEm7Ma9Y+P8ohfUg1IVfJZRvDOJgSZDo5WTYsUD8OJGHO+SST
         hFb1dwBpanSnZrPeW0vAqnVKyfWRu/ESAe6VjTo848uwk824sV0SqkT7eNW/20Nkg2rt
         u/B0IfIzM/xsHTN8LiG+r+CFUl+LKjcXMtJi3SAMsDuLwnHi36aUoldr0Spkj03uEhgm
         kBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634358; x=1783239158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fwiIoQndw+10SE49iAe9WqyGFYJLHZOl/qiC3dgH+mg=;
        b=R0BFp9zANzkOgEYYVYkqB1fvc0yaPVi0OgnQHT6HUwI3hO39D/A/JFH/4QhXnUNBM0
         MfsxgUNZBTcZ0uCXCagteADl5c2gWzWwustweP8uceJEGbl87fzX6BD0u1OjTUnernGn
         qV2ZLVK3uH8cx00J8T+X1BKEJdHEhFbN4r0noFCbIdW4oEDbDEuOzUrNkYcjN/UjPBiA
         xJYpcg84tGeZTy2muJprOCmKaMpxS0c1wErkL5Xy0qf/vrjxTsBkjNBe4U1YMQHx2h7W
         hrpq1RFunMcZ8GcVhWMOCCsOh741JwjzIZwBFhyetgv/FNDx0hYPI42LdlHyktZYc33C
         ExZg==
X-Gm-Message-State: AOJu0Yw/dZY3awVvsFWsC0/QvOoVfbEbY00M5GuAmf2MG3Beab/rB6Mn
	cEH+HO/cFYnrqNFXzbmGeJheATw0iqp4Kl6y6riIb90VpUNxWHveKyl4TSyyyAekQsMpgA==
X-Gm-Gg: AfdE7clqLceaPsCDCuh7CNcMM7iIPLjVjcq5237CkoVAeGLNaA9En1Rv6/p0qXciY2/
	1kuMKzjEsyyHXeusymD6rJhzWiKO2X10GAir+WLSkP9J28Heaqb/145uRqoANDQwoRVYHVOcowo
	Xol0y5Rzhsl6kuyxkDFDbDjFoiefHPyCde3mik0yXHEOeMDcqfXoh00vKLHfRFcSECOsioASLAz
	XCufYVB6YNQ7r6zh59xhNMq8LQd43UAkq4hQKhGfj1+JRTI6A+AmUoDxsVnd43fS7SSeu5k7NrE
	g+aG7zEFKnCz2Pf9tiDFL39ozP0Zm/6Wl4cRajfYVaMjxyFZNpIj5XPfnee6Yu3hy4y7QB3uFR/
	fgABmVpz+Cjo1o8ITx0Atugp8MEvKDIj/IZxbG/d1A2t4a5qMzaUf1gfOnL1m8uJELcB1prcpyq
	LnIDiL283X/bcNDDjU31EQ08hIgHBX1JGHzqDppaXx0tEjxcMEohJTAFL+s+wygT1segaxBxin1
	/gYqq682/hBVLTZNUEwkKdqbpcfc4mHhBFOoBsWJZe2m62aE+Y03HBNk+3WjMyxAxDLY2kfJznd
	4gckJt+yvy+iaCNY9gzEUkHcpapfOA==
X-Received: by 2002:a05:7301:3c8b:b0:30c:ab97:d7ae with SMTP id 5a478bee46e88-30cab97dc0amr6199381eec.40.1782634358092;
        Sun, 28 Jun 2026 01:12:38 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 080/128] proj: upgrade 9.7.0 -> 9.8.1
Date: Sun, 28 Jun 2026 01:10:31 -0700
Message-ID: <20260628081122.178348-80-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127890

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-navigation/proj/{proj_9.7.0.bb => proj_9.8.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/proj/{proj_9.7.0.bb => proj_9.8.1.bb} (90%)

diff --git a/meta-oe/recipes-navigation/proj/proj_9.7.0.bb b/meta-oe/recipes-navigation/proj/proj_9.8.1.bb
similarity index 90%
rename from meta-oe/recipes-navigation/proj/proj_9.7.0.bb
rename to meta-oe/recipes-navigation/proj/proj_9.8.1.bb
index 2a41f1ec52..9f1e03ef59 100644
--- a/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
+++ b/meta-oe/recipes-navigation/proj/proj_9.8.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27445198ba1500f508fce2b183ce0ff"
 DEPENDS = "sqlite3 sqlite3-native"
 
 SRC_URI = "https://download.osgeo.org/${BPN}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "65705ecd987b50bf63e15820ce6bd17c042feaabda981249831bd230f6689709"
+SRC_URI[sha256sum] = "af5b731c145c1d13c4e3b4eeb7d167e94e845e440f71e3496b4ed8dae0291960"
 
 inherit bash-completion cmake lib_package pkgconfig
 

