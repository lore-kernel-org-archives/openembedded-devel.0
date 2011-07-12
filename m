Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qgkuf-0003fb-SY
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jul 2011 23:54:42 +0200
Received: by iwn4 with SMTP id 4so5138901iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2011 14:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=XtenR3M4rMZ8Oj765NBs3QGn8yTG4aN9UBgwI22eSXg=;
	b=WFRBkLqLHqupI6OP655aHzDbVtaoOc35Lhc7F+uERjYvlMS6vioy9gFBEHQ0uKkujF
	t0V6mT97XIv5saHK9wBscoNkKtHs7qAu7U4jl542kwcpXA5I4vL8uhcvHhOx93c/lvSQ
	fzq+pSJ9gy+dIVdJ2kc7I8yB5dV494e/BvmMA=
Received: by 10.42.133.199 with SMTP id i7mr373261ict.95.1310507442477;
	Tue, 12 Jul 2011 14:50:42 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id dn23sm5019ibb.29.2011.07.12.14.50.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 14:50:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jul 2011 14:51:39 -0700
Message-Id: <1310507500-12965-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-oe][PATCH 1/2] icon-naming-utils: inherit allarch
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
X-List-Received-Date: Tue, 12 Jul 2011 21:54:42 -0000

This is a perl script which can be made into an all arch
package and avoid redundant duplicate builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../icon-naming-utils/icon-naming-utils_0.8.90.bb  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb b/meta-oe/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
index ddd1e20..5b977ff 100644
--- a/meta-oe/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
+++ b/meta-oe/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
@@ -3,7 +3,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libxml-simple-perl-native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://tango.freedesktop.org/releases/icon-naming-utils-${PV}.tar.gz"
 SRC_URI[md5sum] = "2c5c7a418e5eb3268f65e21993277fba"
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "044ab2199ed8c6a55ce36fd4fcd8b8021a5e21f5bab028c0a7cdcf52a5
 
 S = "${WORKDIR}/icon-naming-utils-${PV}"
 
-inherit autotools
+inherit autotools allarch
 
 do_configure_append() {
         # replace paths to STAGING_BINDIR_NATIVE/perl with ${bindir}/perl
-- 
1.7.4.1



