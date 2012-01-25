Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rpzs7-0001Qf-SZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 11:14:31 +0100
Received: by mail-ey0-f175.google.com with SMTP id l12so995867eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 02:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=/Pk+XxAHXJBC/auyBk1/9ZRtjUMjfSD1EYXKfpM4U2k=;
	b=ENEo/991Yqi3KDtJHFzk+iYaho0/OacZ5eUoJ17S0Xpyb4dVTWZupa8cOiQ0OOK6sl
	46E9DfkWCMEfOjwWrYdxaVy2pNgmXBEAmayRFtU3mcsJr4m1BzOli7LEJmOH2S3bnkHK
	hyeTAqXg1+Q6pgHXL8LJP+WdMBlwJVxTvViBQ=
Received: by 10.213.35.2 with SMTP id n2mr2973760ebd.145.1327486007796;
	Wed, 25 Jan 2012 02:06:47 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y54sm15925652eef.8.2012.01.25.02.06.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 02:06:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 11:06:37 +0100
Message-Id: <a9957f330a7b791a8eba677a2c672923ba4601ed.1327485929.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <cover.1327485929.git.Martin.Jansa@gmail.com>
References: <cover.1327485929.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 1/3] edbus: add ALLOW_EMPTY
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
X-List-Received-Date: Wed, 25 Jan 2012 10:14:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edbus.inc    |    3 +++
 meta-efl/recipes-efl/efl/edbus_svn.bb |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edbus.inc b/meta-efl/recipes-efl/efl/edbus.inc
index 58498b4..0ffbac4 100644
--- a/meta-efl/recipes-efl/efl/edbus.inc
+++ b/meta-efl/recipes-efl/efl/edbus.inc
@@ -5,6 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=550b8cea13dacc4bf00508a8cce1074c"
 
 inherit efl
 
+# -dev and -dbg packages wants ${PN} which is empty here
+ALLOW_EMPTY = "1"
+
 BBCLASSEXTEND = "native"
 INC_PR = "r1"
 
diff --git a/meta-efl/recipes-efl/efl/edbus_svn.bb b/meta-efl/recipes-efl/efl/edbus_svn.bb
index ebe4312..be1c6cc 100644
--- a/meta-efl/recipes-efl/efl/edbus_svn.bb
+++ b/meta-efl/recipes-efl/efl/edbus_svn.bb
@@ -2,7 +2,7 @@ require edbus.inc
 
 SRCREV = "${EFL_SRCREV}"
 PV = "1.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
-- 
1.7.8.4



