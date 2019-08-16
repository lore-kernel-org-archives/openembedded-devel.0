Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9F7677F323
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 10:39:59 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id f72so3663657wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 03:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AClnrqvL6RPmNm8HPLIojVM3lckeyL5JLE3jcVhSW6w=;
	b=Gx8UTAxE2xsMY1hiNyxdLeUousYY1dOZvWxcpKLaznRjhjgvQdEijNC+glagSQpxJt
	IarrEqQQ+mmEHmVgQ/BU4pRBesLb1wLrtDx01oWE2IvmUjERQ9vct4O11xddhfiYKNAi
	zHXp/lAgyPWx49Ict63vdEYlDaWlAUfKWSu8ZAd14aYX3b2l55CsIdTe53yP9MRxduDm
	V72aG+g+8lRPS6zEo+sa9o04Ig9rl8YFmmuTGv/owSJdXCuj96wmtahrUJCnDh+l/Rqg
	W3cvxDYqq2k0xoA46kwqSSYCAq2i7IRVMi9rAL1Ix2ubIAPEjMjPOni8pRh+kuOLRkrQ
	VPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AClnrqvL6RPmNm8HPLIojVM3lckeyL5JLE3jcVhSW6w=;
	b=Z42wZLvENI9p5znlQp2skrcnDYwkpVx8lRohr+d2lAn4p1DnbUxbFjwkpP97+v6hmC
	tUT7Pqe8/h2uLxBisJoFuuVVG+1B6Nx6r9kN+24iNXn0MLOORcCj2l8GqCAVcpoc/Bvr
	ChWKC3ftCJH0gzxMPsdNtAOb9EJiG/a/RG9fMUx9unjMTvDl/Z6N0oXXFOmfw0v01ZRV
	nngNPFX0fN5a7GVOMNE1i9UFmbe707f7AbcfM3+RG7T0LF1sQ85BkTpJfMzJElGyh8AC
	iiBpxjIOReV41IrGgiXPeaNrGSGzxkmGaemP3oahXNUnfXDHgFcCsEF2KGNuJaA9q23F
	LCsw==
X-Gm-Message-State: APjAAAWsGj79soxWhrplUJEdD7bNdvnmB8qm+tIX1jqqnoQL/wTJi+AV
	PL8cVKwR0ruvdfkxf75+xRaeX5lz9ew=
X-Google-Smtp-Source: APXvYqxLvZHBQn8xEcpnwr6iykXqw6xedQlokVkY6lXSzH8O4VX7oJ4vQjtNtpJNsfLlbzOTiovVHQ==
X-Received: by 2002:a1c:5f06:: with SMTP id t6mr6199919wmb.60.1565951999969;
	Fri, 16 Aug 2019 03:39:59 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id d19sm9312041wrb.7.2019.08.16.03.39.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 03:39:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Aug 2019 10:39:58 +0000
Message-Id: <20190816103958.2701581-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190816103958.2701581-1-Martin.Jansa@gmail.com>
References: <20190816103958.2701581-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 7/7] libdbi-perl: add runtime dependency on perl
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
X-List-Received-Date: Fri, 16 Aug 2019 10:40:00 -0000

* fixes:
  ERROR: QA Issue: /usr/bin/dbiproxy contained in package libdbi-perl requires /usr/bin/perl, but no providers found in RDEPENDS_libdbi-perl? [file-rdeps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
index 91f94a1aa0..7532b3fa22 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
@@ -28,6 +28,7 @@ do_install_prepend() {
 }
 
 RDEPENDS_${PN}_class-target = " \
+    perl \
     perl-module-carp \
     perl-module-exporter \
     perl-module-exporter-heavy \
-- 
2.17.1


