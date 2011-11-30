Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVfIs-0007OQ-GL
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 09:14:06 +0100
Received: by mail-ey0-f175.google.com with SMTP id d13so314165eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 00:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=l2wKsIFwTVJQoX9bvcQpA8DsjXDCGxFignxToX7qhNk=;
	b=aYWv2ZjuxWiQ3NJQFiW8c5IQIBbLU8kDFo9cetDeQEzHI4Em67MhcbZBB3StNwYd8z
	xkJhpn1CE6TNvLlrSF6gLs3gnUH7gRD2kCuLt18b6H/mruIZSiSF5f/IKyekA/M1H7OL
	1XQio22Lh53tfIxxZ9CSY9TgylbDlJ6zVWKNQ=
Received: by 10.213.10.6 with SMTP id n6mr194351ebn.14.1322640445072;
	Wed, 30 Nov 2011 00:07:25 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 8sm3614213ees.2.2011.11.30.00.07.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 00:07:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:06:51 +0100
Message-Id: <f21a5cb16130c966490de57313eb0f342736a130.1322640244.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <404d4fc58d6513392e0e567f15ebc92299c6f3df.1322640244.git.Martin.Jansa@gmail.com>
References: <404d4fc58d6513392e0e567f15ebc92299c6f3df.1322640244.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322640244.git.Martin.Jansa@gmail.com>
References: <cover.1322640244.git.Martin.Jansa@gmail.com>
Subject: [meta-oo 4/4] gconf-native: drop from meta-gnome, newer version is in oe-core
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
X-List-Received-Date: Wed, 30 Nov 2011 08:14:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gconf/gconf-native_2.6.1.bb      |   17 -----------------
 1 files changed, 0 insertions(+), 17 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gconf/gconf-native_2.6.1.bb

diff --git a/meta-gnome/recipes-gnome/gconf/gconf-native_2.6.1.bb b/meta-gnome/recipes-gnome/gconf/gconf-native_2.6.1.bb
deleted file mode 100644
index 2ca2dad..0000000
--- a/meta-gnome/recipes-gnome/gconf/gconf-native_2.6.1.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-NOTE = "This is just a dummy package to get packages stop complaining about gconftool-2 \
-        which they are not using anyway... :D"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-
-PR = "r1"
-
-inherit native
-
-do_install() {
-        install -d ${D}${bindir}
-        echo "#!/bin/sh" >${D}${bindir}/gconftool-2
-        chmod a+rx ${D}${bindir}/gconftool-2
-}
-
-NATIVE_INSTALL_WORKS = "1"
-- 
1.7.8.rc4



