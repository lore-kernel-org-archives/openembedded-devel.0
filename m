Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id CA857732B1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2015 09:52:51 +0000 (UTC)
Received: by wesx3 with SMTP id x3so9653196wes.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2015 01:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y5ur0KseAItcT0Jew+Ho+t/ESTz2DPcy7JfABB+QOho=;
	b=AUK3sGrvfvMqbuIgVMBkPx1BVsOvNJODEq8nKcMWVoZa3EpUutvG5JNVAOuOCApgHM
	GDlf7RA258kX87lNUGNzmjg7shP7LmAwxIeGyV3eNcZY6yR5ICGT289yY1MF7mcywSmf
	KQjCpD2+F5LrshkAqI+FWn/v087rSiX18Jzj+/pTkMPB3RuoUlqHtkLqTr8KznrcxzJx
	JShzbKYMYhr8CivA040iOnnr/ijjhEL8RvOg1QhN0gSQ10FjQjlSMLkJc2PqHc0A8aJn
	qlzYmUxbgmS6CZ8Ixl+YJrMo90JHWaCJCxfH79giDY1PJ6pqOxUe0h+rS7V2wBmjs13G
	IlEA==
X-Received: by 10.180.75.132 with SMTP id c4mr2665431wiw.78.1424512372800;
	Sat, 21 Feb 2015 01:52:52 -0800 (PST)
Received: from localhost.localdomain (ip-84-119-96-251.unity-media.net.
	[84.119.96.251])
	by mx.google.com with ESMTPSA id dm6sm6232120wib.22.2015.02.21.01.52.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Feb 2015 01:52:52 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Feb 2015 10:52:11 +0100
Message-Id: <1424512336-47007-4-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1424512336-47007-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1424512336-47007-1-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-oe][PATCH 3/7] libgee: Update to Version 0.16.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Feb 2015 09:52:52 -0000

---
 meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb | 10 ++++++++++
 meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb  | 10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb
 delete mode 100644 meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb

diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb b/meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb
new file mode 100644
index 0000000..b761b26
--- /dev/null
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb
@@ -0,0 +1,10 @@
+require libgee.inc
+PE = "1"
+PR = "${INC_PR}.2"
+DEPENDS += "gobject-introspection-stub"
+DEPENDS_virtclass-native += "gobject-introspection-stub-native"
+
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgee/${SHRT_VER}/${BP}.tar.xz"
+SRC_URI[md5sum] = "d30cf203784431b0fdc3216b1acd999c"
+SRC_URI[sha256sum] = "d95f8ea8e78f843c71b1958fa2fb445e4a325e4821ec23d0d5108d8170e564a5"
diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb b/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
deleted file mode 100644
index fbd1466..0000000
--- a/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require libgee.inc
-PE = "1"
-PR = "${INC_PR}.2"
-DEPENDS += "gobject-introspection-stub"
-DEPENDS_virtclass-native += "gobject-introspection-stub-native"
-
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgee/${SHRT_VER}/${BP}.tar.xz"
-SRC_URI[md5sum] = "a32bf498cf33d5e3417823a7b252ad22"
-SRC_URI[sha256sum] = "55f39f3b28e676f6cbd9377d83edd031084436a4da41280a9503c94faffb1665"
-- 
1.9.3


