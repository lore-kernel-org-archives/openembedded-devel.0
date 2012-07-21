Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SsfjO-000738-QE
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2012 21:52:51 +0200
Received: by pbbrq2 with SMTP id rq2so7421302pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jul 2012 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=CrXkxOgQYLz8B3DE352FHEZ1Na/a0Wy9pL1ZfoOzIA4=;
	b=B2iE22/4fhaf01luETkycYI5dzl3R1M07xqriw1zEL/ZiqxCzfAF/axeVOB9qI7SZ/
	RtMRCyyhqrDTXvcVnuFMS3i8qn7O1bSwAZrPFwJjvwp3/5os+dObRZ9ju0Hi/PQQBD0K
	fjiu+T+dNSRUZ/tzeuFJb6oTjqIFgtpB//FugKd9Cx3qoahZE3aX22p/i268yCGxylbG
	9ChI03sXwzdcUvTANWHE2hjz4b7Yi4Y9NDMJS4795wFRn4QS5Uayq0yNg7q0QcLVBojf
	NKe/cXQPcVg9JdyLsr5msZ+fmtp7TD8mshcxvrWYdmsji0IC3MPO8mOdIJS/NPXeK8Ex
	aBlg==
Received: by 10.68.225.199 with SMTP id rm7mr427166pbc.76.1342899685260;
	Sat, 21 Jul 2012 12:41:25 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id qr3sm6516943pbc.69.2012.07.21.12.41.23
	(version=SSLv3 cipher=OTHER); Sat, 21 Jul 2012 12:41:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jul 2012 12:41:24 -0700
Message-Id: <1342899684-4450-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-systemd][PATCH] systemd_git.bb: Dont inherit vala and gitpkgv
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
X-List-Received-Date: Sat, 21 Jul 2012 19:52:51 -0000

In an effort to use meta-systemd without meta-oe
layer (purely on OE-Core) I ran into these classes not being there in
OE-Core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-systemd/recipes-core/systemd/systemd_git.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 9cbdd76..6ae9abb 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -15,13 +15,13 @@ SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
 
 SECTION = "base/shell"
 
-inherit gitpkgv
-PKGV = "v${GITPKGVTAG}"
+#inherit gitpkgv
+#PKGV = "v${GITPKGVTAG}"
 
-PV = "git"
-PR = "r2"
+PV = "git${SRCPV}"
+PR = "r3"
 
-inherit useradd pkgconfig autotools vala perlnative
+inherit useradd pkgconfig autotools perlnative
 
 SRCREV = "cd96b3b86abb4a88cac2722bdfb6e5d4413f6831"
 
-- 
1.7.5.4



