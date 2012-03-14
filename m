Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S7uUh-0004Lv-W0
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 21:08:24 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so2113842wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2012 12:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=MpwRx8tyXIaKB1U22KVLLgP08OuhGXtUonxxeLFV44M=;
	b=kr3qS6YkE5ZsQVLxdGMWZ+rZ7lrav3iHbLE6MwN1Z0B7aCQwjlvxVeZ7YoVjftdMep
	DvGE5qf6GaJDYqAEuBHX4HBs6OgvcikI/HEEpZ+Wr075pRRIlvHN5HHGlVSGFTGxyp3n
	gAw5NAb4c3gtxkn06wNA1aVmtjWHptjBt+ckyKvJGvfwwIQRxET3T5nVcNBt7ItT+WzU
	XWt2WtubQEqOphvPxHUZjFb+6cIWQm6lbkzeXiL0u/+JFAtx+COOnfKqdxHpShe8UtY2
	co6twJEIkvYZp9gpnN0nWx1vQtgwSTOsAYC9n+t1csha7i+yNswfImSTuRX3d+Y/RaRK
	JlMA==
Received: by 10.180.102.231 with SMTP id fr7mr9304861wib.10.1331755180682;
	Wed, 14 Mar 2012 12:59:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n15sm54336098wiw.6.2012.03.14.12.59.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Mar 2012 12:59:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Mar 2012 20:59:18 +0100
Message-Id: <cb954851e4d6ab17edd85203cdc07d330c2ecef1.1331754944.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <7ab914b2620b85f3d8363fed900c056ff1f5650a.1331754944.git.Martin.Jansa@gmail.com>
References: <7ab914b2620b85f3d8363fed900c056ff1f5650a.1331754944.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1331754944.git.Martin.Jansa@gmail.com>
References: <cover.1331754944.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 2/5] elementary: package new datetime_input_ctxpopup module
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
X-List-Received-Date: Wed, 14 Mar 2012 20:08:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary_svn.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index 32f706f..171e617 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10a051c72424b80bc784a3903651b43b"
 DEPENDS = "eet-native efreet evas ecore edje eet edbus ethumb poppler"
 PV = "0.8.0+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl gettext
@@ -32,6 +32,11 @@ RSUGGESTS_${PN} = "${PN}-tests ${PN}-accessibility"
 
 FILES_${PN} += "\
   ${libdir}/edje/modules/elm \
+  ${libdir}/elementary/modules/datetime_input_ctxpopup/*/module.so \
+"
+
+FILES_${PN}-dev += "\
+  ${libdir}/elementary/modules/datetime_input_ctxpopup/*/module.la \
 "
 
 FILES_${PN}-themes = "\
@@ -46,6 +51,7 @@ FILES_${PN}-dbg += "\
   ${libdir}/elementary/modules/test_entry/*/.debug \
   ${libdir}/elementary/modules/test_map/*/.debug \
   ${libdir}/elementary/modules/access_output/*/.debug \
+  ${libdir}/elementary/modules/datetime_input_ctxpopup/*/.debug \
   ${libdir}/edje/modules/elm/*/.debug \
 "
 
-- 
1.7.8.5



