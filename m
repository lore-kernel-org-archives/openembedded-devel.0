Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RCETw-00071P-ML
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 19:45:13 +0200
Received: by qyk10 with SMTP id 10so941960qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=AvObjzUkitN/lunEuLSoEaVy0JNzrngoCaHePriqJxw=;
	b=erb4Dv+qrW9tyKInXVmCCa0Vp9LKDKChZD2fDNUq/Zb6BqghT8m4yc4ysDq16BeNuk
	3RdaCPMm0dO5IjpQXFgTiO1PIlLYUqiqMfNs7YX14W6ZFxxJWlHDhjnyINuyopucHy7D
	zCvVgd6aRsnFaK0SYQxUotkh8DmCEMPYF7nSc=
Received: by 10.68.15.70 with SMTP id v6mr15558838pbc.85.1318009169706;
	Fri, 07 Oct 2011 10:39:29 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id d7sm33308796pbn.8.2011.10.07.10.39.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:39:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Oct 2011 10:39:24 -0700
Message-Id: <1318009164-6677-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] ldconfig-native: Change the license field
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
X-List-Received-Date: Fri, 07 Oct 2011 17:45:13 -0000

The license should be GPLv2+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/eglibc/ldconfig-native_2.12.1.bb  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb b/meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb
index 00edb6e..2a93913 100644
--- a/meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb
+++ b/meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "A standalone native ldconfig build"
 
-LICENSE = "GPLv2.1"
+LICENSE = "GPLv2+"
 
 LIC_FILES_CHKSUM = "file://${S}/ldconfig.c;endline=17;md5=1d15f20937c055cb5de2329a4c054399"
 
@@ -12,7 +12,7 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
            file://flag_fix.patch \
            file://endianess-header.patch"
 
-PR = "r1"
+PR = "r2"
 
 inherit native
 
-- 
1.7.5.4



