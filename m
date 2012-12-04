Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi5m-0002oS-Fj
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:18:38 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=rVBC6AhtJboxE+8YxOt7yKZY7i6asjaSSYKmyz8aLGc=;
	b=mUOvDz6I/qhLgSv7sDW5cG2d88B9H46AugTsbaufxqXIRv0LJNtjg+CzXmczB3KCQn
	7ME3V2exUa4Ea2xlVlfUby48tFKu+Hz8MpAK634gORFK9+oMJclz5vrEHz0NNThg0XtA
	pKTp78XeA/3U8aPek9Xt2gRGcSmG//Ho2vwJnoJpAsYKf+rmO8F37AqBoHuijQyYbnMn
	w5ZThTfhSi0DCwxQgFVB+2y90wNX75o7ZKxPOJdPD82NFj2uRhf7nHcGELRvWWTnLlnD
	fZRAM1aQLNvLjHkJESDajWruCjN32lL/zsyXfwDeafPp/ywBucmA1U8qZB2klIXcnJix
	YGRw==
Received: by 10.14.3.195 with SMTP id 43mr42732296eeh.36.1354586658903;
	Mon, 03 Dec 2012 18:04:18 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w3sm34836483eel.17.2012.12.03.18.04.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:04:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:07 +0100
Message-Id: <03697ee0d98d299581471736b217a2574c1b236a.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 34/58] elementary-alarm: remove recipe, source was removed in r70549
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
X-List-Received-Date: Tue, 04 Dec 2012 02:18:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/elementary-alarm_svn.bb | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/elementary-alarm_svn.bb

diff --git a/meta-efl/recipes-efl/e17/elementary-alarm_svn.bb b/meta-efl/recipes-efl/e17/elementary-alarm_svn.bb
deleted file mode 100644
index 6c44109..0000000
--- a/meta-efl/recipes-efl/e17/elementary-alarm_svn.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "An Elementary based Alarm app"
-LICENSE = "GPL"
-DEPENDS = "elementary"
-SECTION = "x11"
-PV = "0.0.0+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
-
-inherit e
-SRC_URI = "${E_SVN}/trunk/TMP/st;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
-
-RDEPENDS_${PN} = "waker"
-FILES_${PN} += "${bindir}/*"
-FILES_${PN} += "${datadir}/${PN}"
-FILES_${PN} += "${datadir}/icons/*"
-FILES_${PN} += "${datadir}/applications/*"
-FILES_${PN} += "${datadir}/${PN}/sounds/*"
-- 
1.8.0



