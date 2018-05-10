Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3F1E575264
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 16:14:25 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o78-v6so5391436wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 09:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2nhDjeRLfrJfHk/oGvV1S7zql211MenEdIyjOeasP08=;
	b=eqT5zpT/SZxoXRF/jkpOpDmMHk48nfB560JDFRA9flvMIYOdpvAldLQaoP2lEFW06a
	X5t8sxQBYCo1RCJT4C/tHWq1WXVE56on8v6qgcH5vwOv34DErhM02N4ITFuSbIqu0gPb
	1jTfYDfpJAGNHW3/nM9stsaILPHrWo5mWiJTgcKpS5n5H/3I75uOsZHWCY8KhdXncNMu
	ma2IieM4/ndHmft+H1Ff3AuSKh+alL49/C2RY5/12wY7U8isYwlgZDUXWMFX1X/2NIiF
	xT534sjwEAzaFJgM0r3KibO3nCCVyNmDUX7yF1iHGceK/zDOOmIw5c2wFHCaeUAcfKZU
	4IhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2nhDjeRLfrJfHk/oGvV1S7zql211MenEdIyjOeasP08=;
	b=Lm3GdfIew+2cbCa2BBLyNuoLSYSAaXgGZmA2l3MHaOJFe97AyZJHg8K8iuPheRWm8T
	mcKpQJtslS7cpzEEqxjoQk88CMhTe3dlvJV8x27/6Tl3dMLaUp684ouiBZwMfU/4tJJS
	Wy6sf7HNVQjZNsjiFRboZ2zYFaiHjNJtO2XcOgjAJqht6b+XA/6NGmFHHWeH7T2EWGQR
	fsY35TATT7zg25+BKsZdTQtRGPWJ/JElw1317GvF+OlAybJUpkznKAJ1ygbYRCLCEykx
	CqXcMIcNMio6yh51LzlFzWUl84YJ8fs3//aWWHtX6nMGRGGjvkpz4BjPCa1m2YwWg4SA
	M88A==
X-Gm-Message-State: ALKqPweEdUGq47RnnxCprErmij/82IZ2516SXkPi4hCVlpQIwgCAmXiF
	CRvt5MVZlukSPdb/AOJp+M9w2g==
X-Google-Smtp-Source: AB8JxZrJaKbLEHKBrUKw3qSV+8VN0oX+BFYOqaFxLejm4NSXN07ACpiASXnsd5VX967tH8i0o50Q3Q==
X-Received: by 2002:a1c:d546:: with SMTP id
	m67-v6mr1784267wmg.117.1525968865472; 
	Thu, 10 May 2018 09:14:25 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC0732689B6120586BBC15E.dip0.t-ipconnect.de.
	[2003:f0:7bc0:7326:89b6:1205:86bb:c15e])
	by smtp.gmail.com with ESMTPSA id
	f143-v6sm1679595wme.43.2018.05.10.09.14.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 10 May 2018 09:14:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 May 2018 18:14:10 +0200
Message-Id: <20180510161415.12827-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180510161415.12827-1-schnitzeltony@gmail.com>
References: <20180510161415.12827-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] fluidsynth: update 1.1.10 -> 1.1.11
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
X-List-Received-Date: Thu, 10 May 2018 16:14:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../fluidsynth/{fluidsynth_1.1.10.bb => fluidsynth_1.1.11.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_1.1.10.bb => fluidsynth_1.1.11.bb} (95%)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.10.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.11.bb
similarity index 95%
rename from meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.10.bb
rename to meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.11.bb
index 0ec4c49ce..5002fc9f3 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.10.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.11.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
     git://github.com/FluidSynth/fluidsynth.git;branch=1.1.x \
     file://0001-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch \
 "
-SRCREV = "f5a0fee6f7f2b2ab4c866df1acb649333464b3fd"
+SRCREV = "f65c6ba25fb2c7e37c89fc6a4afc5aa645e208c2"
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig lib_package
-- 
2.14.3


