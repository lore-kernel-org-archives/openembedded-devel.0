Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 98E7F78A14
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:17 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id c11-v6so1872330plo.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rS48X2lBcknG2RO6KUdsqxiFeiZhAUEW+bb9+Wud+u0=;
	b=U2Gtken0NAcCM6hqib77sCWqZIOLwt9EkC1upHTkuOgjRTL2p0P7DrfJFmfzdUuhsw
	bBLH2ZmT8JSPsU2c9/xFQgsucTwq9dE8CxyW9BKISQ9ddiDOO0K97zwxQhAEtikAYwlE
	LIN/2yu1sr0wUMzKlUemQiZ+39FIGVKbeAfHBiI6FPRgH1QotZiGlgM+jsUyQfc3JOXt
	oMie+z6mUEe3zWCelo6u/9uTlnmCGKKuAlCBcwHkuMwzLMZvsOs1XPrrMXyimKuqy1V2
	6+jc1OUXtxBWE8fJRNi/GovBCMg4nVFa1nbUNm+flFugEN/26J1361Am7fUVeYs5QqpG
	0GXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rS48X2lBcknG2RO6KUdsqxiFeiZhAUEW+bb9+Wud+u0=;
	b=WT3sFhsGOwan4afEQPyV77E+0ijuPKiSODExVFn3MY6FXZggw9oyduaXLKJ45p4rR1
	o3vveDpsKS15tvlp6gxAWretGe08O6ppIUOdmSYxgEpFxU1jyYaw+IJgjfxYGwzSVJfL
	Kqozdv8YfvWgLdAahtX0I79CjRb2m4lxNl+HQ0SWGDnmsVT6iAndzskMMcWZ736mS8Ig
	zbOneVTgI9aEyNhX0GdI3tX/1Fka8hMtmXukNRi9qqCyl1JdiN9Sqws9EUH4cGyYeKyJ
	iut6xx10tbE5tant9e++sHC3utVzPtJKc1kAIVkM2t+sHJnBsjHFwljHlvy9yQSmoz3c
	vb3w==
X-Gm-Message-State: APf1xPD5z8stIUHkiedute/JUKgs4VKoJu14MmlE7DvSe9xAM1XJIleR
	e+mhbmH9GExYtsY8vQHvyR8=
X-Google-Smtp-Source: AG47ELvJRaxV7HR+KO78QsXX7SKgVneaEnnL2nRDwg9CbRpzj2nKRduHnTRvo77z/8QDeTP1Spnidg==
X-Received: by 2002:a17:902:684a:: with SMTP id
	f10-v6mr21899072pln.129.1520449278816; 
	Wed, 07 Mar 2018 11:01:18 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:00:54 -0800
Message-Id: <1520449275-29492-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 02/23] gupnp-tools: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:18 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.13.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.13.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.13.bb
index 9360d65..3ddb818 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.13.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.13.bb
@@ -8,4 +8,6 @@ RRECOMMENDS_${PN} = "adwaita-icon-theme"
 SRC_URI = "http://download.gnome.org/sources/${BPN}/0.8/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "212d85ebce89b32468b59e1164050d40"
 SRC_URI[sha256sum] = "aa3decb9d532c0e2e505adc592f431fd81c0231ded2981129e87da13712479ed"
-inherit autotools pkgconfig gettext
+inherit distro_features_check autotools pkgconfig gettext
+
+REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.7.4


