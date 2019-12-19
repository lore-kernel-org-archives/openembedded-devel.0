Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BBD397FC36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 04:58:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xBJ4wLko013368
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 18 Dec 2019 20:58:21 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 18 Dec 2019 20:58:20 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 19 Dec 2019 12:58:16 +0800
Message-ID: <20191219045816.34085-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH v2] openl2tp: update systemd service file
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
X-List-Received-Date: Thu, 19 Dec 2019 04:58:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

It shows an warning of openl2tp in systemd log:

| /lib/systemd/system/openl2tpd.service:8: PIDFile= references a path
| below legacy directory /var/run/, updating /var/run/openl2tpd.pid →
| /run/openl2tpd.pid; please update the unit file accordingly.

Update the systemd service file to fix the warning.

Update SRC_URI as well that the homepage openl2tp.org has been closed.
Use archived file on sourceforge instead.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-protocols/openl2tp/openl2tp/openl2tpd.service       | 2 +-
 meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd.service b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd.service
index 7b3faf672..d02d0ff7e 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd.service
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd.service
@@ -5,7 +5,7 @@ Requires=rpcbind.service
 
 [Service]
 Type=forking
-PIDFile=@STATEDIR@/run/openl2tpd.pid
+PIDFile=/run/openl2tpd.pid
 EnvironmentFile=@SYSCONFDIR@/default/openl2tpd
 ExecStartPre=@BASE_BINDIR@/sh -c "@BASE_SBINDIR@/modprobe -sq l2tp_ppp || @BASE_SBINDIR@/modprobe -sq pppol2tp"
 ExecStart=@SBINDIR@/openl2tpd $OPENL2TPDARGS
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index 90e8b111d..9c0c28e19 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9d9259cbbf00945adc25a470c1d3585 \
 
 DEPENDS = "popt flex readline rpcsvc-proto-native bison-native"
 
-SRC_URI = "ftp://ftp.openl2tp.org/releases/${BP}/${BP}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
            file://Makefile-modify-CFLAGS-to-aviod-build-error.patch \
            file://openl2tp-simplify-gcc-warning-hack.patch \
            file://Makefile-obey-LDFLAGS.patch \
-- 
2.17.1


