Received: from [72.14.220.153] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1MstzH-0005vj-Va
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Sep 2009 09:52:39 +0200
Received: by fg-out-1718.google.com with SMTP id d23so1830342fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2009 00:51:54 -0700 (PDT)
Received: by 10.86.174.2 with SMTP id w2mr1636423fge.0.1254297114215;
	Wed, 30 Sep 2009 00:51:54 -0700 (PDT)
Received: from localhost.localdomain (94-193-242-65.zone7.bethere.co.uk
	[94.193.242.65])
	by mx.google.com with ESMTPS id e11sm267033fga.3.2009.09.30.00.51.52
	(version=SSLv3 cipher=RC4-MD5); Wed, 30 Sep 2009 00:51:53 -0700 (PDT)
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Sep 2009 08:51:47 +0100
Message-Id: <1254297107-3475-1-git-send-email-dp@xora.org.uk>
X-Mailer: git-send-email 1.6.2.5
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: core glibc. Without this oabi compile of glibc doesnt work.
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
X-List-Received-Date: Wed, 30 Sep 2009 07:52:40 -0000

Graeme

From 74bad1b44410e3df4d13db286e008b5777146340 Mon Sep 17 00:00:00 2001
From: Graeme Gregory <dp@xora.org.uk>
Date: Wed, 30 Sep 2009 08:50:17 +0100
Subject: [PATCH] glibc_2.9.bb : add already existing OE patch arm-lowlevellock-include-tls.patch

This is required to get glibc 2.9 to build on arm oabi. eglibc already
includes this patch and the patch is already in OE

Signed-off-by: Graeme Gregory <dp@xora.org.uk>
---
 recipes/glibc/glibc_2.9.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
index c3ebc16..56a6ff8 100644
--- a/recipes/glibc/glibc_2.9.bb
+++ b/recipes/glibc/glibc_2.9.bb
@@ -64,6 +64,7 @@ SRC_URI = "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
            file://march-i686.patch;patch=1;pnum=0 \
 	   file://tls_i486.patch;patch=1 \
 	   file://glibc-2.9-use-_begin.patch;patch=1 \
+           file://arm-lowlevellock-include-tls.patch;patch=1 \
            "
 
 # Build fails on sh3 and sh4 without additional patches
-- 
1.6.2.5



