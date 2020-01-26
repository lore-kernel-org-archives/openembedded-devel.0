Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id C6B577F891
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Jan 2020 07:04:29 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id e11so1777525pjt.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 23:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GcrPB1r2o2561KbgTm2xSsIt6ctfaGlIWydjydJ0WVQ=;
	b=glMB70LK492C0gqiGAJ3K3d0Jl7xOSVUHWPHu6deX2X1pXqt/AakfkjZJ3J7rQxEUz
	uD1hH4ANswTbcOQdkN0gYhL4nT5xWh5e1UxdD115lL+iuLd/+Np00X8q+TRgrnTmtd0Z
	qWJ9MxNxgFo+k+hMFOdjrPzfAbALTkmc0QR8ZUQW2nxJGevGapUcwUXMqlrOSxy8XjzO
	cfRv1pc7KxbsU2Ykp+Ke0RTJIO204BXRpLbKy0ZOLGAn1MUmwzYKQ1fYkoO70i01W+RC
	Ju0ffWLoKhdO12lBOhuT2Wf4briIpNzH5+a5eAvswNmABr0SUYVDm3smGjf01J2jSxAb
	qq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GcrPB1r2o2561KbgTm2xSsIt6ctfaGlIWydjydJ0WVQ=;
	b=MmISy7MxoQvPzx+Y+t0byi84+37S+/hNHjc1qBUjNBI/vaOuW5bR/9DTcSlj2leQzG
	oy+/Gy2MsWlSeJRbvHGnnKxwghO9ERwgNLt7o0m4bjOxerEqTQE05GD9sM+OZ9HrUHoH
	IPM6pEbka+J415zhoiH+LMl53GrSa2SLFE0DrRnexGh7aWwueWYI8MQn5cCRRLaWZxrg
	qWCUXKQdroGoy3X4ogl2rqKaEUbMB4kPwlrdMh8dA7WBjrYfhWmLJScsRlVcDasPIA7N
	N/L1WDRQ31eiYkMoQR7J2V4irvRkok6aAfaOjTRTkCdb/yjPLzsfMHmqP3WUOyhAoa5A
	CA6w==
X-Gm-Message-State: APjAAAV2am4GjmwFRV3bU4lBiW8egbgFh5YEAP8Q+mYTfJue4lvRFllH
	B6Y/yYdIBRjjhGBJA8niOokfDjsdAxs=
X-Google-Smtp-Source: APXvYqw5NXGKzslMGI/Gb54bDaoskep6tgFdt78aurwELnGCVo5Mcnfdb+oRojBCI0Q2uSTYgO3Qpg==
X-Received: by 2002:a17:902:b089:: with SMTP id
	p9mr12024599plr.34.1580022270514; 
	Sat, 25 Jan 2020 23:04:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c54b])
	by smtp.gmail.com with ESMTPSA id
	t138sm456208pfc.95.2020.01.25.23.04.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 25 Jan 2020 23:04:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Jan 2020 23:04:32 -0800
Message-Id: <20200126070432.66275-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] luajit: Mark incompatible for riscv64
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
X-List-Received-Date: Sun, 26 Jan 2020 07:04:30 -0000
Content-Transfer-Encoding: 8bit

rv64 support is not yet available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
index d0dc1c28dd..93128dda83 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
@@ -90,10 +90,11 @@ FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
 "
 FILES_luajit-common = "${datadir}/${BPN}-${PV}"
 
-# Aarch64/mips64/ppc/ppc64 is not supported in this release
+# Aarch64/mips64/ppc/ppc64/riscv64 is not supported in this release
 COMPATIBLE_HOST_aarch64 = "null"
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 COMPATIBLE_HOST_powerpc = "null"
 COMPATIBLE_HOST_powerpc64 = "null"
 COMPATIBLE_HOST_powerpc64le = "null"
+COMPATIBLE_HOST_riscv64 = "null"
-- 
2.25.0


