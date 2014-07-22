Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE786084E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 11:34:42 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so7804246wgh.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 04:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9vGgfU5b1wp/yuVH04kNpW2+dGNzZ7CtlioOr3tZW20=;
	b=jsrVN56PKA+vyrDKbEWl0vV7AY9bgRbB7V0h6FJcuBSKrw0JWCMg3LIyN8fomuHXPL
	utoxiciE2mUsmkT5viTVTJX0OBmeWHaeMd69LevAbj2u6wL8IZDiE4tBDhbzIhVF74SU
	p7PBQEgqFqsL1tJixt8AuvHN/JzHnays5aC4+6qPwLZa3cQL7vQXvKAfCimGbg3cDPRH
	xJ6hpoJOz5+bxdYh5WAPrz79HRZ42dMxujU4XafZ7GZVLTC+DMKQBAfr1yQ1X2yuwfQC
	U65mhJuLVBEa/gGP2j5utAeQl1/XhJKDg/oIqQlQWwxvB/oC5aIDW+vaXXsVDXfW8Odh
	Fk1Q==
X-Received: by 10.180.104.42 with SMTP id gb10mr13763027wib.65.1406028882038; 
	Tue, 22 Jul 2014 04:34:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id p3sm356542wjw.13.2014.07.22.04.34.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 04:34:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jul 2014 13:34:54 +0200
Message-Id: <1406028895-834-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [meta-oe][PATCH 1/2] python-efl: add git version
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
X-List-Received-Date: Tue, 22 Jul 2014 11:34:47 -0000

* the tarball is missing .pxd files and re-building with our python-cython fails with:
  | Compiling efl/elementary/scroller.pyx because it depends on /OE
  | Error compiling Cython file:
  | ------------------------------------------------------------
  | ...
  | from libc.stdint cimport uintptr_t
  | import traceback
  | from efl.eo cimport Eo, PY_REFCOUNT
  | from efl.utils.conversions cimport _ctouni
  | from cpython cimport Py_INCREF, Py_DECREF
  | cimport efl.ecore.enums as enums
  |        ^
  | ------------------------------------------------------------
  |
  | efl/ecore/__init__.pyx:221:8: 'efl.ecore.enums.pxd' not found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-efl_git.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-efl/recipes-devtools/python/python-efl_git.bb

diff --git a/meta-efl/recipes-devtools/python/python-efl_git.bb b/meta-efl/recipes-devtools/python/python-efl_git.bb
new file mode 100644
index 0000000..b776f7d
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-efl_git.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRCREV = "c1497e10288589ff9834f3d4da17461b8a3a1c15"
+PV = "1.10.0+git${SRCPV}"
+
+SRC_URI = "git://git.enlightenment.org/bindings/python/${BPN}.git;branch=python-efl-1.10"
+
+S = "${WORKDIR}/git"
-- 
2.0.2


