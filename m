Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id B4F067D00F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 10:21:44 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id s15so1682750wra.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 03:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=xs/UAsUNKbVTe0itER/NQbNhjels9SUTxJphL2f2ruA=;
	b=jsFF34aNl2dGNYlwkbVWNx1c1j+MLhfm1TfrcSZxDfwVs9dtAsz0MCpbZ/40YAFrnb
	GBurMTjpbmaSfD4OFqPCmDBtiPXNrDyx/3RBj/r8T3SMUn4/pzIpIHk0kuni/5PXpfry
	WedbXFhN8J0o3mcWLj5OETH/rpHjSoxrxdWq1wIku7xQT9DJiKtQuDsLoSRWQ9hSggT6
	cAUHnsMUV1VR02SPuXK/KvAnfRRfyz/40u7Mb4VjM1bjyYsTvRuaENWCkOsdeiqMOiZ7
	n+LbAwjPB+F3vzYYGikijoTzJ+Ew9Y7WBbfBTYFFoQvX4ULgDLBegpyI8Cku8tqIoj35
	kAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xs/UAsUNKbVTe0itER/NQbNhjels9SUTxJphL2f2ruA=;
	b=j1HXEkMbRFokq7NfeWkbXqJ03bsBKJSElFrOGxdD7x5vDt+zfw0P+nJGQpPLB4kl6t
	UDoR0xJkb2f066mq32LSFEmocUOYFQ9VsjOsEwY+cgb++uZHhEPMmQPGAer/aZUphOjt
	Ymt/BYFOG4JfFEfO3/P7mcmMKmyUNMNYVLxqK0HIQBgawCCym7F41hVMJFGEbNSB6NIV
	1Btn6DeDSRvWxaZnlW7JFJ8JMi1NEEzEz62wdcIysrfs8nNAlVrns/Ms2mTv+wdfnW1g
	Mf4A6BfXYzD74OrOvXk+KBlPx1KmO3oQ7tXkW9mCfLCCnSzekkNV+xiYHI69PLftw+yr
	WDew==
X-Gm-Message-State: APjAAAWVBrLzXvZ9BWXoqdD66+IFORWY4HUD3JSRWwo4NoUrpzwzEOe+
	jj93a1zZQHy1SO15hNzOefXwPbjI
X-Google-Smtp-Source: APXvYqx5KxiMdl0yEmwLZ/UIOJgUZZ+F1xXi4k0fCWGxeMKFeNFCiCV7VPk/sKX/UMSt/umsF5j7TQ==
X-Received: by 2002:a5d:4801:: with SMTP id l1mr5357010wrq.318.1553250105442; 
	Fri, 22 Mar 2019 03:21:45 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	t69sm12255677wmt.16.2019.03.22.03.21.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Mar 2019 03:21:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Mar 2019 11:21:22 +0100
Message-Id: <20190322102129.5067-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190322102129.5067-1-schnitzeltony@gmail.com>
References: <20190322102129.5067-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/11] fluidsynth: upgrade 2.0.3 -> 2.0.4
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
X-List-Received-Date: Fri, 22 Mar 2019 10:21:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index df431b62c..810ca997e 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -5,8 +5,8 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
 SRC_URI = "git://github.com/FluidSynth/fluidsynth.git"
-SRCREV = "1bae9b2fe1a958f54f4910c802a79673e0df9850"
+SRCREV = "9671e412feedb90325e038c3aaf5d543eebc20c0"
 S = "${WORKDIR}/git"
-PV = "2.0.3"
+PV = "2.0.4"
 
 inherit cmake pkgconfig lib_package
-- 
2.20.1


