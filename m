Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NMuSg-0003ud-Nj
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Dec 2009 03:27:01 +0100
Received: by yxe5 with SMTP id 5so1675504yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2009 18:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=/ht2kBouO32YpzE8d6tUoFlVNNC668w99BygWubE7CY=;
	b=YxJfc4Cbu2PPcKTmljYJan2kVtK0me656KPJ6dLoN9I4Lzi1E4Y0VU5Lr03kK3cK6j
	NNwNcFIOfh5TWxeUUAuRKFApehAqPxawb+hUnFPlDJvBLMy1c1KpkWphn8fMY+7tkMx8
	/HyxlOnJbWIY326xyBTy5x4WikexbNu8+EXfM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jVBNJ+AQ33IPh/s5uFtZPiyVYB3BU/xyXdtpyy56I3nf69bh9e/ul/CiM7oShJOC3u
	c994GOXYFc1C4QeipwFXfKmXQzYmCeCF6HKWzNoenQPF59RqqonYhhguxvrnuhR59kHh
	bF2PD+EDaqw3ZbYLyoOIypSDXhPBs6rl6A1iM=
Received: by 10.150.89.41 with SMTP id m41mr12404894ybb.187.1261448706658;
	Mon, 21 Dec 2009 18:25:06 -0800 (PST)
Received: from localhost ([123.162.69.206])
	by mx.google.com with ESMTPS id 22sm2230891ywh.15.2009.12.21.18.25.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 21 Dec 2009 18:25:05 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Dec 2009 10:24:40 +0800
Message-Id: <1261448680-12334-2-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <1261448680-12334-1-git-send-email-camelguo@gmail.com>
References: <>
 <1261448680-12334-1-git-send-email-camelguo@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] change uclibc to eglibc on comments
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
X-List-Received-Date: Tue, 22 Dec 2009 02:27:02 -0000

---
 conf/distro/minimal-eglibc.conf |   14 +++++++-------
 conf/distro/minimal.conf        |    2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/conf/distro/minimal-eglibc.conf b/conf/distro/minimal-eglibc.conf
index 5ab275b..10f271b 100644
--- a/conf/distro/minimal-eglibc.conf
+++ b/conf/distro/minimal-eglibc.conf
@@ -1,7 +1,7 @@
 #-----------------------------------------------------------------------------
 #@TYPE: Distribution
-#@NAME: Minimal uClibc
-#@DESCRIPTION: uClibc based Embedded Linux Distribution Configuration (minimal)
+#@NAME: Minimal eglibc
+#@DESCRIPTION: eglibc based Embedded Linux Distribution Configuration (minimal)
 #
 #@COMMENT: This distribution configuration serves as a starting point for
 #@COMMENT: the integration of new target platforms, machines, or distributions.
@@ -24,13 +24,13 @@ require conf/distro/minimal.conf
 #
 # We get the DISTRO_FEATURES defined in minimal.conf here but
 # however there are some features like mips -mplt support which
-# is not supported on uclibc yet so we need to disable that
-# feature for uclibc based distributions, therefore we redefine
-# the DISTRO_FEATURES for minimal-uclibc and notably leave mplt
+# is not supported on eglibc yet so we need to disable that
+# feature for eglibc based distributions, therefore we redefine
+# the DISTRO_FEATURES for minimal-eglibc and notably leave mplt
 # out. Make sure that if there is a new DISTRO_FEATURE thats added
-# to minimal.conf will not get included in minimal-uclibc.conf
+# to minimal.conf will not get included in minimal-eglibc.conf
 # it has to be added to the below selection if it should also be
-# enabled for minimal-uclibc
+# enabled for minimal-eglibc
 
 # FEATURE SELECTION
 #############################################################################
diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index 00397db..d0ec876 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -86,7 +86,7 @@ OVERRIDES = "local:${MACHINE}:${MACHINE_CLASS}:${DISTRO}:${TARGET_OS}:${TARGET_A
 #############################################################################
 # TOOLCHAIN
 #############################################################################
-LIBC ?= "eglibc"
+LIBC ?= "glibc"
 require conf/distro/include/sane-toolchain.inc
 
 #############################################################################
-- 
1.5.4.3



