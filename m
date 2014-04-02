Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id E15866EAB6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Apr 2014 00:00:40 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id lj1so4759458pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 17:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JJF/ZyO8lIrSNgfSdjYpQNrSUO4meUfB6gC1fxiA8Z4=;
	b=Vh745u123t4IWVm1+GwaN9XT/OlcAhjROxHaL9S8KKrF2xvCShMnTOexKKqYb2dU6v
	HtVanD/wq3TAJyi96dN+IiBIk7NXNtHrMkvV8oJ86PMYt11B5Js7AhIog7saZwDRiL98
	fkwwcsurx3hQANH3UaQqYNz0lOv4+V9IYxqxKY8oEm/iJETRAvOWZxYu0JzpmyOlNTYj
	NHmPS/T4JZXZ2dpaHOAv+Zx9rG815WdvfSu7hFWb2tw7AG4U8slxt2+PvavDxgov9+0P
	jzlHBUwxGe0UMyr4RBDCSdjw0rWeio3MGxyRwP8FzicjKh1q4fPbah2S1d37GDtk8JcP
	3IrQ==
X-Received: by 10.68.94.100 with SMTP id db4mr34459420pbb.62.1396396841044;
	Tue, 01 Apr 2014 17:00:41 -0700 (PDT)
Received: from archimedes.arnolds.bogus
	(dsl-66-59-252-223.static.linkline.com. [66.59.252.223])
	by mx.google.com with ESMTPSA id ff4sm848200pad.24.2014.04.01.17.00.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Apr 2014 17:00:39 -0700 (PDT)
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 17:00:24 -0700
Message-Id: <1396396824-10074-1-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] added upstream license files for gnuplot and gd
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
X-List-Received-Date: Wed, 02 Apr 2014 00:00:43 -0000

Fixes QA warnings about missing license files, supports gnuplot recipe patch.

Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>

---
 meta-oe/licenses/GD      | 53 ++++++++++++++++++++++++++++++++++++++++++++++++
 meta-oe/licenses/gnuplot | 29 ++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 meta-oe/licenses/GD
 create mode 100644 meta-oe/licenses/gnuplot

diff --git a/meta-oe/licenses/GD b/meta-oe/licenses/GD
new file mode 100644
index 0000000..5e17d03
--- /dev/null
+++ b/meta-oe/licenses/GD
@@ -0,0 +1,53 @@
+ 
+     Portions copyright 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001,
+     2002 by Cold Spring Harbor Laboratory. Funded under Grant
+     P41-RR02188 by the National Institutes of Health. 
+
+     Portions copyright 1996, 1997, 1998, 1999, 2000, 2001, 2002 by
+     Boutell.Com, Inc. 
+
+     Portions relating to GD2 format copyright 1999, 2000, 2001, 2002
+     Philip Warner.
+     
+     Portions relating to PNG copyright 1999, 2000, 2001, 2002 Greg
+     Roelofs. 
+
+     Portions relating to gdttf.c copyright 1999, 2000, 2001, 2002 John  
+     Ellson (ellson@lucent.com).
+   
+     Portions relating to gdft.c copyright 2001, 2002 John Ellson  
+     (ellson@lucent.com).  
+
+     Portions copyright 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007
+		 Pierre-Alain Joye (pierre@libgd.org).  
+
+     Portions relating to JPEG and to color quantization copyright 2000,
+     2001, 2002, Doug Becker and copyright (C) 1994, 1995, 1996, 1997,
+     1998, 1999, 2000, 2001, 2002, Thomas G. Lane. This software is
+     based in part on the work of the Independent JPEG Group. See the
+     file README-JPEG.TXT for more information.
+
+     Portions relating to WBMP copyright 2000, 2001, 2002 Maurice
+     Szmurlo and Johan Van den Brande.
+
+     Permission has been granted to copy, distribute and modify gd in
+     any context without fee, including a commercial application,
+     provided that this notice is present in user-accessible supporting
+     documentation.
+
+     This does not affect your ownership of the derived work itself, and 
+     the intent is to assure proper credit for the authors of gd, not to
+     interfere with your productive use of gd. If you have questions,
+     ask. "Derived works" includes all programs that utilize the   
+     library. Credit must be given in user-accessible documentation.
+
+     This software is provided "AS IS." The copyright holders disclaim  
+     all warranties, either express or implied, including but not
+     limited to implied warranties of merchantability and fitness for a
+     particular purpose, with respect to this code and accompanying  
+     documentation.
+
+     Although their code does not appear in gd, the authors wish to thank
+     David Koblas, David Rowley, and Hutchison Avenue Software Corporation
+     for their prior contributions.
+
diff --git a/meta-oe/licenses/gnuplot b/meta-oe/licenses/gnuplot
new file mode 100644
index 0000000..ff6fe23
--- /dev/null
+++ b/meta-oe/licenses/gnuplot
@@ -0,0 +1,29 @@
+/*[
+ * Copyright 1986 - 1993, 1998, 2004   Thomas Williams, Colin Kelley
+ *
+ * Permission to use, copy, and distribute this software and its
+ * documentation for any purpose with or without fee is hereby granted,
+ * provided that the above copyright notice appear in all copies and
+ * that both that copyright notice and this permission notice appear
+ * in supporting documentation.
+ *
+ * Permission to modify the software is granted, but not the right to
+ * distribute the complete modified source code.  Modifications are to
+ * be distributed as patches to the released version.  Permission to
+ * distribute binaries produced by compiling modified sources is granted,
+ * provided you
+ *   1. distribute the corresponding source modifications from the
+ *    released version in the form of a patch file along with the binaries,
+ *   2. add special version identification to distinguish your version
+ *    in addition to the base release version number,
+ *   3. provide your name and address as the primary contact for the
+ *    support of your modified version, and
+ *   4. retain our contact information in regard to use of the base
+ *    software.
+ * Permission to distribute the released version of the source code along
+ * with corresponding source modifications in the form of a patch file is
+ * granted with same provisions 2 through 4 for binary distributions.
+ *
+ * This software is provided "as is" without express or implied warranty
+ * to the extent permitted by applicable law.
+]*/
-- 
1.9.1


