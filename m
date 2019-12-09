Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB467FC56
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:40 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id w15so15209970wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=E3E2QMVe9iGuXGHa2x6HkpaAdGVAaWJV8yfFoWR0ozw=;
	b=Eh9hHTX4AnS0Ywo53+Wu0+wtJcPM0Eucqj1A2HKSf21RqhKZCmvQ+ujo/dB+RdfjFt
	Ebw84i+oGrI8DbaS9rK9WX4QKOO9Hc756ZfMQMtByoNSE3og+Bbvo88gQFI3+twXp+7N
	h11lUm0c+FJKVqiBtA8ZLJKlMN8gkFwRehencyJO12P7s0Prjvg49ml1FzHbeqaV/J0H
	CfS7aRruxVE67bL1eTeZQKAcy2BK7MErzIMgbUTN8Nj6rvxVceP00i/aNE7yr46St12X
	Uou3ab7ZSHPZEh8I4cW+k0KE9pwxiFIQ7avLlCtjs6xzTO92V2N8R1pqWu27nyyJSRpz
	WDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=E3E2QMVe9iGuXGHa2x6HkpaAdGVAaWJV8yfFoWR0ozw=;
	b=TYX1CkpXBQEBsO0IelGqGvtEq4/ia5Wz8CuQWTUGbkwJOo3T/EZOtS488AOKQrwtH7
	ZDRq07Q+SbNx2LxoW/UZHcqPn3CQYjmBfpsCNs4K/lGD50wGyckBsekIm89hHPh4shB/
	3DUUUwGKe0ovZ6lX+OW1vtStGqFhyRNkCUZ0OKAM4skNDiDhmp+uUfWfopq0/u+rTjmw
	RnI1yJ6HsnjY5a1lbU4RABJxNMneSE72GXwhukJ1t+SNZ1sD9+/OIVHf4L1n44ZDrpbp
	i5oOBe08kM2Jr/OnLwBr/qjj4IM3z8OHcjSCKeSXoE5Zxt1bnJ6TWKlR1MDxUlJI07Kt
	sOZw==
X-Gm-Message-State: APjAAAW2JTwMxbmkiUZnJs/T4G2kAusUuYauT+HSCByC1ZZdL2CSsgEu
	Zyq/ZpXhp9S6Renl4zkTdKjpjvJF
X-Google-Smtp-Source: APXvYqwS4Dejpes4VBGiG6sCavPTe8tuMnRU4VTpofAwWAYwpX8TZkZkyc2XcZ8FzXSF/f1P9+CaPA==
X-Received: by 2002:a5d:534b:: with SMTP id t11mr747171wrv.120.1575880601038; 
	Mon, 09 Dec 2019 00:36:41 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:40 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:36:10 +0100
Message-Id: <20191209083612.23922-19-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 18/20] file-roller: remove nautilus from DEPENDS
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nautilus is added by PACKAGECONFIG[nautilus] conditionally

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb
index 7dcf3e9ec..54acb6039 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb
@@ -7,7 +7,6 @@ GNOMEBASEBUILDCLASS = "meson"
 DEPENDS = " \
     glib-2.0-native \
     gtk+3 \
-    nautilus \
     libarchive \
     libnotify \
 "
-- 
2.21.0


