Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id CDAA67851F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 12:39:41 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r68so2725712wmr.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 04:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pEQxyTOJc8xeQxQRG9ZB6RPka958iqfWNP6lltosueo=;
	b=EmtNzzf7QDasuVmGe/PkMXY890or89LDqNvEJDLPQDcasFKLC35zMYclT4wXRiuW2l
	UQzEiBIzE+nJjQwHTOMx/zf7hTjPhNjbghAhpdzoqEkDWV6NGJdsjaoRFYdObgHQBDSv
	SFscRviSns8tAUC26BTNbTaEjVisH6NW0ItciAoJs7IAGB9W88p2k1uZVvCs8q4mRUCV
	UYSFWTy7hlJMwruHsdxZnXkxOgpBT94xzxf8EB241Wp00xaf4eYDvqKfEcv4ZieHjnP8
	Fbtol30vcO7U0YPMoWlTcAg6nWKO/CrH5dIvDKzL5Qn+Aas5MCDLrfdJO1sj4m5RPBT8
	p/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pEQxyTOJc8xeQxQRG9ZB6RPka958iqfWNP6lltosueo=;
	b=c4QwWfAgnMffXHJRgNqVmpUWnLtOF6flAybrhmYvVcKwccWRSfGst8O0fEpNoJQ/LV
	kXdQ0AUBJrp9Vx6hub97VwSGsiWBwodM6C5OXZafOUO7KH9AAUWU2seTjVFwvORN4zAo
	s/aBW2NYx50nKLOyW1ETtSw1hm62OoLayww+CEzK8vr2mZ09ADPnr00d9OHRctSIJvx2
	ue6b+wV0zgt48YCTibb672pxTE9Ay5uowuEd/uWXOYPPzikbpSijCOW4zCzE+MK5wvWP
	blSTBe/piH5sYDCbna1siX8iZOf/WotxupQhOHTlODe1d326xEKdaOSZJDS7VwA8756s
	eTPA==
X-Gm-Message-State: AJaThX6f0jz1Ai3dBjKRG+sQ6WuURVwc54u/bB/XoRJhapMpd5Q7odz5
	II/M+ikhvnOkASJyq88Stc2FUQ==
X-Google-Smtp-Source: AGs4zMbcU4/Dui7K61Z508rhMWN3+bFWFFE7AugbLdFTt3ods5KViB/+/e+1m+y7dD+RygVE/YYIVQ==
X-Received: by 10.28.5.148 with SMTP id 142mr11785467wmf.142.1510749582155;
	Wed, 15 Nov 2017 04:39:42 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	69sm12313852wmp.37.2017.11.15.04.39.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Nov 2017 04:39:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Nov 2017 12:43:34 +0000
Message-Id: <1510749814-110-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-browser][PATCH] chromium: fix DEPENDS
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
X-List-Received-Date: Wed, 15 Nov 2017 12:39:42 -0000

* there is missing space in append, causing:
  ERROR: Nothing PROVIDES 'libexecinfoyasm-native' (but /home/jenkins/oe/world/shr-core/meta-browser/recipes-browser/chromium/chromium_62.0.3202.89.bb DEPENDS on or otherwise requires it)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-browser/chromium/chromium_62.0.3202.89.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-browser/chromium/chromium_62.0.3202.89.bb b/recipes-browser/chromium/chromium_62.0.3202.89.bb
index ca6c086..640c6fe 100644
--- a/recipes-browser/chromium/chromium_62.0.3202.89.bb
+++ b/recipes-browser/chromium/chromium_62.0.3202.89.bb
@@ -53,8 +53,8 @@ DEPENDS += " \
     virtual/libgl \
 "
 DEPENDS_append_libc-musl = " libexecinfo"
-DEPENDS_append_x86 = "yasm-native"
-DEPENDS_append_x86-64 = "yasm-native"
+DEPENDS_append_x86 = " yasm-native"
+DEPENDS_append_x86-64 = " yasm-native"
 
 # The wrapper script we use from upstream requires bash.
 RDEPENDS_${PN} = "bash"
-- 
2.7.4


