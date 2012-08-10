Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpio-0002eM-LA
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:57:50 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so927806wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6fJWt6dNjBvpMO9AKAl+EMUNTCs3+kaCicVnLyWrpTc=;
	b=smXRCfAH6wapMxrzLtmycoy5Eq6fgEDY7gRY3f49Xh8/1zt6SQCn8BjZXHM9brQHnV
	n2aAxdI9K12mPOsGllVomJeI1V2edg7FSaWcVfAK9nReQJGCkhCW9T6UGjYLBAI79+RT
	+MBTJO8a/AbO1EQ/Z6oVb3TEf/vZDB4fZXJgOAJBnmUGDUgcjJLNSIpF4lpZVP6Ww6we
	0oWnpkdM8PmbiUUAmDkHt/G54u+CMJQSswSdw9yam7rwdrszsKb2nTSDmNMJr0Q8X74D
	8uDgHbWIIwlT6glUmxFvho68489oN6EPb1BxZhdJMDkiJ6bpFpxETozjjRRW2Impr2Fk
	V+Mw==
Received: by 10.180.96.3 with SMTP id do3mr6167648wib.5.1344606363253;
	Fri, 10 Aug 2012 06:46:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm11629048wix.6.2012.08.10.06.46.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:46:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:13 +0200
Message-Id: <55abdd2d8eb10ffb1018bf7b5bf3f170b7614040.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 18/46] python-edje: add evas to DEPENDS
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
X-List-Received-Date: Fri, 10 Aug 2012 13:57:50 -0000

* fixes: ./edje/edit/c_edit.c:235:18: fatal error: Evas.h: No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/python/python-edje_svn.bb     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-devtools/python/python-edje_svn.bb b/meta-efl/recipes-devtools/python/python-edje_svn.bb
index 1607d87..f527959 100644
--- a/meta-efl/recipes-devtools/python/python-edje_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-edje_svn.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 PR = "${INC_PR}.2"
 SRCREV = "${EFL_SRCREV}"
-DEPENDS += "edje python-evas"
+DEPENDS += "edje python-evas evas"
 RDEPENDS_${PN} += "python-evas"
 
 SRC_URI += "file://0001-fix-unicode-conversion.patch"
-- 
1.7.8.6



