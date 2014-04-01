Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pd0-f195.google.com (mail-pd0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C64D761116
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 21:49:41 +0000 (UTC)
Received: by mail-pd0-f195.google.com with SMTP id fp1so4186031pdb.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 14:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VQxB4KFdYa4WcoUqvL3xKkzfzWnh9ic1jd9DpKJgAD4=;
	b=ytaaoacSBC+/ry7WSbJnjVIyaymNR/+2V+SVqA/+3Yrnf9wB17W94z+6SXPI9rNUbr
	RuvqkJY5gffOG+ZeiabBGe1/dIWgUBl3Zh3eFjZgj6Y6OmGE/YhdGaXx9hIhTGM3Qd2+
	OVUdruMJH7yKSloLEOSEqfBRNhMehrBN8/rrkvES0rIgba9W8B+31IP/wHl/UadMKmbf
	divCTUa2nl/gcUpeP9Y1JM9bDZSZQRDKMytQRgvYUTagGDFXsGoKADgf5ZRhR0PEgi+2
	QzesQvTITSAl7aBLvg2tJ1E2n9NeWkVHHO5feZtxoTc7UiMlx3LMUgn8dTb3V+g2plAP
	/TvQ==
X-Received: by 10.66.232.68 with SMTP id tm4mr15914013pac.114.1396388982168;
	Tue, 01 Apr 2014 14:49:42 -0700 (PDT)
Received: from archimedes.arnolds.bogus
	(dsl-66-59-252-223.static.linkline.com. [66.59.252.223])
	by mx.google.com with ESMTPSA id q7sm52156431pbc.20.2014.04.01.14.49.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Apr 2014 14:49:41 -0700 (PDT)
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 14:49:13 -0700
Message-Id: <1396388953-25506-1-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [oe-core][PATCH] added upstream license files for gd and gnuplot
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
X-List-Received-Date: Tue, 01 Apr 2014 21:49:41 -0000

Fixes QA warnings about missing license files and supports gnuplot recipe 
change in license classification.

Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>

---
 meta/files/common-licenses/GD      | 53 ++++++++++++++++++++++++++++++++++++++
 meta/files/common-licenses/gnuplot | 29 +++++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 meta/files/common-licenses/GD
 create mode 100644 meta/files/common-licenses/gnuplot

diff --git a/meta/files/common-licenses/GD b/meta/files/common-licenses/GD
new file mode 100644
index 0000000..5e17d03
--- /dev/null
+++ b/meta/files/common-licenses/GD
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
diff --git a/meta/files/common-licenses/gnuplot b/meta/files/common-licenses/gnuplot
new file mode 100644
index 0000000..ff6fe23
--- /dev/null
+++ b/meta/files/common-licenses/gnuplot
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


