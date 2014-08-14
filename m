Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id EB78760424
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 15:32:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id CA68F401CD7;
	Thu, 14 Aug 2014 17:32:09 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Aug 2014 17:31:42 +0200
Message-Id: <1408030303-742-2-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1408030303-742-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1408030303-742-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [meta-oe][PATCH 1/2] collectd: make amqp plugin a selectable feature
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
X-List-Received-Date: Thu, 14 Aug 2014 15:32:18 -0000

The version of rabbitmq-c that collectd is compatible with, is older
than currently available 0.5.0. This results in build errors
triggerred by API deprecation at rabbitmq-c side. Make amqp
plugin a selectable feature, disabled by default.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.2.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
index 6b9b7bd..30279c2 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
@@ -30,6 +30,8 @@ PACKAGECONFIG[modbus] = "--enable-modbus,--disable-modbus,libmodbus"
 PACKAGECONFIG[libowcapi] = "--with-libowcapi,--without-libowcapi,owfs"
 PACKAGECONFIG[sensors] = "--enable-sensors --with-libsensors=yes, \
         --disable-sensors --with-libsensors=no,lmsensors"
+PACKAGECONFIG[amqp] = "--enable-amqp --with-librabbitmq=yes, \
+        --disable-amqp --with-librabbitmq=no,rabbitmq-c"
 
 EXTRA_OECONF = " \
                 ${FPLAYOUT} \
-- 
1.9.0


