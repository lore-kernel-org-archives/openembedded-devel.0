Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DE6B1712AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 01:59:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBG1xeZY019480
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 17:59:41 -0800 (PST)
Received: from pek-wfan-d2.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Mon, 15 Dec 2014 17:59:40 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Dec 2014 09:59:39 +0800
Message-ID: <1418695179-32300-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe] collectd: add PACKAGECONFIG for libvirt
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
X-List-Received-Date: Tue, 16 Dec 2014 01:59:46 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Add PACKAGECONFIG for 'libvirt', otherwise there would be warnings
like below:

WARN: collectd: collectd rdepends on libvirt, but it isn't a build
dependency?

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.4.1.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb b/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
index 46752c8..6e82bbc 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
@@ -35,8 +35,9 @@ PACKAGECONFIG[sensors] = "--enable-sensors --with-libsensors=yes, \
         --disable-sensors --with-libsensors=no,lmsensors"
 PACKAGECONFIG[amqp] = "--enable-amqp --with-librabbitmq=yes, \
         --disable-amqp --with-librabbitmq=no,rabbitmq-c"
-# protobuf-c that is currently only available in meta-virtualization layer
+# protobuf-c, libvirt that are currently only available in meta-virtualization layer
 PACKAGECONFIG[pinba] = "--enable-pinba,--disable-pinba,protobuf-c-native protobuf-c"
+PACKAGECONFIG[libvirt] = "--enable-libvirt,--disable-libvirt,libvirt"
 
 EXTRA_OECONF = " \
                 ${FPLAYOUT} \
-- 
1.7.10.4


