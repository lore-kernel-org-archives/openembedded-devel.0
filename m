Return-Path: <Mark.Jonas@de.bosch.com>
X-Greylist: delayed 566 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 07 Aug 2018 14:26:42 UTC
Received: from de-deferred2.bosch-org.com (de-deferred2.bosch-org.com
	[139.15.180.217])
	by mail.openembedded.org (Postfix) with ESMTP id E970178C93
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Aug 2018 14:26:42 +0000 (UTC)
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
	by fe0vms0193.rbdmz01.com (Postfix) with ESMTPS id 41lGmr485Gz45h
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Aug 2018 16:17:16 +0200 (CEST)
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
	by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 41lGmp2KRSz4f3klZ;
	Tue,  7 Aug 2018 16:17:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
	s=2015-01-21; t=1533651434;
	bh=Uu3tfjNzaZZXE7XFciQf8V7qfY8IJbZYhx2W8Tf9qAY=; l=10;
	h=From:From:Reply-To:Sender;
	b=U6JVaXOxZatF5NatJgkxCOgXucGFIUfBsG4KR15i6AOZg/SPXZiwySDynItKXxpDf
	OHfY+QWTesWzauhaMwYG36pn+KJ+r0xRD0YHKwHMlIdtL7v1kGaEcad1b39ZUiWmMt
	+wq2TqtHntBHXO2gc7YOx0mJluDhNR2AzNdR/Xyc=
Received: from fe0vm7918.rbesz01.com (unknown [10.58.172.176])
	by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 41lGmp1wYLz3rT;
	Tue,  7 Aug 2018 16:17:14 +0200 (CEST)
X-AuditID: 0a3aad10-16dff70000000c8a-81-5b69a9eaa722
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher AES128-SHA (128/128 bits))
	(Client did not present a certificate)
	by fe0vm7918.rbesz01.com (SMG Outbound) with SMTP id
	61.EB.03210.AE9A96B5; Tue,  7 Aug 2018 16:17:14 +0200 (CEST)
Received: from FE-HUB1000.de.bosch.com (fe-hub1000.de.bosch.com [10.4.103.107])
	by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 41lGmp0MJtzDpmd;
	Tue,  7 Aug 2018 16:17:14 +0200 (CEST)
Received: from luchador.grb-fir.grb.de.bosch.com (10.19.187.97) by
	FE-HUB1000.de.bosch.com (10.4.103.107) with Microsoft SMTP Server id
	14.3.408.0; Tue, 7 Aug 2018 16:17:13 +0200
From: Mark Jonas <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Aug 2018 16:15:14 +0200
Message-ID: <1533651314-10320-1-git-send-email-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533407162-21497-1-git-send-email-mark.jonas@de.bosch.com>
References: <1533407162-21497-1-git-send-email-mark.jonas@de.bosch.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA21SfUwTZxzmvTvKtXJ6bWH9WSuag4DCVLr5gV+LcRrRLWZRY4Jk2Q55aZvR
	lt4VIposzKhERiaZukjFakybIEu1qBHq56xsKY6RgW5WhDiqcbUx+BGNoEZ3pcX2j/1zee55
	fs/ved8nL02q3Gla2mSxY8HCV3IyBaVY4pk+J3LCVFo4/FBZ1HfNTRbtueVARYPhZ8QKstjn
	GEor7m1vRV8QWxTLynGlqQYL8z75WmG8c/gPouqCbps70iSrQ680DUhOAzsfOlqfoyhWsfUE
	BMMFDUgh4UsIXg2MErGfcwi8vQ/I6JSMzYfbgc5xnMHOA/fhi+OYZG1Q7zmZ1oBoWs2uh/u7
	1FGaYnPg91MeKooZdg0MuZ6kxoKz4Hbv3nGrnC2GW85A/BBr4N+f7sXnldDdfJ+KrQe4Gg6T
	TWiKI0lyJEnHENGGMitwYY150WJ90VyhDIvbC/Vzt1rNp1GsOLYT+a5X+BFLIy6dwW5TqSqV
	rxFrzX60gCa4TEbIlqjJZdbyWiMvGr8SqiuxyGkZlJKSolK/p8XqMrNJFE1Wix8BTXIZzNZv
	JR9Tztdux4I1ZvOjaTTFaRj9WkliDbwdf4NxFRYm1KU0zQGzp1VSlQI24G0Vpkr7hMxNj2V+
	kKwkxxK03I8+ptOlbHd0BSNW8WbRZIjbp8bsqgk2Yb2OPqXfPD74I6miLFYL1mqYxqifjU4a
	qy3vT6DVMSVBQ6kqM0lIbImgIJI6VDOeqDldep+JbGA61S0lKmWcTJg+ckke1qUAb2gJODtf
	IOh6HiLA6bpLwd9drTT0tJyTwxnnDTm880of19F9CnC+vaeAa4e8DLTtCzMw2D0yGUYDO1no
	PxtUQih4RQ0hzwENBPr7NfC2v04H4dNHddA+2pUFY30nZ8CfO0PZ0HPgZi4MDA3nQss/D3Ph
	eNsPeeB03JwNru/vzoaBB2350L53fwEEm0MFEalXQur1UcF4r3be/j+9xtnE5bR1aLetacOI
	q2PFGDhtjbtSQbb+jtk2vOhXeNexfF0d3KjPc6/WHgvod2hXNq5dlnr5deSvOUc+WzjyMoNK
	Kdkx8/gv/s3evIzFLYO2swt8hbYPf+Of/pz/yPflqalNV7esm7UpZ1J2VrdPtjE89nkPRo9d
	ylU6w6U+vPw8kVP83YXdIkeJRl6fTwoi/x/C3yuDOAQAAA==
Cc: ben.guan@cn.bosch.com
Subject: [meta-oe][PATCH v2] directfb: fix tslib version check in configure.in
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
X-List-Received-Date: Tue, 07 Aug 2018 14:26:43 -0000
Content-Type: text/plain

From: Ben Guan <ben.guan@cn.bosch.com>

The patch makes sure that the old as well as the new tslib pkg-config
metadata file naming style is handled correctly.

tslib 0.0 to 1.0 created only a tslib-<VERSION>.pc pkg-config metadata
file.

With tslib 1.1 the tslib-<VERSION>.pc phase out was started.
Additionally, the pkg-config metadata file tslib.pc was added.

Since tslib 1.6 the tslib-<VERSION>.pc metadata file is deprecated.
Now, there is only a tslib.pc.

Signed-off-by: Ben Guan <ben.guan@cn.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
Changes in v2:
 - send patch to openembedded-devel
 - apply to master (a001e465)
 - add Signed-off-by to contained patch
 - add upstream status to contained patch
---
 meta-oe/recipes-graphics/directfb/directfb.inc     |  1 +
 .../directfb/fix-tslib-version-check.patch         | 38 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/directfb/directfb/fix-tslib-version-check.patch

diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recipes-graphics/directfb/directfb.inc
index bd66a28..96aa311 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -20,6 +20,7 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/DirectFB-${PV}.tar.g
            file://union-sigval.patch \
            file://use-PTHREAD_MUTEX_RECURSIVE.patch \
            file://fix-client-gfx_state-initialisation.patch \
+           file://fix-tslib-version-check.patch \
           "
 
 S = "${WORKDIR}/DirectFB-${PV}"
diff --git a/meta-oe/recipes-graphics/directfb/directfb/fix-tslib-version-check.patch b/meta-oe/recipes-graphics/directfb/directfb/fix-tslib-version-check.patch
new file mode 100644
index 0000000..352bfaf
--- /dev/null
+++ b/meta-oe/recipes-graphics/directfb/directfb/fix-tslib-version-check.patch
@@ -0,0 +1,38 @@
+fix tslib version check in configure.in
+
+The patch makes sure that the old as well as the new tslib pkg-config
+metadata file naming style is handled correctly.
+
+tslib 0.0 to 1.0 created only a tslib-<VERSION>.pc pkg-config metadata
+file.
+
+With tslib 1.1 the tslib-<VERSION>.pc phase out was started.
+Additionally, the pkg-config metadata file tslib.pc was added.
+
+Since tslib 1.6 the tslib-<VERSION>.pc metadata file is deprecated.
+Now, there is only a tslib.pc.
+
+Upstream-Status: Inappropriate [no upstream]
+Signed-off-by: Ben Guan <ben.guan@cn.bosch.com>
+Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
+
+diff -Nru DirectFB-1.7.7.orig/configure.in DirectFB-1.7.7/configure.in
+--- DirectFB-1.7.7.orig/configure.in	2015-02-10 01:16:46.000000000 +0800
++++ DirectFB-1.7.7/configure.in	2018-06-06 17:19:18.472143103 +0800
+@@ -2459,10 +2459,13 @@
+ 
+ enable_tslib=no
+ if test "$checkfor_tslib" = "yes"; then
+-  PKG_CHECK_MODULES([TSLIB], [tslib-1.0 >= 1.0.0], [enable_tslib=yes], [enable_tslib=no])
++  PKG_CHECK_MODULES([TSLIB], [tslib >= 1.1], [enable_tslib=yes], [enable_tslib=no])
+   if test "$enable_tslib" = "no"; then
+-     PKG_CHECK_MODULES([TSLIB], [tslib-0.0], [enable_tslib=yes], [enable_tslib=no
+-       AC_MSG_WARN([*** no tslib -- tslib driver will not be built.])])
++    PKG_CHECK_MODULES([TSLIB], [tslib-1.0 >= 1.0], [enable_tslib=yes], [enable_tslib=no])
++    if test "$enable_tslib" = "no"; then
++      PKG_CHECK_MODULES([TSLIB], [tslib-0.0], [enable_tslib=yes], [enable_tslib=no
++        AC_MSG_WARN([*** no tslib -- tslib driver will not be built.])])
++    fi
+   fi
+ fi
+ 
-- 
2.7.4


