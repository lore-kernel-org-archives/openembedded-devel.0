Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1T4GfX-0000iE-DF
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2012 21:32:47 +0200
Received: by pbcwy7 with SMTP id wy7so1834923pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2012 12:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=zTF05Ih071zaPKUw+DN7ef8Av8OPlfgcFHCOoq8CCTA=;
	b=RSWUSmmVULiDkk5hDs8jdkbK4ylFTJevLl/Zq9xKF2OBcPmIXJ2iJGaV4eUivXFwDp
	v9wg9rwRj82tZ6jseYQ5ASu0wEU56GFrorffaCbJ11HCn4JezPZZF2xYZKGNhFTnGXTq
	8k+xEegcK7ZKSy3YcMCKq8hMtjPiY1lJQk2LcdtuHdKEEYyBikZjiHS/3SCOSHBkaXBZ
	p+P2YSSFM+cVYWvyLQhdAktHZCdmw2SlKoPoPAnW33VJ55WjCQJNRyADfp8FPq6wXf0S
	qffM2hxYI3l3kdFkb1CRM8StLEc4TRRcoljyi6AkB/c5ezRPhTe1MPM5riTmUwmqcrIU
	yeQQ==
Received: by 10.68.201.104 with SMTP id jz8mr54902793pbc.160.1345663241485;
	Wed, 22 Aug 2012 12:20:41 -0700 (PDT)
Received: from eos.du.ae ([94.205.108.162])
	by mx.google.com with ESMTPS id oj8sm4254996pbb.54.2012.08.22.12.20.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 12:20:40 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2012 23:20:20 +0400
Message-Id: <1345663224-42350-3-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345663224-42350-1-git-send-email-elvis.dowson@gmail.com>
References: <1345663224-42350-1-git-send-email-elvis.dowson@gmail.com>
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx 3/7] tune-ppc405e: Add tune-ppc405e file.
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
X-List-Received-Date: Wed, 22 Aug 2012 19:32:47 -0000

* Tune option for ppc405e with hard-float.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 conf/machine/include/tune-ppc405e.inc |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 conf/machine/include/tune-ppc405e.inc

diff --git a/conf/machine/include/tune-ppc405e.inc b/conf/machine/include/tune-ppc405e.inc
new file mode 100644
index 0000000..63e5e9c
--- /dev/null
+++ b/conf/machine/include/tune-ppc405e.inc
@@ -0,0 +1,14 @@
+DEFAULTTUNE ?= "ppc405e"
+
+require conf/machine/include/powerpc/arch-powerpc.inc
+
+TUNEVALID[ppc405e] = "Enable ppc405e specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc405e", "-mcpu=405fp", "", d)}"
+
+AVAILTUNES += "ppc405e"
+TUNE_FEATURES_tune-ppc405e = "m32 ppc405e fpu-hard"
+TUNE_PKGARCH_tune-ppc440e = "ppc405e"
+PACKAGE_EXTRA_ARCHS_tune-ppc405e = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc405e"
+
+# glibc configure options to get ppc405e specific library (for sqrt)
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc405e", "-with-cpu=405fp", "", d)}"
-- 
1.7.9.5



