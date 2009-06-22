Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MIgP9-0000BJ-DK
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 12:05:35 +0200
Received: (qmail 27835 invoked by uid 813007); 22 Jun 2009 09:54:39 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Jun 2009 09:54:39 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jun 2009 11:53:50 +0200
Message-Id: <1245664435-30183-7-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906041838.05838.marcin@juszkiewicz.com.pl>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 030/125] libiconv: 1.12 has GPLv3 binaries LGPLv2.1 libraries
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
X-List-Received-Date: Mon, 22 Jun 2009 10:05:35 -0000

From: Tom Rini <trini@embeddedalley.com>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/libiconv/libiconv.inc     |    1 -
 recipes/libiconv/libiconv_1.12.bb |    1 +
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/libiconv/libiconv.inc b/recipes/libiconv/libiconv.inc
index c815210..c8bc290 100644
--- a/recipes/libiconv/libiconv.inc
+++ b/recipes/libiconv/libiconv.inc
@@ -4,7 +4,6 @@ HOMEPAGE = "http://www.gnu.org/software/libiconv"
 SECTION = "libs"
 PRIORITY = "optional"
 NOTES = "Needs to be stripped down to: ascii iso8859-1 eucjp iso-2022jp gb utf8"
-LICENSE = "LGPL"
 
 SRC_URI = "ftp://ftp.gnu.org/pub/gnu/libiconv/libiconv-${PV}.tar.gz \
 	   file://autotools.patch;patch=1 \
diff --git a/recipes/libiconv/libiconv_1.12.bb b/recipes/libiconv/libiconv_1.12.bb
index 129eb13..db53178 100644
--- a/recipes/libiconv/libiconv_1.12.bb
+++ b/recipes/libiconv/libiconv_1.12.bb
@@ -1,4 +1,5 @@
 require libiconv.inc
+LICENSE = "GPLv3 LGPLv2"
 
 PROVIDES = "virtual/libiconv"
 PR = "r1"
-- 
1.6.3.1





