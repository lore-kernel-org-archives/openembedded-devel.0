Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS5P-0005dI-9y
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:48:55 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so4908028eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=AwkHyaFUEWvUb+XcuU/Y3JjnzOVWndjKi6TgfU6eufI=;
	b=ZrMz2AbWKQv0M6z9Za07MeptZWORB0Sn4hKAxPnl67uhTNKrnWEGFqHccf2IZih87p
	NLZWKMc40jj9OZtsz++Nvz3vx8Scflmo9Z0+s1Ry92f4naWs1U3tZBQbE+kdboi7Tpoa
	1EBziEhZvw711zhWTJsFPeF82i22tRFVNygUdxW0Hd0HlmUss/tbbCEO2k9JejTKaGpp
	5iF6cRLyeO4H8MJVgqgoLGfDyM4EZ7eFLxyqGGl5TzKvzT8qDckrzyAp7Ks/YTUzL4Dt
	4gm1RGRCoDhyrHq4Awu3cuNZ0TsjoLwB7rFrHUhEOJkC3E7uSGQTStm8VmnDCOx4+n6k
	73ig==
Received: by 10.14.173.69 with SMTP id u45mr38466711eel.21.1354048482870;
	Tue, 27 Nov 2012 12:34:42 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a44sm42842027eeo.7.2012.11.27.12.34.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:34:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:42 +0100
Message-Id: <51cc06fd915ca5153ba45e39818b568783805154.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 05/21] efl-from-svn-recipes.inc: update to match new version
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
X-List-Received-Date: Tue, 27 Nov 2012 20:48:55 -0000

* be aware that elocation, efreet and latest eve now depends on edbus2 (edbus directory in svn, e_dbus is edbus1)
  and we don't have recipe for edbus2 yet

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/conf/distro/include/efl-from-svn-recipes.inc | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
index d3a7e81..52da95f 100644
--- a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
+++ b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
@@ -1,4 +1,5 @@
-EFL_PREFERRED_VERSION ?= "1.7.0+svn%"
+EFL_PREFERRED_VERSION ?= "1.7.1+svn%"
+EFL_PREFERRED_PYTHON_VERSION ?= "1.7.0+svn%"
 
 PREFERRED_VERSION_ecore ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_ecore-native ?= "${EFL_PREFERRED_VERSION}"
@@ -30,11 +31,11 @@ PREFERRED_VERSION_emotion ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_ethumb ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_elementary ?= "${EFL_PREFERRED_VERSION}"
 
-PREFERRED_VERSION_python-elementary ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_python-ecore ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_python-edbus ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_python-edje ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_python-emotion ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_python-evas ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_python-elementary ?= "${EFL_PREFERRED_PYTHON_VERSION}"
+PREFERRED_VERSION_python-ecore ?= "${EFL_PREFERRED_PYTHON_VERSION}"
+PREFERRED_VERSION_python-edbus ?= "${EFL_PREFERRED_PYTHON_VERSION}"
+PREFERRED_VERSION_python-edje ?= "${EFL_PREFERRED_PYTHON_VERSION}"
+PREFERRED_VERSION_python-emotion ?= "${EFL_PREFERRED_PYTHON_VERSION}"
+PREFERRED_VERSION_python-evas ?= "${EFL_PREFERRED_PYTHON_VERSION}"
 
 PREFERRED_VERSION_terminology ?= "0.1.0+svn%"
-- 
1.8.0



