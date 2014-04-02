Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id ED1166B25F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Apr 2014 03:47:56 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id uo5so10873541pbc.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 20:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AubYci6kwZjCJ2vuuWEzsWmDZ/7BX48sog2fxN+3Sak=;
	b=RDwksZbp0K26cOC5BJ9iXNNQuFU7jnIfjGthP7129/LcISGJG4hWLy2fGXjG3Sqf0A
	V1l66AqJ5d9eSNWAw2+9ochdwl93Kh618YieUclG57ouU+h4rI74g4ts0LaXKZI9tlED
	0D2SC5bA4D2+/YdC7JwmO5UoEWcEM5d70xo09Wrp6Q95BNCycnhH0A7SfGrICV/H75Ko
	bMze4WMMfe1ZogiA7q07yPB0cjeUionpPwc8+LBOpEuQ+iGZ8qaD5nGBRHfzoRYx5B0P
	V/ZETBePJTG9nLU6WjBpBz9LnlBsjw52fqfFNTt3aWIec5LLbHBvREWODQW29od2v/5Z
	MooA==
X-Received: by 10.66.66.135 with SMTP id f7mr35480121pat.22.1396410476127;
	Tue, 01 Apr 2014 20:47:56 -0700 (PDT)
Received: from archimedes.arnolds.bogus
	(dsl-66-59-252-223.static.linkline.com. [66.59.252.223])
	by mx.google.com with ESMTPSA id yz5sm3125120pac.9.2014.04.01.20.47.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Apr 2014 20:47:55 -0700 (PDT)
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 20:47:44 -0700
Message-Id: <1396410465-13709-1-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v2 1/2] gd: added upstream license file and fixed configure warnings
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
X-List-Received-Date: Wed, 02 Apr 2014 03:47:59 -0000

This fixes QA warnings about missing license file and stale configure options,
(includes updates for freetype libpath and disables hardcoded rpaths).

Upstream-Status: Inappropriate (distribution/packaging fix)

Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
---
 meta-oe/licenses/GD                               | 53 +++++++++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb |  4 +-
 2 files changed, 55 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/licenses/GD

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
diff --git a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb b/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
index 957c4eb..5fb5857 100644
--- a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
+++ b/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
@@ -15,10 +15,10 @@ S = "${WORKDIR}/gd-2.0.36RC1"
 
 inherit autotools binconfig gettext
 
-EXTRA_OECONF += " --with-zlib=${STAGING_LIBDIR}/.. \
+EXTRA_OECONF += " --disable-rpath \
                   --with-png=${STAGING_LIBDIR}/.. \
                   --with-jpeg=${STAGING_LIBDIR}/.. \
-                  --with-freetype \
+                  --with-freetype=${STAGING_LIBDIR}/.. \
                   --without-fontconfig \
                   --without-xpm \
                   --without-x"
-- 
1.9.1


