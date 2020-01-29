Return-Path: <raj.khem@gmail.com>
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
	[209.85.167.169])
	by mail.openembedded.org (Postfix) with ESMTP id 77EF2608C2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 15:08:48 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id i1so3775880oie.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 07:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ToB4D4yF2U+cdMo7NgP3zPWQAURmvm4Q9PzXvH65Gts=;
	b=a3klYQIF1AucmCdM2XUnYDsy84lFs3S3foAUanwX5XYXPRo9oxJitXJg5xS/bQjxEj
	O6mAqrG40/omtk03A5Q26qBg/kYZUEIP2cCTkgd2i5a/k+zc/IH/aSUJpEr9lXYZZXYP
	9L82ZeTz5ArtHiKqjB+T7VZs1/Vwr/V05CNnMx1PwAO0sYXtIr3FQ1113EDgL3uzVYnD
	q06vfWb3VuRweLvEHGV2Lh0cU7mb2FQE4U1CSBeV3Bh7soS92TvDr2oxsA9aFKF3pXlO
	GVhHdeKpX+xnhJlyxZhOLz84J7Zh2nembiDjxRnP+Bfkk4wCrMTpaDKluO7z0L6L9r10
	uy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ToB4D4yF2U+cdMo7NgP3zPWQAURmvm4Q9PzXvH65Gts=;
	b=MR+jhnttqfEpnI8N6H+BGXsTSviB40YdlFMLXaZUXcAev5rclU5n6hbLDKwZQtLUPx
	XOfFDIYpI1jste1q4GY5ZUTkWH6dE7Sjq0FSBp9FCdIze2riTPuCg53XcoBxgDB/1Aco
	slEHkiU8hpatOZQAT+4u+HRpjvSHd54V36ndR7Q3cO5MakHVMlOYvL4IhUaVVhRqbKwc
	UVuNOyiFbEEi3DHAlDqle6BZ/6VM+M5NkXQ/Td+qBgBreBHVvejbBZPyKAzkR4bWbE04
	PJeYRoT5mPQkzaCx2hqMfpVXX59s33SYN7Qn/zedKu+ptvbIKC2mDGP8TC1Pt6g3sR6o
	yv8Q==
X-Gm-Message-State: APjAAAVYltYz1L4A8vlYi3bCoffdwPNL6WXq4K+RvAKcsH9EvdYBRcFp
	52EouJZzB3UhDLRZHSfpUKCF1170JXE=
X-Google-Smtp-Source: APXvYqzSlNRR8x9gCy/85sw5ZBvhXGnp/O7DdetL1xfFckel5iNH9UMuZFIwCmVvt6naTfbl2HWpBQ==
X-Received: by 2002:a17:90a:bd01:: with SMTP id
	y1mr9480610pjr.129.1580281981683; 
	Tue, 28 Jan 2020 23:13:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	g9sm1305019pfm.150.2020.01.28.23.13.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 23:13:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jan 2020 23:13:01 -0800
Message-Id: <20200129071303.3328743-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/3] netperf: Inherit texinfo to get makeinfo
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:06 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/netperf/netperf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
index f1f62df066..d48f3aeabd 100644
--- a/meta-networking/recipes-support/netperf/netperf_git.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -19,7 +19,7 @@ SRCREV = "f482bab49fcedee46fc5b755da127f608325cd13"
 
 S = "${WORKDIR}/git"
 
-inherit update-rc.d autotools
+inherit update-rc.d autotools texinfo
 
 # cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_ macros
 CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
-- 
2.25.0


