Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ScvrL-0004Or-4C
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 11:51:59 +0200
Received: by mail-ee0-f47.google.com with SMTP id d49so983829eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 02:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Ar3wMDq7qFEFVMFjJb4zCu8icSb8sAOHuqJoXoNHt7g=;
	b=g+2esBzi7YYvMv74kyrOjcMu+4MWwHS+lR7rdJSDDvpsHpjtBzPrE34p7AWe5swa3a
	+LdXreqRWxmr0cWwgRtR+5fcLYEYiB39WoWy6mqdi1ltfivwBAEwZd/NrsMAgsd8tUZj
	rQdCwBTFbtrqY1PQZbArG15bvrNojwtSpQkWkU/qfR9kBS6x6ZtFb0LfDYVOS64lyjKi
	xwDJl41X100SqfrsNlVLRg1n6523Zv5vm4VTGKCkpUAyLnlUidcf+3BEkpj3j//6LmcN
	hvXAvs6gJ0Ouzy5bLtMJR27AWACyJR51rcm9zPhF+CZvAB2B1OZUkpNMJOKyleH0vGTi
	T8tA==
Received: by 10.14.186.2 with SMTP id v2mr3268563eem.221.1339148491814;
	Fri, 08 Jun 2012 02:41:31 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id o16sm20190854eeb.13.2012.06.08.02.41.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 02:41:31 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2012 11:40:37 +0200
Message-Id: <1339148443-9467-8-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
References: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlVzXPd22uGrxAcDbSzHvx4OERjBnYkNLE9Qei/JM0W+FDMJjV1m51+kooCaYceoprvHcEl
Cc: Koen Kooi <koen@dominion.thruhere.net>, Chase Maupin <Chase.Maupin@ti.com>,
	eric@eukrea.com
Subject: [for-denzil][meta-oe][PATCH 08/14] libidl: Update LICENSE to contain actual version
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
X-List-Received-Date: Fri, 08 Jun 2012 09:51:59 -0000

From: chase maupin <chase.maupin@ti.com>

* Updated the LICENSE field to contain the version of the LGPL
  being used which is LGPLv2+
* Update the PR to reflect this license change

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-gnome/libidl/libidl.inc       |    2 +-
 meta-gnome/recipes-gnome/libidl/libidl_0.8.13.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libidl/libidl.inc b/meta-gnome/recipes-gnome/libidl/libidl.inc
index 7a90a70..a402037 100644
--- a/meta-gnome/recipes-gnome/libidl/libidl.inc
+++ b/meta-gnome/recipes-gnome/libidl/libidl.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Library for parsing CORBA IDL files"
 SECTION = "x11/gnome/libs"
-LICENSE = "LGPL"
+LICENSE = "LGPLv2+"
 
 inherit autotools pkgconfig
 
diff --git a/meta-gnome/recipes-gnome/libidl/libidl_0.8.13.bb b/meta-gnome/recipes-gnome/libidl/libidl_0.8.13.bb
index 732178d..d658cf8 100644
--- a/meta-gnome/recipes-gnome/libidl/libidl_0.8.13.bb
+++ b/meta-gnome/recipes-gnome/libidl/libidl_0.8.13.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 DEPENDS = "glib-2.0 flex-native libidl-native"
 
-PR = "r0"
+PR = "r1"
 
 BINCONFIG_GLOB = "*-config-2"
 inherit autotools pkgconfig binconfig
-- 
1.7.10



