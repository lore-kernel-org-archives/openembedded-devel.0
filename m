Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 870E160C02
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Apr 2014 03:48:03 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so10760478pbb.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 20:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KC639TLTWuVOUnes20c0joIijSp/Jwc7D55IHioKF9Y=;
	b=njqnh7DgPtNLfKJnogLLNf2c65mvdry4tEvbHJvekSWnbXp0ZtDAlwDkhysTdhYrpn
	UdTIEA4k8efuxZHTOVNNyWzY/a1drfPPZjDa+t+olFQhc0Nd2sZqd+O9aOU7VypBKLmR
	LNlBFsib8BuxvNSAhbomkbw5Tj5U3nmtZgSyyK+U0zdcxBK2km450hmXJlLFEG8fb+Ka
	CTTGcuPMAwQOUqPOt2kq6BMdBg0AAunGmFNiYcBPaHWGXtnmS1HXWqvugKmQ5Bb2MpK0
	qvQ7qMuQYCKGoZf2XoBmNk4GR9VkCDAo1DbBJ0I9Cy4m+OJJq7PurDyLz96RtTbwetC3
	FFqA==
X-Received: by 10.68.171.193 with SMTP id aw1mr18216608pbc.117.1396410484930; 
	Tue, 01 Apr 2014 20:48:04 -0700 (PDT)
Received: from archimedes.arnolds.bogus
	(dsl-66-59-252-223.static.linkline.com. [66.59.252.223])
	by mx.google.com with ESMTPSA id yz5sm3125120pac.9.2014.04.01.20.48.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Apr 2014 20:48:04 -0700 (PDT)
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 20:47:45 -0700
Message-Id: <1396410465-13709-2-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396410465-13709-1-git-send-email-stephen.arnold42@gmail.com>
References: <1396410465-13709-1-git-send-email-stephen.arnold42@gmail.com>
Subject: [meta-oe][PATCH v2 2/2] gnuplot: added upstream license file and updated recipe to match
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
X-List-Received-Date: Wed, 02 Apr 2014 03:48:06 -0000

This fixes QA warnings about missing license file and updates the license 
type to match custom license file.

Upstream-Status: Inappropriate (distribution/packaging fix)

Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
---
 meta-oe/licenses/gnuplot                     | 29 ++++++++++++++++++++++++++++
 meta-oe/recipes-extended/gnuplot/gnuplot.inc |  2 +-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/licenses/gnuplot

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
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot.inc b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
index ab3ec3f..6c27e6d 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot.inc
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Gnuplot is a portable command-line driven interactive datafile \
 (text or binary) and function plotting utility."
 HOMEPAGE = "http://www.gnuplot.info/"
 SECTION = "console/scientific"
-LICENSE = "BSD-4"
+LICENSE = "gnuplot"
 LIC_FILES_CHKSUM = "file://Copyright;md5=243a186fc2fd3b992125d60d5b1bab8f"
 DEPENDS = "virtual/libx11 gd readline"
 
-- 
1.9.1


