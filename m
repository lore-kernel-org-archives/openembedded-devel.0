Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id AA7B571C64
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Feb 2017 18:10:23 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id ip10so13952172wjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2017 10:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=geQwSjiOF3U3DgzmxpbBf2qt5u0GP8BF6EfPWvHu1Uc=;
	b=plDPge1mVv5fL0aGI7JgbyTpT7dSDewVnAEO+zEuieGugiOSi+XZ7bMOsRrHF+UXdg
	3LSYbgqqpMixgq3utAzNrWFHCdXFS8xpor1ByPj2QSIaU9Grilybfvtnw11ziVUrTH/3
	RWWE+b1WgTbMZUS6aRaoJ608riJT7+kdx5jK40YQB2G2KLJy3tD4aFAqnjZe4LQKHz/T
	yE7+UtIa5IocVXR+z01a4jzIGLNzLI5xp0pfIqB9oM2Fz242beJedt0SlOODnRcJuO/G
	XlNXAOhX69cwUatPsuk58eP69JaggaZvGR7puFhrJg/9kMCUN3oRaiQOCmiYLGeHGrg8
	RpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=geQwSjiOF3U3DgzmxpbBf2qt5u0GP8BF6EfPWvHu1Uc=;
	b=nQsKTXTLDHrIrzE+0buQ8cW+hy2YYqxPwBWmHFpJV2p7L+wKCG1kFDBTJybViq8M4m
	SRXtk9J31+W0T7Ff1lHN6ItdZFK5QMNJl4bZY7IDakiVGSYNuDjIl+G78rJEFu4m2AOI
	RJKFn7tiKI7wehV9CPg+UKTqAApLdr8ebYwr1EKHcOktGM0jB6fLgYJKqy7UhHJMfksR
	roBtZpb8Hk/eGmDdq9vMxNUo+fv8SWa26SXqxg/mZ9Rhd+RHfhe2vcO+93Ljrz+CyufO
	uOXON2ofDBSqfIT+u9p/FRtX+jwTRNDZzxYqZVaMdIUw/sV3zfZHh3H2ZnglWrMknHEx
	IqKw==
X-Gm-Message-State: AIkVDXKscf2zgAxf5g/ISQw2BZngqxjMMCCurG9qQUDqahIx3kyFaG8srESOI0fx0oSXPg==
X-Received: by 10.223.164.150 with SMTP id g22mr3800301wrb.148.1485972623574; 
	Wed, 01 Feb 2017 10:10:23 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i203sm2708494wmf.12.2017.02.01.10.10.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Feb 2017 10:10:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Feb 2017 19:10:18 +0100
Message-Id: <20170201181018.12894-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170201181018.12894-1-Martin.Jansa@gmail.com>
References: <20170201181018.12894-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 2/2] geoclue: add missing dependency on gobject-introspection-native
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
X-List-Received-Date: Wed, 01 Feb 2017 18:10:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
index 3170d44..1d531ae 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
@@ -8,7 +8,7 @@ SECTION = "console/network"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8114b83a0435d8136b47bd70111ce5cd"
 
-DEPENDS = "glib-2.0 dbus json-glib libsoup-2.4 intltool-native"
+DEPENDS = "glib-2.0 dbus json-glib libsoup-2.4 intltool-native gobject-introspection-native"
 
 inherit autotools pkgconfig gtk-doc
 
-- 
2.10.2


