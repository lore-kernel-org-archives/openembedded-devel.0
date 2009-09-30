Received: from [72.14.220.155] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Msu5c-0004dR-Nv
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Sep 2009 09:59:13 +0200
Received: by fg-out-1718.google.com with SMTP id e21so1160918fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2009 00:58:27 -0700 (PDT)
Received: by 10.86.232.33 with SMTP id e33mr4926278fgh.71.1254297507215;
	Wed, 30 Sep 2009 00:58:27 -0700 (PDT)
Received: from localhost.localdomain (94-193-242-65.zone7.bethere.co.uk
	[94.193.242.65])
	by mx.google.com with ESMTPS id l19sm856246fgb.12.2009.09.30.00.58.26
	(version=SSLv3 cipher=RC4-MD5); Wed, 30 Sep 2009 00:58:26 -0700 (PDT)
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Sep 2009 08:58:19 +0100
Message-Id: <1254297499-3508-2-git-send-email-dp@xora.org.uk>
X-Mailer: git-send-email 1.6.2.5
In-Reply-To: <1254297499-3508-1-git-send-email-dp@xora.org.uk>
References: <1254297499-3508-1-git-send-email-dp@xora.org.uk>
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] glibc_2.9.bb : add already existing OE patch arm-lowlevellock-include-tls.patch
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
X-List-Received-Date: Wed, 30 Sep 2009 07:59:19 -0000

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



