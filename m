Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id D797971A8D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jun 2018 09:31:48 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id n5-v6so2385344wmc.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2018 02:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X+8tLquB5mPvQG3Qi5vR+KXYpcN/VNw4brFTspxT97w=;
	b=tniP0sSq4eQ/co//exj0V8bR408TpytjPDG5vB+x996TTO2DfxJKs4yKbIths6hIMR
	Bai5WwZolRZesHDBIIFsJpNPAlQzs02stmkjy42LGqSWl7yLt1z5R/zAYDfop1GlhXSi
	wlgjOOfzuonmaZK2UWaM5yqfyL7BDJG91Ytj8shMQv5qhZaCJeuMg1afuZrgtFYooH5j
	MW/1QppHBv9oL4DxOm33Fr+FfNbqtXgNk6PU1wkEpiK3NmcVH365Toh0yN57ebC0M4z0
	AkTHGVt7Ww7nY6K9+y9BxdofsZpOhqdoQ1OQA4fheMnUPdU1JwlmxGnKa3M+VPDCk9jh
	Kj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X+8tLquB5mPvQG3Qi5vR+KXYpcN/VNw4brFTspxT97w=;
	b=ofAXt5Yn7SpsDqLqFPpKRGqmw4pQLiRj9F8kV8MjiG4X1GEFain5YoIutAuBrNhZ/S
	zuZ3lg1BIuI71oekQ9IpFzSSbCDPweLRr1sthS1YAKOt/FerUomdWgLLNZICLKoOkcN8
	IXQAv44rMKDPMZHuE6BsSThHOhym+SiCaPrSKBiNtQGcYuIGqIXkqhPZlV6u7d+SVNdg
	5WSWQA9dAZ5DeexSdCu9Em/SSeze4FhT/gHGjn5o8cmMF+gH9DrgABYVvdPxQihd1jU7
	RV9x5xVw7sHiI0Lsjnq0rNStTvIQdDDPI5J+CjYYMwG3aXxWLsQhJIfrDJGGNR3hXXtW
	uDPQ==
X-Gm-Message-State: APt69E1RXSZUXPvYaL7XWT6DzaW+dk8RC5WijZFvQWNBsS7/Y+qb8SOT
	sCN4F3ri1smEWeGbu8Jurmzdjw==
X-Google-Smtp-Source: ADUXVKI2LMlRWw8whVjsiZdluRvxQ3R2ylFaXUrLXh0Y4Y14KOaKbnxsqp0ogWVEbL58SSzM3XNRNA==
X-Received: by 2002:a1c:b954:: with SMTP id j81-v6mr941910wmf.89.1528450309116;
	Fri, 08 Jun 2018 02:31:49 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local (p50971113.dip0.t-ipconnect.de.
	[80.151.17.19]) by smtp.gmail.com with ESMTPSA id
	d5-v6sm13115797wrp.64.2018.06.08.02.31.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Jun 2018 02:31:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2018 11:31:40 +0200
Message-Id: <20180608093141.7337-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 1/2] qt5-creator: Remove qtquick1 dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jun 2018 09:31:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

qtquick1 was removed

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 recipes-qt/qt5/qt5-creator_4.5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5-creator_4.5.1.bb b/recipes-qt/qt5/qt5-creator_4.5.1.bb
index e97e591..c56fcd1 100644
--- a/recipes-qt/qt5/qt5-creator_4.5.1.bb
+++ b/recipes-qt/qt5/qt5-creator_4.5.1.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 
 inherit qmake5
 
-DEPENDS = "qtbase qtscript qtwebkit qtxmlpatterns qtx11extras qtdeclarative qttools qttools-native qtsvg qtquick1"
+DEPENDS = "qtbase qtscript qtwebkit qtxmlpatterns qtx11extras qtdeclarative qttools qttools-native qtsvg"
 DEPENDS_append_libc-musl = " libexecinfo"
 
 # Patches from https://github.com/meta-qt5/qtcreator/commits/b5.4.1
-- 
2.14.3


