Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id DD3D379A4B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 10:49:12 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b203-v6so987456wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 03:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=7dPugLARTSn/TtlGMDOfFdXd95qaYaqBz3j0iduBtZ0=;
	b=jWk4cxIsN2jCYQha3UaQbHfOzyFWVMk2/j6ZX30zHRZ2021vyH5cBUfc9Djbouqb6a
	/tbW9+/r7+ryxpNcuRmkTAFXAgJuTbk5F21SaFyqlq55/j1DGiZ2ouXLidJdAMwG1FFM
	ZN3966MfPEyy8j4QMJ4e2UMOSJ9UzdxJ87fQSJ4N+4+tK1gwWusd2yzvsUPddiucy1cn
	bID4dR9w3sr64636YBMTxgfdqUzdsJzQftNg8i/6a87RDqtwCM7H/DPC9j/UM3iySvPt
	+OaEvh5MrJBcRb+XoMGbcNmbGH6rdxpqShRBY1sNzbWNNGYZxmZZW6W9WDVBz3wIo/V2
	fAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7dPugLARTSn/TtlGMDOfFdXd95qaYaqBz3j0iduBtZ0=;
	b=gnHrsAu1YebY+MEhqSSd7+vBvLw4vI8upbU/vKxNOx45nXTv46wZ3NmT49oYxWvPLE
	t/G0lWsb+2MMjZxj9NPvNEUHuUrlD81g62jFESjD0RdNLqwRvpmm/7wosEWTywpOMiYT
	bcaJkQBHQP2l0Vl55DHdSxI/SFRGNgOQZBP5rW6Hcz9TwwG8uhgcdYr7/6szTvcXi6Qb
	mPgaqNgI+5uU99/qpZlfhO6Xfw6SULYfbeo8upEJ/eP4NO1X3JSYiCoqFWzJ4oYdny4+
	suTDMMv/25/6ADy5fBW7Bm0mMWP1CI58kgtbXabP3ButcmNUg5ho3cep8wKkWpm1pNek
	UvPw==
X-Gm-Message-State: AGRZ1gL0UwEDdx4wnBUv1hqbpy9c7lrqDepBYpJ+dbrcoydoHXdXxDCo
	hABFAWl7772klr5vxF49Aay6Jie0
X-Google-Smtp-Source: AJdET5cbYBI9BSyRhbMdVG3uWp1HWPUDOeVs4MxmpgkHlTMQwKfVjMcLdUI6LuAGReUamspKl6J1rg==
X-Received: by 2002:a1c:2dc7:: with SMTP id
	t190-v6mr5010450wmt.31.1540550953228; 
	Fri, 26 Oct 2018 03:49:13 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	x8-v6sm23905660wrd.54.2018.10.26.03.49.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 26 Oct 2018 03:49:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2018 12:48:51 +0200
Message-Id: <20181026104857.32142-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20181026104857.32142-1-schnitzeltony@gmail.com>
References: <20181026104857.32142-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] exo: upgrade 0.12.2 -> 0.12.3
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
X-List-Received-Date: Fri, 26 Oct 2018 10:49:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/exo/{exo_0.12.2.bb => exo_0.12.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.12.2.bb => exo_0.12.3.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.12.2.bb b/meta-xfce/recipes-xfce/exo/exo_0.12.3.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/exo/exo_0.12.2.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.12.3.bb
index ea25cca3c..9c4829bbf 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.12.2.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.12.3.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-native = " \
     file://reduce-build-to-exo-csource-only.patch \
 "
 
-SRC_URI[md5sum] = "15b66320dd89e04fbd07a47f1c4b1cb1"
-SRC_URI[sha256sum] = "6d4b0a88c1e1d3d5ed612cbf012c7511ef67b1636f4f85caa9dc68649b7e6350"
+SRC_URI[md5sum] = "da934c5939f2ee4540f5d48991053f01"
+SRC_URI[sha256sum] = "b96fe86bb504aa9b3332b96105d755f5d9052c903fd6574b512a5ef76c0ad439"
 
 PACKAGES =+ "exo-csource"
 
-- 
2.14.5


