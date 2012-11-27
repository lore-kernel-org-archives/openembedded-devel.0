Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS4z-0005dI-VA
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:48:30 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so4908028eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=b11DQqnnm4Bk5lzGFlhEUL2w/05y107ehZPnRw7b0VE=;
	b=MuqU/HZNRf3j1wvFMJzp2yL8zDm8hUo8zS3ezVlhPaMXm8WL3fY8EsmpyND/A7Tk3Q
	oNNHdHx13SCLn7uNoUmQkiLwzreoevvlwgjOJLmeJnHjZ/Pmw0yx+hB3+KP/oeUKmA/1
	TpSooaq5DCDBHZOxrDz5ZxuqLN8E2NsENsvI0OxFn+CIez7iCUPAmdg2+x95fPafN9sO
	YCJ1MczXFdD6laB7M8ztw/Ez8uEjj5rxnyq99OxHS6rSfwaHJ4l+Uoi1nG1EiRI6fLgn
	5MzGX+xI3hP5kCz2z3pBIAYHYlATbb1jYbK7VdxHr5SuXdZmhOzOphXLmJtMY5FbIi+p
	jQZw==
Received: by 10.14.203.132 with SMTP id f4mr62089789eeo.11.1354048456750;
	Tue, 27 Nov 2012 12:34:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f49sm12085818eep.12.2012.11.27.12.34.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:34:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:38 +0100
Message-Id: <5003ec37e68cdfd7654ce4f9f358fef29727ee18.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 01/21] efl: upgrade to bugfix release 1.7.1
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
X-List-Received-Date: Tue, 27 Nov 2012 20:48:30 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/{ecore_1.7.0.bb => ecore_1.7.1.bb} |  4 ++--
 meta-efl/recipes-efl/efl/{eeze_1.7.0.bb => edbus_1.7.1.bb}  |  4 ++--
 meta-efl/recipes-efl/efl/{edbus_1.7.0.bb => edje_1.7.1.bb}  |  4 ++--
 meta-efl/recipes-efl/efl/{edje_1.7.0.bb => eet_1.7.1.bb}    |  4 ++--
 meta-efl/recipes-efl/efl/{eet_1.7.0.bb => eeze_1.7.1.bb}    |  4 ++--
 meta-efl/recipes-efl/efl/efreet_1.7.0.bb                    | 10 ----------
 meta-efl/recipes-efl/efl/efreet_1.7.1.bb                    | 10 ++++++++++
 meta-efl/recipes-efl/efl/eina_1.7.0.bb                      | 10 ----------
 meta-efl/recipes-efl/efl/eina_1.7.1.bb                      | 10 ++++++++++
 meta-efl/recipes-efl/efl/eio_1.7.0.bb                       | 10 ----------
 meta-efl/recipes-efl/efl/eio_1.7.1.bb                       | 10 ++++++++++
 meta-efl/recipes-efl/efl/elementary_1.7.0.bb                | 10 ----------
 meta-efl/recipes-efl/efl/elementary_1.7.1.bb                | 10 ++++++++++
 meta-efl/recipes-efl/efl/embryo_1.7.0.bb                    | 10 ----------
 meta-efl/recipes-efl/efl/embryo_1.7.1.bb                    | 10 ++++++++++
 meta-efl/recipes-efl/efl/emotion_1.7.0.bb                   | 10 ----------
 meta-efl/recipes-efl/efl/emotion_1.7.1.bb                   | 10 ++++++++++
 meta-efl/recipes-efl/efl/ethumb_1.7.0.bb                    | 10 ----------
 meta-efl/recipes-efl/efl/ethumb_1.7.1.bb                    | 10 ++++++++++
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.0.bb      | 10 ----------
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.1.bb      | 10 ++++++++++
 meta-efl/recipes-efl/efl/evas_1.7.0.bb                      | 10 ----------
 meta-efl/recipes-efl/efl/evas_1.7.1.bb                      | 10 ++++++++++
 meta-efl/recipes-efl/efl/expedite_1.7.0.bb                  | 10 ----------
 meta-efl/recipes-efl/efl/expedite_1.7.1.bb                  | 10 ++++++++++
 25 files changed, 110 insertions(+), 110 deletions(-)
 rename meta-efl/recipes-efl/efl/{ecore_1.7.0.bb => ecore_1.7.1.bb} (50%)
 rename meta-efl/recipes-efl/efl/{eeze_1.7.0.bb => edbus_1.7.1.bb} (41%)
 rename meta-efl/recipes-efl/efl/{edbus_1.7.0.bb => edje_1.7.1.bb} (41%)
 rename meta-efl/recipes-efl/efl/{edje_1.7.0.bb => eet_1.7.1.bb} (41%)
 rename meta-efl/recipes-efl/efl/{eet_1.7.0.bb => eeze_1.7.1.bb} (41%)
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.7.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.7.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.7.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.1.bb

diff --git a/meta-efl/recipes-efl/efl/ecore_1.7.0.bb b/meta-efl/recipes-efl/efl/ecore_1.7.1.bb
similarity index 50%
rename from meta-efl/recipes-efl/efl/ecore_1.7.0.bb
rename to meta-efl/recipes-efl/efl/ecore_1.7.1.bb
index 173c3c3..5848091 100644
--- a/meta-efl/recipes-efl/efl/ecore_1.7.0.bb
+++ b/meta-efl/recipes-efl/efl/ecore_1.7.1.bb
@@ -7,5 +7,5 @@ SRC_URI = "\
   file://fix-ecore-fb-initialization.patch \
 "
 
-SRC_URI[md5sum] = "cf0b5e980a77dc0d1bdedf2bcc60e862"
-SRC_URI[sha256sum] = "f009e17376b7f3fb6ce6b45648d2a0131a152943b502fa34cc4bd018f67da8bb"
+SRC_URI[md5sum] = "9d668311a42eb05aef57c2e8ce233722"
+SRC_URI[sha256sum] = "f69e132bb945c2b968aa17e7ac97f2b21e01b94eb25af2b96d89999c8d63ea60"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.7.0.bb b/meta-efl/recipes-efl/efl/edbus_1.7.1.bb
similarity index 41%
rename from meta-efl/recipes-efl/efl/eeze_1.7.0.bb
rename to meta-efl/recipes-efl/efl/edbus_1.7.1.bb
index e7b7727..2438fba 100644
--- a/meta-efl/recipes-efl/efl/eeze_1.7.0.bb
+++ b/meta-efl/recipes-efl/efl/edbus_1.7.1.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "60a8bb62e3d2cc7dfac14f1cd62343e2"
-SRC_URI[sha256sum] = "7db8709445114d1fe1c3609cf79a06e13a3d584a5a3dfd557642ddc65ac3a202"
+SRC_URI[md5sum] = "6997f0fad5b041b9c1df25a2cd98bc24"
+SRC_URI[sha256sum] = "c543031073f267f637cad2eaa51cd1ccdeab98f45f2a1eb438c4c49aebfd53b7"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.0.bb b/meta-efl/recipes-efl/efl/edje_1.7.1.bb
similarity index 41%
rename from meta-efl/recipes-efl/efl/edbus_1.7.0.bb
rename to meta-efl/recipes-efl/efl/edje_1.7.1.bb
index bc24e2f..b676c1a 100644
--- a/meta-efl/recipes-efl/efl/edbus_1.7.0.bb
+++ b/meta-efl/recipes-efl/efl/edje_1.7.1.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "3d59bfb00763a61976a976be925e1cbf"
-SRC_URI[sha256sum] = "6ee303bd0e2f91a6be08433df474377494ba6815441e5e6b79a5d284ead2a768"
+SRC_URI[md5sum] = "f0be474e4b4d51704dc64ec27941c2ad"
+SRC_URI[sha256sum] = "d794b8b2144786cc42c34302660d130211aa0dc223fa399fdabadaee3397d575"
diff --git a/meta-efl/recipes-efl/efl/edje_1.7.0.bb b/meta-efl/recipes-efl/efl/eet_1.7.1.bb
similarity index 41%
rename from meta-efl/recipes-efl/efl/edje_1.7.0.bb
rename to meta-efl/recipes-efl/efl/eet_1.7.1.bb
index 8eb59e4..464b448 100644
--- a/meta-efl/recipes-efl/efl/edje_1.7.0.bb
+++ b/meta-efl/recipes-efl/efl/eet_1.7.1.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "37e15c5d6e7c2676728bda75109b2218"
-SRC_URI[sha256sum] = "d6df9a7bf11c4605f55a2e7c209210044f8dc4f3332135f6256676d2f937621b"
+SRC_URI[md5sum] = "52abbd8ab0d55480166bf5ec49c78627"
+SRC_URI[sha256sum] = "33901b9aa6b83f3c0a1ff044c7ffbb0773e46c12cc3e71ed63619fc1fcd9c29e"
diff --git a/meta-efl/recipes-efl/efl/eet_1.7.0.bb b/meta-efl/recipes-efl/efl/eeze_1.7.1.bb
similarity index 41%
rename from meta-efl/recipes-efl/efl/eet_1.7.0.bb
rename to meta-efl/recipes-efl/efl/eeze_1.7.1.bb
index f617090..fe9d0a2 100644
--- a/meta-efl/recipes-efl/efl/eet_1.7.0.bb
+++ b/meta-efl/recipes-efl/efl/eeze_1.7.1.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "46e989eb4dddd942b4564299e19d9f64"
-SRC_URI[sha256sum] = "9bca5becaaa5abf4b7ac0f80de68d3b9a8f1abce7eca4175e1ad82953783d209"
+SRC_URI[md5sum] = "3da7e14b6736528285551a7fc3e18b67"
+SRC_URI[sha256sum] = "42092b5be0857bba4c1de35fcf9d4ec159c14ef8f57582964e060520ea728b70"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.0.bb b/meta-efl/recipes-efl/efl/efreet_1.7.0.bb
deleted file mode 100644
index baf8245..0000000
--- a/meta-efl/recipes-efl/efl/efreet_1.7.0.bb
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
-SRC_URI[md5sum] = "f039197e14288ecef94eeab040cbbdb4"
-SRC_URI[sha256sum] = "16a41a03d55febf30f2dd786b51be3e370fc563f3335dd26832e0eaa88516c79"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.1.bb b/meta-efl/recipes-efl/efl/efreet_1.7.1.bb
new file mode 100644
index 0000000..46e6d7d
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efreet_1.7.1.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "29e40bb99bb05e4ebe91f3dc2796e12f"
+SRC_URI[sha256sum] = "bc01384a69b138e6aae669b17bfaf3f34ac6189dc5b2e909917098b582d41749"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.0.bb b/meta-efl/recipes-efl/efl/eina_1.7.0.bb
deleted file mode 100644
index 5313b34..0000000
--- a/meta-efl/recipes-efl/efl/eina_1.7.0.bb
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
-SRC_URI[md5sum] = "303b81bbfff684eef0e5be70ba977012"
-SRC_URI[sha256sum] = "6aacededb08aa1090a1beecbf62acf3e2ce0676ac87d21c787c07983f801166f"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.1.bb b/meta-efl/recipes-efl/efl/eina_1.7.1.bb
new file mode 100644
index 0000000..0c71ae7
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eina_1.7.1.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "644b7e8a3c3a48238f2c4003c90925de"
+SRC_URI[sha256sum] = "2dbaa926f758d7d2e8ff9d9efffbf0aceb5225b17fd2b464ce0fe279830098f8"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.0.bb b/meta-efl/recipes-efl/efl/eio_1.7.0.bb
deleted file mode 100644
index 59fe18a..0000000
--- a/meta-efl/recipes-efl/efl/eio_1.7.0.bb
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
-SRC_URI[md5sum] = "02e734ade8de360ef85835c5f5a1f2fa"
-SRC_URI[sha256sum] = "c55ae0a8c303873b85b3b538662e85748154ea0434867291d481ac983c8d962c"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.1.bb b/meta-efl/recipes-efl/efl/eio_1.7.1.bb
new file mode 100644
index 0000000..12c854b
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eio_1.7.1.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "64c441dffeb9eb6ee7ad68ee9501506c"
+SRC_URI[sha256sum] = "4e9511b736b80b0495ae0a54c9638615ee5336f57a9874f4fb16f11c0b8f563f"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.0.bb b/meta-efl/recipes-efl/efl/elementary_1.7.0.bb
deleted file mode 100644
index 006590f..0000000
--- a/meta-efl/recipes-efl/efl/elementary_1.7.0.bb
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
-SRC_URI[md5sum] = "45263c5d107981a44d28734c82e9fae1"
-SRC_URI[sha256sum] = "7e7deeb4e3a9bbb9c7b7a89c2efbe269a1a6a44ef380bf91c1066d128163e2d3"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.1.bb b/meta-efl/recipes-efl/efl/elementary_1.7.1.bb
new file mode 100644
index 0000000..068b433
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary_1.7.1.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "938cf8de6012d2de8db7971f6874feac"
+SRC_URI[sha256sum] = "619074b1561212e8fdb0c0f05a2204ba3f9a3fdebd51ad53adabf5a7d62d3712"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.0.bb b/meta-efl/recipes-efl/efl/embryo_1.7.0.bb
deleted file mode 100644
index 5e95cb1..0000000
--- a/meta-efl/recipes-efl/efl/embryo_1.7.0.bb
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
-SRC_URI[md5sum] = "f46bb8ab1699cd7acb8463e50a3ffb4b"
-SRC_URI[sha256sum] = "290b452e6cb87f64b11b529c7f67c40192f87a73cc4c5be93a95f17b76f65063"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.1.bb b/meta-efl/recipes-efl/efl/embryo_1.7.1.bb
new file mode 100644
index 0000000..3f7abcd
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/embryo_1.7.1.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "493208b3d3e1f3626b65a3257c1ff0ed"
+SRC_URI[sha256sum] = "e0e96388c6a0a2a36ae1a38b6e36f5c27f7ad310fb213bd9c795b98678f99a69"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.0.bb b/meta-efl/recipes-efl/efl/emotion_1.7.0.bb
deleted file mode 100644
index dc0908b..0000000
--- a/meta-efl/recipes-efl/efl/emotion_1.7.0.bb
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
-SRC_URI[md5sum] = "757f46039cd301d10ba2b9a637e9b2e1"
-SRC_URI[sha256sum] = "6e35baa399135dacd41d5cad21cb23338e6331e926107c3e7bdc33b0da18c22b"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.1.bb b/meta-efl/recipes-efl/efl/emotion_1.7.1.bb
new file mode 100644
index 0000000..b10c0ff
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion_1.7.1.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "4e44e192701fa01a944a612a71d0e4ac"
+SRC_URI[sha256sum] = "b55ab73a943b91adad455899390979a2bcabc15e4bcc6e523f1d79398eb01957"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.0.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.0.bb
deleted file mode 100644
index 34a3485..0000000
--- a/meta-efl/recipes-efl/efl/ethumb_1.7.0.bb
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
-SRC_URI[md5sum] = "992a6ecd1345a218e23943ed9af8e030"
-SRC_URI[sha256sum] = "c9b4348a58d28030bba825498246f533211329ad32a3411c02757a78264306ab"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.1.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.1.bb
new file mode 100644
index 0000000..553be0d
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ethumb_1.7.1.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "db259be6c9468df32887a5480f666498"
+SRC_URI[sha256sum] = "3f817154f2fdf6768abb94fd739e8f677d3a2070ac642812df955f0a9c46f5c7"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.0.bb
deleted file mode 100644
index 8305c2e..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.0.bb
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
-SRC_URI[md5sum] = "ca0278ccbf753de78d5847f8665ffcc1"
-SRC_URI[sha256sum] = "0356212b4f64ddc2397d6fb67195bd937248cd82f7f80b248e58d1e709289c8d"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.1.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.1.bb
new file mode 100644
index 0000000..a16581b
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.1.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "6867ad898fb9dd1caf4449add0014c74"
+SRC_URI[sha256sum] = "352d0ae98f4b39c57afe6defb8ba1419f43b6ea7c79c9810cccad020f904117c"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.0.bb b/meta-efl/recipes-efl/efl/evas_1.7.0.bb
deleted file mode 100644
index 9f81d89..0000000
--- a/meta-efl/recipes-efl/efl/evas_1.7.0.bb
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
-SRC_URI[md5sum] = "3359918f8e60c778b861cf1cde02d3a9"
-SRC_URI[sha256sum] = "2d7a33d02d2da37647e4c0127fedebe00eeea14560d6c1b6ca9b0cccdae0de84"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.1.bb b/meta-efl/recipes-efl/efl/evas_1.7.1.bb
new file mode 100644
index 0000000..aed0676
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas_1.7.1.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "bee3c29a5872a2489142806690e1c44d"
+SRC_URI[sha256sum] = "bb8298d9f010172c7b4e60f9e07e3f8fce73d9cce49fd5b05232e40523c9606f"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.0.bb b/meta-efl/recipes-efl/efl/expedite_1.7.0.bb
deleted file mode 100644
index 0ef71ff..0000000
--- a/meta-efl/recipes-efl/efl/expedite_1.7.0.bb
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
-SRC_URI[md5sum] = "4ccd99ad21e25bd651c8ca7a2d20f7f3"
-SRC_URI[sha256sum] = "b4f7d101e957d69b14d1c9207df8d2c9aafcc4a8a0ddea7883c393ef4389249f"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.1.bb b/meta-efl/recipes-efl/efl/expedite_1.7.1.bb
new file mode 100644
index 0000000..dc72fe7
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/expedite_1.7.1.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "ee55884946e0c8e372938d3731ac0dca"
+SRC_URI[sha256sum] = "1399d72d4bef1e1873b97987c81613271dfd03942b03769bada503166d036b18"
-- 
1.8.0



