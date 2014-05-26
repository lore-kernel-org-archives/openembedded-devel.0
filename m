Return-Path: <ashcharles@gmail.com>
X-Greylist: delayed 397 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 26 May 2014 17:03:49 UTC
Received: from mail-pa0-f49.google.com (unknown [209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3AB61F16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 17:03:49 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id lj1so7815629pab.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 10:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Vt+1ZUPVHKJQym/G2jLI6cofLHPGl/bNX+Q48VrUAqk=;
	b=N0w7BfBFbn4n9cIvm9hxI921/EfxKLhCFWBKS+RGCiT/AnB4hY3bHw9vCqi/Jegygx
	AlrDr3vN0wmLta2A/aTKRe2IXc2YdfyyEb7mF8zWXOregbbnGf4vqk6hhCL5SQqj4/V5
	wS7SXpxuhQNO0ESQ0JRBmbQZ8d+FRS3ozTmB9NyyW66rr6Xq3A2eaSgUs/Wlb1QymRv/
	GZvjW7YkIcVaQYetAV29ZTqg4vJ4ZUnPNIAd716c4TKnPbug8ZeRPow6CDV3C1In6q0C
	ralnFYyOD0xhkCvRYJj1vA1VbzpqahqcVh/iXBTVqf53H1R6QNuT2n8XtbCplPNHh7/J
	Bavg==
X-Received: by 10.66.164.135 with SMTP id yq7mr29675323pab.126.1401123434264; 
	Mon, 26 May 2014 09:57:14 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	eh4sm19099403pbc.79.2014.05.26.09.57.13 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 May 2014 09:57:13 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 09:57:04 -0700
Message-Id: <1401123424-16520-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-xfce][PATCH] xfce-git: Run autogen.sh in source directory
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
X-List-Received-Date: Mon, 26 May 2014 17:03:50 -0000

The autogen.sh script executed by the xfce-git.bbclass needs to be
run in and from the source directory.  The configuration step can
still be run from out-of-tree.

Currently, this affects these recipes:
 * libxfce4ui
 * xarchiver
 * xfce4-taskmanager
 * xfce4-closebutton-plugin
 * xfce4-settings
 * xfwm4

Upstream-Status: Inappropriate (configuration)

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta-xfce/classes/xfce-git.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/classes/xfce-git.bbclass b/meta-xfce/classes/xfce-git.bbclass
index c4be554..3fc18d2 100644
--- a/meta-xfce/classes/xfce-git.bbclass
+++ b/meta-xfce/classes/xfce-git.bbclass
@@ -1,5 +1,7 @@
 do_configure_prepend() {
+       cd ${S}
        NOCONFIGURE=yes ./autogen.sh
+       cd ${B}
 }
 
 AUTOTOOLS_COPYACLOCAL = "1"
-- 
1.8.3.2


