Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS6T-0005dI-UC
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:50:03 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so4908028eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=OPgiOoYRe8TilGL3YdALkyRr0sa8K8eJyDvl39qTWJ0=;
	b=e+4iiVt7EbDklLh0ALIN18D4IVyZV03Y8/WzC65g/J89zIhJyT/h1qTQmAorx3GNTp
	mGDC/rYe49Pw6VwEV3US7ze3VTdLoAfBbyZwABXCpcljtYGZLU0GT7d7/U6fEpUpgIct
	bcAI9lXT3EWysXcOyDkH9fRCaPfz8UPpkpFU0ySl4jJ2sqwcOVEasb0xtSInDK0EDq42
	38K6Nlcjf0W37xUezwwrPtb01Qa9WSrCDJZBe0qzFTvJe5Ve5ucKKjFgE3FWDf7VLv/j
	AylsTozs1+5FSXM95TlGD1FBDp7+Mgjb+ojgzmXUTvReD+MfuBfiHC53gRQjRcI/XIkQ
	pB9w==
Received: by 10.14.172.195 with SMTP id t43mr62191413eel.17.1354048550736;
	Tue, 27 Nov 2012 12:35:50 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm42845763eeo.8.2012.11.27.12.35.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:35:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:53 +0100
Message-Id: <ea75a1c61a9a7bc409c791f206d9b949a862d8a2.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 16/21] edbus2: add recipe for new edbus implementation needed for eve and later efl-1.8
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
X-List-Received-Date: Tue, 27 Nov 2012 20:50:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edbus2.inc    | 11 +++++++++++
 meta-efl/recipes-efl/efl/edbus2_svn.bb | 11 +++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta-efl/recipes-efl/efl/edbus2.inc
 create mode 100644 meta-efl/recipes-efl/efl/edbus2_svn.bb

diff --git a/meta-efl/recipes-efl/efl/edbus2.inc b/meta-efl/recipes-efl/efl/edbus2.inc
new file mode 100644
index 0000000..00e2a28
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edbus2.inc
@@ -0,0 +1,11 @@
+DESCRIPTION = "DBus and HAL convenience wrappers for EFL"
+DEPENDS = "dbus ecore eina"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4ed65f801204783f71fedafc082038d9"
+
+inherit efl
+
+BBCLASSEXTEND = "native"
+INC_PR = "r0"
+
+SRCNAME = "edbus"
diff --git a/meta-efl/recipes-efl/efl/edbus2_svn.bb b/meta-efl/recipes-efl/efl/edbus2_svn.bb
new file mode 100644
index 0000000..58ef853
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edbus2_svn.bb
@@ -0,0 +1,11 @@
+require ${BPN}.inc
+
+SRCREV = "${EFL_SRCREV}"
+PV = "1.7.99+svnr${SRCPV}"
+PR = "${INC_PR}.0"
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "\
+  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+"
+S = "${WORKDIR}/${SRCNAME}"
-- 
1.8.0



