Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4906F788FF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 19:08:48 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q83so11531946wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 12:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3kZAP/232cQkFkMsciTRqorEMIFdYKMfQn3WFnklao8=;
	b=MzzxgxkefDVwVpKOLpRfoIYjdVWHz+XYF5t9Bf6uiAqqIqNFSVbgsgZB4OviJ5Cb6W
	xS7WRndeK7HAqsuBQflfW1KM+4V8YN5e1S9pyslH77ebAzpVZGFDUS/mOb2tf60ocOni
	LhmStG7doFNO3Wxg//3wYFF48PrDJQEP5jz3MlivDarIaB2l5ZZzLBjh7DO7T6bFjogs
	uI+B+r6PmcKZ8wmsu8Q6VstqSsanR+xD4VKaMynGau7Or4IBl2VKM0Jcs6CgrmmW+DY0
	U/y19aioL+IS5a0ocMNta41aXx9K+aWdupEfeGKwZouu49jQEXs24Z4FIRwushNE7boG
	mq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3kZAP/232cQkFkMsciTRqorEMIFdYKMfQn3WFnklao8=;
	b=ZZCIs1zPeio5ndNm6q+xdqPUch0W9fukhOnigWJHnU+WhuP7v37jQ+ESA7FQwuAffB
	FVuCLiUpqjb3PX6hZ6DqbodHybIk7vvRfAz640LnRFbkI8uE5cw2knDEADSy1CFuWCfb
	TbUImepbx6uGRXXhr88WEqZ2FUEO+ZYrRblo9EF6uXXP2jTBGEjrAUH3ZIAUgs2ZPQw8
	s1neCfOSvxI/Sjeqtz44gVpax3EQR5Gkv0Ja5HKyuCFLeEWcAoCm0Q3W8jzwVSVs+f24
	k/Y83INPKbWlWsZGnvoIXKlOfSbrJujnJOtJtRBkfnOcVmxh5w+gAtbyshFpfovQyXo2
	5xKg==
X-Gm-Message-State: AElRT7G8qJta6reV2jAy1Eei3wRIJBIo0IrEkcyNHUsOg1fP3A3J5+TD
	uRU8k6jo4B1L62f1lANb82DizA==
X-Google-Smtp-Source: AG47ELtOwnDz7oyES+MMpdqHppx3s5Cm9Nwg12Ui/zimsQ73Ru7LqlQGhv+Ds0P4oVUru4Nfd812zw==
X-Received: by 10.28.236.75 with SMTP id k72mr4088204wmh.15.1521400128898;
	Sun, 18 Mar 2018 12:08:48 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b78:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	b8sm11614531wrf.29.2018.03.18.12.08.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 18 Mar 2018 12:08:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 20:08:29 +0100
Message-Id: <20180318190833.1393-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180318190833.1393-1-schnitzeltony@gmail.com>
References: <20180318190833.1393-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] fluidsynth: update 1.1.9 -> 1.1.10
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
X-List-Received-Date: Sun, 18 Mar 2018 19:08:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../fluidsynth/{fluidsynth_1.1.9.bb => fluidsynth_1.1.10.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_1.1.9.bb => fluidsynth_1.1.10.bb} (95%)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.9.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.10.bb
similarity index 95%
rename from meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.9.bb
rename to meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.10.bb
index fffbf0cae..0ec4c49ce 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.9.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.10.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
     git://github.com/FluidSynth/fluidsynth.git;branch=1.1.x \
     file://0001-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch \
 "
-SRCREV = "fe37923393d6a76f42ed044aa56dadc66ec909ce"
+SRCREV = "f5a0fee6f7f2b2ab4c866df1acb649333464b3fd"
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig lib_package
-- 
2.14.3


