Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SXDzX-00008U-Jq
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 May 2012 18:00:51 +0200
Received: by werg55 with SMTP id g55so5180266wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2012 08:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=FsS6vrYEzfHj53txzUxRm/8fGRKoJTlcmlj9mEvG7BU=;
	b=XhYlebQbADJ6yFYlpQLqd4U3392GuLeIyh7SNSsT+MAYlmZsTuGvcFqGzKKeDn//tm
	UMMAWVCa0yDQUKlPpnmeN9oMpYk7ujG1I12ScYcNcq4KipkGCk+fl8vvTlPZykXLuHKV
	huwGxkNlVP6TabV0MgfP95nslrkj4oe69//s69KGwy11Jod+AiI0vvCbc0wu2x+Ats43
	P5ErZ7LCJzVFmaa2cEGrjmDhWxY/G4II3Mx9T20hIzkn8iVTZ8nl6Gr03eR/EXb7T1YP
	hf/RduUx0er8uMBC5VzEQD4wF3zO+sjzbpC6qWp+Zypb2M40ozaBy9CH+9zhePv2elo5
	TWrw==
Received: by 10.180.102.36 with SMTP id fl4mr40013554wib.2.1337788241751;
	Wed, 23 May 2012 08:50:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ez4sm40788756wid.3.2012.05.23.08.50.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 May 2012 08:50:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 May 2012 17:50:37 +0200
Message-Id: <1337788237-9475-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-handheld][PATCH] meta-handheld: append to BBPATH instead of prepend so order of bblayers.conf is respected
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 May 2012 16:00:52 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/layer.conf |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 7a2441b..31dcb16 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -1,13 +1,18 @@
 # Layer configuration for meta-handheld layer
 # Copyright 2011 Intel Corporation
 
-# We have a conf and classes directory, prepend to BBPATH to prefer our versions
-BBPATH := "${LAYERDIR}:${BBPATH}"
+# We have a conf and classes directory, append to BBPATH
+BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "meta-handheld"
 BBFILE_PATTERN_meta-handheld := "^${LAYERDIR}/"
+
+# Define the priority for recipes (.bb files) from this layer,
+# choosing carefully how this layer interacts with all of the
+# other layers.
+
 BBFILE_PRIORITY_meta-handheld = "7"
 
-- 
1.7.8.6



