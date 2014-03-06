Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id D69C96F59F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 16:48:19 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so1228001eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Mar 2014 08:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=OPRy6R7Sj5U59rcGlvuTC2lec715N8H0nHR/iHis5Pk=;
	b=Io1vYhMrBnwbIwNL3sj4YPAYCeWzbnWpu/dmoko4qCA0mA5WOo3wHvBWkrJuIJh0ji
	Rq9jI3smzohkZmrXnY11Y7CbAk5gh+GqSNTR2Sch14L5pyIFkDciSr8FHv7snAlnUNky
	N9+S2Fp0eWEE3ZCP97szbpfYDKIok1OCv7mKmumVzWswvSIB1UgEZBlOIGG/oTbKslmV
	CvhJEnwtmBg08/YUXuep9PCGEKV3UyxnVpeUh74YiBvj2/+DBEBnV7rj8JeImqlj39Ng
	4UqOqrpnEf8o78VurYy2r7hFSCgJAUvEcg1U91YxLxmCK4DpsU5tSah+g8L6Vtc8Siyz
	IWVA==
X-Received: by 10.14.111.201 with SMTP id w49mr10869143eeg.92.1394124500288;
	Thu, 06 Mar 2014 08:48:20 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o5sm23663099eeg.8.2014.03.06.08.48.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Mar 2014 08:48:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Mar 2014 17:48:15 +0100
Message-Id: <338897265b4862cc520187f96d731f6659c7b2a4.1394124356.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1394124356.git.Martin.Jansa@gmail.com>
References: <cover.1394124356.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1394124356.git.Martin.Jansa@gmail.com>
References: <cover.1394124356.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][WIP][PATCH 5/6] python-efl: upgrade to 1.9.0
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
X-List-Received-Date: Thu, 06 Mar 2014 16:48:20 -0000

* announcement:
  http://sourceforge.net/p/enlightenment/mailman/message/32066075/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-efl.inc      | 2 +-
 meta-efl/recipes-devtools/python/python-efl_1.8.1.bb | 4 ----
 meta-efl/recipes-devtools/python/python-efl_1.9.0.bb | 4 ++++
 3 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-efl_1.8.1.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-efl_1.9.0.bb

diff --git a/meta-efl/recipes-devtools/python/python-efl.inc b/meta-efl/recipes-devtools/python/python-efl.inc
index cca3562..6ac7ad8 100644
--- a/meta-efl/recipes-devtools/python/python-efl.inc
+++ b/meta-efl/recipes-devtools/python/python-efl.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "${PN} bindings"
 
-LICENSE = "LGPLv3.0"
+LICENSE = "LGPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
 # there is also GPLv3.0 in COPYING;md5=d32239bcb673463ab874e80d47fae504 but no file seems to use that
 
diff --git a/meta-efl/recipes-devtools/python/python-efl_1.8.1.bb b/meta-efl/recipes-devtools/python/python-efl_1.8.1.bb
deleted file mode 100644
index 15009f6..0000000
--- a/meta-efl/recipes-devtools/python/python-efl_1.8.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[md5sum] = "ca71f501c7e0479f15d2746380b0f81d"
-SRC_URI[sha256sum] = "90ea20d0a90448fd1dcd56210bf34cb9a78905852d83620617bf164f1cef5edc"
diff --git a/meta-efl/recipes-devtools/python/python-efl_1.9.0.bb b/meta-efl/recipes-devtools/python/python-efl_1.9.0.bb
new file mode 100644
index 0000000..f34e428
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-efl_1.9.0.bb
@@ -0,0 +1,4 @@
+require ${BPN}.inc
+
+SRC_URI[md5sum] = "c643d66157cac9b2892af8b6d1a803b1"
+SRC_URI[sha256sum] = "f6d6fecca20df016acc79a12348ae0a0f6db82e6cceaf53c4b46d7ca72bb8f07"
-- 
1.9.0


