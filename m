Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2427711B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:38:04 +0000 (UTC)
Received: by wijp11 with SMTP id p11so30296920wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 05:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6AqGnyrGHLmh538XE0KahKqxnw+E1ajlip77ScwecL8=;
	b=TJ9lUEiW1nAaRVT12OzbBrMntNsawEV0JTlwTK3M12v06bHZQepWpiyVSEtZ79QzfC
	q3hlafgBXeIZaUkihz4YTrYoFeoIouTrh/SrbRU8wfyCslyKdSR4qFnvYTAqqmB35Bvg
	2Zt455crr563MiC0i58wRaMJrWeKGSZ8u6cJkTBCMNdCiKujq+GohS+8ykkqQlTWVfu/
	2wDnMFwc/Shq+PnjPQy1pSW2zjrNelOHu+oBDvjByrgZuS5VIN6W6Vs1dd97PCHc1V71
	el6Y+AHcZ98tI+nse2qdn+WNdFfalzOWBIu8YW+x3RbwKGE/iUsSoLMHwI01VYAivUH6
	2gEQ==
X-Received: by 10.194.232.230 with SMTP id tr6mr15147858wjc.21.1446817084806; 
	Fri, 06 Nov 2015 05:38:04 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w73sm3104821wme.12.2015.11.06.05.38.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 05:38:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Nov 2015 14:38:11 +0100
Message-Id: <1446817092-9386-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1446817092-9386-1-git-send-email-Martin.Jansa@gmail.com>
References: <1446817092-9386-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-qt5 6/7] qtwebengine: include chromium SRCREV in SRCPV
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Nov 2015 13:38:06 -0000

* some projects can update chromium and qtwebengine SRCREVs independenty
  (we do that in LuneOS) and without this qtwebengine won't rebuild
  automatically when just SRCREV_chromium is changed (other alternative
  is to add do_fetch[vardeps] += "SRCREV_chromium", but having both
  SRCREVs in SRCPV is useful in these cases so just include both.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index e4427c3..a9416d6 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -93,6 +93,6 @@ SRCREV_qtwebengine = "40ef43e0d69c4a86c9430b7f264d2cde6340ee0f"
 SRCREV_chromium = "ec5b3304fc266dfdec7666b8b73d57a3971ea35f"
 SRCREV = "${SRCREV_qtwebengine}"
 
-SRCREV_FORMAT = "qtwebengine"
+SRCREV_FORMAT = "qtwebengine_chromium"
 
 S = "${WORKDIR}/git"
-- 
2.6.2


