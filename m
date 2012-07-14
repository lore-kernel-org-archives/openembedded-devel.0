Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SpzK9-0001JC-1f
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Jul 2012 12:11:41 +0200
Received: by eeit10 with SMTP id t10so589456eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jul 2012 03:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=gsaVxl/GzAygR6p1m3qwKzOeT+VawSMDGC3bLV6NZdY=;
	b=jz5zCjgefXpQ9u3DPW2sOhUPVOU95cZEwGHIJRFDuYdQP+w93ev6NsyfhP69uSFM8m
	IJL38vF6tcemEWeMLHLxPrl1msuuUOCTVAYmmnLYS6VrLLCFfl9mxO2ULhUtD8mm+334
	6f5Jdm1Ii94lpG4SLGzi8v14tOLBrtJegY4xa7SafbnnFB0SlSsD7bNYxNUBV65ho57a
	9KQN2wXmRitWbQDMYrWr0J0RHj2xberShFZIgootbdyJGDjde2RSv5KCb1OjfhLhrifH
	IZfvXkNBDJfu7FOdtEZOCFYsxF/Bk2SfxAtv1g75X2ABQXR8LaN0NdGlRzO8sb4ILmXq
	Mk5w==
Received: by 10.14.214.196 with SMTP id c44mr1553647eep.7.1342260025723;
	Sat, 14 Jul 2012 03:00:25 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id t6sm2837696eeo.17.2012.07.14.03.00.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 14 Jul 2012 03:00:24 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Jul 2012 12:00:11 +0200
Message-Id: <1342260012-9444-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlbE1dAYL9lv4XiL2RbjbFUVpXhRA3fGUPwZwNZvNe3doTr+2wQEZ3hbxQ6/Yt9Nmixfp41
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>, eric@eukrea.com
Subject: [for-denzil][meta-oe 1/2] libnl: bump PE
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
X-List-Received-Date: Sat, 14 Jul 2012 10:11:41 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* libnl-2 in oe-core has PE 1, so in order to have upgrade patch from libnl-2 to libnl-3 we need PE 1 here too

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/libnl/libnl_3.2.3.bb |    2 ++
 1 file changed, 2 insertions(+)

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
1.7.10



