Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 29ABD78E00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 20:39:19 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id y2-v6so5652587wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 13:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dRI8Osjc6GErMtDRk28Bpg9kHIxl502WvTUHjcrUOFI=;
	b=h4Y9sSGpG93/sdwzUmVwvZBcNl73zruuTOHBHxMEuLgacsj5Dfp0gbJONcJ9JeT+Bi
	tUFuZjJv018gopAeaSIT93EBQJVGRculBcLJEZ/xb0wE2/X+zKve8qhkczjh/OYC7Q82
	J5xXMXkG1m1dx4P2kZJ82vWfC2HiRCCM4YferEgp89hpBG2aWAUw3jTvv67l/QGMU4sm
	r0aXP3ItGdhuW2itZ5HCFznvIcwPRimmRvPLhzbal6qxC629U4eDtahriU28C04NNdnV
	jTuJDmvWJ9I3nMZyMjNnatUDifu8M+sYTRVsI+fPzXXgJ0ddGtsK/qjBJpf7k94SL12o
	DfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dRI8Osjc6GErMtDRk28Bpg9kHIxl502WvTUHjcrUOFI=;
	b=WTrA9Ah8Yfz+ofJo3UnHM+RGWukHydM074c6qwS8t0s5KkQHPAdThnbuT8DQfE8/tX
	AOPHK+6Ika9ag9bpuBlOiis7Vvpm7lfPtzH3pTQS1cBf3JOHamgJ0BNcWVX7RDZIEw20
	JJbeQdiWAjxgvGPb/sbdIfnmUzHz6g2RZKWH8q7QLbgAdNuX5TCoKB/hDQnAdmgNTGde
	Vc12WThhXCZL9y7flWWgW9ojkXlFd2fw8yWFBKJKRU6BmPEJ8O6+OpxappU8PEAjzYAb
	KUl5QcwF5hLGOImpz7CuU2+E+b9rzx0RPf3NCCw7y0FZsyyYobyafuUycoCyxNTbesv+
	ie9A==
X-Gm-Message-State: AOUpUlGx3dmr6RbSbNqR8+R9teagVZC7ODFDTRxLFEGkT4Z5bhSMCvP5
	5LjK+jts7Z88W+Ucd/jVtHI4WFVI
X-Google-Smtp-Source: AA+uWPwKkqx0grf7XRHOLhPl+9xXnQeQ2Ypt7Kcx0pFHFMAcnL5AfI5WnelD0sqNAZqqLmAPympzGg==
X-Received: by 2002:a1c:6a0b:: with SMTP id
	f11-v6mr16810235wmc.107.1534451960640; 
	Thu, 16 Aug 2018 13:39:20 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	200-v6sm4085338wmv.6.2018.08.16.13.39.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 13:39:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:39:16 +0000
Message-Id: <20180816203920.464-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180816203920.464-1-Martin.Jansa@gmail.com>
References: <20180816203920.464-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-networking][PATCH 2/6] pure-ftpd: fix build with glibc-2.28
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
X-List-Received-Date: Thu, 16 Aug 2018 20:39:20 -0000

* fixes:
  ../../pure-ftpd-1.0.42/src/pure-pw.c:243: error: undefined reference to 'crypt'
  ../../pure-ftpd-1.0.42/src/pure-pw.c:257: error: undefined reference to 'crypt'
  ../../pure-ftpd-1.0.42/src/pure-pw.c:272: error: undefined reference to 'crypt'
  ../../pure-ftpd-1.0.42/src/pure-pw.c:282: error: undefined reference to 'crypt'
  collect2: error: ld returned 1 exit status

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb
index c1f1504055..e5c5616460 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb
@@ -5,7 +5,7 @@ SECTION = "net"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=90352fb2bfe17f4261687a0d6e09f489"
 
-DEPENDS = "libcap"
+DEPENDS = "libcap virtual/crypt"
 
 
 SRC_URI = "http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${PV}.tar.gz \
-- 
2.17.1


