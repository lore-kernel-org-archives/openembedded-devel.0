Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 13156771A3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 06:44:37 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id i130so899628pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 23:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KRyj0qeTRq+uKtzpnWrSZV6rZcgPanoJyVCJyQrs8rQ=;
	b=A402gdVbb2J1tXCbI9FtN0u3owgvYXjJxSDwuAFCuqPf+0OxC9fEeIJj6wdDd+5DV4
	P1SSHJSs0GrSnATNNzjFY+mlYiLCoDPganHL1HAjrjIvO1m7nclkZWzObeW/7mw7HiPQ
	XPFiT+/sUmoKpyNQV0+EVELIh2qz9W0oVpME6hl1t+MhkHZLX/6X7gWoS3GZUttQsume
	idjrLp5xoP41gEz2owTCczyUgymCJ8dC274m7jaSDKTGr+3LVQCzFwAc30uizKIO/Rxq
	N3PoJAL0qEQzI78RJsgbI6448DIcSFHeA0Ks/7i/DUEv9TeiX3TAVqGcO9FslaAJ8kHO
	5MMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KRyj0qeTRq+uKtzpnWrSZV6rZcgPanoJyVCJyQrs8rQ=;
	b=pDVqnx1ynTyoLMYMnRvYO7czK+UJ/AaxWnJiZo1xPvP215hp3rK75hbycJ1o3D97tW
	pmNYCXkpqPEepcLLkedodX9acV4OYnMC4Xr6FKnWbIDqB6jsOGrgoAhMli/gfdsqjCiQ
	5+6fAtpdr6MRxwgaQTJhz2tj5e6/6FhIve16MYYNaYSNxw9IXsp1gLb2z0TzT2WfVPgt
	a1pMhPlJMynCO2YmJKHIJelIFSyNLbliSBSVZYAf3oNadN+bHg4s/6kGP+50IKa8c24q
	y7bIgnUXxfiAAt3vhQbClTz+cYIsNuz2V7W36hPHqD5omDQAQSQIAG65n9JBXN8FQqDj
	BBUw==
X-Gm-Message-State: AHPjjUhspNABswVDDf26x5/QpL9S0S/sOVeE3GCKkS7q6T7DL0+92uSk
	XPCafaF008BWnnEL
X-Google-Smtp-Source: AOwi7QBZ3kH18CLu3g2JeFhRSCHx/ALLTgTzoOXidtTgTjB5XlLgU6zdbyiczlNtHxanoihiOK+QFg==
X-Received: by 10.159.198.71 with SMTP id y7mr2630737plt.56.1505457879209;
	Thu, 14 Sep 2017 23:44:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::989f])
	by smtp.gmail.com with ESMTPSA id
	r11sm642470pfg.180.2017.09.14.23.44.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Sep 2017 23:44:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Sep 2017 23:44:28 -0700
Message-Id: <20170915064430.35932-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-gnome][PATCH 1/3] gnome-keyring: Fix build with musl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Sep 2017 06:44:38 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnome-keyring/gnome-keyring/musl.patch              | 17 +++++++++++++++++
 .../recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb |  4 +++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/musl.patch

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/musl.patch b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/musl.patch
new file mode 100644
index 000000000..050b87ab2
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/musl.patch
@@ -0,0 +1,17 @@
+include sys/select.h for FD_* macros
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: gnome-keyring-2.32.1/pkcs11/rpc-layer/gkm-rpc-daemon-standalone.c
+===================================================================
+--- gnome-keyring-2.32.1.orig/pkcs11/rpc-layer/gkm-rpc-daemon-standalone.c
++++ gnome-keyring-2.32.1/pkcs11/rpc-layer/gkm-rpc-daemon-standalone.c
+@@ -32,6 +32,7 @@
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <sys/select.h>
+ 
+ #include <dlfcn.h>
+ #include <pthread.h>
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
index 3b4cbf57f..fd6ca73a4 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
@@ -15,7 +15,9 @@ PR = "r12"
 
 inherit autotools gnome gtk-doc pkgconfig gsettings
 
-SRC_URI += "file://egg-asn1x.patch"
+SRC_URI += "file://egg-asn1x.patch \
+            file://musl.patch \
+"
 
 DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} intltool-native"
 RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
-- 
2.14.1


