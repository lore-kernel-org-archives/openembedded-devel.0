Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS6h-0005cR-Bh
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:50:15 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6973088eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=9xVeOzonxKWdmGC74D/yzpMnCU/svYJg/981cStX/A8=;
	b=TdrPMdvkYxsYmXZ4iDm/mmeCd92ToRA9jTdKc1xA+eCZ/nYFSoGObOgUpDsm+JWCGP
	yHhyEtH0gYJyybO5Xv6O9B4afuCQmqgg3trk92gbd7vRS9umL0PA2gg6mG8tQJurM2+m
	gWZj2rp8V5iK/mH/HPq8cNk0Cudwp4z9ODWxIBhtSmsMl/KxzXL7i8I58F+eUAlDwJu+
	4nRGF+oDGhKeZ4hYN+cszWVvBAFRchWGDW36tHKmJ/SBFINS9+5VK8rY067tu38APA6q
	y8KUvyxqQvERpH35lVmkJbEQn7Mpts2tYL56qTVjxsTXsth6s8mmFvCSCOE8fTZNAnFM
	VnNQ==
Received: by 10.14.194.4 with SMTP id l4mr12779118een.42.1354048564206;
	Tue, 27 Nov 2012 12:36:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e1sm42858043eem.3.2012.11.27.12.36.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:36:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:55 +0100
Message-Id: <25d136570dfe7787c9a64405c5196b5111a23c67.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 18/21] efl: upgrade to 1.7.2
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
X-List-Received-Date: Tue, 27 Nov 2012 20:50:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../efl/{ecore_1.7.1.bb => ecore_1.7.2.bb}         |  4 +-
 .../efl/{eeze_1.7.1.bb => edbus_1.7.2.bb}          |  4 +-
 meta-efl/recipes-efl/efl/edje/r79484.patch         | 52 ----------------------
 meta-efl/recipes-efl/efl/edje_1.7.1.bb             | 11 -----
 .../efl/{edbus_1.7.1.bb => edje_1.7.2.bb}          |  4 +-
 .../recipes-efl/efl/{eet_1.7.1.bb => eet_1.7.2.bb} |  4 +-
 .../efl/{efreet_1.7.1.bb => eeze_1.7.2.bb}         |  4 +-
 meta-efl/recipes-efl/efl/efreet_1.7.2.bb           | 10 +++++
 meta-efl/recipes-efl/efl/eina_1.7.1.bb             | 10 -----
 meta-efl/recipes-efl/efl/eina_1.7.2.bb             | 10 +++++
 meta-efl/recipes-efl/efl/eio_1.7.1.bb              | 10 -----
 meta-efl/recipes-efl/efl/eio_1.7.2.bb              | 10 +++++
 meta-efl/recipes-efl/efl/elementary_1.7.1.bb       | 10 -----
 meta-efl/recipes-efl/efl/elementary_1.7.2.bb       | 10 +++++
 meta-efl/recipes-efl/efl/embryo_1.7.1.bb           | 10 -----
 meta-efl/recipes-efl/efl/embryo_1.7.2.bb           | 10 +++++
 meta-efl/recipes-efl/efl/emotion_1.7.1.bb          | 10 -----
 meta-efl/recipes-efl/efl/emotion_1.7.2.bb          | 10 +++++
 meta-efl/recipes-efl/efl/ethumb_1.7.1.bb           | 10 -----
 meta-efl/recipes-efl/efl/ethumb_1.7.2.bb           | 10 +++++
 .../recipes-efl/efl/evas-generic-loaders_1.7.1.bb  | 10 -----
 .../recipes-efl/efl/evas-generic-loaders_1.7.2.bb  | 10 +++++
 meta-efl/recipes-efl/efl/evas_1.7.1.bb             | 10 -----
 meta-efl/recipes-efl/efl/evas_1.7.2.bb             | 10 +++++
 meta-efl/recipes-efl/efl/expedite_1.7.1.bb         | 10 -----
 meta-efl/recipes-efl/efl/expedite_1.7.2.bb         | 10 +++++
 26 files changed, 110 insertions(+), 163 deletions(-)
 rename meta-efl/recipes-efl/efl/{ecore_1.7.1.bb => ecore_1.7.2.bb} (50%)
 rename meta-efl/recipes-efl/efl/{eeze_1.7.1.bb => edbus_1.7.2.bb} (41%)
 delete mode 100644 meta-efl/recipes-efl/efl/edje/r79484.patch
 delete mode 100644 meta-efl/recipes-efl/efl/edje_1.7.1.bb
 rename meta-efl/recipes-efl/efl/{edbus_1.7.1.bb => edje_1.7.2.bb} (41%)
 rename meta-efl/recipes-efl/efl/{eet_1.7.1.bb => eet_1.7.2.bb} (41%)
 rename meta-efl/recipes-efl/efl/{efreet_1.7.1.bb => eeze_1.7.2.bb} (41%)
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.7.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.7.2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.7.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.7.2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.7.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.7.2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.2.bb

diff --git a/meta-efl/recipes-efl/efl/ecore_1.7.1.bb b/meta-efl/recipes-efl/efl/ecore_1.7.2.bb
similarity index 50%
rename from meta-efl/recipes-efl/efl/ecore_1.7.1.bb
rename to meta-efl/recipes-efl/efl/ecore_1.7.2.bb
index 5848091..3679b71 100644
--- a/meta-efl/recipes-efl/efl/ecore_1.7.1.bb
+++ b/meta-efl/recipes-efl/efl/ecore_1.7.2.bb
@@ -7,5 +7,5 @@ SRC_URI = "\
   file://fix-ecore-fb-initialization.patch \
 "
 
-SRC_URI[md5sum] = "9d668311a42eb05aef57c2e8ce233722"
-SRC_URI[sha256sum] = "f69e132bb945c2b968aa17e7ac97f2b21e01b94eb25af2b96d89999c8d63ea60"
+SRC_URI[md5sum] = "f6d086ea8bbe64651dc3b5d2e840d106"
+SRC_URI[sha256sum] = "0b9642a67f0d977c2a13ed83ac02387c99309db92a72bf1031482df65ee4a1c7"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.7.1.bb b/meta-efl/recipes-efl/efl/edbus_1.7.2.bb
similarity index 41%
rename from meta-efl/recipes-efl/efl/eeze_1.7.1.bb
rename to meta-efl/recipes-efl/efl/edbus_1.7.2.bb
index fe9d0a2..159517c 100644
--- a/meta-efl/recipes-efl/efl/eeze_1.7.1.bb
+++ b/meta-efl/recipes-efl/efl/edbus_1.7.2.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "3da7e14b6736528285551a7fc3e18b67"
-SRC_URI[sha256sum] = "42092b5be0857bba4c1de35fcf9d4ec159c14ef8f57582964e060520ea728b70"
+SRC_URI[md5sum] = "c8b4c39efed63bdf503d45c8a94557a6"
+SRC_URI[sha256sum] = "e12146e7b6acca6a9f0fac5849a01ffcfa65004f7b1d5053cfb8c0e37d4dea98"
diff --git a/meta-efl/recipes-efl/efl/edje/r79484.patch b/meta-efl/recipes-efl/efl/edje/r79484.patch
deleted file mode 100644
index 68dc02d..0000000
--- a/meta-efl/recipes-efl/efl/edje/r79484.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Upstream-Status: backport
-
-Index: src/bin/edje_cc_out.c
-===================================================================
---- a/src/bin/edje_cc_out.c	(revision 79483)
-+++ b/src/bin/edje_cc_out.c	(revision 79484)
-@@ -1900,27 +1900,32 @@
-           {
-              for (i = 0 ; i < pc->programs.fnmatch_count ; i++)
-                {
--                  if (!strcmp(pl->u.ep->name, pc->programs.fnmatch[i]->name))
-+                  if (pl->u.ep->name && pc->programs.fnmatch[i]->name &&
-+                      !strcmp(pl->u.ep->name, pc->programs.fnmatch[i]->name))
-                     data_queue_anonymous_lookup(pc, pc->programs.fnmatch[i], dest);
-                }
-              for (i = 0 ; i < pc->programs.strcmp_count ; i++)
-                {
--                  if (!strcmp(pl->u.ep->name, pc->programs.strcmp[i]->name))
-+                  if (pl->u.ep->name && pc->programs.strcmp[i]->name &&
-+                      !strcmp(pl->u.ep->name, pc->programs.strcmp[i]->name))
-                     data_queue_anonymous_lookup(pc, pc->programs.strcmp[i], dest);
-                }
-              for (i = 0 ; i < pc->programs.strncmp_count ; i++)
-                {
--                  if (!strcmp(pl->u.ep->name, pc->programs.strncmp[i]->name))
-+                  if (pl->u.ep->name && pc->programs.strncmp[i]->name &&
-+                      !strcmp(pl->u.ep->name, pc->programs.strncmp[i]->name))
-                     data_queue_anonymous_lookup(pc, pc->programs.strncmp[i], dest);
-                }
-              for (i = 0 ; i < pc->programs.strrncmp_count ; i++)
-                {
--                  if (!strcmp(pl->u.ep->name, pc->programs.strrncmp[i]->name))
-+                  if (pl->u.ep->name && pc->programs.strrncmp[i]->name &&
-+                      !strcmp(pl->u.ep->name, pc->programs.strrncmp[i]->name))
-                     data_queue_anonymous_lookup(pc, pc->programs.strrncmp[i], dest);
-                }
-              for (i = 0 ; i < pc->programs.nocmp_count ; i++)
-                {
--                  if (!strcmp(pl->u.ep->name, pc->programs.nocmp[i]->name))
-+                  if (pl->u.ep->name && pc->programs.nocmp[i]->name &&
-+                      !strcmp(pl->u.ep->name, pc->programs.nocmp[i]->name))
-                     data_queue_anonymous_lookup(pc, pc->programs.nocmp[i], dest);
-                }
-           }
-@@ -2466,6 +2471,7 @@
- _data_queue_part_lookup(Edje_Part_Collection *pc, char *name, char *ptr, int len)
- {
-    Code_Lookup *cl;
-+
-    cl = mem_alloc(SZ(Code_Lookup));
-    cl->ptr = ptr;
-    cl->len = len;
diff --git a/meta-efl/recipes-efl/efl/edje_1.7.1.bb b/meta-efl/recipes-efl/efl/edje_1.7.1.bb
deleted file mode 100644
index 67cf95e..0000000
--- a/meta-efl/recipes-efl/efl/edje_1.7.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-  file://r79484.patch \
-"
-
-SRC_URI[md5sum] = "f0be474e4b4d51704dc64ec27941c2ad"
-SRC_URI[sha256sum] = "d794b8b2144786cc42c34302660d130211aa0dc223fa399fdabadaee3397d575"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.1.bb b/meta-efl/recipes-efl/efl/edje_1.7.2.bb
similarity index 41%
rename from meta-efl/recipes-efl/efl/edbus_1.7.1.bb
rename to meta-efl/recipes-efl/efl/edje_1.7.2.bb
index 2438fba..43d9f46 100644
--- a/meta-efl/recipes-efl/efl/edbus_1.7.1.bb
+++ b/meta-efl/recipes-efl/efl/edje_1.7.2.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "6997f0fad5b041b9c1df25a2cd98bc24"
-SRC_URI[sha256sum] = "c543031073f267f637cad2eaa51cd1ccdeab98f45f2a1eb438c4c49aebfd53b7"
+SRC_URI[md5sum] = "20de3518260eeeed14f54e8d013e23c9"
+SRC_URI[sha256sum] = "fd512821f581b6d16998bac19e479ecf5a191940ba0e0b0a1250f6b04636d08c"
diff --git a/meta-efl/recipes-efl/efl/eet_1.7.1.bb b/meta-efl/recipes-efl/efl/eet_1.7.2.bb
similarity index 41%
rename from meta-efl/recipes-efl/efl/eet_1.7.1.bb
rename to meta-efl/recipes-efl/efl/eet_1.7.2.bb
index 464b448..27e5178 100644
--- a/meta-efl/recipes-efl/efl/eet_1.7.1.bb
+++ b/meta-efl/recipes-efl/efl/eet_1.7.2.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "52abbd8ab0d55480166bf5ec49c78627"
-SRC_URI[sha256sum] = "33901b9aa6b83f3c0a1ff044c7ffbb0773e46c12cc3e71ed63619fc1fcd9c29e"
+SRC_URI[md5sum] = "fb3014a5227e466261a49eee5747597b"
+SRC_URI[sha256sum] = "03693c282db583d1a224d0134a61a3a138ad99cfa329f9c220f585bf8a4677f8"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.1.bb b/meta-efl/recipes-efl/efl/eeze_1.7.2.bb
similarity index 41%
rename from meta-efl/recipes-efl/efl/efreet_1.7.1.bb
rename to meta-efl/recipes-efl/efl/eeze_1.7.2.bb
index 46e6d7d..4412629 100644
--- a/meta-efl/recipes-efl/efl/efreet_1.7.1.bb
+++ b/meta-efl/recipes-efl/efl/eeze_1.7.2.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "29e40bb99bb05e4ebe91f3dc2796e12f"
-SRC_URI[sha256sum] = "bc01384a69b138e6aae669b17bfaf3f34ac6189dc5b2e909917098b582d41749"
+SRC_URI[md5sum] = "4a5d466a00989fe03abd218608cd1d99"
+SRC_URI[sha256sum] = "fbbf42665a2618a2ca7a8080c7a2617cad819b24b3cb3c4f54417aab67ddac97"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.2.bb b/meta-efl/recipes-efl/efl/efreet_1.7.2.bb
new file mode 100644
index 0000000..92499c9
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efreet_1.7.2.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "7490ccdb57d298e6226b4f5cb956c5c5"
+SRC_URI[sha256sum] = "ebb8175664f9c486bd112a4915bda794ef0ecc68833bb6726cd76a395e64ab94"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.1.bb b/meta-efl/recipes-efl/efl/eina_1.7.1.bb
deleted file mode 100644
index 0c71ae7..0000000
--- a/meta-efl/recipes-efl/efl/eina_1.7.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "644b7e8a3c3a48238f2c4003c90925de"
-SRC_URI[sha256sum] = "2dbaa926f758d7d2e8ff9d9efffbf0aceb5225b17fd2b464ce0fe279830098f8"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.2.bb b/meta-efl/recipes-efl/efl/eina_1.7.2.bb
new file mode 100644
index 0000000..4feb9c2
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eina_1.7.2.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "5d0453d6e7eb6f2c1b4e40b8c5be6f20"
+SRC_URI[sha256sum] = "caa1be5cdf3ed450472d4fa114983762bf40699adff506e6b493e4e37c842018"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.1.bb b/meta-efl/recipes-efl/efl/eio_1.7.1.bb
deleted file mode 100644
index 12c854b..0000000
--- a/meta-efl/recipes-efl/efl/eio_1.7.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "64c441dffeb9eb6ee7ad68ee9501506c"
-SRC_URI[sha256sum] = "4e9511b736b80b0495ae0a54c9638615ee5336f57a9874f4fb16f11c0b8f563f"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.2.bb b/meta-efl/recipes-efl/efl/eio_1.7.2.bb
new file mode 100644
index 0000000..cfdfe07
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eio_1.7.2.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "b8e3b115a63f423a70ce7459c0b77d58"
+SRC_URI[sha256sum] = "c4af1062c27d2e0fef6d6919df39921c832553ff448628a5d9fe3704186a714b"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.1.bb b/meta-efl/recipes-efl/efl/elementary_1.7.1.bb
deleted file mode 100644
index 068b433..0000000
--- a/meta-efl/recipes-efl/efl/elementary_1.7.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "938cf8de6012d2de8db7971f6874feac"
-SRC_URI[sha256sum] = "619074b1561212e8fdb0c0f05a2204ba3f9a3fdebd51ad53adabf5a7d62d3712"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.2.bb b/meta-efl/recipes-efl/efl/elementary_1.7.2.bb
new file mode 100644
index 0000000..dedc67d
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary_1.7.2.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "589ae692eb8dbe73fa12b1587c8f877d"
+SRC_URI[sha256sum] = "582dd348e7dfcf76d7ec7fcfc3d4f6f8a73b653ffecf6979121a3bce190f98cf"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.1.bb b/meta-efl/recipes-efl/efl/embryo_1.7.1.bb
deleted file mode 100644
index 3f7abcd..0000000
--- a/meta-efl/recipes-efl/efl/embryo_1.7.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "493208b3d3e1f3626b65a3257c1ff0ed"
-SRC_URI[sha256sum] = "e0e96388c6a0a2a36ae1a38b6e36f5c27f7ad310fb213bd9c795b98678f99a69"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.2.bb b/meta-efl/recipes-efl/efl/embryo_1.7.2.bb
new file mode 100644
index 0000000..dcf2155
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/embryo_1.7.2.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "4dd84e5c7f515b707e4d0fac92b60cc8"
+SRC_URI[sha256sum] = "48e068da62f3bcad7fcf0dad6715f5a0c1cc75ae05529cc39679aeb7560d6803"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.1.bb b/meta-efl/recipes-efl/efl/emotion_1.7.1.bb
deleted file mode 100644
index b10c0ff..0000000
--- a/meta-efl/recipes-efl/efl/emotion_1.7.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "4e44e192701fa01a944a612a71d0e4ac"
-SRC_URI[sha256sum] = "b55ab73a943b91adad455899390979a2bcabc15e4bcc6e523f1d79398eb01957"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.2.bb b/meta-efl/recipes-efl/efl/emotion_1.7.2.bb
new file mode 100644
index 0000000..fa681cb
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion_1.7.2.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "e00a876a607cf6a99c5fc768d2fb69de"
+SRC_URI[sha256sum] = "a280b499a51b531a19c368c1f394b27dda4f6c1f5a0edd8f29036169a9402cef"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.1.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.1.bb
deleted file mode 100644
index 553be0d..0000000
--- a/meta-efl/recipes-efl/efl/ethumb_1.7.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "db259be6c9468df32887a5480f666498"
-SRC_URI[sha256sum] = "3f817154f2fdf6768abb94fd739e8f677d3a2070ac642812df955f0a9c46f5c7"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.2.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.2.bb
new file mode 100644
index 0000000..d5e1cea
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ethumb_1.7.2.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "33f8de3b590269b7dbe6960a0337b30f"
+SRC_URI[sha256sum] = "6dcdf94224903c17ac753a388e6a2d0c23ce525859db93f022c3cd2b8f9afe72"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.1.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.1.bb
deleted file mode 100644
index a16581b..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "6867ad898fb9dd1caf4449add0014c74"
-SRC_URI[sha256sum] = "352d0ae98f4b39c57afe6defb8ba1419f43b6ea7c79c9810cccad020f904117c"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.2.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.2.bb
new file mode 100644
index 0000000..e37de87
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.2.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "991f0ce50e203419f54cb148fb949bb9"
+SRC_URI[sha256sum] = "0ca06936cfe308593c36eb80ac80ad229f2bc3bdc9270b75f96e09595194caae"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.1.bb b/meta-efl/recipes-efl/efl/evas_1.7.1.bb
deleted file mode 100644
index aed0676..0000000
--- a/meta-efl/recipes-efl/efl/evas_1.7.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "bee3c29a5872a2489142806690e1c44d"
-SRC_URI[sha256sum] = "bb8298d9f010172c7b4e60f9e07e3f8fce73d9cce49fd5b05232e40523c9606f"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.2.bb b/meta-efl/recipes-efl/efl/evas_1.7.2.bb
new file mode 100644
index 0000000..e9171f9
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas_1.7.2.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "4e412c79609ae107968c9c45c4b900c0"
+SRC_URI[sha256sum] = "2076608e6a9ac3331b17357c152b640ea0f3eccad24a9c270ad325d5434ab811"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.1.bb b/meta-efl/recipes-efl/efl/expedite_1.7.1.bb
deleted file mode 100644
index dc72fe7..0000000
--- a/meta-efl/recipes-efl/efl/expedite_1.7.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "ee55884946e0c8e372938d3731ac0dca"
-SRC_URI[sha256sum] = "1399d72d4bef1e1873b97987c81613271dfd03942b03769bada503166d036b18"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.2.bb b/meta-efl/recipes-efl/efl/expedite_1.7.2.bb
new file mode 100644
index 0000000..e7f5926
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/expedite_1.7.2.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "f7bbf5dc5bc1212d3116c5452b4a3510"
+SRC_URI[sha256sum] = "f8a4214e3d210396b267325268ba6fcc31a42634fab5bf2efcbc595dbfb2c25f"
-- 
1.8.0



