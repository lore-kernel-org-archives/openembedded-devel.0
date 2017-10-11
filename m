Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8D5DE6E666
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Oct 2017 04:53:21 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u138so1041890wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Oct 2017 21:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nXfnIJwct65IpgQPBoI/nnBo0ygsLQodDL9Nmgy4BZA=;
	b=creGmYVeZJeTLVgm3APp7oLBX9IVAMXkE20EIf20h1D5l7lYC48GzSTGl3aXEFKHEp
	isPiHHDPteULFTqoBbjRKVhvxHimJ7yjuoHyjIz2iRlM3GD7phDDdTcwiC67L4fLpXqq
	PT6CU8CnDUlqqqhZdIkmhG+Yyj+mb6WJlWn+TppxCYFzQQAADOKe9/pdRnhjCVfvcNgZ
	wWW47p7TkYl/DWCDzgbG51XEy99JGO0H4J9BgteKaO8VMv35bPoEKPa1lIDMkGbXhRvf
	hiZdNEfDvwcFhyMQK9U9HIy09o1rr7OSM/Hf739mqvChMwDOpL4lO6jvxSGaF+l5u/qx
	4yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nXfnIJwct65IpgQPBoI/nnBo0ygsLQodDL9Nmgy4BZA=;
	b=uV4jTbkg4tWlWUZLnWDBqfEp4y4ZjbkOpqCMRgP4NSoe72FB0CV5snURoNuoVqAv2u
	qu+UlL+lOL1PmUT7zI48unjdp4yjKLFpKNf6MDWE5hjYcqtrELAsxK9LKhBCQ4O5w31/
	b9wcgDWTcOvO5UaGStq8cZM/wp2EOblsgiEhaHEh0oWfa26c22UuGw4jjgNzB5gicMIK
	TzYfGcdkIzpAgf9LcUmV1tC2WyDWuwShPQ+wOD8jR5pzgcHlcdgqtRsT5+t21jF44fdY
	CPB9twv+Mf5RqcwpfKCfFVSm/EfG1sZ8fMFKr9BrciYkNggHoPFdUwVoiLaChtph4Lpz
	fnXA==
X-Gm-Message-State: AMCzsaWERJFmdb50J6YFmZBPYZrcWbxVrTmPOvvc0+QY/FoJB61Odiyd
	9OwWxaBIVlYXpTbUIDr2h4i5dA==
X-Google-Smtp-Source: AOwi7QClBS/ygRE9oW0p1UdXdRkPeIj8sUFXZiC+BULjhVyWTDTFS5rSK955ewBCpqX9NfNwtwyp7w==
X-Received: by 10.80.130.67 with SMTP id 61mr12264143edf.3.1507697602297;
	Tue, 10 Oct 2017 21:53:22 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58]) by smtp.gmail.com with ESMTPSA id
	k57sm8362739eda.53.2017.10.10.21.53.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Oct 2017 21:53:20 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Oct 2017 06:51:10 +0200
Message-Id: <1507697470-18308-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-java/master-next][PATCH] openjdk-8-cross.inc: add pulseaudio PACKAGECONFIG
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
X-List-Received-Date: Wed, 11 Oct 2017 04:53:21 -0000

From: Ming Liu <liu.ming50@gmail.com>

Add pulseaudio PACKAGECONFIG and set it by default if pulseaudio is
enabled in DISTRO_FEATURES, this introduces a dependency DEPENDS on
pulseaudio which is currently missing.

Without this patch, jdk/jre will be built as soundless even pulseaudio is
enabled in PACKAGECONFIG.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index ad3a44d..d21d9a7 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -34,10 +34,12 @@ PACKAGECONFIG ??= " \
     repack \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 cups', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
 "
 PACKAGECONFIG[x11] = "--with-x,,libx11 xproto libxt libxext libxrender libxtst"
 PACKAGECONFIG[cups] = "--with-cups,,cups"
 PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib"
+PACKAGECONFIG[pulseaudio] = ",,pulseaudio"
 
 PACKAGECONFIG[jce] = "--enable-unlimited-crypto,,"
 
-- 
2.7.4


