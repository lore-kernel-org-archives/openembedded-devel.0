Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 4D52570D90
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 07:05:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 5A08B3160B0B;
	Mon, 18 Aug 2014 09:05:32 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-devel@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Aug 2014 09:05:22 +0200
Message-Id: <1408345522-29466-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [meta-oe][PATCH v2] collectd: make pinba support a selectable feature
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
X-List-Received-Date: Mon, 18 Aug 2014 07:05:41 -0000

Pinba support requires protobuf-c that is currently only available in
meta-virtualization layer. Make this a selectable feature.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---

Notes:
    Updated pinba plugin dependency to protobuf-c.

 meta-oe/recipes-extended/collectd/collectd_5.2.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
index 30279c2..443f85d 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
@@ -32,6 +32,7 @@ PACKAGECONFIG[sensors] = "--enable-sensors --with-libsensors=yes, \
         --disable-sensors --with-libsensors=no,lmsensors"
 PACKAGECONFIG[amqp] = "--enable-amqp --with-librabbitmq=yes, \
         --disable-amqp --with-librabbitmq=no,rabbitmq-c"
+PACKAGECONFIG[pinba] = "--enable-pinba,--disable-pinba,protobuf-c-native protobuf-c"
 
 EXTRA_OECONF = " \
                 ${FPLAYOUT} \
-- 
1.9.0


