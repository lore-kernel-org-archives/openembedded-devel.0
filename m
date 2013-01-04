Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TqyZU-0001nI-SJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 05:08:00 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so8892956pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2013 19:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=NBG/FjpRgwP3i8bMDSfSSlIOhzliEQvVn3DUSQokekE=;
	b=UOe+Aq0Iuuvj0sHtK8oETqVFSrIBZxq4oA9jthG++tGW4Uv543DBknAGZbjaB610UJ
	dpXIgAaogAg/KhmxGNq+uGJpEPVr7s8Inljm90AKss89JLhX04Vxe/K/p3EjlujwsD0c
	JFSob4lM8dEBKKPbF5GzQxifflaCoIkAntioS9Xwn55YwNQzXbG+UUt+wp8rOyoGKB28
	XOBQ0kKCAAT4JSrE/AtE+gVW8CO6vI7WwK1wXTBCGaVCcX+fdEJ9sxLOpck55nJzdbUQ
	TOCk2BjEfBTAZBZVcHRdJ19bgHavsYIv1+sh6Lgv5hXc9UyFV8tv6xtZAlFSH1hT1GlB
	gPTQ==
X-Received: by 10.66.89.199 with SMTP id bq7mr151149720pab.26.1357271567529;
	Thu, 03 Jan 2013 19:52:47 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qb3sm31432797pbb.35.2013.01.03.19.52.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 19:52:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2013 19:52:02 -0800
Message-Id: <1357271522-10566-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-opie][PATCH] layer.conf: Use .= for adding to BBPATH and += to BBFILES
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
X-List-Received-Date: Fri, 04 Jan 2013 04:08:11 -0000
X-List-Received-Date: Fri, 04 Jan 2013 04:08:11 -0000

Fixes parsing errors which is appearing after this commit to
meta-openembedded

http://cgit.openembedded.org/meta-openembedded/commit/?id=3c21a46020bd0816579648f684c41dbd6333583e

This triggers
exception NameError: name 'base_contains' is not defined
without this change

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/layer.conf |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 4d900c9..6950246 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -2,10 +2,10 @@
 # Copyright 2011 Intel Corporation
 
 # We have a conf and classes directory, prepend to BBPATH to prefer our versions
-BBPATH := "${LAYERDIR}:${BBPATH}"
+BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "meta-opie"
 BBFILE_PATTERN_meta-opie := "^${LAYERDIR}/"
-- 
1.7.9.5



