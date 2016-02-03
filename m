Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id ACF2C77212
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Feb 2016 17:19:22 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l66so173976347wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Feb 2016 09:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Jv/n/YHmc6JDrKr4A+ntUUsHH4umeDdGEjXBvROBxdQ=;
	b=lp/zC7ahv4/KY/z7c1O4doTy+ZRUYejje9fe+sKqq0G446pye6n4flSDCTMxPKTors
	1VK3F64CqxXSCKWJVvFUUtyglpADW5aee4bcJp+n7njOaXp7sHoNbeGcmZ/wvBMdNMSf
	SfqrYK0KeL/Lyp4SBWcC1aIgNB1KULdTzFdmOlMCnsNdilVZcHCZShwkKgrFVeIze1D/
	mvyPK+Z0PJKgMmyhkj2VCPIKs8KyiJYMI+zbqlOMW2iiY/Tmtvq/5re8LKzGWKOHhi28
	7AR+dV76G5UVIofMRVwAVafxm7d4tqgZs8rYeRxqNpREvB7YGZgL6hTWK0A/1CfQG7cd
	XDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Jv/n/YHmc6JDrKr4A+ntUUsHH4umeDdGEjXBvROBxdQ=;
	b=OfJchc1JrxSxCekdtjF/bZG2xcp8tUM1aey8TpBwc3g95ls5nLLlPLOhuoiyINMToe
	cGiNTpKDXSf9D6khNmwsqK1xk6jzniQbjPAdIg6H+eMKAxfFILpQSFik6NYHYnkm8o4i
	6sbzLxenzm09Erip04r3aA5p6bz9qh07WIGabDInvjeFbEBIb5Tp0PYte+THrrLubgz0
	xzk1QfooBCn7q+eG2+On1ddjvhVqCuECVwMhxPMzXfGTklhxE29xmIvDatpvLmfUKmYa
	0wzwgxO2P6bi4S1ki/3JeDof7JTjE1Oi1eSCIWcXZ4A/IWP/I4yV6J9HSkL7wwU8uaLd
	GPRQ==
X-Gm-Message-State: AG10YOQrYwrv8uncCj6g+l6ZOp9u16EIG+jPg0r+0TQ1/uDBJlW9uyMK8mZTgK0i7vp9Ew==
X-Received: by 10.28.174.77 with SMTP id x74mr23795578wme.99.1454519962432;
	Wed, 03 Feb 2016 09:19:22 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t205sm8838139wmt.23.2016.02.03.09.19.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Feb 2016 09:19:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Feb 2016 18:22:29 +0100
Message-Id: <1454520149-13230-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH][meta-oe[dizzy] mariadb: add dependency libevent
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
X-List-Received-Date: Wed, 03 Feb 2016 17:19:23 -0000

From: Kang Kai <kai.kang@windriver.com>

mariadb failed to build:
| make[2]: *** No rule to make target
  '/.../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libevent.so',
  needed by 'tests/async_queries'.  Stop.
| make[2]: Leaving directory
  '/.../bitbake_build/tmp/work/core2-64-wrs-linux/mariadb/5.5.40-r0/build'
  CMakeFiles/Makefile2:6742: recipe for target 'tests/CMakeFiles/async_queries.dir/all' failed
| make[1]: *** [tests/CMakeFiles/async_queries.dir/all] Error 2

It is an rare case that when configure mariadb, libevent exists in
sysroot. But when do compile for mariadb, libevent is gone somehow. That
causes build fails. Run follow commands could reproduce this error:

$ bitbake libevent
$ bitbake mariadb -c cleansstate
$ bitbake mariadb -c configure
$ bitbake libevent -c clean
$ bitbake mariadb

Add if without libevent, test case tests/async_queries.c will not be built.
The case is helpful to do unit test. So add libevent as a dependency to fix the
error and make sure async_queries.c will be built.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mysql/mariadb_5.5.39.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.39.bb b/meta-oe/recipes-support/mysql/mariadb_5.5.39.bb
index fee5b62..ca9b2ec 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.5.39.bb
+++ b/meta-oe/recipes-support/mysql/mariadb_5.5.39.bb
@@ -2,7 +2,7 @@ require ${PN}_${PV}.inc
 
 EXTRA_OECMAKE += "-DSTACK_DIRECTION=-1"
 
-DEPENDS += "mariadb-native ncurses zlib readline libaio"
+DEPENDS += "mariadb-native ncurses zlib readline libaio libevent"
 
 PROVIDES += "mysql5"
 
-- 
2.7.0


