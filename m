Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f50.google.com (unknown [209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7971065D6B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 17:21:20 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb1so7895772pad.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 10:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WRueiT0zaYOnpu/zgyXSKvR5NY9DjeOw4gZNh+L41Us=;
	b=bS4g3EKch6391JGSSHtJAlODSHNElIr2poaEOi9rj23DTWWR2KMiOCfU8l0PAoKrdG
	Ckon5Y7/WzLWdvqGr+phXVujr96A5VbcBCFSstZ1IlZLzVGJIrLgIL8FO8FUYGiXCY/E
	pxLK67+mcc/3HVr9LcV0k6wSboJiEut2BQ+iikbmFlcDVRzHiaIEVhs0GBib7t8pX+Ig
	2AkgX8SAiHlqTkzHXDv+kd2yQ+67WbgJ0iy5yCHSOkmgalYaa163bT/VG+Wt2hOjtf5b
	GW/+ASehY4SYHmJdoTnWIVUQqnQn+U8zdw/81HjLXgc4gxgzRRPjGAjH7bo0Nua69RCT
	ju7Q==
X-Received: by 10.68.166.131 with SMTP id zg3mr6311690pbb.165.1401124882105;
	Mon, 26 May 2014 10:21:22 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	ov4sm19200299pbc.46.2014.05.26.10.21.21 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 May 2014 10:21:21 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 10:21:12 -0700
Message-Id: <1401124872-11554-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-xfce][PATCH] xfce4-settings: Install cursors from srcdir
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
X-List-Received-Date: Mon, 26 May 2014 17:21:23 -0000

Cursors patched into the install by 0001-add-cursor-theme-xfce-invisible.patch
are located in the source directory.  To install during an out-of-tree build,
we need to copy them from the source directory, not the current build
directory. See [1] for discussion.

Upstream-Status: Submitted

[1] https://bugzilla.xfce.org/show_bug.cgi?id=9474

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 .../touchscreen/0001-add-cursor-theme-xfce-invisible.patch        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0001-add-cursor-theme-xfce-invisible.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0001-add-cursor-theme-xfce-invisible.patch
index 4d8e01d..5de14fc 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0001-add-cursor-theme-xfce-invisible.patch
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0001-add-cursor-theme-xfce-invisible.patch
@@ -223,15 +223,15 @@ index 0000000..c9e5a9f
 +
 +install-data-local:
 +	$(mkinstalldirs) $(DESTDIR)@cursordir@;
-+	$(INSTALL_DATA) index.theme $(DESTDIR)/@cursordir@/..
-+	$(INSTALL_DATA) invisible wait $(DESTDIR)@cursordir@/
++	$(INSTALL_DATA) $(srcdir)/index.theme $(DESTDIR)/@cursordir@/..
++	$(INSTALL_DATA) $(srcdir)/invisible $(srcdir)/wait $(DESTDIR)@cursordir@/
 +	for CURSOR in $(CURSOR_NAMES_INVISIBLE); do \
 +		echo '-- Installing invisible cursor '$$CURSOR; \
-+		ln -s invisible $(DESTDIR)@cursordir@/$$CURSOR; \
++		ln -s $(srcdir)/invisible $(DESTDIR)@cursordir@/$$CURSOR; \
 +	done
 +	for CURSOR in $(CURSOR_NAMES); do \
 +		echo '-- Installing visible cursor '$$CURSOR; \
-+		ln -s wait $(DESTDIR)@cursordir@/$$CURSOR; \
++		ln -s $(srcdir)/wait $(DESTDIR)@cursordir@/$$CURSOR; \
 +	done
 +
 diff --git a/cursors/index.theme b/cursors/index.theme
-- 
1.8.3.2


