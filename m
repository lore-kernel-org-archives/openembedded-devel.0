Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1821C72727
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Dec 2014 08:56:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBN8uCpd007389
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Dec 2014 00:56:12 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 23 Dec 2014 00:56:12 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Dec 2014 16:55:50 +0800
Message-ID: <1419324950-17298-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2][meta-oe] collectd: add PACKAGECONFIG for libvirt, libesmtp
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
X-List-Received-Date: Tue, 23 Dec 2014 08:56:20 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Add PACKAGECONFIG for libvirt, libesmtp to fix below warnings:

WARN: collectd: collectd rdepends on libvirt, but it isn't a build dependency?
WARN: collectd: collectd rdepends on libcrypto, but it isn't a build dependency?
WARN: collectd: collectd rdepends on libesmtp, but it isn't a build dependency?
WARN: collectd: collectd rdepends on libssl, but it isn't a build dependency?

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.4.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb b/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
index 46752c8..92b231c 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
@@ -35,8 +35,10 @@ PACKAGECONFIG[sensors] = "--enable-sensors --with-libsensors=yes, \
         --disable-sensors --with-libsensors=no,lmsensors"
 PACKAGECONFIG[amqp] = "--enable-amqp --with-librabbitmq=yes, \
         --disable-amqp --with-librabbitmq=no,rabbitmq-c"
-# protobuf-c that is currently only available in meta-virtualization layer
+# protobuf-c, libvirt that are currently only available in meta-virtualization layer
 PACKAGECONFIG[pinba] = "--enable-pinba,--disable-pinba,protobuf-c-native protobuf-c"
+PACKAGECONFIG[libvirt] = "--enable-libvirt,--disable-libvirt,libvirt"
+PACKAGECONFIG[libesmtp] = "--with-libesmtp,--without-libesmtp,libesmtp"
 
 EXTRA_OECONF = " \
                 ${FPLAYOUT} \
-- 
1.9.1


