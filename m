Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5FYK-0003rO-0m
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:28:52 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3592243fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=YigYWYr0H/wHhMMN+IZcEsrxdKRU0+SdpdrEXWG1XMk=;
	b=JeciojFlWLXoLtOx6olCitAlebmobRxKAKkFr2nogWJqZ4StmlRiaWmhusG3En52ew
	m60gpSjaRZ7dtbM7YoyX5+6Ydgqlc3tDN47IZq46kX/SwIk+BUv9YR2HOyl2uOyEwNiL
	DOQgNPym9knKs6IXV6s888BU4FKdAIamDgop8=
Received: by 10.223.44.89 with SMTP id z25mr1919319fae.42.1316345019347;
	Sun, 18 Sep 2011 04:23:39 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id a1sm17912393fab.4.2011.09.18.04.23.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:23:38 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:23:08 +0400
Message-Id: <1316344999-26642-7-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
References: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-opie 06/17] opie-libqrsync: package static library
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
X-List-Received-Date: Sun, 18 Sep 2011 11:28:54 -0000

Most of qt/opie libraries are normal shared libraries. libqrsync is
static lib, so it needs a special handle during packaging.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/opie-libqrsync/opie-libqrsync.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes-opie/opie-libqrsync/opie-libqrsync.inc b/recipes-opie/opie-libqrsync/opie-libqrsync.inc
index 02c21cb..ed657dd 100644
--- a/recipes-opie/opie-libqrsync/opie-libqrsync.inc
+++ b/recipes-opie/opie-libqrsync/opie-libqrsync.inc
@@ -13,3 +13,7 @@ do_install() {
         install -d ${D}${includedir}/
         install -m 0644 qrsync.h ${D}${includedir}/
 }
+
+# opie doesn't use staticdev packages and .a libraries
+# This package is an exception, so include .a in -dev
+FILES_${PN}-dev += "${libdir}/libqrsync.a"
-- 
1.7.2.5



