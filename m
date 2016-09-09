Return-Path: <dev@codyps.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA7A60851
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 20:26:54 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id a144so3825906oii.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2016 13:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=i1b/4GGSVEAElWAfMtUnFgxDbf7T7FvQz7U1fktIN50=;
	b=AN21XHh1YkbYObk89caGT/OS1H7nHdaV9kioSiVg03Fc6fxonRbBmxJQQfZoh0QmiF
	fdbMAPR583P74oHh31JGQcHX7m0qzWCW7eH8HbLwThWs16ohFoNwdLBuGEONZWsFaRAK
	+fdKhWB5cKb2qCkfwN6ddeHu+IZzw6K61Uwho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=i1b/4GGSVEAElWAfMtUnFgxDbf7T7FvQz7U1fktIN50=;
	b=hkKvduSNCHbrrTrMlaQcXjkbV7uj9ipKezD+A434bpXpSPspzf/OD9+CyA1MqhX7yK
	XIaevIl/8CWVEUcDRHdB7TNxdY9OnYVMHIf8/8XN5KCzw1pmKkdmMzEmaPgdZRrd4bYX
	CezrkpqrKtEh2k1gjRLFlKDg2LIDqVqmY2JA7uDP8lDU8rKkyoSMF1riEN0SoH2nJGGI
	ccutDhNedIDla7RXGszRliTMucdpQcF1mTqvuexq86RE5biu4y6bUNOInvohGwlsTdtv
	zJQS4qEL+Y4i8pG4WUMbBfm9T76BzCWYa2BDtUx08rBx1e8+aE8aQGDUGShtUcokwMks
	zEMg==
X-Gm-Message-State: AE9vXwPy+M/ngd6ntO+imeq7yDxeDB4SDqiCVKxWD7CrzGE0tM5Qbx+Ob0VZW4JKPUEAlA==
X-Received: by 10.202.181.84 with SMTP id e81mr8244465oif.126.1473452815144;
	Fri, 09 Sep 2016 13:26:55 -0700 (PDT)
Received: from localhost (static-96-237-165-28.bstnma.fios.verizon.net.
	[96.237.165.28]) by smtp.gmail.com with ESMTPSA id
	u185sm2364058itc.3.2016.09.09.13.26.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 09 Sep 2016 13:26:54 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Sep 2016 16:26:45 -0400
Message-Id: <20160909202645.23148-1-dev@codyps.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-oe][PATCH] meta-oe/thrift: fix build on gcc-6
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
X-List-Received-Date: Fri, 09 Sep 2016 20:26:55 -0000

thrift build issues on gcc-6 were essentially 2 issues:

 - gcc-6 has stricter overflow checking on array declaration, and
   thrift was using `char` when it should have used `signed char`
 - gcc-6 is really picky about it's include paths (`-I`), and thrift
   had a bad habbit of passing internal ones when it was cross compiled
   due to how it was using `include_directories()`

This adds 2 patches (both variations of those submitted upstream, the
ones included here are rebased onto thrift-0.9.3).

	https://issues.apache.org/jira/browse/THRIFT-3831
	https://issues.apache.org/jira/browse/THRIFT-3828

Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
index ce0b492..fdea7f1 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
@@ -10,6 +10,8 @@ DEPENDS = "thrift-native boost python libevent flex-native bison-native \
 
 SRC_URI = "git://git-wip-us.apache.org/repos/asf/thrift.git;protocol=https \
            file://0001-Forcibly-disable-check-for-Qt5.patch \
+           file://0001-THRIFT-3828-In-cmake-avoid-use-of-both-quoted-paths-.patch \
+           file://0002-THRIFT-3831-in-test-cpp-explicitly-use-signed-char.patch \
 "
 SRCREV = "61b8a29b0704ccd81b520f2300f5d1bb261fea3e"
 S = "${WORKDIR}/git"
@@ -32,6 +34,3 @@ EXTRA_OECMAKE_class-nativesdk = "-DWITH_QT4=OFF -DWITH_QT5=OFF \
 do_install_append () {
     ln -sf thrift ${D}/${bindir}/thrift-compiler
 }
-
-# http://errors.yoctoproject.org/Errors/Details/68622/
-PNBLACKLIST[thrift] ?= "BROKEN: fails to build with gcc-6"
-- 
2.9.3


