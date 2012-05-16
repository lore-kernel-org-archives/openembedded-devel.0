Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUg9J-00057q-8r
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 17:28:25 +0200
Received: by eaal1 with SMTP id l1so240181eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 08:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0CEgQGMCjQyGtWMMpBhLsYE0N55RJWCWbOubxWwgqJE=;
	b=iDwOhiHEak8J4L5gGJfzT0PXHiM/PMqIkGBqUTp7WciQ4SrIpNU3kkx6FRD2pzhVuY
	ks2yZyFa/ilgogY9TnIUjVqOBlNmp4quJ9iwOemdksKxfNW/rc65NlfIF5LJrO20zAm5
	rm2RwLjop5YjdbZkLYR4hvTHfFy1xWL0iBSq6X3P37bDps3h4+OHqQwlH+cpYNJuZ3xd
	bqQ9BJoEGhVOy0r+mCzdzB8gwLPK7xIweaIKLmoeFgwemCXFdZnFhUAYu2Q33gxSGO3v
	L9jzb99Bd/cMHkSfoVfVrauzRh7YXPfVJ/beyQCsCm2KujjMbNRjvBOblPovAZmg1h+C
	n8Tg==
Received: by 10.14.22.6 with SMTP id s6mr729570ees.53.1337181504051;
	Wed, 16 May 2012 08:18:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v46sm13774796eef.11.2012.05.16.08.18.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 May 2012 08:18:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 May 2012 17:18:14 +0200
Message-Id: <1337181494-26467-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH] libnl: bump PE
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
X-List-Received-Date: Wed, 16 May 2012 15:28:25 -0000

* libnl-2 in oe-core has PE 1, so in order to have upgrade patch from libnl-2 to libnl-3 we need PE 1 here too

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libnl/libnl_3.2.3.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-support/libnl/libnl_3.2.3.bb b/meta-oe/recipes-support/libnl/libnl_3.2.3.bb
index 190ea4c..38d34bf 100644
--- a/meta-oe/recipes-support/libnl/libnl_3.2.3.bb
+++ b/meta-oe/recipes-support/libnl/libnl_3.2.3.bb
@@ -2,6 +2,8 @@ DESCRIPTION = "libnl is a library for applications dealing with netlink sockets.
 HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
 SECTION = "libs/network"
 
+PE = "1"
+
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2b41e13261a330ee784153ecbb6a82bc"
 
-- 
1.7.8.6



