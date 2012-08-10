Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpk5-0003Pl-CJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:59:09 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so928736wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=hG8RY+yBmE+J4rgI/3I3SS79tE4CK7XMvLhu7WJhvuE=;
	b=0/rjGUs7d2I+xOlCa0BRh7JsYRo+plW21kZyAsp/uCeU9dZjzs70sZclWkbOfrhQEM
	+XpppA/2net4dXzBga0kOVvVmpDktuIlU4ZOQm4xS10Ag5Ae0Z5NtN8DqIGFslXedMXH
	YBal1Y6xNKI2lKRGLAPiUqXKpbaR81gRazFcniTnKxwNU3og/9GIPHXOl3TmzxotGMF+
	1Xd+AGznIum29DjGVu/6JmBu4aXWPiARdJ74X/OVCVd+6xydPNPs3wC8Y9x7P6caZXto
	TG2UMsqCw3r6fzlWhcnY3clfCbfm2dnbIcvMUBenacB5+70WgU4adxJ+XahCx8XLdrGn
	SwZA==
Received: by 10.180.81.165 with SMTP id b5mr6148185wiy.17.1344606441978;
	Fri, 10 Aug 2012 06:47:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm7841827wiv.11.2012.08.10.06.47.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:47:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:21 +0200
Message-Id: <ea81302f48fb139f390c76b5ae80aaec7fe816c5.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 26/46] edbus: option to disable performance-test was renamed and package logo.png in PN
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
X-List-Received-Date: Fri, 10 Aug 2012 13:59:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edbus_svn.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edbus_svn.bb b/meta-efl/recipes-efl/efl/edbus_svn.bb
index d40deb2..b99f79d 100644
--- a/meta-efl/recipes-efl/efl/edbus_svn.bb
+++ b/meta-efl/recipes-efl/efl/edbus_svn.bb
@@ -5,8 +5,12 @@ PV = "1.2.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
-EXTRA_OECONF += "--disable-performance_test"
+# it needs to be disabled, because creates circular dependency on elementary
+EXTRA_OECONF += "--disable-edbus-performance-test"
+
 SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
+
+FILES_${PN} += "${datadir}/e_dbus/logo.png"
-- 
1.7.8.6



