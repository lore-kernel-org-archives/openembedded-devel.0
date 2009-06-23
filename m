Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MJ1zG-0006Dq-9e
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 11:08:18 +0200
Received: (qmail 1822 invoked by uid 813007); 23 Jun 2009 08:57:15 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Jun 2009 08:57:15 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jun 2009 10:56:31 +0200
Message-Id: <1245747394-31806-5-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906230941.30107.marcin@juszkiewicz.com.pl>
References: <200906230941.30107.marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [STABLE][PATCH 042/125] Allow use of Itanium as build machine
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
X-List-Received-Date: Tue, 23 Jun 2009 09:08:18 -0000

From: Peter Chubb <peter.chubb@nicta.com.au>

Hi,
	I have access to a cluster of Itaniums that I want to use as
build machines for openembedded.  This patch enables Itanium as a
build environment.

Signed-off-by: Marcin Juszkiewicz <hrw@openembedded.org>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 classes/siteinfo.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/classes/siteinfo.bbclass b/classes/siteinfo.bbclass
index 55ab371..b51868b 100644
--- a/classes/siteinfo.bbclass
+++ b/classes/siteinfo.bbclass
@@ -48,6 +48,7 @@ def get_siteinfo_list(d):
                "i486-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
                "i586-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
                "i686-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
+	       "ia64-linux":		  "endian-little bit-64 common-linux common-glibc",\
                "mipsel-linux":            "endian-little bit-32 common-linux common-glibc",\
                "mipsel-linux-uclibc":     "endian-little bit-32 common-linux common-uclibc",\
                "mips-linux":              "endian-big bit-32 common-linux common-glibc",\
-- 
1.6.3.1





