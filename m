Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPW9W-0007B3-QD
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 11:47:18 +0200
Received: by mail-bk0-f47.google.com with SMTP id jm2so278550bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 02:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=9RIKoVU0RHmxWX9yKx2GP0G+bP9Dsxp5U05leL2+KSw=;
	b=IJL4O//DE3F7F6IKo0HilGev1sLD2pt3o/f06U0Kn2c4rvM7g6cFPENycb+3I1ltpf
	2lfDqSDNhWtkibuGP4/pNJIJmETDPAHxLbfq4NdTglK0pA2GKgiFnXejvTnp+UBa2WIG
	UkDv2F5putCAmvUJlOPshCq65DdlWjAzX2jKWCs73YDmWpqH/XYbwge/CEcyXHHqFdLP
	IcDshzruDvCPTmG5hM2T08AnVT3Wq1JF4twOzOz662fsUYEac50bvRvDh9zCemSPRk9M
	4pnkE37lBwM8EbJ3VPNrOPdtoJPhYVsPBbVWrEosDy5FMSZnHmiac1ksDJwjD02kKR7P
	lqTg==
Received: by 10.205.119.130 with SMTP id fu2mr15010bkc.120.1335951456950;
	Wed, 02 May 2012 02:37:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s20sm2349886bks.2.2012.05.02.02.37.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 02:37:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 May 2012 11:37:30 +0200
Message-Id: <1335951450-28468-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335766581.git.Martin.Jansa@gmail.com>
References: <cover.1335766581.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 11/11] libgee: upgrade to 0.6.4
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
X-List-Received-Date: Wed, 02 May 2012 09:47:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/libgee/libgee_0.6.0.bb |   12 ------------
 meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb |   11 +++++++++++
 2 files changed, 11 insertions(+), 12 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/libgee/libgee_0.6.0.bb
 create mode 100644 meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb

diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.6.0.bb b/meta-oe/recipes-devtools/libgee/libgee_0.6.0.bb
deleted file mode 100644
index 4e305b6..0000000
--- a/meta-oe/recipes-devtools/libgee/libgee_0.6.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require libgee.inc
-PE = "1"
-PR = "${INC_PR}.1"
-#autoreconf needs introspection.m4 (staged by gobject-introspection-native) after http://git.gnome.org/browse/libgee/commit/?id=d026a29b38ca1a3388981c6e75a92602212373d8
-DEPENDS += "gobject-introspection-native"
-DEPENDS_virtclass-native += "gobject-introspection-native"
-
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgee/0.6/${BPN}-${PV}.tar.bz2"
-S = "${WORKDIR}/${BPN}-${PV}"
-
-SRC_URI[md5sum] = "4eb513b23ab6ea78884989518a4acf6f"
-SRC_URI[sha256sum] = "e586678d0a88637abeaaf850b62231000772e79ea6d9c4b45dc3cea99f778a7a"
diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb b/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
new file mode 100644
index 0000000..4e2c643
--- /dev/null
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
@@ -0,0 +1,11 @@
+require libgee.inc
+PE = "1"
+PR = "${INC_PR}.0"
+#autoreconf needs introspection.m4 (staged by gobject-introspection-native) after http://git.gnome.org/browse/libgee/commit/?id=d026a29b38ca1a3388981c6e75a92602212373d8
+DEPENDS += "gobject-introspection-native"
+DEPENDS_virtclass-native += "gobject-introspection-native"
+
+SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgee/${SHRT_VER}/${BP}.tar.xz"
+SRC_URI[md5sum] = "a32bf498cf33d5e3417823a7b252ad22"
+SRC_URI[sha256sum] = "55f39f3b28e676f6cbd9377d83edd031084436a4da41280a9503c94faffb1665"
-- 
1.7.8.6



