Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F410960111
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 01:15:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1K1Fo2E024870
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Feb 2017 17:15:51 -0800 (PST)
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 19 Feb 2017 17:15:50 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 19 Feb 2017 20:15:49 -0500
Message-ID: <1487553349-22706-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAMKF1sqyxtRoLsi1QvABn7kVsskgLcUXXb7N_0JFct5ukiqUwg@mail.gmail.com>
References: <CAMKF1sqyxtRoLsi1QvABn7kVsskgLcUXXb7N_0JFct5ukiqUwg@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] netcat-openbsd: fix implicit dependency on pkg-config
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
X-List-Received-Date: Mon, 20 Feb 2017 01:15:53 -0000
Content-Type: text/plain

In the report at http://errors.yoctoproject.org/Errors/Details/130673/
we see the following:

i586-oe-linux-gcc  -m32 -march=i586 <snip> netcat.o atomicio.o socks.o `pkg-config --libs libbsd` -lresolv -o nc
/bin/sh: 1: pkg-config: not found

What follows is a bunch of link errors for BSD library functions, as
the backtick didn't return anything but an empty string and hence no
BSD library was involved in the link.

I was able to reproduce this by temporarily removing my host version
of pkg-config, and then validated that this fix solves it while still
having the host binary removed.  So it should fix the reported issue.
I also confirmed pkg-config was in the sysroot after the change.

Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[v2: use inherit pkgconfig vs. depending on it, as per what
 Khem suggested as being the more conventional route. ]

 meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
index bb21e0cfeede..e0a0328eccfc 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
@@ -14,6 +14,8 @@ SRC_URI[netcat.sha256sum] = "40653fe66c1516876b61b07e093d826e2a5463c5d994f1b7e6c
 SRC_URI[netcat-patch.md5sum] = "e914f8eb7eda5c75c679dd77787ac76b"
 SRC_URI[netcat-patch.sha256sum] = "eee759327ffea293e81d0dde67921b7fcfcad279ffd7a2c9d037bbc8f882b363"
 
+inherit pkgconfig
+
 S = "${WORKDIR}/${BPN}-${PV}"
 
 EXTRA_OEMAKE += "'LDFLAGS=${LDFLAGS}'"
@@ -42,5 +44,3 @@ do_install() {
     install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
 }
 ALTERNATIVE_PRIORITY = "60"
-
-PNBLACKLIST[netcat-openbsd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130673/"
-- 
2.7.4


