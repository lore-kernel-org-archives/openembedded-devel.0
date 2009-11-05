Received: from [150.254.30.30] (helo=libra.cs.put.poznan.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1N63oq-0005p8-Ht for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 16:00:17 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id F32708B;
	Thu,  5 Nov 2009 14:58:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xT0P1q0wmLBy; Thu,  5 Nov 2009 15:58:58 +0100 (CET)
Received: from localhost.localdomain (idss-pw.cs.put.poznan.pl [150.254.31.31])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id BC23688;
	Thu,  5 Nov 2009 15:58:58 +0100 (CET)
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2009 16:00:58 +0100
Message-Id: <1257433258-3265-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200911051440.42702.holger+oe@freyther.de>
References: <200911051440.42702.holger+oe@freyther.de>
X-SpamTest-Envelope-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 9691 [Sep 17 2009]
X-SpamTest-Info: {received from trusted sender
	<przemyslaw.wesolek@cs.put.poznan.pl>: common white list}
X-SpamTest-Method: white email list
X-SpamTest-Rate: 0
X-SpamTest-Status: Trusted
X-SpamTest-Status-Extended: trusted
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] boost-1.33.1: Corrected GNU_HASH QA error.
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
X-List-Received-Date: Thu, 05 Nov 2009 15:00:18 -0000

boost 1.33.1 recipe ignores LDFLAGS set by OE, including --hash-style.
In result package_qa task issues error.

This patch fixes the recipe by appending OE's specifics to compiler
flags.

This only affects 1.33, as newer versions of boost don't use boost.inc.

Signed-off-by: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
---
 recipes/boost/boost.inc       |    3 +++
 recipes/boost/boost_1.33.1.bb |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/boost/boost.inc b/recipes/boost/boost.inc
index 80635b0..8b38a5e 100644
--- a/recipes/boost/boost.inc
+++ b/recipes/boost/boost.inc
@@ -77,6 +77,9 @@ FILES_${PN}-dev = "${includedir} ${libdir}/libboost_*.so ${libdir}/libboost_*.a"
 PACKAGES += "${PN}"
 RRECOMMENDS_${PN} += "${BOOSTLIBS}"
 
+# to avoid GNU_HASH QA errors added LDFLAGS to ARCH; a little bit dirty but at least it works
+TARGET_CC_ARCH += " ${LDFLAGS}" 
+
 # Oh yippee, a new build system, it's sooo cooool I could eat my own
 # foot.  inlining=on lets the compiler choose, I think.  At least this
 # stuff is documented...
diff --git a/recipes/boost/boost_1.33.1.bb b/recipes/boost/boost_1.33.1.bb
index 4d8e77d..689c681 100644
--- a/recipes/boost/boost_1.33.1.bb
+++ b/recipes/boost/boost_1.33.1.bb
@@ -1,5 +1,5 @@
 include boost.inc
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "\
   ${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2 \
-- 
1.6.3.3



