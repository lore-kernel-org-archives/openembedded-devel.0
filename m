Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 15EFB6FF76
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 18:28:49 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p66so75527317wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 10:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kvxBsWZmq2NCaZKCMQyxS8D3sQZxK6iGY4ed73WdE/Q=;
	b=wturtzhPVSHvTfoWE6WVndsNGHtF/7LRZaGZKwWhclBbCHRDEb0eFsMr+YV1WLIMU1
	Lo5O5PoghysojJgcxevcSFcqAGvivDn1tdbPCx5LPKWFxo0yLZfUzthjr1sxYhWvv2I8
	VE81weW2kEucOWz9ZeUhl2+dLq482w5tAVa9/xtKn/7o7LWGUCwb6Z/s9rxQG4cAylFB
	Lr/tO2ciimU8KWKbiN/M8kfBTLPTvKRoFs6d/ngjtgDNBJAQYTIhp/ygH0Oed5a5O/7H
	8S3lrK8asgTvZJj6S7FgOMEDk5CpeVgWOwscCYFJ7F75n9CD7sNrtS0Hcr9x8Lenc8Si
	wmcA==
X-Received: by 10.28.125.201 with SMTP id y192mr26715418wmc.23.1450117729959; 
	Mon, 14 Dec 2015 10:28:49 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gj2sm30926906wjb.40.2015.12.14.10.28.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 10:28:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2015 19:30:49 +0100
Message-Id: <1450117849-19495-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH][meta-networking] ctdb: add dependency on libldb
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
X-List-Received-Date: Mon, 14 Dec 2015 18:28:51 -0000

* libldb is autodetected from sysroot:
  WARN: ctdb: ctdb rdepends on libtdb, but it isn't a build dependency?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
index 66e8faf..f95b5a2 100644
--- a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
+++ b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
@@ -29,7 +29,7 @@ PACKAGECONFIG[libtdb] = "--without-included-tdb,--with-included-tdb,libtdb"
 
 PARALLEL_MAKE = ""
 
-DEPENDS += "popt libtevent libtalloc"
+DEPENDS += "popt libtevent libtalloc libldb"
 
 do_configure() {
     oe_runconf
-- 
2.6.4


