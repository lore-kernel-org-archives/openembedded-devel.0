Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS5B-0005cR-0m
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:48:41 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6973088eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Do6uF2fYnEn4zo3JUznvKd+VpCUmQRsiMYiAjdFeSRU=;
	b=yfMC1deccM+pjSRM5NnobJyzHPEHI+u2FPd8jLbYxYqIbTgYdg9xPg48rT03kvR3KX
	0lfeU3yev4IbnRyBy1++rNazeKK2oq+OPk6EN5IjB04iDxTPHLbStE0xQ3CsHldEBjcu
	flYaZKRUXf/+XmOMUB4eWiud+ilJuv4a2NlHn7YK2z61JXowC6gf5tiy7V8QwjV4tCJc
	B69lcd1U9FT16BWGS6s7Cj35x+V15u5kK60TKO5fowT1qVUQDC+piIS4cYv9YeBWd3TO
	A5DxLM6oGg/yQ7DzvRkUmBP3giFDgE2jR6pIYXZu3H5D/xIoZFQ9zKCPnDsMTcHLaWAT
	mtWg==
Received: by 10.14.215.194 with SMTP id e42mr29232769eep.32.1354048469899;
	Tue, 27 Nov 2012 12:34:29 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g47sm42844100eeo.6.2012.11.27.12.34.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:34:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:40 +0100
Message-Id: <b926b4c4394e62377e67103dcccab19ec423c0a4.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 03/21] eve: add edbus to DEPENDS, but use older SRCREV which depends on edbus1 not edbus2
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
X-List-Received-Date: Tue, 27 Nov 2012 20:48:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/eve_svn.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/eve_svn.bb b/meta-efl/recipes-efl/e17/eve_svn.bb
index d760c4a..34cae18 100644
--- a/meta-efl/recipes-efl/e17/eve_svn.bb
+++ b/meta-efl/recipes-efl/e17/eve_svn.bb
@@ -1,9 +1,11 @@
 DESCRIPTION = " Enlightenment Web Browser"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-DEPENDS = "evas ecore edje elementary webkit-efl"
+DEPENDS = "evas ecore edje elementary webkit-efl edbus"
 PV = "0.3.0.0+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
+# 78126 and newer depends on edbus2
+# SRCREV = "${EFL_SRCREV}"
+SRCREV = "78125"
 
 inherit e gettext
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
-- 
1.8.0



