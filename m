Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 882C56067D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 21:02:35 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u63so15998307wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 13:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ew5e0Jy9R5Meeq/9ABmRGrWB3bXBcUR5q66W3tSIBOA=;
	b=HKXyAxQ2iyGKMec4MRpa5Yut0+BNCWGv9F+hoRWTrrIrhhlXWfbGtfojzWigCEaLdQ
	2jdnOJePfor91xpoYEuyxPP11Q5hbvy9GVsaw8YEiAK2Ib+JIbGc3YfWYsGi07aTHkmd
	REYg4cYJeOtE55EfhG/IDN1i0u1c/oOXLeCIFIuZBdf8rtcPJzP23h3cilByf2dlZYrQ
	yzn9kPd8Bty7RoFMYOdB69GezZ/lxEgkOVYiLkFLK5DmZ6xqr+XMwppwOvcfOPkdQQ3b
	ntqOdLVK5jM8mk4BHmE3kjXTH2Jd5oq4g8JnDBlMOTO68e/eMQYaSG0lveycXJIN1RhC
	1nXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ew5e0Jy9R5Meeq/9ABmRGrWB3bXBcUR5q66W3tSIBOA=;
	b=GKz2xWX97rlFvn5qsgyy71aIpy98hkz7MDPOktd5dV2ReOcesQBNvydhFcFwGcHfx2
	V7vsppsOEFpYUipGKy2c/ad86LbGHTS9Q5qExBYAc5PvyLBAEsXTfvQT+yzV3sKsCeua
	XVijdqtPt9QxwtmeOPkfcgRVZjUnSsHbw9rHcKND0xNZjGx0IVtO8CDPqZZAJ/boac25
	o8XewqsNQtt2UQlkJI7WaWOXHCO4Bq93Oo2KODArtbGS+6jyfNjJXMRzR4WOlWR7wiMw
	qt1Gg/b+gtiqPjVpxVbl4Rgv76C2AGWftqoY+uhKPzJBPx5PuWM9fXI/ZlmKMtBW23Yv
	tC3A==
X-Gm-Message-State: AMke39kn+mHEFPj2SWO0y4Z/1betLmGB1Q/2lqmpad1ZUQnlZGkrbiR45AcZ/jWC7XoVMg==
X-Received: by 10.28.217.83 with SMTP id q80mr33448580wmg.58.1486933355500;
	Sun, 12 Feb 2017 13:02:35 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E91173851E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:7385:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	s18sm2688541wmb.18.2017.02.12.13.02.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Feb 2017 13:02:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Feb 2017 22:02:13 +0100
Message-Id: <20170212210216.867-9-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170212210216.867-1-schnitzeltony@googlemail.com>
References: <20170212210216.867-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 08/11] gegl: fix build
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
X-List-Received-Date: Sun, 12 Feb 2017 21:02:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb b/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
index 9de8489..90f0216 100644
--- a/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
+++ b/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
@@ -19,6 +19,8 @@ SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.3/${BP}.tar.bz2 \
 SRC_URI[md5sum] = "c19478321594d715a4cb324a0decda6f"
 SRC_URI[sha256sum] = "846290a790854d1e6b7c17a2d6f82ad7cb14c72e240bd3b81b98cc0ceddbc3ec"
 
+LDFLAGS += "-lm"
+
 # There are a couple of non-symlink .so files installed into libdir, which need to go into main package
 FILES_${PN}_append = " ${libdir}/gegl-0.3/*.so ${libdir}/gegl-0.3/*.json ${libdir}/libgegl-npd-0.3.so ${libdir}/libgegl-sc-0.3.so"
 FILES_${PN}-dev_append = " ${libdir}/gegl-0.3/*.la ${libdir}/libgegl-0.3.so"
-- 
2.9.3


