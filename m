Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B655AC44506
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:16 +0000 (UTC)
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69137.1782634330079081034
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MKnvSTZ+;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-13981833e13so2927383c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634329; x=1783239129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpErpnsYWpZuR5hUHcYm0O0wV60QmQ60pUIA9wsXVGI=;
        b=MKnvSTZ+cT9ciP9YtKXJI2P7yhu+gIilXe5tXo9lBB0NaSXCRyzeXU+ha1joSY7b7s
         sNOykUMDV4zLqgl2wMAfbLfAa13+X3LHkYFsLNiTbxJJVM42+cvniGUdErHbtIYrsPik
         1y1zgRXSWf/zccMMmiDgvyMfrzl56DZVy++GMXdfJtb6nxwFhEOoW2EGflZ4FdfJaZ5a
         tX34CasnJDPHApxkLZVjWlIihdMN0HJ0p84p2tp3LHEdtDx63UQPWCEPYEJIYHpT2Y4A
         cvzJ7RkiSHEkf7chF/Hpf4m4pWKhOIN155+IoECDCGU/FNd5soVwcmTSICVKGMf7m5GC
         1Ayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634329; x=1783239129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BpErpnsYWpZuR5hUHcYm0O0wV60QmQ60pUIA9wsXVGI=;
        b=eBkMwd6rWduixsOiEcuxCM1bk1a1VQJ9sQm03s3I2Z0gN6FjKbaUdDEmLc2rlU4C/V
         6qPz7Y7nx6mdlYrb5VSIWGKUqMZMoOPoPhCwKjhX3z/Cf6XVgZUsiX7b6s2o6uJR0i5b
         HycnmiyeMpVgKWlJdP/xMI90r8GZT4nb4z0Joixxqfv5RIRhK6O9g86aurn8m9FVe6BC
         esJQUwI+nOQRF4K4psiAMt59E/iCsda9+G4nVgsyKT0UeGRk8auFtGLjRL++8hROGar6
         8UXy4v3Z6Sjy+rGzcXLXAJ/myxJUEXkSZpRQCAZZQk6q9jN+ZmLalO4txELIvpapuVbQ
         3oyQ==
X-Gm-Message-State: AOJu0YzZLi8GD/U2hD3eeamqJS9IlCOczUVp/6KQFq+x9hLdGecfpWvZ
	cmYEWtRZJnepJebwEx/ziOQIr6afVAuqgzRHZHAniR6s2Jf8LToGhpZx42mk3X7qRuxOgw==
X-Gm-Gg: AfdE7cnez7XnSjXT4loDF7OJhrbD7ctC09wnBW9BE0Prx+6l/AVYF7E3k55v2YGN+wo
	vowBstZ0fyn5pVl389Kpvx34S9mx4kthS3CK7NBvv6mMO6L3tO9m9EGJilEX4HTgXQCk4yFs4Wu
	uzfpiI75s8bGVH4ZVhxcC6JZJZWY7NGNFHEmI+5dNnBqGO9p5e8/mEjj06ukSt87qn415wvsCbs
	2PA+RBWPe2XujezkMI1vY+pL1tSMMRgBBXvAWR3IFab8vL06SccbGVLJRySqdRA31Asslo4YAkc
	fUGbZtQpsoIUNHqTwuT3mYiQxxISyTZUcMVABMj+1cCZfdWMx86M4hwLMgQ6NwzqcCpkl482xPB
	wXanUuNtUGzAI7McXZmstLqzLJP3wxvE2JEqc09rBwOfxjBqE7Jka5ZxSO8He7FJG9Zj2SMYjuK
	HwKE9D+owMWJWTTjlypQ9d7nN2rfht8Z/GEQAqyRsiON9aqIuIKi+1nkfupwXWjS78ZTfFV3Mvi
	dE2BWjjkD9heOQjjKV0fSapzXzsRAH4XFxyY9TTIZP/wAiZ+Ui//VU62X9zas4DfAm3NY8Y6aV6
	iVpZpLdCdbbGuSOk/TQw3T+qKYYw9g==
X-Received: by 2002:a05:7022:6b9d:b0:138:13e9:e66c with SMTP id a92af1059eb24-139dba047c3mr10959769c88.6.1782634329365;
        Sun, 28 Jun 2026 01:12:09 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 048/128] libqb: upgrade 2.0.8 -> 2.0.10
Date: Sun, 28 Jun 2026 01:09:59 -0700
Message-ID: <20260628081122.178348-48-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127858

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-extended/libqb/{libqb_2.0.8.bb => libqb_2.0.10.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libqb/{libqb_2.0.8.bb => libqb_2.0.10.bb} (87%)

diff --git a/meta-oe/recipes-extended/libqb/libqb_2.0.8.bb b/meta-oe/recipes-extended/libqb/libqb_2.0.10.bb
similarity index 87%
rename from meta-oe/recipes-extended/libqb/libqb_2.0.8.bb
rename to meta-oe/recipes-extended/libqb/libqb_2.0.10.bb
index d270bf2113..9ea1d542fa 100644
--- a/meta-oe/recipes-extended/libqb/libqb_2.0.8.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_2.0.10.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
 inherit autotools pkgconfig
 
 SRC_URI = "https://github.com/ClusterLabs/${BPN}/releases/download/v${PV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "b42531fc20b8ac02f4c6d0a4dc49f7c4a1eef09bdb13af5f6927b7fc49522ee6"
+SRC_URI[sha256sum] = "326a69fb5b2ee4479f0db4f98d10d670ad0798b5ded8c4cfd585b765fd8941e8"
 
 DEPENDS += "libxml2"
 

