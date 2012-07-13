Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc6R-0006Vo-Jh
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:23:59 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so352488eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Ar3wMDq7qFEFVMFjJb4zCu8icSb8sAOHuqJoXoNHt7g=;
	b=fcKhiX9Utzf+KAtOfn/Kjfbtlb9+7QmxRXO8rhZaaoN0b9VFlySCQQxj5I1rbC16da
	Xf+KKBTU3xBcnsBAbh8dvU+zRKZ8XHTB0mcg+dIO4qjGh/P7x/c2XKfPJv6NnzSyuoZp
	RW5MAGk9NMutjrhOPcPZp7a7UD9/dEJQwopz8UDeX8hvrjk9LP1TlE1Yp6fKuGYz9THZ
	pZjEraxWQlGy6G9lduch9OM7jB1dLTLaUmCjlfIFFRuQ/3nNet+qhRYW8TBDBflCUYYo
	d2Wr6LUOG2U0IevrgSyxycF7W+qBTnN6ZyHTQQMd+pOm7HqNJPKEMb/3McO32payXnil
	JSyw==
Received: by 10.14.48.1 with SMTP id u1mr82612eeb.84.1342170767540;
	Fri, 13 Jul 2012 02:12:47 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id e45sm23231097eeb.6.2012.07.13.02.12.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:12:46 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:11:54 +0200
Message-Id: <1342170730-14982-8-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQk3w9jPxBQv/xb+tm/Q8B5M9LVHmI7l67VNcQKvN+kw2rG7CTQj8Ns6eMdtMXVp8fskQ9Bh
Cc: Koen Kooi <koen@dominion.thruhere.net>, Chase Maupin <Chase.Maupin@ti.com>,
	eric@eukrea.com
Subject: [for-denzil][meta-oe 08/24] libidl: Update LICENSE to contain actual version
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
X-List-Received-Date: Fri, 13 Jul 2012 09:24:01 -0000

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



