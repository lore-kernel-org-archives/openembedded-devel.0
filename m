Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QyOfS-0005Gd-17
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 15:47:55 +0200
Received: by ywa12 with SMTP id 12so5124665ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 06:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Omi/8KMRA9RsLLS3wvQr5hppUYNNIpX92gH/rrccu20=;
	b=d0r7WagKdw6sUBRXhCejF2Vvyvl2qLpjSZHMdy3kkY6H6s0qaV2xGzlDf3iBJ4DjNq
	yjZ6qIRy7qYsyc7kqsID9uFUgdiM4XtT1vaEC9M1z4LTD+yAVrqZF671rt/o4haiWV1p
	p9mYA54UwX45XaGOw2ML7ygyN7marfAPPxnSU=
Received: by 10.236.152.4 with SMTP id c4mr33579273yhk.52.1314711780133;
	Tue, 30 Aug 2011 06:43:00 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id a29sm5020072yhj.3.2011.08.30.06.42.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 30 Aug 2011 06:42:59 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Aug 2011 13:42:44 +0000
Message-Id: <04a735b690f58a4b9f0eaf0b1e243f0b806a4500.1314710525.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1314710525.git.otavio@ossystems.com.br>
References: <cover.1314710525.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1314710525.git.otavio@ossystems.com.br>
References: <cover.1314710525.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/2] json-glib: drop specific recipe to use OpenEmbedded-Core
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
X-List-Received-Date: Tue, 30 Aug 2011 13:47:55 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-devtools/json-glib/json-glib_0.10.4.bb |   14 --------------
 1 files changed, 0 insertions(+), 14 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/json-glib/json-glib_0.10.4.bb

diff --git a/meta-oe/recipes-devtools/json-glib/json-glib_0.10.4.bb b/meta-oe/recipes-devtools/json-glib/json-glib_0.10.4.bb
deleted file mode 100644
index 87c60cb..0000000
--- a/meta-oe/recipes-devtools/json-glib/json-glib_0.10.4.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "JSON-GLib is a library providing serialization and deserialization support for the JavaScript Object Notation (JSON) format"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-DEPENDS = "glib-2.0"
-
-PR = "r1"
-
-EXTRA_OECONF = "--enable-introspection=no"
-
-inherit autotools
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/json-glib/0.10/json-glib-0.10.4.tar.gz"
-
-SRC_URI[md5sum] = "87677e939a4b3d42e1c56b2a3046b9bb"
-SRC_URI[sha256sum] = "9561b3c58b350c89333d154f1e8669b8ece611c9c724252aed0e6273cda9cc6f"
-- 
1.7.2.5



