Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 12E2C6DE3D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 17:50:31 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id q10so10309677pdj.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 09:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/fJcEr+GQQtpLUfHYrWFBAr3i4bMrQE0pp6DH6+Tv6Y=;
	b=uu1xUe0D8w+hqHv1fc2c0diorknnhhCW3eLa+xhGYewrc//S8/awYem0yth3IxfOYY
	Sy8Hw+/OKO9GIgmJFrpE/ZhZSOlDqMItkEdpsPL938edas3bcXjbPrnKH20+9YET5v5e
	dOluoBXok3cxpVmc7X3fxOP3mMHmRuAJp+KIZRvF4P+99M9KdSBjoNT9mBsvNeHkGowH
	4IO+ubcsWRe/xbu/7va0CxxZTMb/4ihLw0CdGhHLqS3MRjm8xLBrM8J2mU+WCH3mJyXe
	6lkfNiAun+zBrXHGWA0PObeUPNPpVRAiAjfVvHk04NeqL9VDWcYs6N/N66BIzCW/26S5
	l7DQ==
X-Received: by 10.68.221.233 with SMTP id qh9mr6368144pbc.103.1385574630942;
	Wed, 27 Nov 2013 09:50:30 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	sg1sm89415355pbb.16.2013.11.27.09.50.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 09:50:29 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Nov 2013 10:50:20 -0700
Message-Id: <1385574620-9408-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1385574620-9408-1-git-send-email-kergoth@gmail.com>
References: <1385574620-9408-1-git-send-email-kergoth@gmail.com>
Subject: [meta-oe][PATCH 2/2] lmbench: fix the CONFIG path in lmbench-run
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Nov 2013 17:50:33 -0000

The 'config' script which gets run returns '../scripts/CONFIG.<machine>', so
the current value was '${datadir}/lmbench/../scripts/CONFIG.<machine>', which
is obviously not ideal. Remove the $SHAREDIR prefix, as the relative path will
work from the scripts dir where lmbench-run runs. With this, we can install
a custom CONFIG.qemux86 into ${datadir}/lmbench/scripts/, for example.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index fb8cf4f..b4020d7 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -55,7 +55,7 @@ do_install () {
     install -m 0755 ${WORKDIR}/lmbench-run ${D}${bindir}/
     sed -i -e 's,^SHAREDIR=.*$,SHAREDIR=${datadir}/${PN},;' \
            -e 's,^BINDIR=.*$,BINDIR=${libdir}/${PN},;' \
-           -e 's,^CONFIG=.*$,CONFIG=$SHAREDIR/`$SCRIPTSDIR/config`,;' \
+           -e 's,^CONFIG=.*$,CONFIG=`$SCRIPTSDIR/config`,;' \
            ${D}${bindir}/lmbench-run
     install -m 0755 ${S}/scripts/lmbench ${D}${bindir}
     install -m 0755 ${S}/scripts/* ${D}${datadir}/lmbench/scripts
-- 
1.8.3.4


