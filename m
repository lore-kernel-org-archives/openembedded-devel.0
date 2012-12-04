Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi5g-0002l7-P1
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:18:33 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926297eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=dHkjuo2BUFwb3aCIa7iTnd8KcNYiXrvz82k95+WE6c8=;
	b=ZnXaVThwwPdrt3rdFcWluW4pvTzBYemRxWNWphCkU1/ciEbKc0cHbeZt7kNqEZB9Zl
	+yEXH7AYpOUNA4sRwxLvpW6NtFS9lrULNY9XpIVhXInEyMtgab+KewQWo8ivPsAfxwK3
	dY+ZPb08jIER+rVgufOOBifbu1gQCyNNab6Zy2YECzGy+yCOKfTny8FyV7bES3qnJ6I1
	NiuNMcCWYUDNbdZSDCUHeLXhIC/r2Inzf+fV7DGRcLWMKA5iDb9tVUNrcMq8rkJq3Mzd
	ZDbq0NgHr+RkP1FeOxyooUej1j+nQLYT4cowyW+TaZm78ytkjxFo5+JHNjm2eSz4WLMN
	ll3w==
Received: by 10.14.174.198 with SMTP id x46mr36125226eel.23.1354586651845;
	Mon, 03 Dec 2012 18:04:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm34813862eeg.4.2012.12.03.18.04.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:04:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:06 +0100
Message-Id: <3879ed931f53e293a53ed6aff5beb1aa3396cea3.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 33/58] waker: remove recipe, source was removed in r70549
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
X-List-Received-Date: Tue, 04 Dec 2012 02:18:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/waker_svn.bb | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/waker_svn.bb

diff --git a/meta-efl/recipes-efl/e17/waker_svn.bb b/meta-efl/recipes-efl/e17/waker_svn.bb
deleted file mode 100644
index 1d6d846..0000000
--- a/meta-efl/recipes-efl/e17/waker_svn.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "An EFL base at/alarm wakeup daemon"
-LICENSE = "LGPL"
-DEPENDS = "ecore edbus"
-SECTION = "console"
-PV = "0.0.0+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
-
-inherit efl
-
-SRC_URI = "\
-  ${E_SVN}/trunk/TMP/st;module=${SRCNAME};protocol=http \
-  file://0001-waker-remove-old-ecore_string_init-and-ecore_string_.patch \
-"
-S = "${WORKDIR}/${SRCNAME}"
-
-FILES_${PN} += "${bindir}/* ${libdir}/lib*.so.*"
-FILES_${PN} += "/etc/X11/Xsession.d/80x-enlightenment-wakerd"
-- 
1.8.0



