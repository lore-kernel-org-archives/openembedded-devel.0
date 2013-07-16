Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BD2766A464
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2013 09:53:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6G9rgfZ025601
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2013 02:53:42 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 16 Jul 2013 02:53:41 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Jul 2013 17:53:39 +0800
Message-ID: <1373968419-2952-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: Joe.macdonald@windriver.com
Subject: [meta-networking][PATCH] The ip is being installed into /sbin as of the latest busybox.
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
X-List-Received-Date: Tue, 16 Jul 2013 09:53:41 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The ip is being installed into /sbin as of the latest busybox, or oe-core.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../recipes-protocols/zeroconf/zeroconf/debian-zeroconf            |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf/debian-zeroconf b/meta-networking/recipes-protocols/zeroconf/zeroconf/debian-zeroconf
index c3705d2..0c9d15b 100644
--- a/meta-networking/recipes-protocols/zeroconf/zeroconf/debian-zeroconf
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf/debian-zeroconf
@@ -35,10 +35,10 @@ done
 
 # should we only allocate an address if we do not already have one?
 if [ -n "$FALLBACK" ]; then
-    /bin/ip addr show $IFACE scope global | grep -q "inet"
+    /sbin/ip addr show $IFACE scope global | grep -q "inet"
     IP=$?
     if [ $IP -eq 0 ]; then
-        /bin/ip route add 169.254.0.0/16 dev $IFACE
+        /sbin/ip route add 169.254.0.0/16 dev $IFACE
         exit 0
     fi
 fi
-- 
1.7.10.4


