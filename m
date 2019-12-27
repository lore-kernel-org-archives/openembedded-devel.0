Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id E59757CBDF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:33 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id m24so9126050wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=DTD4alk8qIsQC1HQR4SPSiIuAdnAqv7Wrc3PCr+ZXZQ=;
	b=ncm/0hjtqugU3uoDHxCv7UZciNIbNF0ImbtFewWoNjdOoz2QlDJlYJGnShkhJqPk7M
	nERPFxuGI6OnanZUA9Nne3Z5mqT0ixS6g2m1yze4TyBCyRV33JQI0iCxmY8J0hwNJmmc
	8bAkMESJPpN6tl/Lmm/Fj0KKTr75LgLKuh1w2aacXUC1yg9VNkwEJOCiTVGFiXuXrWM+
	qA4qNgjxsTfZWrliBzFE+NbCeSRqbXh3QtVlStMdA4z1okRVCW1qEsEfvETQq/i6OKZg
	qRObkC9UkQUXkapupKs1yuNQ0z8wHCPtiaph+zGY5RHfqy2/bVXWWNwfOTUkhuEgioGB
	R7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DTD4alk8qIsQC1HQR4SPSiIuAdnAqv7Wrc3PCr+ZXZQ=;
	b=r6ZFzB6AI1+is4j61Egzb5J4GJgIpJtP7e2N+JWvEUuC/srE+oaCa3gKrWhwHkD7dT
	ZYUnxQagyaSWWC4StmHWphGmjokNpEETCGsESDfm0UXEt2Qehhf4F9kMMVUfp+YgLvPt
	jUOGWcnsWmIkCwUjaqcAJ9+oqSRSAlc3gguRCMX8vHlbKFMTItCxSdBKa6ZqfyBzeRGg
	U0ySV2VmRsdVhcdr4BTHgTD4Vp9xklfNWdBByzJwOWvark0axbU6QVE/EqCekkjcNtOn
	ann9jE3S/obusZuxX3yluSYt+pr25QwI7w2I2hBGHRWD6hqSnAb9yfJfEGVOaRq9TFMX
	slzA==
X-Gm-Message-State: APjAAAX2pUvgC1weh/1aF/3rxU9ziladfEREfiOvVN7z7rdmLIl4LDAv
	Sw0nZ/e4mXDoWZ9i9cVvC+q3NkJsc6U=
X-Google-Smtp-Source: APXvYqy1KnWhBwshPjR8UkbfUo6oNnzxiCCtXvB62cbCJlN9yHOWaJhSiyKLeEt+TqkTUmXmzkg88Q==
X-Received: by 2002:a1c:a982:: with SMTP id
	s124mr20308713wme.132.1577482293666; 
	Fri, 27 Dec 2019 13:31:33 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:05 +0100
Message-Id: <20191227213120.3930-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/23] file-roller: upgrade 3.32.2 -> 3.32.3
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1] - just translations

version 3.32.3
--------------

 New or updated application translations:

  * Basque (Asier Sarasua Garmendia)
  * Japanese (Ryuta Fujii)

[1] http://ftp.gnome.org/pub/gnome/sources/file-roller/3.32/file-roller-3.32.3.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{file-roller_3.32.2.bb => file-roller_3.32.3.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_3.32.2.bb => file-roller_3.32.3.bb} (77%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.3.bb
similarity index 77%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_3.32.3.bb
index 54acb6039..3ab9668ec 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.3.bb
@@ -13,8 +13,8 @@ DEPENDS = " \
 
 inherit gnomebase gsettings itstool gnome-help gettext upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "e79715bb2400df83c0f67cc0cce2b655"
-SRC_URI[archive.sha256sum] = "c60a79e0baf74cb1c09a1c8f5ffe0d6e311227ca14ecc5b1156beb3715341a71"
+SRC_URI[archive.md5sum] = "5e098bb254d34f48a9b5761b468f4240"
+SRC_URI[archive.sha256sum] = "be111fb877dc1eb487ec5d6e2b72ba5defe1ab8033a6a6b9b9044a2a7787e22a"
 
 PACKAGECONFIG[nautilus] = "-Dnautilus-actions=true,-Dnautilus-actions=false,nautilus"
 
-- 
2.21.0


