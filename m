Return-Path: <gizero@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 39AD973D27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 13:41:21 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so58779411wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 06:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OLW+HZHq40rO2Ir2qac3W6RA7/qw7v4GlBqQlfTloak=;
	b=QQgIX/3JWbb1J/f2gRqxNCS4aLslLRRErsDZf5Pi5LHFdQsVKN+mNK3atLT6SqBQ3w
	2JLQ8diIINASUJyvpYdxHkwogNORHcVCfoiY9se6lUb414hNd56pCbYl822lScjmz6mp
	XZxpX0DIGHO32ly7MlL+SbterDtZ0kUl48rbmdKI9I+QGXXpZiZqbc7z98vIeU+d+q8E
	2+41F+16QldRJ9qEG9+5fiwHi72kWvMkyzg83TYS0pWEM3bpCCmXpvQYqEq143mclD1s
	2009gdaazOGVaDIRikvIRLqkeI42tmeqRgKn/Ga+nzg36ioFmRqjYM42sJNC2JtJBiIj
	uIag==
X-Received: by 10.180.75.176 with SMTP id d16mr4781287wiw.75.1441978881667;
	Fri, 11 Sep 2015 06:41:21 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by smtp.gmail.com with ESMTPSA id
	nb10sm621368wic.11.2015.09.11.06.41.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Sep 2015 06:41:20 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Sep 2015 15:41:05 +0200
Message-Id: <1441978867-24237-2-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1441978867-24237-1-git-send-email-gizero@gmail.com>
References: <1441978867-24237-1-git-send-email-gizero@gmail.com>
Subject: [meta-oe][PATCH 1/3] redis: fix configuration file permissions
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
X-List-Received-Date: Fri, 11 Sep 2015 13:41:22 -0000

use 0644 instead of 0755 to install configuration file

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_3.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/redis/redis_3.0.2.bb b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
index e439431..4aea90a 100644
--- a/meta-oe/recipes-extended/redis/redis_3.0.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
@@ -27,7 +27,7 @@ do_install() {
     oe_runmake install
 
     install -d ${D}/${sysconfdir}/redis
-    install -m 0755 ${WORKDIR}/redis.conf ${D}/${sysconfdir}/redis/redis.conf
+    install -m 0644 ${WORKDIR}/redis.conf ${D}/${sysconfdir}/redis/redis.conf
 
     install -d ${D}/${sysconfdir}/init.d 
     install -m 0755 ${WORKDIR}/init-redis-server ${D}/${sysconfdir}/init.d/redis-server
-- 
1.9.1


