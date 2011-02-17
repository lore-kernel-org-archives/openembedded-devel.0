Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1Pq5jh-0006Gr-Er
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 16:25:41 +0100
Received: from sb-ubuntu-1004.alm.mentorg.com ([134.86.97.236])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p1HFOQ1m030696
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 09:24:26 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Feb 2011 08:24:26 -0700
Message-Id: <1297956266-30032-2-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.3.5
In-Reply-To: <1297956266-30032-1-git-send-email-tom_rini@mentor.com>
References: <1297956266-30032-1-git-send-email-tom_rini@mentor.com>
Subject: [PATCH 2/2] gettext: Pass --disable-rpath on target
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
X-List-Received-Date: Thu, 17 Feb 2011 15:25:42 -0000

We disable rpath stuff as this casues problems with libtool 2.2
and 2.4 is fine.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 recipes/gettext/gettext_0.18.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/gettext/gettext_0.18.bb b/recipes/gettext/gettext_0.18.bb
index e9e613e..850b269 100644
--- a/recipes/gettext/gettext_0.18.bb
+++ b/recipes/gettext/gettext_0.18.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The GNU internationalization library."
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SECTION = "libs"
 LICENSE = "GPLv3"
-PR = "r4"
+PR = "r5"
 DEPENDS = "gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = "libxml2-native"
 PROVIDES = "virtual/libintl"
@@ -26,7 +26,7 @@ PARALLEL_MAKE = ""
 
 inherit autotools
 
-NATIVECONF = ""
+NATIVECONF = "--disable-rpath"
 NATIVECONF_virtclass-native += "--enable-relocatable --disable-curses"
 
 EXTRA_OECONF += "--without-lispdir \
-- 
1.7.3.5



