Return-Path: <jpuhlman@mvista.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2BA9E6E660
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Aug 2016 04:20:52 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id fi15so48624436pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jul 2016 21:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=vIL2Mw8Q4Tu825f7sP2vdOIfMr7Kw/1Kol8J6XHCSBc=;
	b=wgIcX4L00yiG86u6ExHZeBFC83ah48EzZQW5kziiXhmo2Ikdb4xD0Qqrp7ikrmjqwx
	5DCXV4bJdIcEwIiFGAFpeSmkP/izHOLelUw7v0ac2ZvLPTXKk7QUkdbBbWl/bmaK2jCc
	SJCSBKNMbptZB1eg/AUl6Goncg8KZrKTEcKTgN0GaSpsK4tnsTSX6A0kOYLlbPK+amhO
	1CB3KDAfqrkpaTk9J9CAqMCS005h/6FLt6vFFoC6upnta0MR1RSOTCxlAXj+2GHWLV9P
	8GBPkYn1rw+rNJ4TgWK0R7vpbJPVlmgU0JAsgVzBN7GeBqzUQykILIwvBx4espgIcg06
	yBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vIL2Mw8Q4Tu825f7sP2vdOIfMr7Kw/1Kol8J6XHCSBc=;
	b=ZVsSAsU7VGdBlasa/ghM5cHKwPQxNtcsWUoI00lnKdyO6i6gASdOLafUhsza5HvQWC
	5MqW27M2tnhc8XnnN914pSY89PrWmXPvTkumHh2pUST6mB1UnD0gxM+btf8Gl6NsGjEo
	hhGzdDcJAJgIiAXGt+73jVmkPZnGvpPqRaePctz6nxoq2BZsj7r4k6rS2bSSdXivY63f
	BDUqN3XRdxLRk1CosSCKh3nmyvmdlvTbdrT3m2uFPOSBJWYSlyyAn7FTByQ/SQaluSLx
	W/B4J4uHr4VXY84Hr5/DqSnyUBlEDzmceA/2XcFK9siA/FQHDNk0irCAHrdHQNSUZo/s
	Lr6w==
X-Gm-Message-State: AEkoouu5tWT/ohICwLmhFU4jBdsnQchEu083vKWM89LYK1j9nWAOOFSLL3ltBDqqB2/HpNsr
X-Received: by 10.66.101.101 with SMTP id ff5mr93173268pab.88.1470025252983;
	Sun, 31 Jul 2016 21:20:52 -0700 (PDT)
Received: from workhorse.mvista.com
	(99-0-9-164.lightspeed.frokca.sbcglobal.net. [99.0.9.164])
	by smtp.gmail.com with ESMTPSA id
	h86sm41260759pfh.46.2016.07.31.21.20.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Jul 2016 21:20:51 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jul 2016 21:20:41 -0700
Message-Id: <1470025241-25888-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.2
Subject: [meta-oe][PATCH] mozjs: Fix incorrect usage of PN.
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
X-List-Received-Date: Mon, 01 Aug 2016 04:20:57 -0000

When building mutlilib, using ${PN} in the middle of the package name
creates incorrect package names:

lib32-liblib32-mozjs
lib32-liblib32-mozjs.shlibdeps

Which in turn breaks license.bbclass during image creation.
---
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index 02d5694..f147714 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -59,8 +59,8 @@ do_unpack() {
 }
 
 
-PACKAGES =+ "lib${PN}"
-FILES_lib${PN} += "${libdir}/lib*.so"
+PACKAGES =+ "lib${BPN}"
+FILES_lib${BPN} += "${libdir}/lib*.so"
 FILES_${PN}-dev += "${bindir}/js17-config"
 
 # Fails to build with thumb-1 (qemuarm)
-- 
2.6.2


