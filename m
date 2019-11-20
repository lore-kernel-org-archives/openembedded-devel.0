Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id D6A476C3B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 23:38:14 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c22so1641765wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 15:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4qQoxjQ2z/X41Be/0tTh4PQop9SzqdpEY37Z33cTOJE=;
	b=oWPESgZfq+YnIm8bVl4qtSrZXUt/QKZ7dGT8ARDMMmyhJnp8n88dgNLymyu8DH8Q6E
	CGyIudIhpmDOpsSWCsOa/Gq28XgZQRM62kfQZNg735JWAQ8aqlGMoGshNX2KiBU0G2+l
	azQjBnD4rkNDZK9htMfNx3lcjrBZUlCgF0AdvZRFKdi2znHFgWvaB5C4EkC5k9GkODAP
	JyXQsofn/6BZSbEeffGO8suJZ3j8zRffN+wiXvN6G17uMqjB3iT36VjuYnsg5+MJMYnp
	t6cRw4tfr3de2+jiKYTAs9HOsMEXYnWh7LqH8WIvEJ1uvhdxt+sqdPE/c34+RKuzZI1J
	nopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4qQoxjQ2z/X41Be/0tTh4PQop9SzqdpEY37Z33cTOJE=;
	b=IFK4Lqp7vnxU6ZaZmsmECNxmWKrtcgqSQvA6+rDN9qbZUU98/3rHoLSi3HMgPc0Wgm
	PZh4OYqSTu9nLTvKKgTkOem1bQ8h9r4zowOguG2LQ7mkvRUnYFWDyHBQEELTuHDKZHas
	RrSsiGo7u4HggvaBHBaYdJw6NULPr654Qc2ByggZtVMdcSJQoWTZTQhOWf33SXYRy5vJ
	vWlR6LBY7UVkMJ3YsAGxxlepU1p/P+6LMSEnDXsjnXn6pB6n9GeRAiBY5/4zCA2RbcBk
	dNm+QD78K/KR4UWv8eXaDYMseir8TN/H5x4WIThdT2xLT9OhAq6yMOpdHYSARu7DhUrH
	4V+g==
X-Gm-Message-State: APjAAAV9mNSz6R5POobBPE2Y7oxhEACg1nqW9vGZPGxy1c4pccbJgObO
	mAe1Ohi0yTuoVgBS/9+9WPbz5LR0
X-Google-Smtp-Source: APXvYqyM62Tq1a0s5zVaEV4CMe6ywCP8CRW/aMjqjw8kS2sutNG8CahnediLJ0Pxgksr/9YekruvHA==
X-Received: by 2002:a1c:8086:: with SMTP id b128mr6414306wmd.104.1574293095088;
	Wed, 20 Nov 2019 15:38:15 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0CB687FD2CB83E858114E3.dip0.t-ipconnect.de.
	[2003:f0:7f0c:b687:fd2c:b83e:8581:14e3])
	by smtp.gmail.com with ESMTPSA id
	x10sm1014074wrv.60.2019.11.20.15.38.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 15:38:14 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Thu, 21 Nov 2019 00:38:05 +0100
Message-Id: <20191120233806.31207-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 1/2] exo: upgrade 0.12.8 -> 0.12.9
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
X-List-Received-Date: Wed, 20 Nov 2019 23:38:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.12.9
========================
Bug Fixes:
- Explicitly depend on gio-unix-2.0 (Xfce #15825)
- Fix alignment of multi-line filenames when text beside icons (Xfce
- Fix cursor missing in search popup widget (Xfce #16068)
- Fix desktop item creation on symbolic link directories
- Fix excess clickable area of multiline filenames (Xfce #16075)
- Fix issues with displaying icon view contents (Xfce #14737)
- Fix prelight deactivation (Xfce #11806)
- Hide search widget when doing a fullscreen resize (Xfce #15106)
- Make user-created launchers executable by default

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/exo/{exo_0.12.8.bb => exo_0.12.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.12.8.bb => exo_0.12.9.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.12.8.bb b/meta-xfce/recipes-xfce/exo/exo_0.12.9.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/exo/exo_0.12.8.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.12.9.bb
index fdd50d435..a12520417 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.12.8.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.12.9.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-native = " \
     file://reduce-build-to-exo-csource-only.patch \
 "
 
-SRC_URI[md5sum] = "e618ce760a12ac7427a48a44c69f3d31"
-SRC_URI[sha256sum] = "3400a2e64aa41ede25bedaca4909bde7ea4f8698d9598d1b80f02a40ac89fcde"
+SRC_URI[md5sum] = "9730f9d270b4968a8bbebe73e6de934f"
+SRC_URI[sha256sum] = "9ba0bf0fd59aeb1cd32ae3863e7a78222655eb15eb675ba08f3b3fb933b6fbfe"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG_class-target ??= "gtk"
-- 
2.21.0


