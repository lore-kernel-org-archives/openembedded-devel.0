Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pcgam-0000ZX-2O
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 16:57:04 +0100
Received: by fxm17 with SMTP id 17so19263489fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 07:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=y7x2L/PuP7Fw28jIEvIKxQ0lPJssFr6EKlotbkCYMjE=;
	b=LHt7+0MGrcU+iWIUpMSHL+24RV8OkAERhpy22TuPfpMKJn5is1dXfuBk0apJTF3MiS
	gXunZXqxnTNNBc4nc1lB2uAwuL/1C6A34NCTaG6GIcOxgKc6hB+UYQN5CPEwQunbyMw/
	2kRCAP8zFPphIjuP6x5ecFej1gVmO3rHdhffc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=AO30zF50NGLLIUn3+WU64ljH4Me7f7hnrEQdlVF3oL7L8M9Eta/L1pSrsQ1Ub6wqam
	BEJ5X6umYvaH5YGiYXmHwYoTwKjVsX0us8/OcZTPn9nDbTdg0VbyNi8BQ7OISknbvrkh
	1crEBnPMfjX3d/o41W0GPaNKZ8gfEJTCoKpDk=
Received: by 10.223.103.12 with SMTP id i12mr229500fao.43.1294761393442;
	Tue, 11 Jan 2011 07:56:33 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l3sm977970fan.0.2011.01.11.07.56.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 07:56:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jan 2011 16:56:23 +0100
Message-Id: <1294761389-13634-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
In-Reply-To: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
References: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 06/12] xorg-util: obsolete old versions
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
X-List-Received-Date: Tue, 11 Jan 2011 15:57:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/obsolete/xorg-util/imake_1.0.2.bb       |    9 +++++++++
 recipes/obsolete/xorg-util/makedepend_1.0.2.bb  |    4 ++++
 recipes/obsolete/xorg-util/util-macros_1.3.0.bb |    4 ++++
 recipes/xorg-util/imake_1.0.2.bb                |    9 ---------
 recipes/xorg-util/makedepend_1.0.2.bb           |    4 ----
 recipes/xorg-util/util-macros_1.3.0.bb          |    4 ----
 6 files changed, 17 insertions(+), 17 deletions(-)
 create mode 100644 recipes/obsolete/xorg-util/imake_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-util/makedepend_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-util/util-macros_1.3.0.bb
 delete mode 100644 recipes/xorg-util/imake_1.0.2.bb
 delete mode 100644 recipes/xorg-util/makedepend_1.0.2.bb
 delete mode 100644 recipes/xorg-util/util-macros_1.3.0.bb

diff --git a/recipes/obsolete/xorg-util/imake_1.0.2.bb b/recipes/obsolete/xorg-util/imake_1.0.2.bb
new file mode 100644
index 0000000..a77e705
--- /dev/null
+++ b/recipes/obsolete/xorg-util/imake_1.0.2.bb
@@ -0,0 +1,9 @@
+require xorg-util-common.inc
+
+DESCRIPTION = "C preprocessor interface to the make utility"
+RDEPENDS_${PN} = "perl xproto"
+
+PR = "r3"
+PE = "1"
+SRC_URI[archive.md5sum] = "b5c3a719d60a14ca2378dc1259ee60df"
+SRC_URI[archive.sha256sum] = "8008b4366ab96abfdac2c91808b79ec2cc5649966b41cfb07b14b6fbd798651c"
diff --git a/recipes/obsolete/xorg-util/makedepend_1.0.2.bb b/recipes/obsolete/xorg-util/makedepend_1.0.2.bb
new file mode 100644
index 0000000..2f7850d
--- /dev/null
+++ b/recipes/obsolete/xorg-util/makedepend_1.0.2.bb
@@ -0,0 +1,4 @@
+require makedepend.inc
+PR = "${INC_PR}.0"
+SRC_URI[archive.md5sum] = "905bfeb1a59929d950e5d638fbadcf39"
+SRC_URI[archive.sha256sum] = "008e6e117372e04cdc9a72ffc7dfae2e2d6617c9b399e052ae12dc2a1a03079a"
diff --git a/recipes/obsolete/xorg-util/util-macros_1.3.0.bb b/recipes/obsolete/xorg-util/util-macros_1.3.0.bb
new file mode 100644
index 0000000..1663b7c
--- /dev/null
+++ b/recipes/obsolete/xorg-util/util-macros_1.3.0.bb
@@ -0,0 +1,4 @@
+require util-macros.inc
+PR = "${INC_PR}.0"
+SRC_URI[archive.md5sum] = "51bb54c08415ee3c3000b7df9e9b07c5"
+SRC_URI[archive.sha256sum] = "57d2629849796b4dc919261eadd1eea3ee6e634d58979797287f7e09408cde67"
diff --git a/recipes/xorg-util/imake_1.0.2.bb b/recipes/xorg-util/imake_1.0.2.bb
deleted file mode 100644
index a77e705..0000000
--- a/recipes/xorg-util/imake_1.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-util-common.inc
-
-DESCRIPTION = "C preprocessor interface to the make utility"
-RDEPENDS_${PN} = "perl xproto"
-
-PR = "r3"
-PE = "1"
-SRC_URI[archive.md5sum] = "b5c3a719d60a14ca2378dc1259ee60df"
-SRC_URI[archive.sha256sum] = "8008b4366ab96abfdac2c91808b79ec2cc5649966b41cfb07b14b6fbd798651c"
diff --git a/recipes/xorg-util/makedepend_1.0.2.bb b/recipes/xorg-util/makedepend_1.0.2.bb
deleted file mode 100644
index 2f7850d..0000000
--- a/recipes/xorg-util/makedepend_1.0.2.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require makedepend.inc
-PR = "${INC_PR}.0"
-SRC_URI[archive.md5sum] = "905bfeb1a59929d950e5d638fbadcf39"
-SRC_URI[archive.sha256sum] = "008e6e117372e04cdc9a72ffc7dfae2e2d6617c9b399e052ae12dc2a1a03079a"
diff --git a/recipes/xorg-util/util-macros_1.3.0.bb b/recipes/xorg-util/util-macros_1.3.0.bb
deleted file mode 100644
index 1663b7c..0000000
--- a/recipes/xorg-util/util-macros_1.3.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require util-macros.inc
-PR = "${INC_PR}.0"
-SRC_URI[archive.md5sum] = "51bb54c08415ee3c3000b7df9e9b07c5"
-SRC_URI[archive.sha256sum] = "57d2629849796b4dc919261eadd1eea3ee6e634d58979797287f7e09408cde67"
-- 
1.7.4.rc1



