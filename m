Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C9D678879
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jan 2018 08:16:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0V8GFxk008207
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jan 2018 00:16:18 -0800
Received: from pek-lpgtest5.wrs.com (128.224.153.85) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 31 Jan 2018 00:16:13 -0800
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Jan 2018 15:55:39 +0800
Message-ID: <20180131075540.23719-1-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] collectd: Add PACKAGECONFIG for write_riemann plugin
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
X-List-Received-Date: Wed, 31 Jan 2018 08:16:18 -0000
Content-Type: text/plain

Adding PACKAGECONFIG for write_riemann plugin can avoid
the inconsistent building output of collectd with or without
protobuf-c.

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.7.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.7.2.bb b/meta-oe/recipes-extended/collectd/collectd_5.7.2.bb
index c156ea19c..c638a1626 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.7.2.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.7.2.bb
@@ -42,6 +42,7 @@ PACKAGECONFIG[amqp] = "--enable-amqp --with-librabbitmq=yes, \
         --disable-amqp --with-librabbitmq=no,rabbitmq-c"
 # protobuf-c, libvirt that are currently only available in meta-virtualization layer
 PACKAGECONFIG[pinba] = "--enable-pinba,--disable-pinba,protobuf-c-native protobuf-c"
+PACKAGECONFIG[riemann] = "--enable-write_riemann,--disable-write_riemann,protobuf-c-native protobuf-c"
 PACKAGECONFIG[libvirt] = "--enable-libvirt,--disable-libvirt,libvirt"
 PACKAGECONFIG[libesmtp] = "--with-libesmtp,--without-libesmtp,libesmtp"
 PACKAGECONFIG[libmnl] = "--with-libmnl,--without-libmnl,libmnl"
-- 
2.11.0


