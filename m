Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 661117E404
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:46 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id x15so3351405pfq.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8BNsSoMzNvlAQd/3CqrkyOBo2K/dCrOtvM8cxZDFdro=;
	b=KkOj5noMpi+GyyD8OKe68EE1hUBqDoBPzqt+6a3h+vOhhicu4W14U/aGt7k4zovROD
	AIxS9jjZ0RDRpigmm6O2KwsfWpRxU+AWHMlHdrGeP4f5peyHwfP8YEctDHzslJPyqytq
	rGca165k/XBE5aADWPCg0YMi3T4xx09ByUtV7JlZWsg6iuWFkeJikzgLTqHZ/kfqgrXm
	XH2u+6VDtJ+Zb+CRnxeB2mHwQqMiPgm/m2z5ya0DYCVFPpfz8XfX3mj4SXGjybvb9d7f
	PBHnnxeQc6fj8SAjhOy+DWzsG1PZqNqlM4f1wdX4kd3elljHaa7wWZ+sBdlkgo3fwlEd
	tRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8BNsSoMzNvlAQd/3CqrkyOBo2K/dCrOtvM8cxZDFdro=;
	b=EF9hhDnsRfeJF0uRBfsSByJPwg2mcswDovN6GkkwZh4oXAbb/PXTsMVXUJP7xFnSU1
	RTtteCvWTl9p5Mbw9SR2CU3B+IBt/xjRb50msEC3AuPIQmHg+cldiwHGlHHudjdvNx/D
	c4ko1l8aAXdHYuUgb+iU8/jCn5q6ZBnT/9hfW8Xc/gILmDOtAGB7cW0y6o7hsHajpdgm
	24X7WtBo1G8kmanhLxSRfNojFjcSZmCd8us9y9EjU3qCWVBYoisCRxk/fQZFCz6UGW2h
	K07NzPaN6N1Bqynw4p9w0WVhCV3d6wVitmgvdDJZUwFLZqifSCx5R5/ltV4p8viM2X2J
	bdgQ==
X-Gm-Message-State: APjAAAUaBBc7QdPLkYPNAnvHFYZgyucmlLQQyIe/BzMZ8ov4b5mdP6Oz
	s5pKhdKqdAQHwsKpgGjajPWg8GxS
X-Google-Smtp-Source: APXvYqzjiU7e+K7szimP9swgPvP4qB4SoyRHAqbMUOaUjo2yTvjc9uNRM89QmThX+kQ0+PAIMjvEfw==
X-Received: by 2002:a65:484d:: with SMTP id i13mr40668729pgs.27.1560621467319; 
	Sat, 15 Jun 2019 10:57:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:21 -0700
Message-Id: <5f4408b2df0e951a10a7b61df42d28098b544cbe.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 17/23] mariadb: Upgrade to 10.3.15
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:46 -0000

From: Mingli Yu <mingli.yu@windriver.com>

Fixes for the following security vulnerabilities:
 CVE-2019-2614
 CVE-2019-2627
 CVE-2019-2628

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../mysql/{mariadb-native_10.3.13.bb => mariadb-native_10.3.15.bb}    | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                                 | 4 ++--
 meta-oe/recipes-dbs/mysql/{mariadb_10.3.13.bb => mariadb_10.3.15.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.3.13.bb => mariadb-native_10.3.15.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.3.13.bb => mariadb_10.3.15.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.3.13.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.3.15.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.3.13.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.3.15.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index fca74d4..eed23d2 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -19,8 +19,8 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BPN}-${PV}/source/${BPN}
            file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
           "
-SRC_URI[md5sum] = "603ce42e35b9a688f2cca05275acb5cb"
-SRC_URI[sha256sum] = "b2aa857ef5b84f85a7ea60a1eac7b34c0ca5151c71a0d44ce2d7fb028d71459a"
+SRC_URI[md5sum] = "08edd8b5060a181e6dd3c6aac23218cd"
+SRC_URI[sha256sum] = "27f391a54d544f93850d4edfb3ef1b4cf24f8e27e61e51727b0e7d31bb4d6968"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.3.13.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.3.15.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.3.13.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.3.15.bb
-- 
2.7.4


